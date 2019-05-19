package com.chenwt.admin.business.domain.projection;

import org.springframework.beans.factory.annotation.Value;

import java.util.Date;

/**
 * @interface：AppCommandProjection
 * @campany：zkzj
 * @author:feiniaoying
 * @date:2019-05-08 00:10
 * @description:
 */
public interface AppCommandProjection {
    Long getId();
    String getTitle();
    String getCommand();
    String getCreateName();
    Date getCreateDate();
    Byte getStatus();
    Date getUpdateDate();
    String getRemark();
}
