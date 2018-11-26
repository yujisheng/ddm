package com.baizhi.ddm.service.Impl;

import com.baizhi.ddm.dao.ProductDao;
import com.baizhi.ddm.entity.Product;
import com.baizhi.ddm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public Map getAllProduct(int page, int rows) {
        Map map = new HashMap<>();
        int start = (page - 1) * rows;
        //int end = page*rows;
        //System.out.println(start+"============="+end);
        List<Product> products = productDao.getAllProduct(start, rows);
        int count = productDao.getCount();
        map.put("total", count);
        map.put("rows", products);
        return map;
    }

    @Override
    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    @Override
    public void deleteMutliProduct(int[] bookIds) {
        productDao.deleteMutliProduct(bookIds);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    @Override
    public Map getOneProduct(int bookId) {
        Map map = new HashMap<>();
        map.put("product", productDao.getOneProduct(bookId));
        return map;
    }
}
