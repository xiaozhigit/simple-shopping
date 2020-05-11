package com.xiaozhi.shopping.service.impl;


import com.xiaozhi.shopping.dao.CategoriesMapper;
import com.xiaozhi.shopping.model.Categories;
import com.xiaozhi.shopping.service.CategoriesService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by xiaozhi on 2020/05/01.
 */
@Service
@Transactional
public class CategoriesServiceImpl  implements CategoriesService {
    @Resource
    private CategoriesMapper categoriesMapper;

    @Override
    public List<Categories> findAll() {
        return categoriesMapper.selectByExample(null);
    }

    @Override
    public void save(Categories categories) {
        categoriesMapper.insertSelective(categories);
    }

    @Override
    public void deleteById(Integer id) {
        categoriesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Categories categories) {
        categoriesMapper.updateByPrimaryKeySelective(categories);
    }

    @Override
    public Categories findById(Integer id) {
        return categoriesMapper.selectByPrimaryKey(id);
    }
}
