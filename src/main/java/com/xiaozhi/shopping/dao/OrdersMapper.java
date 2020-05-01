package com.xiaozhi.shopping.dao;

import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.OrdersExample;
import com.xiaozhi.shopping.model.OrdersWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrdersMapper {
    long countByExample(OrdersExample example);

    int deleteByExample(OrdersExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OrdersWithBLOBs record);

    int insertSelective(OrdersWithBLOBs record);

    List<OrdersWithBLOBs> selectByExampleWithBLOBs(OrdersExample example);

    List<Orders> selectByExample(OrdersExample example);

    OrdersWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OrdersWithBLOBs record, @Param("example") OrdersExample example);

    int updateByExampleWithBLOBs(@Param("record") OrdersWithBLOBs record, @Param("example") OrdersExample example);

    int updateByExample(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByPrimaryKeySelective(OrdersWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(OrdersWithBLOBs record);

    int updateByPrimaryKey(Orders record);
}