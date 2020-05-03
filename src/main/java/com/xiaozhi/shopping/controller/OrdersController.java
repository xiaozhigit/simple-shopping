package com.xiaozhi.shopping.controller;

//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
import com.xiaozhi.shopping.base.Result;
import com.xiaozhi.shopping.base.ResultGenerator;
import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.OrdersWithBLOBs;
import com.xiaozhi.shopping.model.vo.OrdersVo;
import com.xiaozhi.shopping.service.OrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        ordersService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/update")
    public Result update(Orders orders) {
        ordersService.update(orders);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/detail")
    public String detail(HttpServletRequest request,@RequestParam Integer id) {
        OrdersVo ordersVo = ordersService.findById(id);
        request.setAttribute("orders",ordersVo);
        return "payment";
    }

    @RequestMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
       // PageHelper.startPage(page, size);
        List<Orders> list = ordersService.findAll();
       // PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(list);
    }
}
