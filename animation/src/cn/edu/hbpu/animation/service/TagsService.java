package cn.edu.hbpu.animation.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.Tags;

public interface TagsService {
	List<Tags> getTags();
	
	PageInfo<Tags> getAllTags(int page, int limit);

	void insertTag(Tags tag);

	void deleteTag(Tags tag);
	
	List<Tags> getTagByName(String name);
	
	void batchDelTag(Integer[] tagids);
	
	void editTag(Tags tag);
}
