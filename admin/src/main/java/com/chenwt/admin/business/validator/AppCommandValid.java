package com.chenwt.admin.business.validator;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

/**
 * @author chenwt
 * @date 2018/8/14
 */
@Data
public class AppCommandValid implements Serializable {
    @NotEmpty(message = "标题不能为空")
    private String title;
    @NotEmpty(message = "指令不能为空")
    private String command;
}
