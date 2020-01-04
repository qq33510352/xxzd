package com.xxzd.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageResult {
	private Integer code;//状态码  0成功  1失败
	String msg;//信息
	Integer count;//总记录数
	Object data;//数据
	//处理成功
	public static PageResult success(Integer count,Object data) {
		return new PageResult(0,"处理成功",count,data);
	}
	public static PageResult success(String msg,Integer count,Object data) {
		return new PageResult(0,msg,count,data);
	}
	
	//处理失败
	public static PageResult fail() {
		return new PageResult(1,"处理失败",null,null);
	}
	public static PageResult fail(String msg) {
		return new PageResult(1,msg,null,null);
	}
	public static PageResult fail(Throwable e) {
		return new PageResult(1,e.getMessage(),null,null);
	}
}
