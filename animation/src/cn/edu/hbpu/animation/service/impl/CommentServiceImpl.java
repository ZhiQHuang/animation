package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.CommentMapper;
import cn.edu.hbpu.animation.pojo.Comment;
import cn.edu.hbpu.animation.pojo.CommentExample;
import cn.edu.hbpu.animation.pojo.CommentPojo;
import cn.edu.hbpu.animation.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	public CommentMapper commentMapper;

	public void batchDelComment(Integer[] cids) {
		commentMapper.batchDelete(cids);
	}

	public void deleteComment(Comment comment) {
		comment.setIsdel(1);
		commentMapper.updateByPrimaryKeySelective(comment);
	}

	public PageInfo<CommentPojo> getAllComment(int page, int limit) {
		PageHelper.startPage(page, limit);
		CommentExample example = new CommentExample();
		List<CommentPojo> list = commentMapper.selectUsername(example);
		return new PageInfo<CommentPojo>(list);
	}

	public List<CommentPojo> getCommentByContent(String content) {
		return commentMapper.selectAllByContent(content);
	}

}
