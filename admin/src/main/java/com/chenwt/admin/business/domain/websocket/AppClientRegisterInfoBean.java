package com.chenwt.admin.business.domain.websocket;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

/**
 * @class：ApkSubscribeInfoBean
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-06 19:16
 * @description: app请求info注册对象封装
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AppClientRegisterInfoBean extends ClientInfoBean {
    private String phone;
    private String name1;
    private String name2;
    private String name3;
    private String name4;
}
