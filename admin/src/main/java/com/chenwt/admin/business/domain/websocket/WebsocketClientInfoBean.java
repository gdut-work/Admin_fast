package com.chenwt.admin.business.domain.websocket;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * @class：SubscribeInfoBean
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-04-04 01:29
 * @description: websocket统一请求info对象封装
 */
@Setter
@Getter
public class WebsocketClientInfoBean<T extends ClientInfoBean> implements Serializable {
    @JsonProperty("type")
    private Integer type;
    /**
     * clientInfo : {"phone":1,"name1":"1","name2":"2","name3":"3","name4":"4"}
     */
    @JsonProperty("clientInfo")
    private T clientInfo;
}
