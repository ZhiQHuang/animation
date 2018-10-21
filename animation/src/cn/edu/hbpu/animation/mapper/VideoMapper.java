package cn.edu.hbpu.animation.mapper;

import cn.edu.hbpu.animation.pojo.Video;
import cn.edu.hbpu.animation.pojo.VideoExample;
import cn.edu.hbpu.animation.pojo.VideoPojo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VideoMapper {
    int countByExample(VideoExample example);

    int deleteByExample(VideoExample example);

    int deleteByPrimaryKey(Integer vid);

    int insert(Video record);

    int insertSelective(Video record);

    List<Video> selectByExample(VideoExample example);

    Video selectByPrimaryKey(Integer vid);

    int updateByExampleSelective(@Param("record") Video record, @Param("example") VideoExample example);

    int updateByExample(@Param("record") Video record, @Param("example") VideoExample example);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
    
    List<VideoPojo> selectAll(VideoExample example);
    
    List<VideoPojo> selectByTitle(String title);
    
    int batchDelete(Integer[] vids);
}