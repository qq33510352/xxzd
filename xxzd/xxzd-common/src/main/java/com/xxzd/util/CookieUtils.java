package com.xxzd.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	//1.删除Cookie信息
	public static void deleteCookie(String cookieName,String path,String domain,HttpServletResponse response) {
		Cookie cookie = new Cookie(cookieName, "233");
		cookie.setMaxAge(0);
		cookie.setPath(path);
		cookie.setDomain(domain);
		response.addCookie(cookie);
	}
	/**
	 *添加Cookie信息  时限自定 
	 * @param cookieName
	 * @param value
	 * @param path
	 * @param domain
	 * @param response
	 */
	public static void addCookie(String cookieName,Integer second,String value,String path,String domain,HttpServletResponse response) {
		Cookie cookie = new Cookie(cookieName,value);
		cookie.setMaxAge(second);
		cookie.setPath(path);
		cookie.setDomain(domain);
		response.addCookie(cookie);
	}
		
	/**
	 *添加Cookie信息  时限一周 
	 * @param cookieName
	 * @param value
	 * @param path
	 * @param domain
	 * @param response
	 */
	public static void addCookie(String cookieName,String value,String path,String domain,HttpServletResponse response) {
		Cookie cookie = new Cookie(cookieName,value);
		cookie.setMaxAge(7*24*3600);
		cookie.setPath(path);
		cookie.setDomain(domain);
		response.addCookie(cookie);
	}
			
		
	
	//2.查询Cookie信息
	public static Cookie get
			(HttpServletRequest request,String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					return cookie;
				}
			}
		}
		return null;
	}
}
