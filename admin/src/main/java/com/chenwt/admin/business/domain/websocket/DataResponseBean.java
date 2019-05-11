package com.chenwt.admin.business.domain.websocket;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * @interface：SubscribeInfoBean
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-04-11 17:46
 * @description: 服务端推送数据封装包
 */
@Setter
@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DataResponseBean implements Serializable {
    private Integer code;
    private String message;
    private Object data;

    public DataResponseBean(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public DataResponseBean(Object data) {
        this.data = data;
    }

    public static DataResponseBean ok() {
        return new DataResponseBean(200,"Success");
    }

    public static DataResponseBean error(String message) {
        return new DataResponseBean(500,message);
    }

}
