package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.ReplyMapper;
import cn.edu.hbpu.animation.pojo.Reply;
import cn.edu.hbpu.animation.pojo.ReplyExample;
import cn.edu.hbpu.animation.pojo.ReplyPojo;
import cn.edu.hbpu.animation.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;
	
	public void batchDelReply(Integer[] rids) {
		replyMapper.batchDelete(rids);
	}

	public void deleteReply(Reply reply) {
		reply.setIsdel(1);
		replyMapper.updateByPrimaryKeySelective(reply);
	}

	public PageInfo<ReplyPojo> getAllReply(int page, int limit) {
		PageHelper.startPage(page, limit);
		ReplyExample example = new ReplyExample();
		List<ReplyPojo> list = replyMapper.selectAllReply(example);
		return new PageInfo<ReplyPojo>(list);
	}

	public List<ReplyPojo> getReplyByContent(String content) {
		return replyMapper.selectReply(content);
	}

}
