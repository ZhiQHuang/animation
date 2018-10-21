package cn.edu.hbpu.animation.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.Type;

public interface TypeService {
	PageInfo<Type> getAllType(int page, int limit);
	
	List<Type> getType();

	void insertType(Type type);

	void deleteType(Type type);
	
	List<Type> getTypeByTname(String tname);
	
	void batchDelType(Integer[] tids);
	
	void editType(Type type);
	
	String getTnameByTid(Integer tid);
}
