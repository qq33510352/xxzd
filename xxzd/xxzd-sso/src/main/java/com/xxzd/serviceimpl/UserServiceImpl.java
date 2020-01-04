package com.xxzd.serviceimpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxzd.mapper.UserMapper;
import com.xxzd.pojo.User;
import com.xxzd.service.DubboUserService;
import com.xxzd.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 根据 列和值   进行判断 如果存在则返回true  不存在则返回false
	 * type 1  1用户名     2手机号   3邮箱号  
	 */
	@Override
	public boolean checkUser(String para, String type) {
		HashMap<String,String> map = new HashMap<>();
		map.put("1","name");
		map.put("2","mobile");
		map.put("3","email");
		String column = map.get(type);
		QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
		queryWrapper.eq(column,para);
		Integer count = userMapper.selectCount(queryWrapper);
		if (count==0)return false;
		return true;
	}
	
}
