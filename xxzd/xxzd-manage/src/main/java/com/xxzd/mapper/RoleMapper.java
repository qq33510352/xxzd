package com.xxzd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xxzd.pojo.Role;
import com.xxzd.vo.DTreeVo;

public interface RoleMapper extends BaseMapper<Role>{

	List<DTreeVo> findDtreeVo();
	
	@Update("update role set ${column} = #{value} where id = #{id}")
	void updateOne(Integer id, String column, String value);
	
}
