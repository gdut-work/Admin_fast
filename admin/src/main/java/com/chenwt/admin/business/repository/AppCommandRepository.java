package com.chenwt.admin.business.repository;

import com.chenwt.admin.business.domain.entity.AppCommand;
import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @class：AppCommandRepository
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:14
 * @description:
 */
public interface AppCommandRepository extends JpaRepository<AppCommand, Long>, JpaSpecificationExecutor<AppCommand> {
    /**
     * 分页查询
     *
     * @param title
     * @param page
     * @return
     */
    @Query(value = "SELECT " +
            "t1.id, " +
            "t1.title, " +
            "t1.command, " +
            "t2.username as createName, " +
            "t1.create_date as createDate, " +
            "t1.update_date as updateDate, " +
            "t1.remark " +
            "FROM " +
            "app_command t1 " +
            "LEFT JOIN " +
            "sys_user t2 " +
            "ON t1.create_by = t2.id " +
            "where 1=1 " +
            "and if(:title is NULL,1=1,t1.title LIKE CONCAT('%', :title,'%'))", nativeQuery = true)
    Page<AppCommandProjection> getPageList(@Param("title") String title, Pageable page);

    /**
     * 根据id获取
     * @param appCommandId
     * @return
     */
    @Query(value = "SELECT " +
            "t1.id, " +
            "t1.title, " +
            "t1.command, " +
            "t2.username as createName, " +
            "t1.create_date as createDate, " +
            "t1.update_date as updateDate, " +
            "t1.remark " +
            "FROM " +
            "app_command t1 " +
            "LEFT JOIN " +
            "sys_user t2 " +
            "ON t1.create_by = t2.id " +
            "where t1.id = :appCommandId", nativeQuery = true)
    AppCommandProjection findByAppCommandId(@Param("appCommandId") Long appCommandId);
}
