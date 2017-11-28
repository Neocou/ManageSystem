package com.uestc.managesystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.Power;
import com.uestc.managesystem.entity.model.Role;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.PowerRoleService;
import com.uestc.managesystem.service.serviceInter.PowerService;
import com.uestc.managesystem.service.serviceInter.RoleService;
import com.uestc.managesystem.service.serviceInter.UserService;


@Controller
public class RoleController {
	@Autowired
	private PowerRoleService powerRoleService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	@Autowired
	private PowerService powerService;
	
	
	/**
	 * 角色管理
	 * 默认显示全部
	 * @return
	 */
	@RequestMapping(value="/role",method=RequestMethod.GET)
	public String postManage(Model model){
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		return "roleManage/rolemanage";
	}
	/**
	 * 角色添加
	 * 跳转到add.jsp
	 * @return
	 */
	@RequestMapping(value="/role/add",method=RequestMethod.GET)
	public String add(){
		return "roleManage/roleadd";
	}
	/**
	 * 角色添加模块
	 * @param role 添加角色的信息
	 * @return
	 */
	@RequestMapping(value="/role/add",method=RequestMethod.POST)
	public String add(Role role){
		int i = roleService.insert(role);
		if(i==0){
			return "redirect:add/?addmesg=0";
		}
		else{
			return "redirect:add/?addmesg=1";
		}
	}
	/**
	 * 角色操作跳转界面
	 * 删除操作可直接进行
	 * 权限和用户分配以及信息修改需要跳转
	 * @param doname 操作名称 
	 * @param model  传递数据
	 * @param role   选择操作的角色信息
	 * @return
	 */
	
	@RequestMapping(value = "/role/next",method=RequestMethod.POST)
	public String next(String doname,Model model,Role role){
		Integer id = role.getRoleId();
		switch(doname) {
		case "编辑":
			model.addAttribute("editrole", role);
			return "roleManage/roleedit";
		case "删除":
			int i =roleService.remove(id);
			return "redirect:/role?delmesg="+i;
		case "权限分配":
			List<Integer> rolePower = powerRoleService.selectPowers(id);
			List<Power>  powers = powerService.findAll();
			model.addAttribute("powers", powers);
			model.addAttribute("rolePower", rolePower);
			model.addAttribute("roleid", id);
			return "roleManage/rolepower" ;
		case "用户分配":
			List<User> users = userService.getUsers();
			List<Integer> roleusers = userService.getUsers(id);
			model.addAttribute("users", users);
			model.addAttribute("roleusers", roleusers);
			model.addAttribute("roleid", id);
			return "roleManage/roleuser";
		default:
				throw new RuntimeException("不能为空");
		}
	}
	
	/**
	 * 
	 * @param role 更新的角色信息
	 * @return
	 */
	@RequestMapping(value="/role/edit",method=RequestMethod.POST)
	public String editRole(Role role){
		int i = roleService.update(role);
		if(i==0){
			return "redirect:/role?editmesg=0";
		}
		else{
			return "redirect:/role?editmesg=1";
		}
	}

	

	

}
