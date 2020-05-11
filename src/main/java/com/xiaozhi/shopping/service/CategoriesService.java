package com.xiaozhi.shopping.service;


import com.xiaozhi.shopping.model.Categories;
import java.util.List;

/**
 * Created by xiaozhi on 2020/05/01.
 */
public interface CategoriesService  {

    List<Categories> findAll();

    void save(Categories categories);

    void deleteById(Integer id);

    void update(Categories categories);

    Categories findById(Integer id);
}
