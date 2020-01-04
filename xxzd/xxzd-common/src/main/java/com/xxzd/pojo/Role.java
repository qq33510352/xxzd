package com.xxzd.pojo;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@TableName
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Data
public class Role extends BasePojo{
	@TableId(type = IdType.AUTO)
	private Integer id;
	private String name;
	private String explained;
	private String createUser;
	private String updateUser;
}
