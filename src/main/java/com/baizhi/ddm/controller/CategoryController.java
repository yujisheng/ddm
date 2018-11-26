package com.baizhi.ddm.controller;

import com.baizhi.ddm.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/getAllCategory")
    @ResponseBody
    public Map getAllCategory() {
        return categoryService.getAllCategory();
    }

}
