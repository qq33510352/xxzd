package com.xxzd.serviceimpl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxzd.exception.ServiceException;
import com.xxzd.mapper.UserMapper;
import com.xxzd.mapper.UsersRolesMapper;
import com.xxzd.pojo.User;
import com.xxzd.service.DubboUserService;
import com.xxzd.util.ObjectMapperUtil;

import redis.clients.jedis.JedisCluster;
@Service
public class DubboUserServiceImpl implements DubboUserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UsersRolesMapper usersRolesMapper;
	@Autowired
	private JedisCluster jedis;
	
	/**
	 * 1.MD5加密方式取值有多少种  
	 * 32位16进制数 2^128 种
	 */
	//用户注册
	@Override
	@Transactional
	public void register(User user) {
		//密码加密存储 更改时间创建时间 和修改时间还有 exp gold
		QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
		queryWrapper.eq("name",user.getName());
		if(userMapper.selectCount(queryWrapper)!=0)throw new ServiceException("用户名已存在");
		queryWrapper.eq("email",user.getEmail());
		if(userMapper.selectCount(queryWrapper)!=0)throw new ServiceException("邮箱已被使用");
		queryWrapper.eq("register_ip",user.getRegisterIp());
		if(userMapper.selectCount(queryWrapper)!=0)throw new ServiceException("一个IP只能注册一个账号");
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		user.setCreated(new Date());
		user.setUpdated(user.getCreated());
		user.setExp(0L).setGold(30L).setSalt("yanzhi").setValid(1);
		userMapper.insert(user);
		usersRolesMapper.insert(user.getId(),1);//用户刚注册是一级用户
	}
	
	
	/**
	 * 用户登录
	 * 如果验证成功 将 用户信息以 缓存的方式存 redis 包括 user 和  ip  还有用户名对应的titcket
	 * 返回 titcket
	 */
	@Override
	public String findUserByUP(String ip, User user) {
		//将用户密码加密后比对
		user.setPassword
		(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		//进行查询
		QueryWrapper<User> queryWrapper = new QueryWrapper<User>(user);
		User dUser = userMapper.selectOne(queryWrapper);
		if(dUser==null)return null;
		//查看Redis是否有缓存 有则清理
		String oldTicket = jedis.get("XXZD_USER_"+dUser.getName());
		if(!StringUtils.isEmpty(oldTicket)) {
			jedis.del(oldTicket);
		}
		//生成uuid作为key
		String ticket = UUID.randomUUID().toString();
		//数据转Json  并脱敏 存redis
		user.setPassword("666666");
		String json = ObjectMapperUtil.toJson(user);
		jedis.hset(ticket,"XXZD_USER",json);
		jedis.hset(ticket,"XXZD_USER_IP",ip);
		jedis.expire(ticket,7*24*3600);
		jedis.setex("XXZD_USER_"+dUser.getName(),7*24*3600,ticket);
		return ticket;
	}
}
