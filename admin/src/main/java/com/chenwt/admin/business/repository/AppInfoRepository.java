package com.chenwt.admin.business.repository;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @class：AppInfoRepository
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:09
 * @description:
 */
public interface AppInfoRepository extends JpaRepository<AppInfo, Long>, JpaSpecificationExecutor<AppInfo> {
    /**
     * 通过手机号码查询
     * @param phone
     * @return
     */
    AppInfo findAppInfoByPhone(String phone);

    /**
     * 分页查询
     * @param status
     * @param phone
     * @param onLinePhoneStr
     * @param page
     * @return
     */
    @Query(value = "SELECT t.id, " +
            "t.phone, " +
            "t.name1, " +
            "t.name2, " +
            "t.name3, " +
            "t.name4, " +
            "t.create_date as createDate " +
            "from app_info t " +
            "where 1=1 " +
            "and if(:phone is NULL,1=1,t.phone LIKE CONCAT('%',:phone,'%')) " +
            "and if(:status = 1,t.phone in(:onLinePhoneStr),1=1) " +
            "and if(:status = 2,t.phone not in(:onLinePhoneStr),1=1)",nativeQuery = true)
    Page<AppInfoProjection> getPageList(@Param("status") Integer status, @Param("phone") String phone, @Param("onLinePhoneStr") String onLinePhoneStr, Pageable page);
}
