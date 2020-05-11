package com.xiaozhi.shopping.controller;

import com.xiaozhi.shopping.base.Result;
import com.xiaozhi.shopping.base.ResultGenerator;
import com.xiaozhi.shopping.model.*;
import com.xiaozhi.shopping.model.vo.OrdersVo;
import com.xiaozhi.shopping.service.CategoriesService;
import com.xiaozhi.shopping.service.OrdersService;
import com.xiaozhi.shopping.service.ProductsService;
import com.zaxxer.hikari.util.FastList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by xiaozhi on 2020/05/01.
*/
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private OrdersService ordersService;
    @Resource
    private CategoriesService categoriesService;
    @Resource
    private ProductsService productService;


    @RequestMapping("/")
    public String index() {
        return  "admin/login";
    }

    @RequestMapping("/newAdd")
    public String newAdd(HttpServletRequest request,String type) {
        if(type.equals("category")){
            request.setAttribute("title","Categories - Add New Record");
            request.setAttribute("type","categories");
            List<Field> fields=new ArrayList<>();
            Field field=new Field();
            field.setTitle("Category Name");
            field.setName("name");
            field.setType("text");
            fields.add(field);
            Field field2=new Field();
            field2.setTitle("Category Status");
            field2.setName("active");
            field2.setType("select");
            List<Option> options=new ArrayList<>();
                Option option=new Option();
                option.setName("Active");
                option.setValue("Y");
                options.add(option);
                 Option option2=new Option();
                option2.setName("Passive");
                option2.setValue("N");
                options.add(option2);
            field2.setSelect(options);
            fields.add(field2);
            request.setAttribute("FIELDS",fields);
        }
        return  "admin/page/crud.insert";
    }


    @RequestMapping("/login")
    public String login(HttpServletRequest request,String username,String password) {
        if(username.equals("admin")&&password.equals("123456")){
            request.setAttribute("userName","admin");
            request.setAttribute("title","Dashboard");
            request.setAttribute("description","Welcome to the Multi Product Order Form 2 - Admin Panel Dashboard");
           // request.setAttribute("userName","admin");
           // request.setAttribute("userName","admin");
            return "admin/layout";
        }else{
            request.setAttribute("msg","Username or password not match");
            return "admin/login";
        }

    }

    @RequestMapping("/dashboard")
    public String dashboard(HttpServletRequest request) {
        List<Categories> categories = categoriesService.findAll();
        request.setAttribute("categoryCount", categories.size());
        List<Products> products = productService.findAll();
        request.setAttribute("productCount", products.size());
        Map countMap = ordersService.getPayAndPendingOrderCount();
        request.setAttribute("orderCount", countMap.get("payment"));
        request.setAttribute("pendingOrderCount", countMap.get("pending"));

        Map payMap = ordersService.getOrderPayInfo();
        request.setAttribute("total", payMap.get("EARNING"));
        request.setAttribute("taxes", payMap.get("TAXES"));
        request.setAttribute("income", payMap.get("INCOME"));
        return "admin/page/dashboard";
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
