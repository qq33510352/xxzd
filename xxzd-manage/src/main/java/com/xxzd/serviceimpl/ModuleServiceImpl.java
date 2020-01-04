package com.xxzd.serviceimpl;

import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxzd.mapper.ModuleMapper;
import com.xxzd.mapper.RolesModulesMapper;
import com.xxzd.pojo.Module;
import com.xxzd.pojo.Role;
import com.xxzd.service.ModuleService;
import com.xxzd.vo.DTreeVo;
import com.xxzd.vo.TreeTableVo;
@Service
public class ModuleServiceImpl implements ModuleService {
	@Autowired
	private ModuleMapper moduleMapper;
	@Autowired
	private RolesModulesMapper rolesModulesMapper;
	//删除节点
	@Override
	public void deleteModuleByIds(Integer[] ids) {
		List<Integer> list = Arrays.asList(ids);
		rolesModulesMapper.deleteByModules(ids);
		list = list.stream().distinct().collect(Collectors.toList());
		System.out.println("去重复值:"+list);
		rolesModulesMapper.deleteByModules(ids);
		moduleMapper.deleteBatchIds(list);
	}
	//添加节点
	@Override
	public void insertNode(Module module) {
		if(module.getParentId()==null)module.setParentId(0);
		module.setCreated(new Date());
		module.setUpdated(module.getCreated());
		module.setCreateUser("admin");//临时
		module.setUpdateUser("admin");
		moduleMapper.insert(module);
	}

	//根据id获取节点
	@Override
	public List<DTreeVo> getDTreeVoById(Integer id) {
		if(id==0)return null;
		List<DTreeVo> list = moduleMapper.getDtreeVos();
		Iterator<DTreeVo> iterator = list.iterator();
		while (iterator.hasNext()) {
			DTreeVo dTreeVo = iterator.next();
			if(dTreeVo.getId()==id || dTreeVo.getParentId()==id) {
				Iterator<DTreeVo> iterator2 = list.iterator();
				while (iterator2.hasNext()) {
					DTreeVo dTreeVo2 = iterator2.next();
					if(dTreeVo.getParentId()==dTreeVo.getId()) {
						iterator2.remove();
					}
				}
				iterator.remove();//移除前先移除 这个的子节点
				continue;
			}
		}
		System.out.println(list);
		return list;
	}
	@Override
	public List<TreeTableVo> getTableTree() {
		return moduleMapper.getTreeTable();
	}
	@Override
	public void updateNodeById(Module module) {
		if(module.getParentId()==null)module.setParentId(0);
		module.setUpdated(new Date());
		module.setCreateUser("admin").setUpdateUser("admin");
		moduleMapper.updateById(module);
	}
	@Override
	public boolean isExists(String column, String value) {
		QueryWrapper<Module> queryWrapper = new QueryWrapper<Module>();
		queryWrapper.eq(column,value);
		Integer selectCount = moduleMapper.selectCount(queryWrapper);
		if(selectCount==null||selectCount==0)return true;
		return false;
	}
}
