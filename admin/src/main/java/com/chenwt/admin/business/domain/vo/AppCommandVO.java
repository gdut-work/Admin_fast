package com.chenwt.admin.business.domain.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @class：AppCommand
 * @campany：zkzj
 * @author:feiniaoying
 * @date:2019-05-08 00:04
 * @description: 查询对象封装
 */
@Setter
@Getter
@ToString
public class AppCommandVO {
    private Byte status;
    private String title;
}
