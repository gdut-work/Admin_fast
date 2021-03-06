package com.chenwt.admin.business.controller;

import com.chenwt.admin.business.domain.entity.AppInfo;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import com.chenwt.admin.business.domain.vo.AppInfoVO;
import com.chenwt.admin.business.service.AppInfoService;
import com.chenwt.common.utils.ResultVoUtil;
import com.chenwt.common.vo.ResultVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * @author chenwt
 * @date 2018/12/02
 */
@Controller
@RequestMapping("/business/appInfo")
public class AppInfoController implements Serializable {
	@Resource
	private AppInfoService appInfoService;

	/**
	 * 列表页面
	 */
	@GetMapping("/index")
	@RequiresPermissions("business:appInfo:index")
	public String index(Model model, AppInfoVO appInfoVO) {
		// 获取客户列表
		Page<AppInfoProjection> list = appInfoService.getPageList(appInfoVO.getStatus(),appInfoVO.getPhone());

		// 封装数据
		model.addAttribute("list", list.getContent());
		model.addAttribute("page", list);
		return "/business/appInfo/index";
	}

	/**
	 * 跳转到详细页面
	 */
	@GetMapping("/detail/{id}")
	@RequiresPermissions("business:appInfo:detail")
	public String toDetail(@PathVariable("id") Long appInfoId, Model model){
		AppInfo appInfo = appInfoService.findById(appInfoId);
		model.addAttribute("appInfo", appInfo);
		return "/business/appInfo/detail";
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("business:appInfo:delete")
	@ResponseBody
	public ResultVo delete(@RequestParam(value = "ids", required = false) List<Long> ids){
		appInfoService.deleteBatchById(ids);
		return ResultVoUtil.DELETE_SUCCESS;
	}
}
