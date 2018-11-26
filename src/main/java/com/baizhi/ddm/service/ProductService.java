package com.baizhi.ddm.service;

import com.baizhi.ddm.entity.Product;

import java.util.Map;

public interface ProductService {
    public Map getAllProduct(int page, int rows);

    public void addProduct(Product product);

    public void deleteMutliProduct(int[] bookIds);

    public void updateProduct(Product product);

    public Map getOneProduct(int bookId);
}
