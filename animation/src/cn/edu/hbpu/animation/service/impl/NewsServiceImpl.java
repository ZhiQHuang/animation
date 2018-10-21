package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.NewsMapper;
import cn.edu.hbpu.animation.pojo.News;
import cn.edu.hbpu.animation.pojo.NewsExample;
import cn.edu.hbpu.animation.pojo.NewsPojo;
import cn.edu.hbpu.animation.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newsMapper;
	
	public PageInfo<NewsPojo> findNewsByPage(int page, int limit) {
		PageHelper.startPage(page, limit);
		NewsExample example = new NewsExample();
		List<NewsPojo> list = newsMapper.selectTagnameAndTnameByExample(example);
		return new PageInfo<NewsPojo>(list);
	}

	public void deleteNews(News news) {
		newsMapper.updateByPrimaryKeySelective(news);
	}
	
	public void insertNews(News news) {
		newsMapper.insertSelective(news);
	}
	
	public List<NewsPojo> getNewsByTitle(String title) {
		return newsMapper.selectTagnameAndAndTitleByTname(title);
	}

	public void batchDelNews(Integer[] newids) {
		newsMapper.batchDelete(newids);
	}

	public void editNews(News news) {
		newsMapper.updateByPrimaryKeySelective(news);
	}
	
	private void changeNewsList(List<NewsPojo> list) {
		for (int i = 0; i < list.size(); i++) {
			News news = list.get(i);
			String content = news.getContent();
			if (content.length()>50) {
				news.setContent(content.substring(0, 50)+"...");
			}
		}
	}
	
	public PageInfo<NewsPojo> getNewsByBroadcast(News news) {
		PageHelper.startPage(1, 4);
		NewsExample example = new NewsExample();
		List<NewsPojo> list = newsMapper.selectTnameByBroadcast(example);
		changeNewsList(list);
		return new PageInfo<NewsPojo>(list);
	}

	public PageInfo<NewsPojo> getNewsByHot(News news) {
		PageHelper.startPage(1, 8);
		NewsExample example = new NewsExample();
		List<NewsPojo> list = newsMapper.selectTnameByHot(example);
		changeNewsList(list);
		return new PageInfo<NewsPojo>(list);
	}

	public PageInfo<NewsPojo> getNewsByWeek(News news) {
		PageHelper.startPage(1, 5);
		NewsExample example = new NewsExample();
		List<NewsPojo> list=newsMapper.selectTnameByWeek(example);
		return new PageInfo<NewsPojo>(list); 
	}

	public PageInfo<NewsPojo> getNewsByHits(News news) {
		PageHelper.startPage(1, 5);
		NewsExample example = new NewsExample();
		List<NewsPojo> list = newsMapper.selectTnameByRead(example);
		return new PageInfo<NewsPojo>(list);
	}

	public PageInfo<NewsPojo> getNewsByTime(News news) {
		PageHelper.startPage(1, 5);
		NewsExample example = new NewsExample();
		List<NewsPojo> list = newsMapper.selectTnameByTime(example);
		changeNewsList(list);
		return new PageInfo<NewsPojo>(list);
	}

	public PageInfo<News> getNewsByType(Integer tid) {
		PageHelper.startPage(1, 5);
		NewsExample example = new NewsExample();
		example.createCriteria().andTidEqualTo(tid).andIsdelEqualTo(0);
		List<News> list = newsMapper.selectByExample(example);
		return new PageInfo<News>(list);
	}

	public List<News> getNewsByTid(Integer tid) {
		NewsExample example = new NewsExample();
		example.createCriteria().andIsdelEqualTo(0).andTidEqualTo(tid);
		example.setOrderByClause("date desc");
		return newsMapper.selectByExample(example);
	}


}
