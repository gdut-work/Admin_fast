package com.chenwt.admin.business.service;

import com.chenwt.admin.business.domain.entity.AppResponse;
import com.chenwt.admin.business.domain.projection.AppResponseProjection;
import org.springframework.data.domain.Page;

/**
 * @interface：AppResponseService
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-08 09:47
 * @description:
 */

public interface AppResponseService {
    /**
     * 分页查询
     * @param phone
     * @return
     */
    Page<AppResponseProjection> getPageList(String phone);

    /**
     * 保存
     * @param appResponse
     */
    void saveAppResponse(AppResponse appResponse);

    /**
     * 根据appResponseId获取
     * @param appResponseId
     * @return
     */
    AppResponseProjection findById(Long appResponseId);

    /**
     * 删除操作
     * @param id
     */
    void deleteById(Long id);

    /**
     * 清空响应
     */
    void deleteAll();
}
