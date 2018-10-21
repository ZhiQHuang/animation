package cn.edu.hbpu.animation.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.News;
import cn.edu.hbpu.animation.pojo.NewsPojo;

public interface NewsService {
	void deleteNews(News news);

	void insertNews(News news);

	PageInfo<NewsPojo> findNewsByPage(int page, int limit);

	List<NewsPojo> getNewsByTitle(String title);

	void batchDelNews(Integer[] newids);
	
	void editNews(News news);
	
	PageInfo<NewsPojo> getNewsByBroadcast(News news);
	
	PageInfo<NewsPojo> getNewsByHot(News news);
	
	PageInfo<NewsPojo> getNewsByWeek(News news);
	
	PageInfo<NewsPojo> getNewsByHits(News news);
	
	PageInfo<NewsPojo> getNewsByTime(News news);
	
	PageInfo<News> getNewsByType(Integer tid);
	
	List<News> getNewsByTid(Integer tid);
	
}
