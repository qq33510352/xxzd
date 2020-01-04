package com.xxzd.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xxzd.common.vo.JsonResult;
import com.xxzd.common.vo.PageResult;
import com.xxzd.pojo.Role;
import com.xxzd.service.RoleService;
import com.xxzd.vo.DTreeVo;

@RestController
@RequestMapping("/role/")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/getRoleMap")
	public JsonResult getRoleMap(){
		List<Map<String, Object>> list = roleService.getRoleMap();
		return JsonResult.success("OJBK",list);
	}

	@RequestMapping("/findRoleByUserId")
	public JsonResult findRoleByUserId(Integer id){
		Integer roleId = roleService.findRoleByUserId(id);
		return JsonResult.success("OJBK",roleId);
	}
	
	@RequestMapping("/findRoles/{name}")
	public PageResult findUsers(@PathVariable String name) {
		name = name.substring(0,name.length()-1);
		System.out.println("角色名:"+name);
		List<Role> roles = roleService.findRoles(name);
		PageResult pageResult = new PageResult(0,"OJBK",100,roles);
		System.out.println(pageResult);
		return pageResult;
	}
	
	@RequestMapping("/getModuleTree")
	public JsonResult testTree() {
		List<DTreeVo> list = roleService.getDtreeVo();
		JsonResult result = JsonResult.success("ok",list);
		System.err.println(result);
		return result;
	}
	
	@RequestMapping("/deleteByIds")
	public JsonResult deleteByIds(Integer[] ids) {
		System.out.println("----"+Arrays.toString(ids));
		roleService.deleteByIds(ids);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/addRole")
	public JsonResult addRole(Role role,Integer[] moduleIds) {
		System.out.println("添加----"+role);
		System.out.println("----"+Arrays.toString(moduleIds));
		roleService.addRole(role,moduleIds);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/updateRole")
	public JsonResult updateRole(Role role,Integer[] moduleIds) {
		System.out.println("更新----"+role);
		System.out.println("----"+Arrays.toString(moduleIds));
		roleService.updateRole(role,moduleIds);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/findModulesByRoleId")
	public JsonResult findModulesByRoleId(Integer id) {
		Integer moduleIds[] = roleService.findModulesByRoleId(id);
		return JsonResult.success("OJBK",moduleIds);
	}

	@RequestMapping("/updateOne")
	public JsonResult updateOne(Integer id,String column,String value) {
		System.out.println("id"+id+"更新了"+column+":"+value);
		roleService.updateOne(id,column,value);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/isExists")
	public JsonResult isExists(String column,String value) {
		System.err.println("查询角色名是否存在:"+column+":"+value);
		boolean flag = roleService.isExists(column,value);
		return JsonResult.success("ok",flag);
	}
}
