package com.baizhi.ddm.service.Impl;

import com.baizhi.ddm.dao.CategoryDao;
import com.baizhi.ddm.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public Map getAllCategory() {
        Map map = new HashMap<>();
        map.put("categorys", categoryDao.getAllCategory());
        return map;
    }
}
