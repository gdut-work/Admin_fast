package com.chenwt.admin.business.domain.projection;

import java.util.Date;

/**
 * @interface：AppProjection
 * @campany：zkzj
 * @author:feiniaoying
 * @date:2019-05-08 00:06
 * @description:
 */

public interface AppInfoProjection {
    Long getId();
    String getPhone();
    String getName1();
    String getName2();
    String getName3();
    String getName4();
    Date getCreateDate();
}
