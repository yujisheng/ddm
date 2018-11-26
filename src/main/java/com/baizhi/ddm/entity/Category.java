package com.baizhi.ddm.entity;

import java.io.Serializable;

public class Category implements Serializable {
    private Integer category_id;
    private Integer parent_id;
    private String category_name;
    private Integer count;
    private String category_type;

    public Category() {
        super();
    }

    public Category(Integer category_id, Integer parent_id, String category_name, Integer count, String category_type) {
        this.category_id = category_id;
        this.parent_id = parent_id;
        this.category_name = category_name;
        this.count = count;
        this.category_type = category_type;
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getCategory_type() {
        return category_type;
    }

    public void setCategory_type(String category_type) {
        this.category_type = category_type;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    @Override
    public String toString() {
        return "Category{" +
                "category_id=" + category_id +
                ", parent_id=" + parent_id +
                ", category_name='" + category_name + '\'' +
                ", count=" + count +
                ", category_type='" + category_type + '\'' +
                '}';
    }
}
