package com.uestc.managesystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.model.PartsFirst;
import com.uestc.managesystem.entity.model.PartsSecond;
import com.uestc.managesystem.service.serviceInter.PartService;

@Controller
public class PartController {
	
	@Autowired
	private PartService partService;
	/**
	 * 部件编辑模块
	 * @param model 传递全部部件
	 * @return
	 */
	@RequestMapping(value = "/parts", method = RequestMethod.GET)
	public String get(Model model){
		List<PartsFirst> parts = partService.findAll();
		model.addAttribute("parts", parts);
		return "partsManage/partsmanage";
	}
	
	/**
	 * 部件编辑模块
	 * @param eventid 编辑部件的id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/parts/{partid}", method = RequestMethod.GET)
	public String edit(@PathVariable("partid")int partid,Model model){
		PartsSecond part = partService.selectById(partid);
		model.addAttribute("part", part);
		return "partsManage/partsedit";
	}
	
	/**
	 * 部件编辑更新模块
	 * @param eventSecond 更新后的部件内容
	 * @return
	 */
	@RequestMapping(value = "/parts/edit", method = RequestMethod.POST)
	public String edit(PartsSecond partsSecond){
		int i = partService.update(partsSecond);
		if(i==0){
			return "redirect:/parts/"+partsSecond.getPartLId()+"?mesg=0";
		}
		return "redirect:/parts/"+partsSecond.getPartLId()+"?mesg=1";
	}
	/**
	 * 部件添加
	 * 跳转到partsadd.jsp
	 * @return
	 */
	@RequestMapping(value="/parts/add",method=RequestMethod.GET)
	public String add(){
		return "partsManage/partsadd";
	}
	/**
	 * 部件添加模块
	 * @param partsSecond 添加部件的信息
	 * @return
	 */
	@RequestMapping(value="/parts/add",method=RequestMethod.POST)
	public String add(PartsSecond partsSecond){
		int i = partService.insert(partsSecond);
		if(i==0){
			return "redirect:add?mesg=0";
		}
		else{
			return "redirect:add?mesg=1";
		}
	}
	
	/**
	 * 删除部件模块
	 * @param id 删除部件的ID
	 * @return
	 */
	@RequestMapping(value="/parts/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id")int id){
		int i = partService.remove(id);
		if(i==0){
			return "redirect:/parts?delmesg=0";
		}
		else{
			return "redirect:/parts?delmesg=1";
		}
	}

}
