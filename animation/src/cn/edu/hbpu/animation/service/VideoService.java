package cn.edu.hbpu.animation.service;

import java.util.List;

import cn.edu.hbpu.animation.pojo.Video;
import cn.edu.hbpu.animation.pojo.VideoPojo;

import com.github.pagehelper.PageInfo;

public interface VideoService {

	PageInfo<VideoPojo> getAllVideo(int page, int limit);

	void insertVideo(Video video);

	void deleteVideo(Video video);

	List<VideoPojo> getVideoByTitle(String title);

	void batchDelVideo(Integer[] vids);

	void editVideo(Video video);
	
	PageInfo<VideoPojo> getVideo(Video video);
}
