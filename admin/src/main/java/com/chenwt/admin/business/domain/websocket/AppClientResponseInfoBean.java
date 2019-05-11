package com.chenwt.admin.business.domain.websocket;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

/**
 * @class：AppClientResponeInfoBean
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-08 13:09
 * @description: app请求info接收服务端请求响应对象封装
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AppClientResponseInfoBean extends ClientInfoBean {
    private String context;
}
