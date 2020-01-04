package com.xxzd.serviceimpl;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xxzd.common.vo.PageResult;
import com.xxzd.mapper.UserMapper;
import com.xxzd.mapper.UsersRolesMapper;
import com.xxzd.pojo.User;
import com.xxzd.service.UserService;
import com.xxzd.vo.CheckBox;
@Service
public class UserServiceimpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UsersRolesMapper usersRolesMapper;
	@Override
	public PageResult findUsers(Integer page, Integer pageSize,String username) {
		Page<User> paged = new Page<>();
		paged.setCurrent(page).setSize(pageSize);
		QueryWrapper<User> queryWrapper = new QueryWrapper<>();
		queryWrapper.like("name",username)
		.orderByAsc("created");
		IPage<User> selectPage = userMapper.selectPage(paged, queryWrapper);
		PageResult pageResult = PageResult.success("获取成功",(int)selectPage.getTotal(),selectPage.getRecords());
//		System.out.println(selectPage.getRecords());
		return pageResult;
	}

	@Override
	public void valids(CheckBox checkBox) {
		userMapper.valids(checkBox);
	}

	@Override
	public void deleteByIds(Integer[] ids) {
		List<Integer> list = Arrays.asList(ids);
		usersRolesMapper.deleteRolesByUserIds(ids);
		userMapper.deleteBatchIds(list);
	}

	@Override
	public void updateOne(Integer id, String column, String value) {
		userMapper.updateOne(id,column,value);
	}

	@Override
	public void addUser(User user,Integer roleSelect) {
		user.setCreated(new Date());
		user.setUpdated(user.getCreated());
		user.setSalt("yanzhi").setValid(1);
		userMapper.insert(user);
		usersRolesMapper.insert(user.getId(),roleSelect);
	}

	@Override
	public boolean isExists(String column, String value) {
		QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
		queryWrapper.eq(column,value);
		Integer selectCount = userMapper.selectCount(queryWrapper);
		if(selectCount==null||selectCount==0)return true;
		return false;
	}

	@Override
	public void updateUser(User user,Integer roleSelect) {
		user.setUpdated(new Date());
		usersRolesMapper.deleteByUserId(user.getId(),roleSelect);
		userMapper.updateById(user);
	}

}
