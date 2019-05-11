package com.chenwt.admin.business.service;
import java.util.Date;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.entity.AppResponse;
import com.chenwt.admin.business.domain.websocket.AppClientRegisterInfoBean;
import com.chenwt.admin.business.domain.websocket.AppClientResponseInfoBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @class：AsyncServiceTool
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:04
 * @description:
 */
@Slf4j
@Component
public class AsyncServiceTool {
    @Resource
    private AppInfoService appInfoService;

    @Resource
    private AppResponseService appResponseService;

    @Async("asyncExecutor")
    public void saveAppInfo(AppClientRegisterInfoBean clientInfo){
        AppInfo appInfo = appInfoService.findByPhone(clientInfo.getPhone());
        if (null == appInfo){
            appInfo = new AppInfo();
            appInfo.setPhone(clientInfo.getPhone());
            appInfo.setName1(clientInfo.getName1());
            appInfo.setName2(clientInfo.getName2());
            appInfo.setName3(clientInfo.getName3());
            appInfo.setName4(clientInfo.getName4());
            appInfo.setCreateDate(new Date());

            appInfoService.saveAppInfo(appInfo);
        }
    }

    public void saveAppResponse(String phone, AppClientResponseInfoBean clientInfo) {
        //查询对应phone客户信息
        AppInfo appInfo = appInfoService.findByPhone(phone);
        if (null == appInfo){
            log.warn("没有phone=="+phone+"客户信息");
            return;
        }

        AppResponse appResponse = new AppResponse();
        appResponse.setAppId(appInfo.getId());
        appResponse.setContext(clientInfo.getContext());
        appResponse.setCreateDate(new Date());

        appResponseService.saveAppResponse(appResponse);
    }
}
