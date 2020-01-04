package com.xxzd.pojo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
@Data
public class BasePojo implements Serializable{
	private Date created;
	private Date updated;
}
