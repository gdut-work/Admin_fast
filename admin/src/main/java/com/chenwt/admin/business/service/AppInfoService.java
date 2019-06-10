package com.chenwt.admin.business.service;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @interface：AppInfoService
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:05
 * @description:
 */

public interface AppInfoService {
    /**
     * 通过号码查询
     * @param phone
     * @return
     */
    AppInfo findByPhone(String phone);

    /**
     * 保存
     * @param appInfo
     */
    void saveAppInfo(AppInfo appInfo);

    /**
     * 分页
     * @param status
     * @param phone
     * @return
     */
    Page<AppInfoProjection> getPageList(Integer status, String phone);

    /**
     * 获取
     * @param appInfoId
     * @return
     */
    AppInfo findById(Long appInfoId);

    /**
     * 获取在线客户端
     * @param phone
     * @return
     */
    Page<AppInfoProjection> getOnlinePageList(String phone);

    /**
     * 根据获取
     * @param appInfoIdList
     * @return
     */
    List<AppInfo> findByAppInfoIdList(List<Long> appInfoIdList);

    /**
     * 删除
     * @param id
     */
    void deleteById(Long id);

    /**
     * 批量删除
     * @param appInfoIdList
     */
    void deleteBatchById(List<Long> appInfoIdList);

    /**
     * 更新
     * @param appInfo
     */
    void updateAppInfo(AppInfo appInfo);
}
