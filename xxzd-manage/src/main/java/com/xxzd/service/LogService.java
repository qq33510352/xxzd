package com.xxzd.service;

import com.xxzd.common.vo.PageResult;

public interface LogService {

	PageResult findLogs(Integer page, Integer pageSize, String name);

	void deleteByIds(Integer[] ids);

}
