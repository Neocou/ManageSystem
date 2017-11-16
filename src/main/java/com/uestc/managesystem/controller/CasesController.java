package com.uestc.managesystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.Cases;
import com.uestc.managesystem.service.serviceInter.CasesService;

@Controller
public class CasesController {
	@Autowired
	private CasesService casesService;
	
	/**
	 * 设置案件时限模块
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cases/settime",method = RequestMethod.GET)
	public String setTime(Model model){
		List<Cases>  cases = casesService.findAllNo();
		model.addAttribute("cases", cases);
		return "/cases/settime";
	}
	
	
	/**
	 * 设置案件时限模块
	 * @param cases 案件
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cases/settime",method = RequestMethod.POST)
	public String setTime(Cases cases,Model model){
		int i = casesService.setTime(cases);
		if(i==0){
			return "redirect:/cases/settime?mesg=0";
		}
		return "redirect:/cases/settime?mesg=1";
	}

	/**
	 * 查看案件情况
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cases/view",method = RequestMethod.GET)
	public String view(Model model){
		List<Cases>  cases = casesService.findAll();
		model.addAttribute("cases", cases);
		return "/cases/viewcase";
	}
}
