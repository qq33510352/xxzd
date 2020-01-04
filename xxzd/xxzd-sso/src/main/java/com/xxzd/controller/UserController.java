package com.xxzd.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.xxzd.common.vo.JsonResult;
import com.xxzd.service.DubboUserService;
import com.xxzd.service.UserService;
import com.xxzd.util.CookieUtils;
import com.xxzd.util.IPUtil;

import redis.clients.jedis.JedisCluster;
@RestController
@RequestMapping("/user/")
public class UserController {
	@Autowired
	private UserService userService;
	
    //检查指定行的值是否存在
//	URL	http://sso.xxzd.com/user/check/{param}/{type}?callback=xxxx
	//返回值  callback(jsonResult)
	@RequestMapping("/check/{para}/{type}")
	public JSONPObject checkUser(@PathVariable String para,@PathVariable String type,String callback) {
		System.out.println("验证:"+type+":"+para+",callback:"+callback);
		return new JSONPObject(callback,JsonResult.success("OJBK",userService.checkUser(para,type)));
	}
	
	//根据用法的ticket和username获取用户信息
	@Autowired
	private JedisCluster jedis;
	@RequestMapping("/query/{titcket}/{userName}")
	public JSONPObject findUserByTicket(@PathVariable String userName,@PathVariable String titcket,String callback,HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("查用户 数据"+userName);
		//思路:首先用户请求后获取用户ip 然后获取用户凭证去找redis
		//找到后获取redis 数据的ip对比 不对的话打回  并删cookie 如果对的话继续 
		//然用titcket获取用户的用户信息 对比如果有的话则继续没有则打回并删cookie
		//都没有问题的话 以callback形势将数据返回
		String ip = IPUtil.getIpAddr(request);
		JSONPObject jp = null;
		//校验ip是否有效
		//思路:获取用户名然后根据用户名查询titcket如果对得上则继续
		String oldTitckt = jedis.get("XXZD_USER_"+userName);
		if(!titcket.equals(oldTitckt)) {
			jp = new JSONPObject(callback,JsonResult.fail());
			CookieUtils.deleteCookie("XXZD_TICKET", "/", "xxzd.com",response);
			CookieUtils.deleteCookie("XXZD_USER", "/", "xxzd.com",response);
			return jp;
		}
		Map<String, String> map = jedis.hgetAll(titcket);
		
		if(!ip.equals(map.get("XXZD_USER_IP"))) {
			//ip地址不正确
			jp = new JSONPObject(callback,JsonResult.fail());
			CookieUtils.deleteCookie("XXZD_TICKET", "/", "xxzd.com",response);
			CookieUtils.deleteCookie("XXZD_USER", "/", "xxzd.com",response);
			return jp;
		}
		
		//2.校验ticket数据信息
		String userJSON = map.get("XXZD_USER");
		if(StringUtils.isEmpty(userJSON)) {
			jp = new JSONPObject(callback,JsonResult.fail());
			//3删除cookie
			CookieUtils.deleteCookie("XXZD_TICKET", "/", "xxzd.com",response);
			CookieUtils.deleteCookie("XXZD_USER", "/", "xxzd.com",response);
			return jp;
		}
		return new JSONPObject(callback,JsonResult.success("OJBK",userJSON));
	}
}
