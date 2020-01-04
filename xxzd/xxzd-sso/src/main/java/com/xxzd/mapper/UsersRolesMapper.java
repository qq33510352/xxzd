package com.xxzd.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UsersRolesMapper{

	void deleteRolesByUserIds(Integer[] userIds);

	void deleteUsersByRoleIds(Integer[] ids);
	@Insert("insert into users_roles values(#{userId},#{roleSelect})")
	void insert(Integer userId, Integer roleSelect);
	@Select("select role_id from users_roles where user_id = #{id}")
	Integer[] findRoleByUserId(Integer id);
	@Update("update users_roles set role_id = #{roleId} where user_id = #{userId}")
	void deleteByUserId(Integer userId, Integer roleId);

}
