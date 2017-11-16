package com.uestc.managesystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.OperationRecord;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.OperationService;

@Controller
public class OperationRecordController {
	
	@Autowired
	private OperationService operationService;
	
	/**
	 * 管理员查看所有操作记录模块
	 * @param model 
	 * @return
	 */
	@RequestMapping(value="/operation/admin",method = RequestMethod.GET)
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
	@RequestMapping(value="/operation/admin",method = RequestMethod.POST)
	public String operationView(User user,Model model){
		List<OperationRecord> records = operationService.findByUser(user);
		model.addAttribute("records", records);
		return "/operation/admin";
		
	}
	
	/**
	 * 普通用户查看操作记录模块
	 * @param model 
	 * @return
	 */
	@RequestMapping(value="/operation/user",method = RequestMethod.GET)
	public String operationView(HttpSession session,Model model){
		User userInfo = (User) session.getAttribute("userinfo");
		List<OperationRecord> records = operationService.findById(userInfo.getUserNumber());
		model.addAttribute("records", records);
		return "/operation/user";
		
	}

	
}
