package com.xxzd.service;


import com.xxzd.common.vo.PageResult;
import com.xxzd.pojo.User;
import com.xxzd.vo.CheckBox;

public interface UserService {

	PageResult findUsers(Integer page, Integer pageSize,String name);

	void valids(CheckBox checkBox);

	void deleteByIds(Integer[] ids);

	void updateOne(Integer id, String column, String value);

	boolean isExists(String column, String value);

	void updateUser(User user, Integer roleSelect);

	void addUser(User user, Integer roleSelect);

}
