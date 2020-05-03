package com.xiaozhi.shopping.controller;


import com.xiaozhi.shopping.model.Categories;
import com.xiaozhi.shopping.model.Products;
import com.xiaozhi.shopping.model.vo.CategorieVo;
import com.xiaozhi.shopping.service.CategoriesService;
import com.xiaozhi.shopping.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 首页控制器
 */
@Controller
@RequestMapping(value = "/")
public class IndexController {

    //商品种类
    @Autowired
    CategoriesService categoriesService;
    //商品类
    @Autowired
    ProductsService productsService;

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        List<CategorieVo> categorieVos = new ArrayList<>();
        for (Categories categorie : categoriesService.findAll()) {

            List<Products> products1 = new ArrayList<>();
            CategorieVo categorieVo = new CategorieVo();

            categorieVo.setId(categorie.getId());
            categorieVo.setName(categorie.getName());
            categorieVo.setActive(categorie.getActive());

            for (Products product : productsService.findAll()) {
                if (product.getCategory().equals(categorie.getId())) {
                    products1.add(product);
                }
            }
            categorieVo.setProducts(products1);
            categorieVos.add(categorieVo);
        }
        request.setAttribute("categories", categorieVos);
        return "order";
    }


}
