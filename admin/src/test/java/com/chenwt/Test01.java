package com.chenwt;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.service.AppCommandService;
import com.chenwt.admin.business.service.AppInfoService;
import com.chenwt.modules.system.service.RoleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

/**
 * @class：Test01
 * @campany：zkzj
 * @author:feiniaoying
 * @date:2019-05-04 21:20
 * @description:
 */
public class Test01 extends BaseTest {
    @Autowired
    private RoleService roleService;

//    @Autowired
//    private OrderService orderService;
//
    @Resource
    private AppCommandService appCommandService;
    @Test
    public void test01(){
        AppCommandProjection tt = appCommandService.findById(1L);
        System.out.println(tt.getStatus());
    }
    @Resource
    private AppInfoService appInfoService;
    @Test
    public void test02(){
        List<Long> appInfoIdList = new LinkedList<>();
        List<AppInfo> tt1 = appInfoService.findByAppInfoIdList(appInfoIdList);

        appInfoIdList.add(1L);
        appInfoIdList.add(2L);
        List<AppInfo> tt = appInfoService.findByAppInfoIdList(appInfoIdList);
        System.out.println("111111111");
    }

}
