package com.xxzd.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface RolesModulesMapper{

	void deleteModulesByRoleIds(Integer[] ids);

	void deleteByModules(Integer[] ids);

	void add(@Param("roleId")Integer roleId,@Param("moduleIds")Integer[] moduleIds);
	
	@Select("select module_id from roles_modules where role_id = #{id}")
	Integer[] findModulesByRoleId(@Param("id")Integer id);

}
