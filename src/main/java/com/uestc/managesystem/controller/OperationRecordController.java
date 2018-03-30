package com.uestc.managesystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.OperationRecord;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.OperationService;

@Controller
@Api(value = "操作记录管理")
@RequestMapping(value = "/operation")
public class OperationRecordController {
	
	@Autowired
	private OperationService operationService;
	
	/**
	 * 管理员查看所有操作记录模块
	 * @param model 
	 * @return
	 */
	@RequestMapping(value="admin",method = RequestMethod.GET)
	@ApiOperation(value = "管理员查看操作记录入口",httpMethod = "GET")
	public String operationView(Model model){
		List<OperationRecord> records = operationService.findAll();
		model.addAttribute("records", records);
		return "/operation/admin";
		
	}

	/**
	 * 管理员搜索查询操作记录模块
	 * @param name 查询指定用户名的操作记录
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "管理员查看操作记录查询",httpMethod = "POST")
	@RequestMapping(value="admin",method = RequestMethod.POST)
	public String operationViewSelect(User user,Model model){
		List<OperationRecord> records = operationService.findByUser(user);
		model.addAttribute("records", records);
		return "/operation/admin";
		
	}
	
	/**
	 * 普通用户查看操作记录模块
	 * @param model 
	 * @return
	 */
	@ApiOperation(value = "个人查看操作记录查询",httpMethod = "GET")
	@RequestMapping(value="user",method = RequestMethod.GET)
	public String operationView(HttpSession session,Model model){
		User userInfo = (User) session.getAttribute("userinfo");
		List<OperationRecord> records = operationService.findById(userInfo.getUserNumber());
		model.addAttribute("records", records);
		return "/operation/user";
		
	}

	
}
