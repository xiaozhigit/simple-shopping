package com.xiaozhi.shopping.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaozhi.shopping.base.Result;
import com.xiaozhi.shopping.base.ResultGenerator;
import com.xiaozhi.shopping.model.Categories;
import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.Products;
import com.xiaozhi.shopping.model.vo.OrdersVo;
import com.xiaozhi.shopping.model.vo.Record;
import com.xiaozhi.shopping.service.CategoriesService;
import com.xiaozhi.shopping.service.OrdersService;
import com.xiaozhi.shopping.service.ProductsService;
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
@RequestMapping("/product")
public class ProductsController {
    @Resource
    private ProductsService productsService;
    @Resource
    private CategoriesService categoriesService;

    @RequestMapping("/add")
    public String add(HttpServletRequest request,Products products) {
        productsService.save(products);
        return "redirect:/product/list";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        productsService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/edit")
    public String edit(HttpServletRequest request,int id) {
        Products products = productsService.findById(id);
        List<Categories> categories=categoriesService.findAll();
        request.setAttribute("TABLE_NAME","product");
        request.setAttribute("title","Products - Edit Record #"+id);
        request.setAttribute("categories",categories);
        request.setAttribute("product",products);
        return "admin/page/crud.edit";
    }

    @ResponseBody
    @RequestMapping("/update")
    public Result update(Products products) {
        productsService.update(products);
        return ResultGenerator.genSuccessResult();
    }

//    @RequestMapping("/detail")
//    public String detail(HttpServletRequest request,@RequestParam Integer id) {
//        Products products = productsService.findById(id);
//        request.setAttribute("product",products);
//        return  "admin/page/crud.edit";
//    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request,@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        request.setAttribute("TABLE_NAME","product");
        //封装表列名
        List<String> COLUMNS=new ArrayList<>();
        COLUMNS.add("Category"); COLUMNS.add("Product Name"); COLUMNS.add("Producer");
        COLUMNS.add("Product Image"); COLUMNS.add("Product Thumbnail"); COLUMNS.add("Product Price"); COLUMNS.add("Product Tax");COLUMNS.add("Product Status");
        request.setAttribute("COLUMNS",COLUMNS);

        PageHelper.startPage(page, size);
        List<Products> products = productsService.findAll();
        PageInfo pageInfo = new PageInfo(products);
        //封装表数据
        List<Record> RECORDS=new ArrayList<>();

        for (Products product:products) {
            Record record=new Record();
            record.setId(product.getId());
            List<Object> datas=new ArrayList<>();
            datas.add(product.getCategory());
            datas.add(product.getName());
            datas.add(product.getProducer());
            datas.add(product.getName());
            datas.add(product.getThumb());
            datas.add(product.getPrice());
            datas.add(product.getTax());
            datas.add(product.getActive());
            record.setData(datas);
            RECORDS.add(record);
        }
        request.setAttribute("RECORDS",RECORDS);
        request.setAttribute("pageInfo",pageInfo);
        return "admin/page/crud.list";
    }
}
