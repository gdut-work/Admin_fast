package com.chenwt.admin.business.domain.projection;

import java.util.Date;

/**
 * @interface：AppProjection
 * @campany：zkzj
 * @author:feiniaoying
 * @date:2019-05-08 00:06
 * @description:
 */
public interface AppResponseProjection {
    Long getId();
    String getPhone();
    String getAppId();
    String getContext();
    Date getCreateDate();
}
