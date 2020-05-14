package com.xiaozhi.shopping.controller;

import com.xiaozhi.shopping.base.Constant;
import com.xiaozhi.shopping.base.Result;
import com.xiaozhi.shopping.base.ResultGenerator;
import com.xiaozhi.shopping.model.*;
import com.xiaozhi.shopping.model.vo.OrdersVo;
import com.xiaozhi.shopping.service.CategoriesService;
import com.xiaozhi.shopping.service.OrdersService;
import com.xiaozhi.shopping.service.ProductsService;
import com.zaxxer.hikari.util.FastList;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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
    @Value("${fileBasePath}")
    private String fileBasePath;


    @RequestMapping("/")
    public String index() {
        return  "admin/login";
    }

    @RequestMapping("/newAdd")
    public String newAdd(HttpServletRequest request,String type) {
        List<Field> fields=new ArrayList<>();
        if(type.equals("category")){
            //设置也页面参数
            settingParamter(request,"Categories - Add New Record","categories");
            fields.add(createField("Category Name","name",Constant.FILELD_TYPE_TEXT));
            Field field2=createField("Category Status","active",Constant.FILELD_TYPE_SELECT);
            field2.setSelect(createOptionAction());
            fields.add(field2);
        }else if(type.equals("product")){
            //设置也页面参数
            settingParamter(request,"Products - Add New Record","product");
            Field field=createField("Category","category",Constant.FILELD_TYPE_SELECT);;
            List<Option> options=new ArrayList<>();
            List<Categories> categories = categoriesService.findAll();
            for (Categories categorie:categories) {
                Option option=new Option();
                option.setName(categorie.getName());
                option.setValue(categorie.getId());
                options.add(option);
            }
            field.setSelect(options);
            fields.add(field);

            fields.add(createField("Product Name","name",Constant.FILELD_TYPE_TEXT));
            fields.add(createField("Producer","producer",Constant.FILELD_TYPE_TEXT));
            fields.add(createField("Product Image","image",Constant.FILELD_TYPE_IMAGE));
            fields.add(createField("Product Price","price",Constant.FILELD_TYPE_NUMBER));
            fields.add(createField("Product Tax","tax",Constant.FILELD_TYPE_NUMBER));
            Field field6=createField("Product Status","active",Constant.FILELD_TYPE_SELECT);
            field6.setSelect(createOptionAction());
            fields.add(field6);
        }
        request.setAttribute("FIELDS",fields);
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

    @ResponseBody
    @RequestMapping("/upload")
    public Result upload(@RequestParam("file") MultipartFile file)
            throws IllegalStateException, IOException {

        // 判断文件是否为空，空则返回失败页面
        if (file.isEmpty()) {
            return ResultGenerator.genFailResult("文件为空");
        }
        // 获取文件存储路径（绝对路径）
        String path =fileBasePath;
        String fileuploadPath="productImage/";
        // 获取原文件名
        String fileName = file.getOriginalFilename();
        // 创建文件实例
        File filePath = new File(path+fileuploadPath, fileName);
        // 如果文件目录不存在，创建目录
        if (!filePath.getParentFile().exists()) {
            filePath.getParentFile().mkdirs();
            System.out.println("创建目录" + filePath);
        }
        // 写入文件
        file.transferTo(filePath);
        return ResultGenerator.genSuccessResult("static/"+fileuploadPath+fileName);
    }

    //设置页面显示数据及类的请求类型地址
    public void settingParamter(HttpServletRequest request,String title,String type){
        request.setAttribute("title",title);
        request.setAttribute("type",type);
    }
    /**
     * 创建表显示字段
     * @param title
     * @param name
     * @param type
     * @return
     */
    public Field createField(String title,String name,String type){
        Field field3=new Field();
        field3.setTitle(title);
        field3.setName(name);
        field3.setType(type);
        return field3;
    }

    /**
     * 返回是否激活下拉框
     * @return
     */
    public List<Option> createOptionAction(){
        List<Option> options=new ArrayList<>();
        Option option=new Option();
        option.setName("Active");
        option.setValue("Y");
        options.add(option);
        Option option2=new Option();
        option2.setName("Passive");
        option2.setValue("N");
        options.add(option2);
        return  options;
    }


}
