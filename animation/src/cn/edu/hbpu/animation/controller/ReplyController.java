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

import cn.edu.hbpu.animation.pojo.Reply;
import cn.edu.hbpu.animation.pojo.ReplyPojo;
import cn.edu.hbpu.animation.service.ReplyService;

@Controller
@RequestMapping("/admin/demo")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	//分页显示所有回复评论
	@RequestMapping("/getAllReply")
	@ResponseBody
	public Map<String, Object> getAllReply(int page, int limit) {
		PageInfo<ReplyPojo> pageInfo = replyService.getAllReply(page, limit); 
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		
		return result ;
	}
	
	//删除回复评论
	@RequestMapping("/deleteReply")
	@ResponseBody
	public String deleteReply(Reply reply) {
		reply.getCid();
		replyService.deleteReply(reply);
		return "ok";
	}
	
	//批量删除回复评论
	@RequestMapping("/batchDelReply")
	@ResponseBody
	public void batchDelComment(Integer[] rids) {
		replyService.batchDelReply(rids);
	}
	
	//根据评论内容查找评论
	@RequestMapping("/searchReply")
	@ResponseBody
	public Map<String, Object> getReplyByContent(String keyword) {
		String content = "";
		try {
			content = URLDecoder.decode(keyword, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<ReplyPojo> list = replyService.getReplyByContent(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}
}
