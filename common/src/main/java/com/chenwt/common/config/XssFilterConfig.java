package com.chenwt.common.config;

import com.chenwt.common.config.properties.ProjectProperties;
import com.chenwt.common.xss.XssFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * xss过滤拦截器
 * @author chenwt
 * @date 2018/12/9
 */
@Configuration
public class XssFilterConfig {
    private static final int FILTER_ORDER = 1;

    @Bean
    public FilterRegistrationBean xssFilterRegistrationBean(ProjectProperties properties) {
        ProjectProperties.Xxs propertiesXxs = properties.getXxs();
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new XssFilter());
        registration.setOrder(FILTER_ORDER);
        registration.setEnabled(propertiesXxs.isEnabled());
        registration.addUrlPatterns(propertiesXxs.getUrlPatterns().split(","));
        Map<String, String> initParameters = new HashMap<>();
        initParameters.put("excludes", propertiesXxs.getExcludes());
        registration.setInitParameters(initParameters);
        return registration;
    }
}
