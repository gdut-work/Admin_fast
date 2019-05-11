package com.chenwt.modules.system.enums;

import lombok.Getter;

/**
 * @author chenwt
 * @date 2018/10/14
 */
@Getter
public enum ActionLogEnum {

    BUSINESS((byte)1, "业务"),
    LOGIN((byte)2, "登录"),
    SYSTEM((byte)3, "系统");

    private Byte code;

    private String message;

    ActionLogEnum(Byte code, String message) {
        this.code = code;
        this.message = message;
    }
}
