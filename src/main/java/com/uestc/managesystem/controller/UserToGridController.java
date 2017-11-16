package com.uestc.managesystem.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.Grid;
import com.uestc.managesystem.entity.model.Street;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.entity.model.UserGrid;
import com.uestc.managesystem.service.serviceInter.GridService;
import com.uestc.managesystem.service.serviceInter.UserGridService;
import com.uestc.managesystem.service.serviceInter.UserService;

@Controller
public class UserToGridController {
	
	@Autowired
	private UserGridService userGridService;
	@Autowired
	private UserService userService;
	@Autowired
	private GridService gridService;
	
	
	
	@RequestMapping(value="/grid",method = RequestMethod.GET)
	public String getGrids(Model model){
		List<Street>  streets = userGridService.findAll();
		model.addAttribute("streets", streets);
		return "gridManage/gridmanage";
	}
	
	@RequestMapping(value="/grid/{grid}",method = RequestMethod.GET)
	public String editGrid(@PathVariable("grid")int grid,Model model){
		List<Integer> users = userGridService.selectUser(grid);
		model.addAttribute("users", users);
		model.addAttribute("grid", grid);
		return "gridManage/gridedit";
	}
	
	@RequestMapping(value="/grid/del/{grid}/{userid}",method = RequestMethod.GET)
	public String deleteUserGrid(@PathVariable("userid")int userid,@PathVariable("grid")int grid){
		int i = userGridService.delete(userid,grid);
		if(i==0){
			return "redirect:/grid/"+grid+"?mesg=0";
		}
		else{
			return "redirect:/grid/"+grid+"?mesg=1";
		}
	}

	@RequestMapping(value = "/grid/{grid}/add",method = RequestMethod.GET)
	public String addUserGrid(@PathVariable("grid")int grid,Model model){
		model.addAttribute("grid", grid);
		return "gridManage/gridaddone";
	}
	
	@RequestMapping(value = "/grid/{grid}/add",method = RequestMethod.POST)
	public String addUserGrid(int userid,int grid,Model model){
		User user =  userService.selectByPrimaryKey(userid);
		if(user==null){
			return "redirect:/grid/"+grid+"/add?user=0";
		}
		int i = userGridService.add(grid,userid);
		if(i==0){
			return "redirect:/grid/"+grid+"/add?mesg=0";
		}
		return "redirect:/grid/"+grid+"/add?mesg=1";
	}
	
	
	@RequestMapping(value = "/grid/add",method = RequestMethod.GET)
	public String add(){
		return "gridManage/gridaddall";
	}
	
	@RequestMapping(value = "/grid/add",method = RequestMethod.POST)
	public String addUserGrid(UserGrid userGrid,Model model){
		User user =  userService.selectByPrimaryKey(userGrid.getUserNumber());
		if(user==null){
			return "redirect:/grid/add?user=0";
		}
		Grid grid = gridService.selectByPrimaryKey(userGrid.getGridId());
		if(grid==null){
			return "redirect:/grid/add?grid=0";
		}
		int i = userGridService.add(userGrid);
		if(i==0){
			return "redirect:/grid/add?mesg=0";
		}
		return "redirect:/grid/add?mesg=1";
	}
}
