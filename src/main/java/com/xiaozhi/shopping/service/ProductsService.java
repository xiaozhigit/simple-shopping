package com.xiaozhi.shopping.service;

import com.xiaozhi.shopping.model.Products;
import java.util.List;

public interface ProductsService {
    public List<Products> findAll();

    void save(Products products);

    void deleteById(Integer id);

    void update(Products products);

    Products findById(int id);
}
