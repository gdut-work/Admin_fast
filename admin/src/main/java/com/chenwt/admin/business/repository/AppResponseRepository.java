package com.chenwt.admin.business.repository;

import com.chenwt.admin.business.domain.entity.AppResponse;
import com.chenwt.admin.business.domain.projection.AppResponseProjection;
import com.chenwt.modules.system.repository.BaseRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @class：AppInfoRepository
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:09
 * @description:
 */
public interface AppResponseRepository extends JpaRepository<AppResponse, Long>, JpaSpecificationExecutor<AppResponse> {
    /**
     * 根据手机号分页查询
     *
     * @param phone
     * @param page
     * @return
     */
    @Query(value = "SELECT " +
            "t1.id, " +
            "t1.app_id as appId, " +
            "t2.phone, " +
            "t1.context, " +
            "t1.create_date as createDate " +
            "FROM " +
            "app_response t1 " +
            "LEFT JOIN " +
            "app_info t2 " +
            "ON t1.app_id = t2.id " +
            "where 1=1 " +
            "and if(:phone is NULL,1=1,t2.phone LIKE CONCAT('%', :phone,'%'))"
            , countQuery = "select count(t1.id) FROM app_response t1 LEFT JOIN app_info t2 ON t1.app_id = t2.id where 1=1 " +
            "and if(:phone is NULL,1=1,t2.phone LIKE CONCAT('%', :phone,'%'))"
            , nativeQuery = true)
    Page<AppResponseProjection> getPageList(@Param("phone") String phone, Pageable page);

    /**
     * 根据appResponseId获取
     *
     * @param appResponseId
     * @return
     */
    @Query(value = "SELECT " +
            "t1.id, " +
            "t1.app_id as appId, " +
            "t2.phone, " +
            "t1.context, " +
            "t1.create_date as createDate " +
            "FROM " +
            "app_response t1 " +
            "LEFT JOIN " +
            "app_info t2 " +
            "ON t1.app_id = t2.id " +
            "where t1.id = :appResponseId  "
            , nativeQuery = true)
    AppResponseProjection findByAppResponseId(@Param("appResponseId") Long appResponseId);
}
