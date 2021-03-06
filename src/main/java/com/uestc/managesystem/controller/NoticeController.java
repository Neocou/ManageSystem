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

import com.uestc.managesystem.entity.model.Notice;
import com.uestc.managesystem.service.serviceInter.NoticeService;

@Controller
@Api(value = "公告管理")
@RequestMapping(value = "/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 公告信息管理员查看模块
	 * @param model 传递公告信息
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET)
	@ApiOperation(value = "公告管理",httpMethod = "GET")
	public String getNotice(Model model){
		List<Notice> notices = noticeService.findAll();
		model.addAttribute("notices", notices);
		return "/notice/noticemanage";
	}
	
	/**
	 * 公告信息编辑模块
	 * @param noticeid 编辑公告的id
	 * @param model   传递编辑的公告信息
	 * @return
	 */
	@ApiOperation(value = "公告编辑",httpMethod = "GET")
	@RequestMapping(value = "edit/{noticeid}",method = RequestMethod.GET)
	public String edit(@PathVariable("noticeid")int noticeid,Model model){
		Notice notice = noticeService.selectNotice(noticeid);
		if(notice == null){
			return "redirect:notice";
		}
		model.addAttribute("notice", notice);
		return "notice/noticeedit";
	}
	
	
	/**
	 * 公告信息更新模块
	 * @param notice 更新的公告信息
	 * @return
	 */
	@ApiOperation(value = "公告编辑",httpMethod = "POST")
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public String edit(Notice notice){
		System.out.println(notice.getNoticeContent());
		int i = noticeService.update(notice);
		if(i==0){
			return "redirect:/notice/edit/"+notice.getNoticeId()+"?editmesg=0";
		}
		return "redirect:/notice/edit/"+notice.getNoticeId()+"?editmesg=1";
	}
	
	/**
	 * 公告删除模块
	 * @param noticeid 删除公告id
	 * @return
	 */
	@ApiOperation(value = "公告删除",httpMethod = "GET")
	@RequestMapping(value = "del/{noticeid}",method = RequestMethod.GET)
	public String del(@PathVariable("noticeid") int noticeid){
		int i = noticeService.delete(noticeid);
		if(i==0){
			return "redirect:/notice?delmesg=0";
		}
		return "redirect:/notice?delmesg=1";
	}
	
	
	/**
	 * 公告添加模块
	 * @return
	 */
	@ApiOperation(value = "公告添加",httpMethod = "GET")
	@RequestMapping(value = "add",method = RequestMethod.GET)
	public String add(){
		return "notice/noticeadd";
	}
	
	
	/**
	 * 公告添加模块
	 * @param notice 添加的公告信息
	 * @return
	 */
	@ApiOperation(value = "公告添加",httpMethod = "POST")
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public String add(Notice notice){
		int i = noticeService.insert(notice);
		if(i==0){
			return "redirect:add?mesg=0";
		}
		return "redirect:add?mesg=1";
	}
	
	/**
	 * 公告信息通用查看模块
	 * @param model 传递公告信息
	 * @return
	 */
	@ApiOperation(value = "外部公告查看",httpMethod = "GET")
	@RequestMapping(value="view",method=RequestMethod.GET)
	public String viewNotice(Model model){
		List<Notice> notices = noticeService.findAll();
		model.addAttribute("notices", notices);
		return "/notice/commonnotice";
	}
	
	/**
	 * 公告信息编辑模块
	 * @param noticeid 编辑公告的id
	 * @param model   传递编辑的公告信息
	 * @return
	 */
	@ApiOperation(value = "内部公告查看",httpMethod = "GET")
	@RequestMapping(value = "view/{noticeid}",method = RequestMethod.GET)
	public String viewDetail(@PathVariable("noticeid")int noticeid,Model model){
		Notice notice = noticeService.selectNotice(noticeid);
		if(notice == null){
			return "redirect:notice/view?mesg=0";
		}
		model.addAttribute("notice", notice);
		return "notice/commondetail";
	}
}
