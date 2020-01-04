package com.xxzd.service;

import com.xxzd.pojo.User;

public interface DubboUserService {

	void register(User user);

	String findUserByUP(String ip, User user);
	
}
