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

import cn.edu.hbpu.animation.pojo.Comment;
import cn.edu.hbpu.animation.pojo.CommentPojo;
import cn.edu.hbpu.animation.service.CommentService;

@Controller
@RequestMapping("/admin/demo")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	//分页显示所有评论
	@RequestMapping("/getAllComment")
	@ResponseBody
	public Map<String, Object> getAllcomment(int page, int limit) {
		PageInfo<CommentPojo> pageInfo = commentService.getAllComment(page, limit); 
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		
		return result ;
	}
	
	//删除评论
	@RequestMapping("/deleteComment")
	@ResponseBody
	public String deleteCom(Comment comment) {
		comment.getCid();
		commentService.deleteComment(comment);
		return "ok";
	}
	
	//批量删除评论
	@RequestMapping("/batchDelComment")
	@ResponseBody
	public void batchDelComment(Integer[] cids) {
		commentService.batchDelComment(cids);
	}
	
	//根据评论内容查找评论
	@RequestMapping("/searchComment")
	@ResponseBody
	public Map<String, Object> getCommentByContent(String keyword) {
		String content = "";
		try {
			content = URLDecoder.decode(keyword, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<CommentPojo> list = commentService.getCommentByContent(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}
}
