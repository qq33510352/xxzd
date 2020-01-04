package com.xxzd.vo;

import lombok.Data;

/*
 * 禁用启用vo对象
 */
@Data
public class CheckBox {
	Integer[] ids;//用户id
	Integer valid;//0 启用  1禁用
}
