package com.chenwt.admin.business.service.impl;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import com.chenwt.admin.business.enums.AppStatusEnum;
import com.chenwt.admin.business.repository.AppInfoRepository;
import com.chenwt.admin.business.service.AppInfoService;
import com.chenwt.admin.business.webosocket.AppWebSocketServer;
import com.chenwt.admin.business.webosocket.WebSocketMapUtil;
import com.chenwt.common.data.PageSort;
import com.google.common.base.Joiner;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

/**
 * @class：AppInfoServiceImpl
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:06
 * @description:
 */
@Service
public class AppInfoServiceImpl implements AppInfoService {
    @Resource
    private AppInfoRepository appInfoRepository;

    @Override
    public AppInfo findByPhone(String phone) {
        return appInfoRepository.findAppInfoByPhone(phone);
    }

    @Override
    public void saveAppInfo(AppInfo appInfo) {
        appInfoRepository.save(appInfo);
    }

    @Override
    public Page<AppInfoProjection> getPageList(Integer status, String phone) {
        // 创建分页对象
        Pageable page = PageSort.nativePageRequest(Sort.Direction.ASC);
        List<String> onLinePhoneList = new LinkedList<>();
        if (null != status){
            Collection<AppWebSocketServer> appWebSocketServer = WebSocketMapUtil.getWebSocketServer();
            if (!appWebSocketServer.isEmpty()){
                appWebSocketServer.forEach(e->{
                    onLinePhoneList.add(e.getPhone());
                });
            }
        }

        phone = (phone==null)?null:"%"+phone+"%";

        // 以逗号分割
        String onLinePhoneStr = Joiner.on(",").join(onLinePhoneList);
        Page<AppInfoProjection> appInfoProjections = appInfoRepository.getPageList(status,phone,onLinePhoneStr,page);

        return appInfoProjections;
    }

    @Override
    public AppInfo findById(Long appInfoId) {
        return appInfoRepository.findById(appInfoId).orElse(null);
    }

    @Override
    public Page<AppInfoProjection> getOnlinePageList(String phone) {
        /**
         * 测试数据
         */
        {
            AppWebSocketServer appWebSocketServer = new AppWebSocketServer();
            appWebSocketServer.setPhone("15820242077");
            WebSocketMapUtil.put("1111", appWebSocketServer);
        }

        Collection<AppWebSocketServer> appWebSocketServerCollection = WebSocketMapUtil.getWebSocketServer();


        List<String> onlinePhoneList = new LinkedList<>();
        if (!appWebSocketServerCollection.isEmpty()){
            appWebSocketServerCollection.forEach(e->{
                if (StringUtils.isNotBlank(phone)){
                    if (e.getPhone().contains(phone)){
                        onlinePhoneList.add(e.getPhone());
                    }
                }else{
                    onlinePhoneList.add(e.getPhone());
                }
            });
            // 创建分页对象
            Pageable page = PageSort.pageRequest(Sort.Direction.ASC);
            return appInfoRepository.findByPhoneIn(onlinePhoneList,page);
        }
        return new PageImpl(new LinkedList());
    }

    @Override
    public List<AppInfo> findByAppInfoIdList(List<Long> appInfoIdList) {
        return appInfoRepository.findByIdIn(appInfoIdList);
    }

}
