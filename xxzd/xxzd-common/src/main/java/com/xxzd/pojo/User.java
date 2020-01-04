package com.xxzd.pojo;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName
public class User extends BasePojo{
	@TableId(type = IdType.AUTO)
	private Integer id;
	private String name;
	private String password;
	private String mobile;
	private String email;
	private String salt;
	private Date lastTime;
	private Integer valid;
	private String registerIp;
	private String sex;
	private String addr;
	private String intro;
	private Long exp;
    private String headUrl;
	private Long gold;
}
