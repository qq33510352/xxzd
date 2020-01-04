package com.xxzd.pojo;


import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@AllArgsConstructor
@NoArgsConstructor
@TableName
@Accessors(chain = true)
@Data
public class Module extends BasePojo{
	@TableId(type = IdType.AUTO)
	private Integer id;
	private String name;
	private String intro;
	@TableField("parentId")
	private Integer parentId;
	private String permission;
	private String createUser;
	private String updateUser;
}
