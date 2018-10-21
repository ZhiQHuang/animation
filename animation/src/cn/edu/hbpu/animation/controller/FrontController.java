package cn.edu.hbpu.animation.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.News;
import cn.edu.hbpu.animation.pojo.NewsPojo;
import cn.edu.hbpu.animation.pojo.Video;
import cn.edu.hbpu.animation.pojo.VideoPojo;
import cn.edu.hbpu.animation.service.NewsService;
import cn.edu.hbpu.animation.service.TypeService;
import cn.edu.hbpu.animation.service.UserService;
import cn.edu.hbpu.animation.service.VideoService;

@Controller
public class FrontController {
	@Autowired
	private NewsService newsService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private UserService userService;
	
	//获取轮播
	@RequestMapping("/getNewsByBroadcast")
	@ResponseBody
	public PageInfo<NewsPojo> getNewsByBroadcast(News news) {
		return newsService.getNewsByBroadcast(news);
	}
	
	//获取热门
	@RequestMapping("/getNewsByHot")
	@ResponseBody
	public PageInfo<NewsPojo> getNewsByHot(News news) {
		return newsService.getNewsByHot(news);
	}
	
	//获取周推
	@RequestMapping("/getNewsByWeek")
	@ResponseBody
	public PageInfo<NewsPojo> getNewsByWeek(News news) {
		return newsService.getNewsByWeek(news);
	}
	
	//获取点击量最高
	@RequestMapping("/getNewsByHits")
	@ResponseBody
	public PageInfo<NewsPojo> getNewsByHits(News news) {
		return newsService.getNewsByHits(news);
	}
	
	//发布时间
	@RequestMapping("/getNewsByDate")
	@ResponseBody
	public PageInfo<NewsPojo> getNewsByDate(News news) {
		return newsService.getNewsByTime(news);
	}
	
	//获取点击量最高
	@RequestMapping("/getVideo")
	@ResponseBody
	public PageInfo<VideoPojo> getVideo(Video video) {
		return videoService.getVideo(video);
	}
	
	//分类获取资讯
	@RequestMapping("/getNewsByType")
	@ResponseBody
	public PageInfo<News> getNewsByType(Integer tid) {
		return newsService.getNewsByType(tid);
	}
	
	//获取分类名称
	@RequestMapping("/getTname")
	@ResponseBody
	public Map<String, String> getTname(Integer tid) {
		 Map<String, String> map=new HashMap<String, String>();
	     map.put("tname", typeService.getTnameByTid(tid));
	     return map;
	}
	
	//获取分类
	@RequestMapping("/getNewsByTid")
	@ResponseBody
	public List<News> getNewsByTid(Integer tid) {
		return newsService.getNewsByTid(tid);
	}

}
