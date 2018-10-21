package cn.edu.hbpu.animation.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.NewsmaptagsKey;
import cn.edu.hbpu.animation.pojo.Tags;
import cn.edu.hbpu.animation.service.NewsTagService;
import cn.edu.hbpu.animation.service.TagsService;

@Controller
@RequestMapping("/admin/demo")
public class TagsController {
	@Autowired
	private TagsService tagsService;
	@Autowired
	private NewsTagService newsTagService;

	// 分贝获取标签
	@RequestMapping("/getAllTags")
	@ResponseBody
	public Map<String, Object> getAlltags(int page, int limit) {
		PageInfo<Tags> pageInfo = tagsService.getAllTags(page, limit);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		return result;
	}

	// 获取所有标签
	@RequestMapping("/getTags")
	@ResponseBody
	public List<Tags> getTags() {
		return tagsService.getTags();
	}

	// 给资讯插入标签
	@RequestMapping("/insertNewsTags")
	@ResponseBody
	public String insertNewsTags(Integer[] tagsids, Integer newsid) {
		for (int i = 0; i < tagsids.length; i++) {
			NewsmaptagsKey newsmaptagsKey = new NewsmaptagsKey();
			newsmaptagsKey.setNewsid(newsid);
			newsmaptagsKey.setTagid(tagsids[i]);
			newsTagService.insertNewsTag(newsmaptagsKey);
		}
		return "ok";

	}

	// 插入标签
	@RequestMapping("/insertTag")
	@ResponseBody
	public String insertType(Tags tag) {
		tagsService.insertTag(tag);
		return "ok";
	}

	// 删除标签
	@RequestMapping("/deleteTag")
	@ResponseBody
	public String deleteTag(Tags tag) {
		tag.getTagid();
		tag.setIsdel(1);
		tagsService.deleteTag(tag);
		return "ok";
	}

	// 批量删除标签
	@RequestMapping("/batchDelTag")
	@ResponseBody
	public void batchDelTag(Integer[] tagIds) {
		tagsService.batchDelTag(tagIds);
	}

	// 查找标签
	@RequestMapping("/searchTag")
	@ResponseBody
	public Map<String, Object> searchTag(String name) {
		String content = "";
		try {
			content = URLDecoder.decode(name, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Tags> list = tagsService.getTagByName(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}

	// 修改分类
	@RequestMapping("/editTag")
	@ResponseBody
	public void editTag(Tags tag) {
		tagsService.editTag(tag);
	}

}
