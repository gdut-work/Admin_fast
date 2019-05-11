package com.chenwt.admin.business.service.impl;

import com.chenwt.admin.business.domain.entity.AppResponse;
import com.chenwt.admin.business.domain.projection.AppResponseProjection;
import com.chenwt.admin.business.repository.AppResponseRepository;
import com.chenwt.admin.business.service.AppResponseService;
import com.chenwt.common.data.PageSort;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @class：AppResponseServiceImpl
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-08 09:48
 * @description:
 */
@Service
public class AppResponseServiceImpl implements AppResponseService {
    @Resource
    private AppResponseRepository appResponseRepository;

    @Override
    public Page<AppResponseProjection> getPageList(String phone) {
        // 创建分页对象
        Pageable page = PageSort.nativePageRequest(Sort.Direction.ASC);
        return appResponseRepository.getPageList(phone,page);
    }

    @Override
    public void saveAppResponse(AppResponse appResponse) {
        appResponseRepository.save(appResponse);
    }

    @Override
    public AppResponseProjection findById(Long appResponseId) {
        return appResponseRepository.findByAppResponseId(appResponseId);
    }
}
