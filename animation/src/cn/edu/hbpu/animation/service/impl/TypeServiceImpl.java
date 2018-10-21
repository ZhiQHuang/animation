package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.TypeMapper;
import cn.edu.hbpu.animation.pojo.Type;
import cn.edu.hbpu.animation.pojo.TypeExample;
import cn.edu.hbpu.animation.service.TypeService;

@Service
public class TypeServiceImpl implements TypeService {
	@Autowired
	public TypeMapper typeMapper;

	public void insertType(Type type) {
		typeMapper.insertSelective(type);

	}

	public void deleteType(Type type) {
		typeMapper.updateByPrimaryKeySelective(type);
	}

	public PageInfo<Type> getAllType(int page, int limit) {
		PageHelper.startPage(page, limit);
		TypeExample example = new TypeExample();
		example.createCriteria().andIsdelEqualTo(0);
		List<Type> list = typeMapper.selectByExample(example);
		return new PageInfo<Type>(list);
	}

	public List<Type> getType() {
		TypeExample example = new TypeExample();
		example.createCriteria().andIsdelEqualTo(0);
		return typeMapper.selectByExample(example);
	}

	public List<Type> getTypeByTname(String tname) {
		TypeExample example = new TypeExample();
		example.createCriteria().andIsdelEqualTo(0).andTnameLike("%"+tname+"%");
		return typeMapper.selectByExample(example);
	}

	public void batchDelType(Integer[] tids) {
		typeMapper.batchDelete(tids);
	}

	public void editType(Type type) {
		typeMapper.updateByPrimaryKeySelective(type);
	}

	public String getTnameByTid(Integer tid) {
	 	return typeMapper.selectByPrimaryKey(tid).getTname();
	}
}
