package com.chenwt.admin.business.service;

import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import org.springframework.data.domain.Page;

/**
 * @class：AppCommandService
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:05
 * @description:
 */
public interface AppCommandService {
    /**
     * 分页查询
     * @param title
     * @return
     */
    Page<AppCommandProjection> getPageList(String title);

    /**
     * 根据appCommandId获取
     * @param appCommandId
     * @return
     */
    AppCommandProjection findById(Long appCommandId);
}
