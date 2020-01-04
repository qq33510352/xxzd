package com.xxzd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xxzd.pojo.Module;
import com.xxzd.vo.DTreeVo;
import com.xxzd.vo.TreeTableVo;

public interface ModuleMapper extends BaseMapper<Module>{
	@Select("select id,parentId pid,name title,intro,permission,created,updated,create_user,update_user from module")
	List<TreeTableVo> getTreeTable();
	@Select("select id,name title,parentId from module")
	List<DTreeVo> getDtreeVos();
	
}
