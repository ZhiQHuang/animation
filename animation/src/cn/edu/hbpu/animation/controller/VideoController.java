package cn.edu.hbpu.animation.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.Video;
import cn.edu.hbpu.animation.pojo.VideoPojo;
import cn.edu.hbpu.animation.service.VideoService;
import cn.edu.hbpu.animation.util.CommonUtils;

@Controller
@RequestMapping("/admin/demo")
public class VideoController {

	@Autowired
	private VideoService videoService;

	// 分页获取视频列表
	@RequestMapping("/getAllVideo")
	@ResponseBody
	public Map<String, Object> getAllVideo(int page, int limit) {
		PageInfo<VideoPojo> pageInfo = videoService.getAllVideo(page, limit);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		return result;
	}

	// 插入视频
	@RequestMapping("/insertVideo")
	@ResponseBody
	public String insertVideo(Video video,@RequestParam("imageFile") MultipartFile[] files) {
		CommonUtils.uploadFiles(video, files);
		video.setPicture("/pic/"+video.getPicture());
		videoService.insertVideo(video);
		return "ok";
	}

	// 删除视频
	@RequestMapping("/deleteVideo")
	@ResponseBody
	public String deleteVideo(Video video) {
		video.getVid();
		video.setIsdel(1);
		videoService.deleteVideo(video);
		return "ok";
	}

	// 批量删除视频
	@RequestMapping("/batchDelVideo")
	@ResponseBody
	public void batchDelVideo(Integer[] vids) {
		videoService.batchDelVideo(vids);
	}

	// 查找视频
	@RequestMapping("/searchVideo")
	@ResponseBody
	public Map<String, Object> searchVideo(String title) {
		String content = "";
		try {
			content = URLDecoder.decode(title, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<VideoPojo> list = videoService.getVideoByTitle(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}

	// 修改视频
	@RequestMapping("/editVideo")
	@ResponseBody
	public void editVideo(Video video, @RequestParam("imageFile") MultipartFile[] files) {
		CommonUtils.uploadFiles(video, files);
		video.setPicture("/pic/"+video.getPicture());
		videoService.editVideo(video);
	}
}
