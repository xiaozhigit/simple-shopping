package com.xiaozhi.shopping.controller;

//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
import com.xiaozhi.shopping.base.Result;
import com.xiaozhi.shopping.base.ResultGenerator;
import com.xiaozhi.shopping.model.Categories;
import com.xiaozhi.shopping.service.CategoriesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by xiaozhi on 2020/05/01.
*/
@Controller
@RequestMapping("/categories")
public class CategoriesController {
    @Resource
    private CategoriesService categoriesService;

//    @RequestMapping("/add")
//    public Result add(Categories categories) {
//        categoriesService.save(categories);
//        return ResultGenerator.genSuccessResult();
//    }
//
//    @RequestMapping("/delete")
//    public Result delete(@RequestParam Integer id) {
//        categoriesService.deleteById(id);
//        return ResultGenerator.genSuccessResult();
//    }
//
//    @RequestMapping("/update")
//    public Result update(Categories categories) {
//        categoriesService.update(categories);
//        return ResultGenerator.genSuccessResult();
//    }
//
//    @RequestMapping("/detail")
//    public Result detail(@RequestParam Integer id) {
//        Categories categories = categoriesService.findById(id);
//        return ResultGenerator.genSuccessResult(categories);
//    }
    @ResponseBody
    @RequestMapping("/list")
    //public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
    public Result list() {
        /// PageHelper.startPage(page, size);
        List<Categories> list = categoriesService.findAll();
       // PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(list);
    }
}
