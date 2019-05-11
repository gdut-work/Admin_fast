package com.chenwt.component.thymeleaf.config;

import com.chenwt.component.thymeleaf.AdminDialect;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author chenwt
 * @date 2018/8/14
 */
@Configuration
public class ThymeleafConfig {

    /**
     * 配置自定义的CusDialect，用于整合thymeleaf模板
     */
    @Bean
    public AdminDialect getAdminDialect(){
        return new AdminDialect();
    }
}
