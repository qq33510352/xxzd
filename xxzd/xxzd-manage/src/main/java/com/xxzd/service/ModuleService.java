package com.xxzd.service;

import java.util.List;

import com.xxzd.common.vo.JsonResult;
import com.xxzd.pojo.Module;
import com.xxzd.vo.DTreeVo;
import com.xxzd.vo.TreeTableVo;

public interface ModuleService {

	void deleteModuleByIds(Integer[] ids);

	void insertNode(Module module);

	List<DTreeVo> getDTreeVoById(Integer id);

	List<TreeTableVo> getTableTree();

	void updateNodeById(Module module);

	boolean isExists(String column, String value);
	
}
