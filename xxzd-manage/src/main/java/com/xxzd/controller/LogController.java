package com.xxzd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xxzd.service.LogService;
import com.xxzd.common.vo.JsonResult;
import com.xxzd.common.vo.PageResult;

@RestController
@RequestMapping("/log/")
public class LogController {
	@Autowired
	private LogService logService;
	
	@RequestMapping("/findLogs/{name}")
	public PageResult findLogs(@PathVariable String name,Integer page,@RequestParam(name = "limit")Integer pageSize){
		name = name.substring(0,name.length()-1);
		System.out.println("根据用户名找日志:"+name);
		PageResult pageResult = logService.findLogs(page, pageSize,name);
		System.out.println(pageResult);
		return pageResult;
	}
	
	@RequestMapping("/deleteByIds")
	public JsonResult deleteByIds(Integer[] ids) {
		logService.deleteByIds(ids);
		return JsonResult.success("OJBK");
	}
}
