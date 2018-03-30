package com.uestc.managesystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uestc.managesystem.entity.dto.UserSelect;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.UserService;
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * 默认登陆页面
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(HttpSession session) {
		if(session.getAttribute("userinfo")!=null){
			return "redirect:/home";
		}
		else
			return "login";
	}
	
	
	/**
	 * 验证登陆模块
	 * 保存存储休息信息和账号信息
	 * @param user 账号信息
	 * @param session 存储登陆后的信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,HttpSession session) {
		User userResult = userService.login(user);
		if(userResult==null){
			return "redirect:login?loginmesg=0";
		}
		userService.setOnline(userResult);
		session.setAttribute("userinfo", userResult);
		return "redirect:home";
	}
	
	
	/**
	 * 默认主页页面
	 * @return
	 */
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	
	
	/*
	 * 个人信息查看
	 * 从session获取得了
	 */
	@RequestMapping(value="/personinfo",method = RequestMethod.GET)
	public String personinfo(HttpSession session,Model model) {
		return "userManage/personinfo";
	}
	/**
	 * 个人信息修改
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/personinfo",method = RequestMethod.POST)
	public String personinfo(User user,HttpSession session) {
		int i = userService.updateUser(user);
		if(0==i){
			return "redirect:personinfo?mesg=0";
		}
		else{
			User userResult = userService.getUserInfo(user.getUserNumber());
			session.setAttribute("userinfo", userResult);
			return "redirect:personinfo?mesg=1";
		}
	}
	
	@RequestMapping(value = "/personinfo/password",method = RequestMethod.GET)
	public String changePassword(){
		return "userManage/changePassword";
	}
	
	@RequestMapping(value = "/personinfo/password",method = RequestMethod.POST)
	public String changePassword(HttpSession session,User user,String newPassword,String surePassword){
		User userinfo = (User) session.getAttribute("userinfo");
		String password = userinfo.getPassWord();
		if(!password.equals(user.getPassWord())){
			return "redirect:password?mesg=0";
		}
		else {
			int i = userService.changePassword(user,newPassword,surePassword);
			if(i==0){
				return "redirect:password?mesg=0";
			}
			return "redirect:password?mesg=1";
		}

	}
	
	/**
	 * 退出登陆
	 * @param session 移除账号信息
	 * @return	登陆页面
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		User userResult = (User) session.getAttribute("userinfo");
		userService.setOffline(userResult);
		session.removeAttribute("userinfo");
		return "redirect:login?mesg=1";
	}
	
	/**
	 * 用户公共查询模块
	 * 默认显示全部用户
	 * @return
	 */
	@RequestMapping(value="/users/select",method=RequestMethod.GET)
	public String select(Model model){
		List<User> users = userService.selectAllCommon();
		model.addAttribute("users", users);
		return "userManage/commonSelect";
	}
	/**
	 * 
	 * @param userSelect 多条件公共查询的条件
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/users/select",method=RequestMethod.POST)
	public @ResponseBody List<User> select(UserSelect userSelect,Model model){
		List<User> users = userService.userSelectCommon(userSelect);
		return users;
	}
	
	/**
	 * 公共查看用户详细模块
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/users/select/{id}",method = RequestMethod.GET)
	public String view(@PathVariable("id")int id,Model model){
		User result = userService.getUserInfo(id);
		if(result == null){
			return "redirect:users/select?mesg=0";
		}
		model.addAttribute("result", result);
		return "userManage/commondetail";
	}
}
