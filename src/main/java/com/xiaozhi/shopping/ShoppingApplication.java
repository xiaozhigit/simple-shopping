package com.xiaozhi.shopping;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;



@SpringBootApplication
@MapperScan("com.xiaozhi.shopping.dao")
public class ShoppingApplication extends SpringBootServletInitializer  {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ShoppingApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ShoppingApplication.class, args);
    }

}
