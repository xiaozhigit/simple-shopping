package com.xiaozhi.shopping.model;

import lombok.Data;

@Data
public class Products {
    private Integer id;

    private Integer category;

    private String name;

    private String image;

    private String thumb;

    private Float price;

    private String producer;

    private Float tax;

    private String active;

}