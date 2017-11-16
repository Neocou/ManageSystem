package com.uestc.managesystem.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.service.serviceInter.PowerRoleService;


@Controller
public class PowerRoleController {
	
	@Autowired
	
	private PowerRoleService powerRoleService;
	
	/**
	 * 角色权限分配模块
	 * @param powers 分配权限列表
	 * @param roleid 分配的角色
	 * @return
	 */
	@RequestMapping(value = "/role/powers",method = RequestMethod.POST)
	public String editPowers(int [] powerId,int roleid){
		int i = powerRoleService.updatePowers(powerId,roleid);
		if(i==0){
			return "redirect:/role?updatemesg="+0;
		}
		else{
			return "redirect:/role?updatemesg="+1;
		}
	}
	

}
