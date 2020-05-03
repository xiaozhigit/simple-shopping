package com.xiaozhi.shopping.model;

import lombok.Data;

/**
 * 订单项
 */
@Data
public class OrderItems {
    private Integer id;

    private Integer orderid;

    private Integer productId;

    private String productName;

    private Float quantity;

    private Float price;

    private Float tax;

    private Float subTotal;

    private Float totalTax;

    private Float total;

}