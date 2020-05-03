package com.xiaozhi.shopping.service;

import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.OrdersWithBLOBs;
import com.xiaozhi.shopping.model.vo.OrdersVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface OrdersService {
    int save(HttpServletRequest request,OrdersVo ordersVo);

    void deleteById(Integer id);

    void update(Orders orders);

    OrdersVo findById(Integer id);

    List<Orders> findAll();
}
