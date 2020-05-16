package com.xiaozhi.shopping.controller;

//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaozhi.shopping.base.Result;
import com.xiaozhi.shopping.base.ResultGenerator;
import com.xiaozhi.shopping.model.OrderItems;
import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.OrdersWithBLOBs;
import com.xiaozhi.shopping.model.vo.OrdersVo;
import com.xiaozhi.shopping.model.vo.Record;
import com.xiaozhi.shopping.service.OrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
* Created by xiaozhi on 2020/05/01.
*/
@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Resource
    private OrdersService ordersService;


    @ResponseBody
    @RequestMapping("/add")
    public Result add(HttpServletRequest request, @RequestBody OrdersVo ordersVo) {
        int orderId=ordersService.save(request,ordersVo);
        return  ResultGenerator.genSuccessResult(orderId);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        ordersService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    /**
     * 删除订单项
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteOrderItem")
    public Result deleteOrderItem(@RequestParam Integer id) {
        ordersService.deleteOrderItemById(id);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/edit")
    public String edit(HttpServletRequest request,int id) {
        OrdersVo ordersVo = ordersService.findById(id);
        request.setAttribute("title","Orders - Edit Record #"+id);
        request.setAttribute("TABLE_NAME","orders");
        request.setAttribute("order",ordersVo);
        return "admin/page/crud.edit";
    }
    /**
     * 查看订单项
     * @param request
     * @param id 订单id
     * @return
     */
    @RequestMapping("/view_orderItem")
    public String view_orderItem(HttpServletRequest request,int id) {
        OrdersVo ordersVo = ordersService.findById(id);
        request.setAttribute("title","Orders-item - view Record #"+id);
        request.setAttribute("TABLE_NAME","orders");
        request.setAttribute("order",ordersVo);
        return "admin/page/view_order_item";
    }

    /**
     * 编辑订单项
     * @param request
     * @param id 订单项id
     * @return
     */
    @RequestMapping("/edit_order_item")
    public String edit_order_item(HttpServletRequest request,int id) {
        OrderItems orderItem = ordersService.findOrderItemById(id);
        request.setAttribute("title","Orders-item - Edit Record #"+id);
        request.setAttribute("TABLE_NAME","orders");
        request.setAttribute("orderItem",orderItem);
        return "admin/page/crud.edit";
    }

    @ResponseBody
    @RequestMapping("/update")
    public Result update(OrdersWithBLOBs orders) {
        ordersService.update(orders);
        return ResultGenerator.genSuccessResult();
    }

    /**
     * 更新订单项信息
     * @param rderItems
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateOrderItem")
    public Result updateOrderItem(OrderItems rderItems) {
        ordersService.updateOrderItem(rderItems);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/detail")
    public String detail(HttpServletRequest request,@RequestParam Integer id) {
        OrdersVo ordersVo = ordersService.findById(id);
        request.setAttribute("orders",ordersVo);
        return "payment";
    }


    @RequestMapping("/list")
    public String list(HttpServletRequest request,@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        request.setAttribute("TABLE_NAME","orders");
        //封装表列名
        List<String> COLUMNS=new ArrayList<>();
        COLUMNS.add("Customer Name"); COLUMNS.add("Customer E-Mail"); COLUMNS.add("Customer Company");
        COLUMNS.add("Address"); COLUMNS.add("Order Taxes"); COLUMNS.add("Order Total"); COLUMNS.add("Order Status");COLUMNS.add("Order Time");
        request.setAttribute("COLUMNS",COLUMNS);

        PageHelper.startPage(page, size);
        List<Orders> orders = ordersService.findAll();
        PageInfo pageInfo = new PageInfo(orders);
        //封装表数据
        List<Record> RECORDS=new ArrayList<>();

        for (Orders order:orders) {
            Record record=new Record();
            record.setId(order.getId());
            List<Object> datas=new ArrayList<>();
            datas.add(order.getName());
            datas.add(order.getEmail());
            datas.add(order.getCompany()==null?"":order.getCompany());
            datas.add(order.getAddress());
            datas.add(order.getTaxes());
            datas.add(order.getTotal());
            datas.add(order.getOrderStatus().equals("0")?"Unpaid":"paid");
            datas.add(order.getCreateTime());
            record.setData(datas);
            RECORDS.add(record);
        }
        request.setAttribute("RECORDS",RECORDS);
        request.setAttribute("pageInfo",pageInfo);
        return "admin/page/crud.list";
    }
}
