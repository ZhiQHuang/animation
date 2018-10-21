package cn.edu.hbpu.animation.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.Comment;
import cn.edu.hbpu.animation.pojo.CommentPojo;

public interface CommentService {
	PageInfo<CommentPojo> getAllComment(int page, int limit);

	void deleteComment(Comment comment);

	void batchDelComment(Integer[] cids);
	
	List<CommentPojo> getCommentByContent(String content);

}
