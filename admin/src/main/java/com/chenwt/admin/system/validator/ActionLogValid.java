package com.chenwt.admin.system.validator;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

@Data
public class ActionLogValid implements Serializable {
    @NotEmpty(message = "标题不能为空")
    private String title;
}
