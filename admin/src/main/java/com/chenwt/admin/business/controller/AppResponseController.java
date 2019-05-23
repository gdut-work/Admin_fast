package com.chenwt.admin.business.controller;

import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.domain.projection.AppInfoProjection;
import com.chenwt.admin.business.domain.projection.AppResponseProjection;
import com.chenwt.admin.business.domain.vo.AppInfoVO;
import com.chenwt.admin.business.domain.vo.AppResponseVO;
import com.chenwt.admin.business.service.AppResponseService;
import com.chenwt.common.utils.ResultVoUtil;
import com.chenwt.common.vo.ResultVo;
import lombok.Data;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/business/appResponse")
public class AppResponseController {
	@Resource
	private AppResponseService appResponseService;

	/**
	 * 列表页面
	 */
	@GetMapping("/index")
	@RequiresPermissions("business:appResponse:index")
	public String index(Model model, AppResponseVO appResponseVO) {
		// 获取响应列表
		Page<AppResponseProjection> list = appResponseService.getPageList(appResponseVO.getPhone());

		// 封装数据
		model.addAttribute("list", list.getContent());
		model.addAttribute("page", list);
		return "/business/appResponse/index";
	}

	/**
	 * 跳转到详细页面
	 */
	@GetMapping("/detail/{id}")
	@RequiresPermissions("business:appResponse:detail")
	public String toDetail(@PathVariable("id") Long appResponseId, Model model){
		AppResponseProjection appResponseProjection = appResponseService.findById(appResponseId);
		model.addAttribute("appResponse", appResponseProjection);
		return "/business/appResponse/detail";
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("business:appResponse:delete")
	@ResponseBody
	public ResultVo delete(@RequestParam(value = "ids", required = false) Long id){
		if (id != null){
			appResponseService.deleteById(id);
			return ResultVoUtil.success("删除响应成功");
		}else {
			appResponseService.deleteAll();
			return ResultVoUtil.success("清空响应成功");
		}
	}
}
