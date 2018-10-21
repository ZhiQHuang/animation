package cn.edu.hupu.shop.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.hbpu.animation.mapper.AdminuserMapper;
import cn.edu.hbpu.animation.mapper.CommentMapper;
import cn.edu.hbpu.animation.mapper.NewsMapper;
import cn.edu.hbpu.animation.mapper.NewsmaptagsMapper;
import cn.edu.hbpu.animation.pojo.Adminuser;
import cn.edu.hbpu.animation.pojo.CommentExample;
import cn.edu.hbpu.animation.pojo.News;
import cn.edu.hbpu.animation.pojo.NewsExample;
import cn.edu.hbpu.animation.pojo.NewsPojo;
import cn.edu.hbpu.animation.pojo.NewsmaptagsKey;
import cn.edu.hbpu.animation.pojo.Tags;
import cn.edu.hbpu.animation.service.AdminuserService;
import cn.edu.hbpu.animation.service.CommentService;
import cn.edu.hbpu.animation.service.NewsService;
import cn.edu.hbpu.animation.service.NewsTagService;
import cn.edu.hbpu.animation.service.TagsService;
import cn.edu.hbpu.animation.service.TypeService;
import cn.edu.hbpu.animation.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Demo1 {
	
	@Autowired
	private UserService userService;
	@Autowired
	private TagsService tagService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private AdminuserMapper adminuserMapper;
	@Autowired
	private AdminuserService adminuserService;	
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private CommentService commentService;
	@Autowired
	private NewsmaptagsMapper newsmaptagsMapper;
	@Autowired 
	private NewsTagService newsTagService;
	
	
	@Test
	public void test01(){
		adminuserService.adminLogin(1, "123");
	}
	@Test
	public void test02(){
		NewsExample example = new NewsExample();
		newsMapper.selectTnameByHot(example);
		News news = new News();
		newsService.getNewsByHot(news);
	}
	@Test
	public void test03(){
		
		newsMapper.selectTagnameAndAndTitleByTname("一");
		System.out.println(newsMapper.selectTagnameAndAndTitleByTname("一"));
		
	}
	
	@Test
	public void test04(){
		News news = new News();
		news.setNewsfrom("13414");
		newsMapper.insertSelective(news);
	}
	
	@Test
	public void test05(){
		News news = new News();
		news.setNewsfrom("13414");
		news.setNewsid(3);
		newsService.editNews(news);
	}
	
	@Test
	public void test06(){
		NewsExample example = new NewsExample();
		example.createCriteria().andIsdelEqualTo(0);
		example.createCriteria().andNewsidEqualTo(3);
		newsMapper.selectByExample(example);
	}
	
	@Test
	public void test08(){
		Tags tag = new Tags();
		tag.setName("1");
		tagService.insertTag(tag);
		 
	}
	
	@Test
	public void test09(){
		Integer[] uids={1,2};
		userService.batchDelUser(uids);
	}
	
}












