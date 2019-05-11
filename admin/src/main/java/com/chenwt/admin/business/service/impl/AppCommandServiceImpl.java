package com.chenwt.admin.business.service.impl;

import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.repository.AppCommandRepository;
import com.chenwt.admin.business.service.AppCommandService;
import com.chenwt.common.data.PageSort;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @class：AppCommandServiceImpl
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:06
 * @description:
 */
@Service
public class AppCommandServiceImpl implements AppCommandService {
    @Resource
    private AppCommandRepository appCommandRepository;


    @Override
    public Page<AppCommandProjection> getPageList(String title) {
        // 创建分页对象
        Pageable page = PageSort.nativePageRequest(Sort.Direction.ASC);
        return appCommandRepository.getPageList(title,page);
    }

    @Override
    public AppCommandProjection findById(Long appCommandId) {
        return appCommandRepository.findByAppCommandId(appCommandId);
    }
}
