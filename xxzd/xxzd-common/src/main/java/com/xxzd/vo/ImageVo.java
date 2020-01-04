package com.xxzd.vo;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@NoArgsConstructor
public class ImageVo {
	private Integer code;	//0上传正确  1上传有误
	private String msg;		//信息
	private String src;	  	//图片虚拟地址
	
	public ImageVo(Integer code, String msg, String src) {
		super();
		this.code = code;
		this.msg = msg;
		this.src = src;
	} 
	
	//根据分析 需要定义一个失败的方法
	public static ImageVo fail() {
		return new ImageVo(1,null,null);
	}



}
