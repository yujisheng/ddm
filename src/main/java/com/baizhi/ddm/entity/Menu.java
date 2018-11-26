package com.baizhi.ddm.entity;

import java.io.Serializable;

public class Menu implements Serializable {
    private Integer id;
    private String menuname;
    private String resourcerul;
    private Integer patent_id;
    private Integer lev;

    public Menu() {
        super();
    }

    public Menu(Integer id, String menuname, String resourcerul, Integer patent_id, Integer lev) {
        this.id = id;
        this.menuname = menuname;
        this.resourcerul = resourcerul;
        this.patent_id = patent_id;
        this.lev = lev;
    }

    public Menu(String menuname, String resourcerul, Integer patent_id, Integer lev) {
        this.menuname = menuname;
        this.resourcerul = resourcerul;
        this.patent_id = patent_id;
        this.lev = lev;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public String getResourcerul() {
        return resourcerul;
    }

    public void setResourcerul(String resourcerul) {
        this.resourcerul = resourcerul;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", menuname='" + menuname + '\'' +
                ", resourcerul='" + resourcerul + '\'' +
                ", patent_id=" + patent_id +
                ", lev=" + lev +
                '}';
    }

    public Integer getPatent_id() {
        return patent_id;
    }

    public void setPatent_id(Integer patent_id) {
        this.patent_id = patent_id;
    }

    public Integer getLev() {
        return lev;
    }

    public void setLev(Integer lev) {
        this.lev = lev;
    }
}
