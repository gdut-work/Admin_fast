package com.chenwt.admin.business.service.impl;

import com.chenwt.admin.business.domain.entity.AppCommand;
import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.repository.AppCommandRepository;
import com.chenwt.admin.business.service.AppCommandService;
import com.chenwt.common.data.PageSort;
import com.chenwt.common.enums.StatusEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
    public Page<AppCommandProjection> getPageList(Byte status, String title) {
        // 创建分页对象
        Pageable page = PageSort.nativePageRequest(Sort.Direction.ASC);
        return appCommandRepository.getPageList(status,title,page);
    }

    @Override
    public AppCommandProjection findById(Long appCommandId) {
        return appCommandRepository.findByAppCommandId(appCommandId);
    }

    @Override
    public AppCommand getById(Long appCommandId) {
        return appCommandRepository.findById(appCommandId).orElse(null);
    }

    @Override
    public AppCommand save(AppCommand appCommand) {
        return appCommandRepository.save(appCommand);
    }

    @Override
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> ids) {
        return appCommandRepository.updateStatus(statusEnum.getCode(), ids) > 0;
    }
}
