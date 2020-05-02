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
}
