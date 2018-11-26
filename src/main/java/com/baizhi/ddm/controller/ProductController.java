package com.baizhi.ddm.controller;

import com.baizhi.ddm.entity.Product;
import com.baizhi.ddm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/getAll")
    @ResponseBody
    public Map getAll(int page, int rows) {
        return productService.getAllProduct(page, rows);
    }

    @RequestMapping("/deleteMultiProduct")
    @ResponseBody
    public boolean deleteMulti(int[] ids) {
        try {
            productService.deleteMutliProduct(ids);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping("/addProduct")
    @ResponseBody
    public boolean addProduct(Product product, MultipartFile uploadFile, HttpSession session) {

        String fileName = uploadFile.getOriginalFilename();

        fileName = new Date().getTime() + fileName;

        String realPath = session.getServletContext().getRealPath("productImages");

        try {

            try {
                uploadFile.transferTo(new File(realPath + "\\" + fileName));
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }

            product.setProduct_image(fileName);
            productService.addProduct(product);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping("/updateProduct")
    @ResponseBody
    public boolean updateProduct(Product product, MultipartFile uploadFile, HttpSession session) {

        System.out.println("===================");

        String fileName = uploadFile.getOriginalFilename();
        if (!"".equals(fileName)) {
            fileName = new Date().getTime() + fileName;

            String realPath = session.getServletContext().getRealPath("productImages");
            try {
                uploadFile.transferTo(new File(realPath + "\\" + fileName));
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        product.setProduct_image(fileName);
        try {
            productService.updateProduct(product);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping("/getOneProduct")
    @ResponseBody
    public Map getOneProduct(Integer bookId) {
        return productService.getOneProduct(bookId);
    }
}
