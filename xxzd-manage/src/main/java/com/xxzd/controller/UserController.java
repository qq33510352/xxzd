package com.xxzd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xxzd.common.vo.JsonResult;
import com.xxzd.common.vo.PageResult;
import com.xxzd.pojo.User;
import com.xxzd.service.UserService;
import com.xxzd.vo.CheckBox;

@RestController
@RequestMapping("/user/")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/findUsers/{name}")
	public PageResult findUsers(@PathVariable String name,Integer page,@RequestParam(name = "limit")Integer pageSize) {
		name = name.substring(0,name.length()-1);
		System.out.println("用户名:"+name);
		PageResult pageResult = userService.findUsers(page, pageSize,name);
		System.out.println(pageResult);
		return pageResult;
	}
	
	@RequestMapping("/valids")
	public JsonResult valids(CheckBox checkBox) {
		System.err.println("禁用/启用"+checkBox);
		userService.valids(checkBox);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/deleteByIds")
	public JsonResult deleteByIds(Integer[] ids) {
		userService.deleteByIds(ids);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/updateOne")
	public JsonResult updateOne(Integer id,String column,String value) {
		System.out.println("id"+id+"更新了"+column+":"+value);
		userService.updateOne(id,column,value);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/addUser")
	public JsonResult addUser(User user,Integer roleSelect) {
		System.err.println("新增用户:"+user+"角色选择:"+roleSelect);
		userService.addUser(user,roleSelect);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/updateUser")
	public JsonResult updateUser(User user,Integer roleSelect) {
		System.err.println("更新用户:"+user+"角色选择:"+roleSelect);
		userService.updateUser(user,roleSelect);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/isExists")
	public JsonResult isExists(String column,String value) {
		System.err.println("查询用户是否存在:"+column+":"+value);
		boolean flag = userService.isExists(column,value);
		return JsonResult.success("ok",flag);
	}
}
