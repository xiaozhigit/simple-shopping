package com.xiaozhi.shopping.service;

import com.xiaozhi.shopping.model.OrderItems;
import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.OrdersWithBLOBs;
import com.xiaozhi.shopping.model.vo.OrdersVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface OrdersService {
    int save(HttpServletRequest request,OrdersVo ordersVo);

    void deleteById(Integer id);

    void update(OrdersWithBLOBs orders);

    OrdersVo findById(Integer id);

    List<Orders> findAll();

    Map getPayAndPendingOrderCount();

    Map getOrderPayInfo();

    OrderItems findOrderItemById(int id);

    void deleteOrderItemById(Integer id);

    void updateOrderItem(OrderItems rderItems);
}
