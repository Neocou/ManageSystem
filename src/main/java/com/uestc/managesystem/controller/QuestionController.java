package com.uestc.managesystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uestc.managesystem.entity.dto.QuestionSelect;
import com.uestc.managesystem.entity.model.QuestionDetails;
import com.uestc.managesystem.entity.model.QuestionFirst;
import com.uestc.managesystem.service.serviceInter.QuestionService;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	/**
	 * 查看问题模块
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/question",method = RequestMethod.GET)
	public String get(Model model){
		List<QuestionFirst> questions = questionService.findAll();
		model.addAttribute("questions", questions);
		return "/question/questionmanage";
	}
	
	/**
	 * 问题编辑模块
	 * @param eventid 编辑事件的id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/question/{questionid}", method = RequestMethod.GET)
	public String edit(@PathVariable("questionid")int questionid,Model model){
		QuestionDetails question = questionService.selectById(questionid);
		model.addAttribute("question", question);
		return "question/questionedit";
	}
	
	/**
	 * 问题编辑更新模块
	 * @param eventSecond 更新后的问题内容
	 * @return
	 */
	@RequestMapping(value = "/question/edit", method = RequestMethod.POST)
	public String edit(QuestionDetails questionDetails){
		int i = questionService.update(questionDetails);
		if(i==0){
			return "redirect:/question/"+questionDetails.getQuesLId()+"?mesg=0";
		}
		return "redirect:/question/"+questionDetails.getQuesLId()+"?mesg=1";
	}

	/**
	 * 问题添加
	 * 跳转到questionadd.jsp
	 * @return
	 */
	@RequestMapping(value="/question/add",method=RequestMethod.GET)
	public String add(){
		return "question/questionadd";
	}
	/**
	 * 问题添加模块
	 * @param eventSecond 添加问题的信息
	 * @return
	 */
	@RequestMapping(value="/question/add",method=RequestMethod.POST)
	public String add(QuestionDetails questionDetails){
		int i = questionService.insert(questionDetails);
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
	@RequestMapping(value="/question/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id")int id){
		int i = questionService.remove(id);
		if(i==0){
			return "redirect:/question?delmesg=0";
		}
		else{
			return "redirect:/question?delmesg=1";
		}
	}
	/**
	 * 公共查看问题模块
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/question/view",method = RequestMethod.GET)
	public String view(Model model){
		List<QuestionDetails> result = questionService.findAllDetail();
		model.addAttribute("result", result);
		return "question/commonquestion";
	}
	
	/**
	 * 公共查看问题详细模块
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/question/view/{quesLId}",method = RequestMethod.GET)
	public String view(@PathVariable("quesLId")int quesLId,Model model){
		QuestionDetails question = questionService.selectById(quesLId);
		if(question == null){
			return "redirect:question/view?mesg=0";
		}
		model.addAttribute("question", question);
		return "question/commondetail";
	}
	
	/**
	 * 搜索问题模块
	 * @param str 搜索内容
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/question/view",method = RequestMethod.POST)
	public String select(QuestionSelect questionSelect,Model model){
		List<QuestionDetails> result = questionService.questionSelect(questionSelect);
		model.addAttribute("result", result);
		return "question/commonquestion";
	}
	
	

}
