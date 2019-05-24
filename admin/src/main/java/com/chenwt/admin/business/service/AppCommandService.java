package com.chenwt.admin.business.service;

import com.chenwt.admin.business.domain.entity.AppCommand;
import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.common.enums.StatusEnum;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
     *
     * @param status
     * @param title
     * @return
     */
    Page<AppCommandProjection> getPageList(Byte status, String title);

    /**
     * 根据appCommandId获取
     * @param appCommandId
     * @return
     */
    AppCommandProjection findById(Long appCommandId);

    /**
     * 获取
     * @param appCommandId
     * @return
     */
    AppCommand getById(Long appCommandId);

    /**
     * 保存
     * @param appCommand
     * @return
     */
    AppCommand save(AppCommand appCommand);

    /**
     * 更新状态
     * @param statusEnum
     * @param ids
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    Boolean updateStatus(StatusEnum statusEnum, List<Long> ids);

    /**
     * 指令执行
     * @param appCommandId
     * @param appInfoIdList
     */
    void exec(Long appCommandId, List<Long> appInfoIdList);
}
