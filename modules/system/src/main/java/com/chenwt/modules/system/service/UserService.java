package com.chenwt.modules.system.service;

import com.chenwt.common.enums.StatusEnum;
import com.chenwt.modules.system.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author chenwt
 * @date 2018/8/14
 */
public interface UserService {

    /**
     * 获取分页列表数据
     * @param user 实体对象
     * @return 返回分页数据
     */
    Page<User> getPageList(User user);

    /**
     * 保存用户
     * @param user 用户实体类
     */
    User save(User user);

    /**
     * 保存用户列表
     * @param userList 用户实体类
     */
    List<User> save(List<User> userList);

    /**
     * 根据用户名查询用户数据
     * @param username 用户名
     * @return 用户数据
     */
    User getByName(String username);

    /**
     * 用户名是否重复
     * @param user 用户对象
     * @return 用户数据
     */
    Boolean repeatByUsername(User user);

    /**
     * 根据用户ID查询用户数据
     * @param id 用户ID
     */
    User getById(Long id);

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Transactional(rollbackFor = Exception.class)
    Boolean updateStatus(StatusEnum statusEnum, List<Long> idList);
}
