package com.chenwt.admin.business.service;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.entity.AppResponse;
import com.chenwt.admin.business.domain.websocket.AppClientRegisterInfoBean;
import com.chenwt.admin.business.domain.websocket.AppClientResponseInfoBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
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
    public synchronized void saveAppInfo(AppClientRegisterInfoBean clientInfo){
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
        }else{
            updateAppInfo(clientInfo, appInfo);
        }
    }

    /**
     * 加锁执行
     * @param clientInfo
     * @param appInfo
     */
    private void updateAppInfo(AppClientRegisterInfoBean clientInfo, AppInfo appInfo) {
        Set name1Set = getNameSet(clientInfo.getName1(),appInfo.getName1());
        Set name2Set = getNameSet(clientInfo.getName2(),appInfo.getName2());
        System.out.println("name2Set.size==="+name2Set.size());
        Set name3Set = getNameSet(clientInfo.getName3(),appInfo.getName3());
        Set name4Set = getNameSet(clientInfo.getName4(),appInfo.getName4());

        appInfo.setName1(StringUtils.join(name1Set, ";"));
        appInfo.setName2(StringUtils.join(name2Set, ";"));
        appInfo.setName3(StringUtils.join(name3Set, ";"));
        appInfo.setName4(StringUtils.join(name4Set, ";"));

        appInfoService.updateAppInfo(appInfo);
    }

    /**
     * 获取nameSet
     * @param clientInfoName
     * @param appInfoName
     * @return
     */
    private Set getNameSet(String clientInfoName, String appInfoName) {
        Set nameSet = new HashSet();
        if (StringUtils.isNotBlank(clientInfoName)){
            String name = clientInfoName;
            if (StringUtils.isNotBlank(appInfoName)){
                name = name +";"+appInfoName;
            }
            nameSet = new HashSet(Arrays.asList(name.split(";")));
        }else{
            if (StringUtils.isNotBlank(appInfoName)){
                nameSet = new HashSet(Arrays.asList(appInfoName.split(";")));
            }
        }

        return nameSet;
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


    public static void main(String[] args) {
        Set set = new HashSet();
        set.add(121);
        set.add(22);
        System.out.println(StringUtils.join(set, ";"));
    }
}
