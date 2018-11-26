package com.baizhi.ddm.dao;

import com.baizhi.ddm.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductDao {
    public List<Product> getAllProduct(@Param("start") int start, @Param("end") int end);

    public int getCount();

    public void addProduct(Product product);

    public void deleteMutliProduct(int[] bookIds);

    public void updateProduct(Product product);

    public Product getOneProduct(int bookId);
}
