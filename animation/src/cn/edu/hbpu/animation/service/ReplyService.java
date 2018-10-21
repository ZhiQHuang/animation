package cn.edu.hbpu.animation.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.Reply;
import cn.edu.hbpu.animation.pojo.ReplyPojo;

public interface ReplyService {
	PageInfo<ReplyPojo> getAllReply(int page, int limit);
	
	void deleteReply(Reply reply);
	
	void batchDelReply(Integer[] rids);
	
	List<ReplyPojo> getReplyByContent(String content);
}
