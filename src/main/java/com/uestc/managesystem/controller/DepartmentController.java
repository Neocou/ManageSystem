package com.uestc.managesystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.Department;
import com.uestc.managesystem.service.serviceInter.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	
	/**
	 * 部门管理
	 * 默认显示全部
	 * @return
	 */
	@RequestMapping(value="/dep",method=RequestMethod.GET)
	
	public String depmanage(Model model){
		List<Department> departments = departmentService.findAll();
		model.addAttribute("departments", departments);
		return "depManage/depmanage";
	}
	/**
	 * 部门添加
	 * 跳转到add.jsp
	 * @return
	 */
	@RequestMapping(value="/dep/add",method=RequestMethod.GET)
	public String add(){
		return "depManage/depadd";
	}
	/**
	 * 部门添加模块
	 * @param department 添加部门的信息
	 * @return
	 */
	@RequestMapping(value="/dep/add",method=RequestMethod.POST)
	public String add(Department department){
		int i = departmentService.insert(department);
		if(i==0){
			return "redirect:add?mesg=0";
		}
		else{
			return "redirect:add?mesg=1";
		}
	}
	/**
	 * 删除部门模块
	 * @param id 删除部门的ID
	 * @return
	 */
	@RequestMapping(value="/dep/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id")int id){
		int i = departmentService.remove(id);
		if(i==0){
			return "redirect:/dep?delmesg=0";
		}
		else{
			return "redirect:/dep?delmesg=1";
		}
	}
	/**
	 * 部门信息编辑
	 * @param id 编辑的部门ID
	 * @param model 用于传递部门信息
	 * @return
	 */
	@RequestMapping(value="/dep/edit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id")int id,Model model){
		Department department = departmentService.selectById(id);
		model.addAttribute("department", department);
		return "depManage/depedit";
	}
	/**
	 * 
	 * @param department 更新的部门信息
	 * @return
	 */
	@RequestMapping(value="/dep/edit",method=RequestMethod.POST)
	public String edit(Department department){
		int i = departmentService.update(department);
		if(i==0){
			return "redirect:edit/"+department.getDepartmentNum()+"?editmesg=0";
		}
		else{
			return "redirect:edit/"+department.getDepartmentNum()+"?editmesg=1";
		}
	}
	
	
	
}
