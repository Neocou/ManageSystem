package com.uestc.managesystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.dto.UserSelect;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.UserService;

@Controller
public class UserManageController {
	
	@Autowired
	private UserService userService;
	/**
	 * 用户管理模块
	 * @return
	 */
	@RequestMapping(value="/user",method=RequestMethod.GET)
	public String user(){
		return "userManage/userManage";
	}
	/**
	 * 用户添加模块
	 * @return
	 */
	@RequestMapping(value="/user/add",method=RequestMethod.GET)
	public String add(){
		return "userManage/add";
	}
	/**
	 * @param 添加的用户信息
	 * @return 返回成功并添加的用户Id
	 */
	@RequestMapping(value="/user/add",method=RequestMethod.POST)
	public String add(User user)  {
		User result = userService.addUser(user);
		if(result==null){
			return "redirect:add?mesg=0";
		}
		else{
			return "redirect:add?mesg=1&userId="+result.getUserNumber();
		}
	}

	/**
	 * @param 删除的用户Id
	 * @return 返回操作结果
	 */
	@RequestMapping(value="/user/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id")int id){
		int result = userService.delUser(id);
		if(result==0){
			return "redirect:/user/select?delmesg=0";
		}
		else{
			return "redirect:/user/select?delmesg=1";
		}
	}
	/**
	 * 用户查询模块
	 * 默认显示全部用户
	 * @return
	 */
	@RequestMapping(value="/user/select",method=RequestMethod.GET)
	public String select(Model model){
		List<User> users = userService.selectAllAdmin();
		model.addAttribute("users", users);
		return "userManage/select";
	}
	/**
	 * 
	 * @param userSelect 多条件查询的条件
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/select",method=RequestMethod.POST)
	public String select(UserSelect userSelect,Model model){
		List<User> users = userService.userSelect(userSelect);
		if(users==null){
			return "redirect:usermanage/select?mesg=0";
		}
		
		model.addAttribute("users", users);
		return "userManage/select";
	}
	/**
	 * 管理员对用户信息修改模块
	 * @param 修改的用户Id
	 * @return 返回用户信息到edit.jsp
	 */
	@RequestMapping(value="/user/edit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id")int id,Model model){
		User result = userService.selectByPrimaryKey(id);
		if(result==null){
			return "redirect:/user/select?editmesg=0";
		}
		else{
			model.addAttribute("result", result);
			return "userManage/edit";
		}
	}
	/**
	 * 用户信息修改模块
	 * @param user 更新后的用户信息
	 * @return
	 */
	@RequestMapping(value="/user/edit",method=RequestMethod.POST)
	public String edit(User user){
		int result = userService.updateUser(user);
		if(result==0){
			return "redirect:edit/"+user.getUserNumber()+"?editmesg=0";
		}
		else{
			return "redirect:edit/"+user.getUserNumber()+"?editmesg=1";
		}
	}
}
