package cn.edu.hbpu.animation.mapper;

import cn.edu.hbpu.animation.pojo.Reply;
import cn.edu.hbpu.animation.pojo.ReplyExample;
import cn.edu.hbpu.animation.pojo.ReplyPojo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReplyMapper {
    int countByExample(ReplyExample example);

    int deleteByExample(ReplyExample example);

    int deleteByPrimaryKey(Integer rid);

    int insert(Reply record);

    int insertSelective(Reply record);

    List<Reply> selectByExample(ReplyExample example);

    Reply selectByPrimaryKey(Integer rid);

    int updateByExampleSelective(@Param("record") Reply record, @Param("example") ReplyExample example);

    int updateByExample(@Param("record") Reply record, @Param("example") ReplyExample example);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);
    
    List<ReplyPojo> selectAllReply(ReplyExample example);
    
    int batchDelete(Integer[] rids);
    
    List<ReplyPojo> selectReply(String content);
}