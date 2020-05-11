package com.xiaozhi.shopping.service.impl;

import com.xiaozhi.shopping.dao.ProductsMapper;
import com.xiaozhi.shopping.model.Products;
import com.xiaozhi.shopping.service.ProductsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ProductsServiceImpl implements ProductsService {
    @Resource
    ProductsMapper productsMapper;

    @Override
    public List<Products> findAll() {
        return productsMapper.selectByExample(null);
    }

    @Override
    public void save(Products products) {
        productsMapper.insertSelective(products);
    }

    @Override
    public void deleteById(Integer id) {
        productsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Products products) {
        productsMapper.updateByPrimaryKeySelective(products);
    }

    @Override
    public Products findById(int id) {
        return productsMapper.selectByPrimaryKey(id);
    }
}
