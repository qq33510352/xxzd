package com.xxzd.serviceimpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xxzd.common.vo.PageResult;
import com.xxzd.mapper.LogMapper;
import com.xxzd.pojo.Log;
import com.xxzd.service.LogService;
@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private LogMapper logMapper;
	
	@Override
	public PageResult findLogs(Integer page, Integer pageSize, String name) {
		Page<Log> paged = new Page<>();
		paged.setCurrent(page).setSize(pageSize);
		QueryWrapper<Log> queryWrapper = new QueryWrapper<>();
		queryWrapper.like("username",name)
		.orderByAsc("created");
		IPage<Log> selectPage = logMapper.selectPage(paged, queryWrapper);
		PageResult pageResult = PageResult.success("获取成功",(int)selectPage.getTotal(),selectPage.getRecords());
//		System.out.println(selectPage.getRecords());
		return pageResult;
	}

	@Override
	public void deleteByIds(Integer[] ids) {
		List<Integer> list = Arrays.asList(ids);
		logMapper.deleteBatchIds(list);
	}

}
