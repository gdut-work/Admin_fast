package com.chenwt;

import com.chenwt.modules.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;

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
//    @Test
//    public void test01(){
//        OrderVO orderVO = new OrderVO();
//        orderVO.setStatus(1);
//        Page<OrderProjection> page = orderService.getPageList(orderVO.getStatus(),orderVO.getUsername(),orderVO.getNickname());
//        System.out.println(orderVO.toString());
//    }


}
