package com.xxzd.mapper;

import org.apache.ibatis.annotations.Update;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xxzd.pojo.User;
import com.xxzd.vo.CheckBox;

public interface UserMapper extends BaseMapper<User> {

	void valids(CheckBox checkBox);
	@Update("update user set ${column} = #{value},updated=now() where id = #{id}")
	void updateOne(Integer id,String column,String value);

}
