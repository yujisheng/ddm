package com.baizhi.ddm;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(value = "com.baizhi.ddm.dao")
@SpringBootApplication
public class ddmApplication {
    public static void main(String[] args) {
        SpringApplication.run(ddmApplication.class, args);
    }
}
