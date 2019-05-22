package com.chenwt.admin.business.domain.websocket;

import lombok.Getter;
import lombok.Setter;

/**
 * @class：WebSocketMessage
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-04-03 10:18
 * @description: 自定义封装包含发送信息的实体类
 */
@Setter
@Getter
public class WebSocketMessageBean {
    /**
     * 实际发送的数据对象
     */
    private Object data;
    /**
     * 发送对象唯一标识码phone
     */
    private String phone;

    public WebSocketMessageBean() {
    }

    public WebSocketMessageBean(String phone) {
        this.phone = phone;
    }
}