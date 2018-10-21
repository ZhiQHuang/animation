package cn.edu.hbpu.animation.mapper;

import cn.edu.hbpu.animation.pojo.NewsmaptagsExample;
import cn.edu.hbpu.animation.pojo.NewsmaptagsKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsmaptagsMapper {
    int countByExample(NewsmaptagsExample example);

    int deleteByExample(NewsmaptagsExample example);

    int deleteByPrimaryKey(NewsmaptagsKey key);

    int insert(NewsmaptagsKey record);

    int insertSelective(NewsmaptagsKey record);

    List<NewsmaptagsKey> selectByExample(NewsmaptagsExample example);

    int updateByExampleSelective(@Param("record") NewsmaptagsKey record, @Param("example") NewsmaptagsExample example);

    int updateByExample(@Param("record") NewsmaptagsKey record, @Param("example") NewsmaptagsExample example);
}