package com.chenwt.modules.system.service;

import com.chenwt.common.enums.StatusEnum;
import com.chenwt.modules.system.domain.Role;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * @author chenwt
 * @date 2018/8/14
 */
public interface RoleService {

    /**
     * 获取用户角色列表
     * @param id 用户ID
     */
    @Transactional(rollbackFor = Exception.class)
    Set<Role> getUserOkRoleList(Long id);

    /**
     * 判断指定的用户是否存在角色
     * @param id 用户ID
     */
    Boolean existsUserOk(Long id);

    /**
     * 根据角色ID查询角色数据
     * @param id 角色ID
     */
    @Transactional(rollbackFor = Exception.class)
    Role getById(Long id);

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    Page<Role> getPageList(Example<Role> example);

    /**
     * 获取角色列表数据
     * @param sort 排序对象
     */
    List<Role> getListBySortOk(Sort sort);

    /**
     * 角色标识是否重复
     * @param role 角色实体类
     */
    boolean repeatByName(Role role);

    /**
     * 保存角色
     * @param role 角色实体类
     */
    Role save(Role role);

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Transactional(rollbackFor = Exception.class)
    Boolean updateStatus(StatusEnum statusEnum, List<Long> idList);
}
