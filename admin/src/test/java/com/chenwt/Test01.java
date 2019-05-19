package com.chenwt;

import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.service.AppCommandService;
import com.chenwt.modules.system.service.RoleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;

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


}
