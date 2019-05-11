package com.chenwt.modules.system.repository;

import com.chenwt.common.constant.StatusConst;
import com.chenwt.modules.system.domain.Menu;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author chenwt
 * @date 2018/8/14
 */
public interface MenuRepository extends BaseRepository<Menu, Long> {

    /**
     * 查找多个菜单
     * @param ids id列表
     */
    public List<Menu> findByIdIn(List<Long> ids);

    /**
     * 查找响应状态的菜单
     * @param sort 排序对象
     */
    public List<Menu> findAllByStatus(Sort sort, Byte status);

    /**
     * 查询菜单URL
     * @param url id列表
     */
    public Menu findByUrl(String url);

    /**
     * 根据父ID查找子菜单
     * @param pids pid列表
     */
    public List<Menu> findByPidsLikeAndStatus(String pids, Byte status);

    /**
     * 获取排序最大值
     * @param pid 父菜单ID
     */
    @Query("select max(sort) from Menu m where m.pid = ?1 and m.status <> " + StatusConst.DELETE)
    public Integer findSortMax(long pid);

    /**
     * 根据父级菜单ID获取本级全部菜单
     * @param sort 排序对象
     * @param pid 父菜单ID
     * @param notId 需要排除的菜单ID
     */
    public List<Menu> findByPidAndIdNot(Sort sort, long pid, long notId);

    /**
     * 取消菜单与角色之间的关系
     * @param id 菜单ID
     */
    @Modifying
    @Transactional
    @Query(value = "DELETE FROM sys_role_menu WHERE menu_id = ?1", nativeQuery = true)
    public Integer cancelRoleJoin(Long id);
}
