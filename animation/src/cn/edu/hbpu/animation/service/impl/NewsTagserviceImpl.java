package cn.edu.hbpu.animation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.hbpu.animation.mapper.NewsmaptagsMapper;
import cn.edu.hbpu.animation.pojo.NewsmaptagsKey;
import cn.edu.hbpu.animation.service.NewsTagService;

@Service
public class NewsTagserviceImpl implements NewsTagService {

	@Autowired
	private NewsmaptagsMapper newsmaptagsMapper;

	public void insertNewsTag(NewsmaptagsKey newsmaptagsKey) {
		newsmaptagsMapper.insertSelective(newsmaptagsKey);
	}

}
