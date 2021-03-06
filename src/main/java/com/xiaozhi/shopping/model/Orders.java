package com.xiaozhi.shopping.model;

import lombok.Data;

import java.util.Date;
@Data
public class Orders {
    private Integer id;

    private String name;

    private String ip;

    private String email;

    private String company;

    private String phone;
    //邮政编码
    private String zip;
    //所在州
    private String state;
    //所在城市
    private String city;
    //地址
    private String address;

    private String shippingOption;

    private String orderNotes;
    //订单状态：-1:取消订单，0已提交，1已付款.2已发货，3已签收，4已完成
    private String orderStatus;

    private Float total;

    private Float taxes;

    private Date createTime;


}