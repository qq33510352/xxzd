package com.xxzd.vo;


import java.util.Date;

import lombok.Data;


@Data
public class TreeTableVo {
	private Integer id;
	private Integer pid;
	private String title;
	private String intro;
	private String permission;
	private Date created;
	private Date updated;
	private String createUser;
	private String updateUser;
	//[{"id":1,"pid":0,"title":"1-1"}
}
