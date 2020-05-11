package com.xiaozhi.shopping.model.vo;

import lombok.Data;

import java.util.List;

/**
 * crud页面录入数据pojo
 */
@Data
public class Record {
    private int id;
    private List<Object> data;
}
