package com.xiaozhi.shopping.model.vo;

import com.xiaozhi.shopping.model.Categories;
import com.xiaozhi.shopping.model.Products;
import lombok.Data;
import java.util.List;

/**
 * 商品目录vo类
 */
@Data
public class CategorieVo extends Categories {
    //目录下的商品集合
    private List<Products> products;
}
