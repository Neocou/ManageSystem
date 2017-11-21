package com.uestc.managesystem.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.uestc.managesystem.entity.model.RestTime;
import com.uestc.managesystem.service.serviceInter.RestTimeService;

@Controller
public class RestTimeController {

	@Autowired
	private RestTimeService restTimeService;
	
	/**
	 * 休息日查看模块
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/restTime",method = RequestMethod.GET)
	public String get(Model model){
		List<RestTime> restTimes = restTimeService.findAll();
		model.addAttribute("restTimes", restTimes);
		return "restTime/resttime";
	}
	
	/**
	 * 删除休息日记录模块
	 * @param restNum 删除记录编号
	 * @return
	 */
	@RequestMapping(value = "/restTime/del/{restNum}",method = RequestMethod.GET)
	public String del(@PathVariable("restNum")int restNum){
		int i = restTimeService.delete(restNum);
		if(i==0){
			return "redirect:/restTime?delmesg=0";
		}
		return "redirect:/restTime?delmesg=1";
	}
	
	/**
	 * 添加休息日记录模块
	 * @return
	 */
	@RequestMapping(value = "/restTime/add",method = RequestMethod.GET)
	public String add(){
		return "restTime/restadd";
	}
	
	/**
	 * 添加休息日记录模块
	 * @param restTime 休息日
	 * @return
	 */
	@RequestMapping(value = "/restTime/add",method = RequestMethod.POST)
	public String add(RestTime restTime){
		int i = restTimeService.insert(restTime);
		if(i==0){
			return "redirect:add?mesg=0";
		}
		return "redirect:add?mesg=1";
	}
	/**
	 * 休息日编辑
	 * @param id 编辑的休息日ID
	 * @param model 用于传递休息日信息
	 * @return
	 */
	@RequestMapping(value="/restTime/edit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id")int id,Model model){
		RestTime restTime = restTimeService.selectById(id);
		model.addAttribute("restTime", restTime);
		return "restTime/restedit";
	}
	/**
	 * 
	 * @param post 更新的休息日信息
	 * @return
	 */
	@RequestMapping(value="/restTime/edit",method=RequestMethod.POST)
	public String edit(RestTime restTime){
		int i = restTimeService.update(restTime);
		if(i==0){
			return "redirect:/restTime/edit/"+restTime.getRestNum()+"?editmesg=0";
		}
		else{
			return "redirect:/restTime/edit/"+restTime.getRestNum()+"?editmesg=1";
		}
	}
	/**定时模块：每天24点开始
	 * 查看是否休息日模块
	 * 获取ServletContext添加属性标记是否假日
	 */
	@Scheduled(cron="0 0 0 * * ?" )
	public void judge(){
		WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
		ServletContext application = webApplicationContext.getServletContext();//获取ServletContext
		String  restMesg =  restTimeService.judge();
		application.setAttribute("restMesg", restMesg);
	}
}
