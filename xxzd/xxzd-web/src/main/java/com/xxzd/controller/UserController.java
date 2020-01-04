package com.xxzd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;
import com.xxzd.common.vo.JsonResult;
import com.xxzd.pojo.User;
import com.xxzd.service.DubboUserService;
import com.xxzd.util.CookieUtils;
import com.xxzd.util.IPUtil;

@RestController
@RequestMapping("/user/")
public class UserController {
	@Reference(check = true)
	private DubboUserService userService;
	
	//使用Dubbo实现用户注册
	@RequestMapping("/register")
	public JsonResult register(User user,HttpServletRequest request) {
		//如果用Dubbo抛回来的是长异常   如果没用dubbo抛出的则是短异常
		String ip = IPUtil.getIpAddr(request);
		System.out.println("用户注册"+user);
		System.out.println("ip"+ip);
		user.setRegisterIp(ip);
		userService.register(user);
		return JsonResult.success("OJBK");
	}
	
	/**
	 * 实现用户登录请求路径 
	 *user/login/
	 *用户携带参数   用户  密码
	 *返回      一个JsonResult表示是否登录成功
	 * 两个Cookie  一个登录的Cookie   XXZD_LOGIN	包含用户验证成功后的cookie
	 *   		    一个辅助验证Cookie  XXZD_USER   包含用户名
	 * 思路:先获取用户ip  然后 调用业务层方法将ip 和用户参数传过去进行验证 如果验证成功返回cookie
	 */
	@RequestMapping("login")
	@ResponseBody
	public JsonResult login(User user,HttpServletResponse respon,HttpServletRequest request) {
		System.out.println("用户尝试登录:"+user);
		String ip = IPUtil.getIpAddr(request);
		
		String ticket = userService.findUserByUP(ip,user);
		System.out.println("验证完毕"+ticket);
		if(ticket==null) {
			return JsonResult.fail();
		}
		CookieUtils.addCookie("XXZD_USER",7*24*3600,user.getName(),"/","xxzd.com",respon);
		CookieUtils.addCookie("XXZD_TICKET",7*24*3600,ticket,"/","xxzd.com",respon);
		return JsonResult.success("OJBK");
	}
	
	
	
}
