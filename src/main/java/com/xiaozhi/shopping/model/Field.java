package com.xiaozhi.shopping.model;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * pojo字段信息
 */
@Data
public class Field {
    private String key;
    //字段显示标题
    private String title;
    //字段属性名
    private String name;
    //字段类型 text,number,textarea,select等
    private String type;

    private String placeholder;

    private List<Option> select;

}
