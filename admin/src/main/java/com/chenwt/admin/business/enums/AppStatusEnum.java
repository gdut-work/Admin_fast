package com.chenwt.admin.business.enums;

import lombok.Getter;

/**
 * @author chenwt
 * @date 2018/10/14
 */
@Getter
public enum AppStatusEnum {

    ON_LINE(1, true),
    OUT_LINE(2, false);

    private Integer code;

    private Boolean value;

    AppStatusEnum(Integer code, Boolean value) {
        this.code = code;
        this.value = value;
    }

    /**
     * 通过code获取value
     * @param code
     * @return
     */
    public static Boolean getValue(Integer code) {
        AppStatusEnum[] enums = values();
        for (AppStatusEnum appStatusEnum : enums) {
            if (appStatusEnum.getCode().equals(code)) {
                return appStatusEnum.getValue();
            }
        }
        return false;
    }

}
