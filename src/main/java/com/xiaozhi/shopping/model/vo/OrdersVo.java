package com.xiaozhi.shopping.model.vo;

import com.xiaozhi.shopping.model.OrderItems;
import com.xiaozhi.shopping.model.Orders;
import lombok.Data;

import java.util.List;

/**
 * 订单数据封装
 */
@Data
public class OrdersVo extends Orders {

    private List<OrderItems> orderItems;
}
