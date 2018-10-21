package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.VideoMapper;
import cn.edu.hbpu.animation.pojo.Video;
import cn.edu.hbpu.animation.pojo.VideoExample;
import cn.edu.hbpu.animation.pojo.VideoPojo;
import cn.edu.hbpu.animation.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	private VideoMapper videoMapper;
	
	public void batchDelVideo(Integer[] vids) {
		videoMapper.batchDelete(vids);
	}

	public void deleteVideo(Video video) {
		videoMapper.updateByPrimaryKeySelective(video);
	}

	public void editVideo(Video video) {
		videoMapper.updateByPrimaryKeySelective(video);
	}

	public PageInfo<VideoPojo> getAllVideo(int page, int limit) {
		PageHelper.startPage(page,limit);
		VideoExample example = new VideoExample();
		List<VideoPojo> list = videoMapper.selectAll(example);
		return new PageInfo<VideoPojo>(list);
	}

	public List<VideoPojo> getVideoByTitle(String title) {
		return videoMapper.selectByTitle(title);
	}

	public void insertVideo(Video video) {
		videoMapper.insertSelective(video);
	}

	public PageInfo<VideoPojo> getVideo(Video video) {
		PageHelper.startPage(1, 4);
		VideoExample example = new VideoExample();
		List<VideoPojo> list = videoMapper.selectAll(example);
		return new PageInfo<VideoPojo>(list);
	}

}
