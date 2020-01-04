package com.xxzd.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsonResult {
	private Integer code;//状态码  0成功  1失败
	String msg;//信息
	Object data;//数据
	//处理成功
	public static JsonResult success(String msg) {
		return new JsonResult(0,msg,null);
	}
	public static JsonResult success(String msg,Object data) {
		return new JsonResult(0,msg,data);
	}
	
	//处理失败
	public static JsonResult fail() {
		return new JsonResult(1,"处理失败",null);
	}
	public static JsonResult fail(String msg) {
		return new JsonResult(1,msg,null);
	}
	public static JsonResult fail(Throwable e) {
		return new JsonResult(1,e.getMessage(),null);
	}
}
