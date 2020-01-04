package com.xxzd.serviceimpl;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxzd.mapper.RoleMapper;
import com.xxzd.mapper.RolesModulesMapper;
import com.xxzd.mapper.UsersRolesMapper;
import com.xxzd.pojo.Role;
import com.xxzd.service.RoleService;
import com.xxzd.vo.DTreeVo;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private UsersRolesMapper usersRolesMapper;
	@Autowired
	private RolesModulesMapper rolesModulesMapper;
	@Override
	public List<Role> findRoles(String name) {
		return roleMapper.selectList(new QueryWrapper<Role>().like("name", name));
	}

	@Override
	public void deleteByIds(Integer[] ids) {
		List<Integer> list = Arrays.asList(ids);
		usersRolesMapper.deleteUsersByRoleIds(ids);
		rolesModulesMapper.deleteModulesByRoleIds(ids);
		roleMapper.deleteBatchIds(list);
	}

	@Override
	public List<DTreeVo> getDtreeVo() {
		return roleMapper.findDtreeVo();
	}

	@Override
	@Transactional
	public void addRole(Role role, Integer[] moduleIds) {
		//先主表后 关系表 
		role.setCreated(new Date());
		role.setUpdated(role.getCreated());
		role.setCreateUser("admin").setUpdateUser("admin");//临时
		roleMapper.insert(role);
		rolesModulesMapper.add(role.getId(),moduleIds);
	}

	@Override
	public Integer[] findModulesByRoleId(Integer id) {
		return rolesModulesMapper.findModulesByRoleId(id);
	}

	@Override
	public void updateRole(Role role, Integer[] moduleIds) {
		//先删除关系表   添加 主表 添加关系表  都行
		rolesModulesMapper.deleteModulesByRoleIds(new Integer[]{role.getId()});
		role.setUpdated(new Date());
		role.setCreateUser("admin").setUpdateUser("admin");//临时
		roleMapper.updateById(role);
		rolesModulesMapper.add(role.getId(),moduleIds);
	}

	@Override
	public void updateOne(Integer id, String column, String value) {
		roleMapper.updateOne(id,column,value);
	}

	@Override
	public boolean isExists(String column, String value) {
		QueryWrapper<Role> queryWrapper = new QueryWrapper<Role>();
		queryWrapper.eq(column,value);
		Integer selectCount = roleMapper.selectCount(queryWrapper);
		if(selectCount==null||selectCount==0)return true;
		return false;
	}

	@Override
	public List<Map<String,Object>> getRoleMap() {
		QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
		queryWrapper.select("id,name");
		List<Map<String, Object>> list = roleMapper.selectMaps(queryWrapper);
		return list;
	}

	@Override
	public Integer findRoleByUserId(Integer id) {
		if (id==null)return null;
		//根据用户id去查询中间表  获取用户角色
		Integer[] roleId = usersRolesMapper.findRoleByUserId(id);
		if(roleId.length==0)return null;
		return roleId[0];
	}

}
