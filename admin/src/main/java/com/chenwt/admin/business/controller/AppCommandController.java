package com.chenwt.admin.business.controller;

import com.chenwt.admin.business.domain.entity.AppCommand;
import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import com.chenwt.admin.business.domain.vo.AppCommandVO;
import com.chenwt.admin.business.domain.vo.AppInfoVO;
import com.chenwt.admin.business.service.AppCommandService;
import com.chenwt.admin.business.service.AppInfoService;
import com.chenwt.admin.business.validator.AppCommandValid;
import com.chenwt.common.constant.StatusConst;
import com.chenwt.common.enums.StatusEnum;
import com.chenwt.common.utils.EntityBeanUtil;
import com.chenwt.common.utils.ResultVoUtil;
import com.chenwt.common.utils.StatusUtil;
import com.chenwt.common.vo.ResultVo;
import com.chenwt.component.actionLog.annotation.EntityParam;
import com.chenwt.component.shiro.ShiroUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author chenwt
 * @date 2018/12/02
 */
@Controller
@RequestMapping("/business/appCommand")
public class AppCommandController{
	@Resource
	private AppCommandService appCommandService;
    @Resource
    private AppInfoService appInfoService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("business:appCommand:index")
    public String index(Model model, AppCommandVO appCommandVO) {
        // 获取指令列表
        Page<AppCommandProjection> list = appCommandService.getPageList(appCommandVO.getStatus(),appCommandVO.getTitle());
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
        AppCommandProjection appCommand = appCommandService.findById(appCommandId);
        model.addAttribute("appCommand", appCommand);
        return "/business/appCommand/add";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("business:appCommand:add")
    public String toAdd(){
        return "/business/appCommand/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     * @param appCommand 实体对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"business:appCommand:add", "business:appCommand:edit"})
    @ResponseBody
    public ResultVo save(@Validated AppCommandValid valid, @EntityParam AppCommand appCommand) {

        // 复制保留无需修改的数据
        if (appCommand.getId() != null) {
            AppCommand beAppCommand = appCommandService.getById(appCommand.getId());
            EntityBeanUtil.copyProperties(beAppCommand, appCommand);

            appCommand.setUpdateBy(ShiroUtil.getSubject().getId());
            appCommand.setUpdateDate(new Date());
        }else{
            appCommand.setCreateBy(ShiroUtil.getSubject().getId());
            appCommand.setStatus(StatusConst.OK);
            appCommand.setCreateDate(new Date());
        }

        // 保存数据
        appCommandService.save(appCommand);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("business:appCommand:status")
    @ResponseBody
    public ResultVo updateStatus(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {

        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (appCommandService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }

    /**
     * 执行指令
     */
    @RequestMapping("/toExec/{id}")
    @RequiresPermissions("business:appCommand:exec")
    public String toExec(@PathVariable("id") Long appCommandId,AppInfoVO appInfoVO, Model model){
        // 执行
        // 查找出在线用户
        // 获取客户列表
        Page<AppInfoProjection> list = appInfoService.getOnlinePageList(appInfoVO.getPhone());

        // 封装数据
        model.addAttribute("appCommandId", appCommandId);
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/business/appCommand/exec";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/exec/{appCommandId}")
    @RequiresPermissions("business:appCommand:exec")
    @ResponseBody
    public ResultVo exec(@PathVariable("appCommandId") Long appCommandId,@RequestParam(value = "ids", required = false) List<Long> ids) {
        appCommandService.exec(appCommandId,ids);
        return ResultVoUtil.success("发送执行成功，可到响应管理查看客户端执行响应");
    }

}
