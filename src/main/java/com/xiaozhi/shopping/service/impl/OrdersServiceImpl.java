package com.xiaozhi.shopping.service.impl;

import com.xiaozhi.shopping.base.util.BigDecimalUtil;
import com.xiaozhi.shopping.base.util.Utils;
import com.xiaozhi.shopping.dao.OrderItemsMapper;
import com.xiaozhi.shopping.dao.OrdersMapper;
import com.xiaozhi.shopping.model.OrderItems;
import com.xiaozhi.shopping.model.OrderItemsExample;
import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.OrdersWithBLOBs;
import com.xiaozhi.shopping.model.vo.OrdersVo;
import com.xiaozhi.shopping.service.OrdersService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Resource
    OrdersMapper ordersMapper;
    @Resource
    OrderItemsMapper orderItemsMapper;

    @Override
    public int save(HttpServletRequest request,OrdersVo ordersVo) {
        OrdersWithBLOBs order=new OrdersWithBLOBs();
        //填充订单对象
        fullPojo(request,order,ordersVo);
        //保存订单对象到数据库并获取订单id
        ordersMapper.insert(order);
        //订单项设置订单id
        List<OrderItems> orderItems=ordersVo.getOrderItems();
        for (OrderItems orderItem:orderItems) {
            orderItem.setOrderid(order.getId());
        }
        //批量保存订单项
        orderItemsMapper.insertPatch(orderItems);
        return order.getId();
    }

    @Override
    public void deleteById(Integer id) {
        //删除订单及订单项
        ordersMapper.deleteByPrimaryKey(id);
        OrderItemsExample itemsExample=new OrderItemsExample();
        OrderItemsExample.Criteria criteria=itemsExample.createCriteria();
        criteria.andOrderidEqualTo(id);
        orderItemsMapper.selectByExample(itemsExample);
    }

    @Override
    public void update(OrdersWithBLOBs orders) {
        ordersMapper.updateByPrimaryKeySelective(orders);
    }

    @Override
    public OrdersVo findById(Integer id) {
        Orders orders= ordersMapper.selectByPrimaryKey(id);
        OrdersVo ordersVo=new OrdersVo();

        ordersVo.setId(orders.getId());
        ordersVo.setOrderStatus(orders.getOrderStatus());
        ordersVo.setCreateTime(orders.getCreateTime());
        ordersVo.setName(orders.getName());
        ordersVo.setEmail(orders.getEmail());
        ordersVo.setCompany(orders.getCompany());
        ordersVo.setPhone(orders.getPhone());
        ordersVo.setTaxes(orders.getTaxes());
        ordersVo.setTotal(orders.getTotal());

        OrderItemsExample example=new OrderItemsExample();
        OrderItemsExample.Criteria criteria=example.createCriteria();
        criteria.andOrderidEqualTo(orders.getId());
       List<OrderItems> orderItems= orderItemsMapper.selectByExample(example);
        ordersVo.setOrderItems(orderItems);
        return  ordersVo;
    }

    @Override
    public List<Orders> findAll() {
        return ordersMapper.selectByExample(null);
    }

    /**
     * 获取付款的和未付款的订单数量
     * @return
     */
    public Map getPayAndPendingOrderCount() {
        Map map=new HashMap();
        List<Orders> orders=this.findAll();
        int payOrderCount=0,pendIngOrderCount=0;
        for (Orders order:orders) {
            if(order.getOrderStatus().equals("0")){
                pendIngOrderCount++;
            }else if(order.getOrderStatus().equals("1")){
                payOrderCount++;
            }
        }
        map.put("payment",payOrderCount);
        map.put("pending",pendIngOrderCount);
        return map;
    }

    /**
     * 获取已支付订单信息（合计，总税收，总收入）
     * @return
     */
    public Map getOrderPayInfo() {
        Map map=new HashMap();
        List<Orders> orders=this.findAll();
        List<Orders> payOrders=new ArrayList<>();
        double totalTaxes=0,total=0;
        for (Orders order:orders) {
            if(order.getOrderStatus().equals("1")){
                payOrders.add(order);
            }
        }
        if(payOrders.size()>0){
            for (Orders order:payOrders) {
                totalTaxes=BigDecimalUtil.add(totalTaxes,order.getTaxes());
                total=BigDecimalUtil.add(total,order.getTotal());
            }
        }
        map.put("EARNING",BigDecimalUtil.add(total,totalTaxes));
        map.put("TAXES",totalTaxes);
        map.put("INCOME",total);
        return map;
    }

    /**
     * 订单信息由vo转pojo
     * @param order
     * @param ordersVo
     */
    public  void fullPojo(HttpServletRequest request, OrdersWithBLOBs order,OrdersVo ordersVo){
        order.setIp(Utils.getIpAddress(request));
        order.setName(ordersVo.getName());
        order.setCompany(ordersVo.getCompany());
        order.setEmail(ordersVo.getEmail());
        order.setOrderNotes(ordersVo.getOrderNotes());
        order.setPhone(ordersVo.getPhone());
        order.setShippingOption(ordersVo.getShippingOption());
        order.setOrderStatus("0");
        order.setTotal(ordersVo.getTotal());
        order.setTaxes(ordersVo.getTaxes());
        order.setCreateTime(new Date());
    }
}
