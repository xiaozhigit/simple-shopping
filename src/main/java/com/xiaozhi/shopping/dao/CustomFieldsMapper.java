package com.xiaozhi.shopping.dao;

import com.xiaozhi.shopping.model.CustomFields;
import com.xiaozhi.shopping.model.CustomFieldsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomFieldsMapper {
    long countByExample(CustomFieldsExample example);

    int deleteByExample(CustomFieldsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CustomFields record);

    int insertSelective(CustomFields record);

    List<CustomFields> selectByExampleWithBLOBs(CustomFieldsExample example);

    List<CustomFields> selectByExample(CustomFieldsExample example);

    CustomFields selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CustomFields record, @Param("example") CustomFieldsExample example);

    int updateByExampleWithBLOBs(@Param("record") CustomFields record, @Param("example") CustomFieldsExample example);

    int updateByExample(@Param("record") CustomFields record, @Param("example") CustomFieldsExample example);

    int updateByPrimaryKeySelective(CustomFields record);

    int updateByPrimaryKeyWithBLOBs(CustomFields record);

    int updateByPrimaryKey(CustomFields record);
}