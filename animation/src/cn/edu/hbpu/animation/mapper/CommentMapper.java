package cn.edu.hbpu.animation.mapper;

import cn.edu.hbpu.animation.pojo.Comment;
import cn.edu.hbpu.animation.pojo.CommentExample;
import cn.edu.hbpu.animation.pojo.CommentPojo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommentMapper {
    int countByExample(CommentExample example);

    int deleteByExample(CommentExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);

    Comment selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
    
    List<CommentPojo> selectUsername(CommentExample example);
    
    int batchDelete(Integer[] cids);
    
    List<CommentPojo> selectAllByContent(String content);
}