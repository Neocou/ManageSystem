package com.uestc.managesystem.controller;

import java.util.List;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@RequestMapping("/parts")
@Api(value = "部件管理")
public class PartController {
	
	@Autowired
	private PartService partService;
	/**
	 * 部件编辑模块
	 * @param model 传递全部部件
	 * @return
	 */
	@RequestMapping( method = RequestMethod.GET)
	@ApiOperation(value = "部件管理入口",httpMethod = "GET")
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
	@ApiOperation(value = "部件编辑",httpMethod = "GET")
	@RequestMapping(value = "{partid}", method = RequestMethod.GET)
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
	@ApiOperation(value = "部件编辑",httpMethod = "POST")
	@RequestMapping(value = "edit", method = RequestMethod.POST)
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
	@ApiOperation(value = "部件添加",httpMethod = "GET")
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(){
		return "partsManage/partsadd";
	}

	/**
	 * 部件添加模块
	 * @param partsSecond 添加部件的信息
	 * @return
	 */
	@ApiOperation(value = "部件添加",httpMethod = "POST")
	@RequestMapping(value="add",method=RequestMethod.POST)
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
	@ApiOperation(value = "部件删除",httpMethod = "GET")
	@RequestMapping(value="del/{id}",method=RequestMethod.GET)
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
