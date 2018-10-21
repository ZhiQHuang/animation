package cn.edu.hbpu.animation.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.News;
import cn.edu.hbpu.animation.pojo.NewsPojo;
import cn.edu.hbpu.animation.service.NewsService;
import cn.edu.hbpu.animation.util.CommonUtils;

@Controller
@RequestMapping("/admin/demo")
public class NewsController {
	@Autowired
	private NewsService newsService;

	/*
	 * @Autowired private NewsTagService newsTagService;
	 * 
	 * @Autowired private TagsService tagsService;
	 */
	// 分页显示资讯列表
	@RequestMapping("/getAllNews")
	@ResponseBody
	public Map<String, Object> getAllNews(int page, int limit) {
		PageInfo<NewsPojo> pageInfo = newsService.findNewsByPage(page, limit);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		return result;
	}

	// 假删除资讯
	@RequestMapping("/deleteNews")
	@ResponseBody
	public String deleteNews(News news) {
		news.getNewsid();
		news.setIsdel(1);
		newsService.deleteNews(news);
		return "ok";

	}

	@RequestMapping("/batchDelNews")
	@ResponseBody
	public String adminBatchDel(Integer[] newsids) {
		newsService.batchDelNews(newsids);
		return "ok";
	}

	// 添加资讯
	@RequestMapping("/insertNews")
	@ResponseBody
	public String insertNews(News news,
			@RequestParam("imageFile") MultipartFile[] files) {

		CommonUtils.uploadFiles(news, files);
		news.setPictures("/pic/" + news.getPictures());
		newsService.insertNews(news);
		return "ok";
	}

	// 修改资讯
	@RequestMapping("/editNews")
	@ResponseBody
	public String editNews(News news,
			@RequestParam("imageFile") MultipartFile[] files) {
		CommonUtils.uploadFiles(news, files);
		news.setPictures("/pic/" + news.getPictures());
		newsService.editNews(news);
		return "ok";
	}

	// 上传图片
	@RequestMapping("/uploadFile")
	@ResponseBody
	public static String uploadFile(HttpServletRequest request,
			@Param("file") MultipartFile file) throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		java.util.Date d = new java.util.Date();
		String res = sdf.format(d);
		File f = new File("E:\\dev\\upload\\");
		if (!f.exists()) {
			try {
				f.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String rootPath = "E:\\dev\\upload\\";
		// 原文件名称
		String originalFilename = file.getOriginalFilename();
		// 新的文件名称
		String newFileName = res
				+ originalFilename.substring(originalFilename.lastIndexOf("."));
		// 创建年月文件夹
		Calendar date = Calendar.getInstance();
		File dateDirs = new File(date.get(Calendar.YEAR) + File.separator
				+ (date.get(Calendar.MONTH) + 1));
		// 新文件
		File newFile = new File(rootPath + File.separator + dateDirs
				+ File.separator + newFileName);
		// 判断目标文件所在的目录是否存在
		if (!newFile.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			newFile.getParentFile().mkdirs();
		}
		System.out.println(newFile);
		// 将内存中的数据写入磁盘
		file.transferTo(newFile);
		// 完整的url

		String fileUrl = "/pics/" + date.get(Calendar.YEAR) + "/"
				+ (date.get(Calendar.MONTH) + 1) + "/"

				+ newFileName; // 以 Map 方式 创建JSON，最终返回给 前台

		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> map2 = new HashMap<String, Object>();

		map.put("code", 0);// 0表示成功，1失败
		map.put("msg", "上传成功");// 提示消息
		map.put("data", map2);
		map2.put("src", fileUrl);// 图片url
		map2.put("title", newFileName);// 图片名称，这个会显示在输入框里
		String result = new JSONObject(map).toString();
		return result;

	}

	// 根据标题查找资讯
	@RequestMapping("/getNewsByTitle")
	@ResponseBody
	public Map<String, Object> getNewsByTitle(String keyword) {
		String content = "";
		try {
			content = URLDecoder.decode(keyword, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<NewsPojo> list = newsService.getNewsByTitle(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}
}
