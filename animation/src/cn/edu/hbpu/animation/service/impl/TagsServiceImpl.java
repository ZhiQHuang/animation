package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.TagsMapper;
import cn.edu.hbpu.animation.pojo.Tags;
import cn.edu.hbpu.animation.pojo.TagsExample;
import cn.edu.hbpu.animation.service.TagsService;

@Service
public class TagsServiceImpl implements TagsService {
	@Autowired
	public TagsMapper tagsMapper;
	
	public List<Tags> getTags() {
		TagsExample example = new TagsExample();
		example.createCriteria().andIsdelEqualTo(0);
		return tagsMapper.selectByExample(example);
	}

	public PageInfo<Tags> getAllTags(int page, int limit) {
		PageHelper.startPage(page, limit);
		TagsExample example = new TagsExample();
		example.createCriteria().andIsdelEqualTo(0);
		List<Tags> list = tagsMapper.selectByExample(example);
		return new PageInfo<Tags>(list);
	}

	public void batchDelTag(Integer[] tagIds) {
		tagsMapper.batchDelete(tagIds);
	}

	public void deleteTag(Tags tag) {
		tagsMapper.updateByPrimaryKeySelective(tag);
	}

	public void editTag(Tags tag) {
		tagsMapper.updateByPrimaryKeySelective(tag);
	}

	public List<Tags> getTagByName(String name) {
		TagsExample example = new TagsExample();
		example.createCriteria().andNameLike("%"+name+"%");
		return tagsMapper.selectByExample(example);
	}

	public void insertTag(Tags tag) {
		tagsMapper.insertSelective(tag);
	}

}
