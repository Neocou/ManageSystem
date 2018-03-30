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

import com.uestc.managesystem.entity.model.EventFirst;
import com.uestc.managesystem.entity.model.EventSecond;
import com.uestc.managesystem.service.serviceInter.EventService;

@Controller
@RequestMapping(value = "/event")
@Api(value = "事件管理")
public class EventController {
	@Autowired
	private EventService eventService;
	
	/**
	 * 事件编辑模块
	 * @param model 传递全部事件
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	@ApiOperation(value = "事件管理入口",httpMethod = "GET")
	public String get(Model model){
		List<EventFirst> events = eventService.findAll();
		model.addAttribute("events", events);
		return "eventManage/eventmanage";
	}
	
	/**
	 * 事件编辑模块
	 * @param eventid 编辑事件的id
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "事件编辑",httpMethod = "GET")
	@RequestMapping(value = "{eventid}", method = RequestMethod.GET)
	public String edit(@PathVariable("eventid")int eventid,Model model){
		EventSecond event = eventService.selectById(eventid);
		model.addAttribute("event", event);
		return "eventManage/eventedit";
	}
	
	/**
	 * 事件编辑更新模块
	 * @param eventSecond 更新后的事件内容
	 * @return
	 */
	@ApiOperation(value = "事件编辑",httpMethod = "POST")
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(EventSecond eventSecond){
		int i = eventService.update(eventSecond);
		if(i==0){
			return "redirect:/event/"+eventSecond.getEventLId()+"?mesg=0";
		}
		return "redirect:/event/"+eventSecond.getEventLId()+"?mesg=1";
	}

	/**
	 * 事件添加
	 * 跳转到eventadd.jsp
	 * @return
	 */
	@ApiOperation(value = "事件添加",httpMethod = "GET")
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(){
		return "eventManage/eventadd";
	}
	/**
	 * 事件添加模块
	 * @param eventSecond 添加事件的信息
	 * @return
	 */
	@ApiOperation(value = "事件添加",httpMethod = "POST")
	@RequestMapping(value="/event/add",method=RequestMethod.POST)
	public String add(EventSecond eventSecond){
		int i = eventService.insert(eventSecond);
		if(i==0){
			return "redirect:add?mesg=0";
		}
		else{
			return "redirect:add?mesg=1";
		}
	}
	
	/**
	 * 删除事件模块
	 * @param id 删除事件的ID
	 * @return
	 */
	@ApiOperation(value = "事件删除",httpMethod = "GET")
	@RequestMapping(value="del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id")int id){
		int i = eventService.remove(id);
		if(i==0){
			return "redirect:/event?delmesg=0";
		}
		else{
			return "redirect:/event?delmesg=1";
		}
	}
}
