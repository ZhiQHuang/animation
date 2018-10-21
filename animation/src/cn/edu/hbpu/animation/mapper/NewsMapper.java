package cn.edu.hbpu.animation.mapper;

import cn.edu.hbpu.animation.pojo.News;
import cn.edu.hbpu.animation.pojo.NewsExample;
import cn.edu.hbpu.animation.pojo.NewsPojo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsMapper {
    int countByExample(NewsExample example);

    int deleteByExample(NewsExample example);

    int deleteByPrimaryKey(Integer newsid);

    int insert(News record);

    int insertSelective(News record);

    List<News> selectByExample(NewsExample example);

    News selectByPrimaryKey(Integer newsid);

    int updateByExampleSelective(@Param("record") News record, @Param("example") NewsExample example);

    int updateByExample(@Param("record") News record, @Param("example") NewsExample example);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
    int batchDelete(Integer[] newsIds);
    
    List<NewsPojo> selectTagnameAndTnameByExample(NewsExample example);
    
    List<NewsPojo> selectTagnameAndAndTitleByTname(String title);
    
    List<NewsPojo> selectTnameByBroadcast(NewsExample example);
    
    List<NewsPojo> selectTnameByWeek(NewsExample example);
    
    List<NewsPojo> selectTnameByHot(NewsExample example);
    
    List<NewsPojo> selectTnameByRead(NewsExample example);
    
    List<NewsPojo> selectTnameByTime(NewsExample example);
}