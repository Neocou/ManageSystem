package com.uestc.managesystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.service.serviceInter.UserRoleService;

@Controller
public class UserRoleController {
	
	@Autowired
	
	private UserRoleService userRoleService;
	

	/**
	 * 
	 * @param userids 分配的用户id集合
	 * @param roleid  分配角色id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/role/users",method = RequestMethod.POST)
	public String editusers(int [] userids,int roleid,Model model){
		int i = userRoleService.updateusers(userids,roleid);
		if(i==0){
			return "redirect:/role?usermesg=0";
		}
		else{
			return "redirect:/role?usermesg=1";
		}
	}
	
	

}
