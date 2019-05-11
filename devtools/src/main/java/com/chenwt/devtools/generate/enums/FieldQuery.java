package com.chenwt.devtools.generate.enums;

import lombok.Getter;

/**
 * @author chenwt
 * @date 2018/10/21
 */
@Getter
public enum FieldQuery {
    Exact(1, "精准查询"),
    Like(2, "模糊查询");

    private Integer code;

    private String message;

    FieldQuery(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}