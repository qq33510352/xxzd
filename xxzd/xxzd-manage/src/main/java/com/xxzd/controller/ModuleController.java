package com.xxzd.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xxzd.common.vo.JsonResult;
import com.xxzd.pojo.Module;
import com.xxzd.service.ModuleService;
import com.xxzd.vo.DTreeVo;
import com.xxzd.vo.TreeTableVo;

@RestController
@RequestMapping("/module/")
public class ModuleController {
	@Autowired
	private ModuleService moduleService;
	
	@RequestMapping("/deleteModuleByIds")
	public JsonResult deleteModuleByIds(Integer[] ids) {
		System.out.println("删除树:"+Arrays.toString(ids));
		moduleService.deleteModuleByIds(ids);
		return JsonResult.success("OJBK");
	}
	
	@RequestMapping("/insertNode")
	public JsonResult insertNode(Module module) {
		System.out.println("添加树"+module);
		moduleService.insertNode(module);
		return JsonResult.success("OJBK");
	}

	@RequestMapping("/updateNodeById")
	public JsonResult updateNode(Module module) {
		System.out.println("更新树"+module);
		moduleService.updateNodeById(module);
		return JsonResult.success("OJBK");
	}

	@RequestMapping("/getDTreeVoById")
	public JsonResult getDTreeVoById(Integer id) {
		List<DTreeVo> list = moduleService.getDTreeVoById(id);
		JsonResult result = JsonResult.success("ok",list);
		System.err.println(result);
		return result;
	}
	
	@RequestMapping("/getTableTree")
	public List<TreeTableVo> getTableTree() {
		System.out.println("TableTree树被访问");
		List<TreeTableVo> list = moduleService.getTableTree();
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("/isExists")
	public JsonResult isExists(String column,String value) {
		System.err.println("查询角色名是否存在:"+column+":"+value);
		boolean flag = moduleService.isExists(column,value);
		return JsonResult.success("ok",flag);
	}
}
