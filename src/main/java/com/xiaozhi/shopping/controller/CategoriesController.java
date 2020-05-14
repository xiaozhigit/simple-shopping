package com.xiaozhi.shopping.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaozhi.shopping.base.Result;
import com.xiaozhi.shopping.base.ResultGenerator;
import com.xiaozhi.shopping.model.Categories;
import com.xiaozhi.shopping.model.Orders;
import com.xiaozhi.shopping.model.vo.OrdersVo;
import com.xiaozhi.shopping.model.vo.Record;
import com.xiaozhi.shopping.service.CategoriesService;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/categories")
public class CategoriesController {
    @Resource
    private CategoriesService categoriesService;

    //进入类别管理首页
    @RequestMapping("/")
    public String index() {
        return "admin/category/list";
    }

    @RequestMapping("/add")
    public String add(Categories categories) {
        categoriesService.save(categories);
        return "redirect:/categories/list";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        categoriesService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, int id) {
        Categories categories = categoriesService.findById(id);
        request.setAttribute("title","Categories - Edit Record #"+id);
        request.setAttribute("TABLE_NAME","categories");
        request.setAttribute("category",categories);
        return "admin/page/crud.edit";
    }

    @ResponseBody
    @RequestMapping("/update")
    public Result update(Categories categories) {
        categoriesService.update(categories);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Categories categories = categoriesService.findById(id);
        return ResultGenerator.genSuccessResult(categories);
    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request,@RequestParam(defaultValue = "0")
            Integer page, @RequestParam(defaultValue = "0") Integer size) {

        request.setAttribute("TABLE_NAME","categories");
        //封装表列名
        List<String> COLUMNS=new ArrayList<>();
        COLUMNS.add("Category Name"); COLUMNS.add("Category Status");
        request.setAttribute("COLUMNS",COLUMNS);

        PageHelper.startPage(page, size);
        List<Categories> categories = categoriesService.findAll();
        PageInfo pageInfo = new PageInfo(categories);
        //封装表数据
        List<Record> RECORDS=new ArrayList<>();

        for (Categories categorie:categories) {
            Record record=new Record();
            record.setId(categorie.getId());
            List<Object> datas=new ArrayList<>();
            datas.add(categorie.getName());
            datas.add(categorie.getActive());
            record.setData(datas);
            RECORDS.add(record);
        }
        request.setAttribute("RECORDS",RECORDS);
        request.setAttribute("pageInfo",pageInfo);
        return "admin/page/crud.list";
    }
}
