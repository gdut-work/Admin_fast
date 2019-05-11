package com.chenwt.admin.business.controller;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import com.chenwt.admin.business.domain.vo.AppCommandVO;
import com.chenwt.admin.business.domain.vo.AppInfoVO;
import com.chenwt.admin.business.service.AppCommandService;
import com.chenwt.admin.system.validator.UserValid;
import com.chenwt.common.constant.AdminConst;
import com.chenwt.common.enums.ResultEnum;
import com.chenwt.common.exception.ResultException;
import com.chenwt.common.utils.EntityBeanUtil;
import com.chenwt.common.utils.ResultVoUtil;
import com.chenwt.common.vo.ResultVo;
import com.chenwt.component.actionLog.action.UserAction;
import com.chenwt.component.actionLog.annotation.ActionLog;
import com.chenwt.component.actionLog.annotation.EntityParam;
import com.chenwt.component.shiro.ShiroUtil;
import lombok.Data;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * @author chenwt
 * @date 2018/12/02
 */
@Controller
@RequestMapping("/business/appCommand")
public class AppCommandController{
	@Resource
	private AppCommandService appCommandService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("business:appCommand:index")
    public String index(Model model, AppCommandVO appCommandVO) {
        // 获取指令列表
        Page<AppCommandProjection> list = appCommandService.getPageList(appCommandVO.getTitle());

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/business/appCommand/index";
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("business:appCommand:detail")
    public String toDetail(@PathVariable("id") Long appCommandId, Model model){
        AppCommandProjection appCommandProjection = appCommandService.findById(appCommandId);
        model.addAttribute("appCommand", appCommandProjection);
        return "/business/appCommand/detail";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("business:appCommand:edit")
    public String toEdit(@PathVariable("id") Long appCommandId, Model model){
//        AppInfo appInfo = appCommandService.findById(appInfoId);
//
//        model.addAttribute("appCommand", appCommand);
        return "/business/appCommand/add";
    }

//    /**
//     * 保存添加/修改的数据
//     * @param valid 验证对象
//     * @param user 实体对象
//     */
//    @PostMapping("/save")
//    @RequiresPermissions({"system:user:add", "system:user:edit"})
//    @ResponseBody
//    @ActionLog(key = UserAction.USER_SAVE, action = UserAction.class)
//    public ResultVo save(@Validated UserValid valid, @EntityParam User user) {
//
//        // 验证数据是否合格
//        if (user.getId() == null) {
//
//            // 判断密码是否为空
//            if (user.getPassword().isEmpty() || "".equals(user.getPassword().trim())) {
//                throw new ResultException(ResultEnum.USER_PWD_NULL);
//            }
//
//            // 判断两次密码是否一致
//            if (!user.getPassword().equals(valid.getConfirm())) {
//                throw new ResultException(ResultEnum.USER_INEQUALITY);
//            }
//
//            // 对密码进行加密
////            String salt = ShiroUtil.getRandomSalt();
//            String encrypt = ShiroUtil.encrypt(user.getPassword(), salt);
//            user.setPassword(encrypt);
//            user.setSalt(salt);
//        }
//
//        // 判断用户名是否重复
//        if (userService.repeatByUsername(user)) {
//            throw new ResultException(ResultEnum.USER_EXIST);
//        }
//
//        // 复制保留无需修改的数据
//        if (user.getId() != null) {
//            // 不允许操作超级管理员数据
//            if (user.getId().equals(AdminConst.ADMIN_ID) &&
//                    !ShiroUtil.getSubject().getId().equals(AdminConst.ADMIN_ID)) {
//                throw new ResultException(ResultEnum.NO_ADMIN_AUTH);
//            }
//
//            User beUser = userService.getById(user.getId());
//            String[] fields = {"password", "salt", "picture", "roles"};
//            EntityBeanUtil.copyProperties(beUser, user, fields);
//        }
//
//        // 保存数据
//        userService.save(user);
//        return ResultVoUtil.SAVE_SUCCESS;
//        return null;
//    }

}
