package com.xxzd.service;

import java.util.List;
import java.util.Map;

import com.xxzd.pojo.Role;
import com.xxzd.vo.DTreeVo;

public interface RoleService {

	List<Role> findRoles(String name);

	void deleteByIds(Integer[] ids);

	List<DTreeVo> getDtreeVo();

	void addRole(Role role, Integer[] moduleIds);

	Integer[] findModulesByRoleId(Integer id);

	void updateRole(Role role, Integer[] moduleIds);

	void updateOne(Integer id, String column, String value);

	boolean isExists(String column, String value);

	List<Map<String, Object>> getRoleMap();

	Integer findRoleByUserId(Integer id);


	
}
