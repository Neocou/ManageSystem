package com.uestc.managesystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.OnlineService;

@Controller
public class OnlineController {

	@Autowired
	private OnlineService onlineService;
	
	/**
	 * 查看在线
	 * 跳转到前端
	 * 默认查看全部
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/online",method = RequestMethod.GET)
	public String getAll(Model model){
		List<User> users = onlineService.findAllByStatus();
		model.addAttribute("users", users);
		return "online/online";
	}
	
	/**
	 * 根据状态查询用户
	 * @param status 状态
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/online/select",method = RequestMethod.POST)
	public String select(String status,Model model){
		List<User> users = onlineService.findByStatus(status);
		model.addAttribute("users", users);
		return "online/online";
	}
}
