package com.xxzd.util;

import com.xxzd.pojo.User;

public class UserTreadLocal {
	//ThreadLocal可以线程之间值共享  静态因为其他程序也要用
	public static ThreadLocal<User> thread = new ThreadLocal<>();
	
	public static void set(User user) {
		thread.set(user);
	}
	
	public static User get() {
		return thread.get();
	}
	//添加防止内存泄漏的操作   remove方法会清空 线程的值  
	public static void remove() {
		thread.remove();
	}
}
