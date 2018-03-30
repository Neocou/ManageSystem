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

import com.uestc.managesystem.entity.model.Post;
import com.uestc.managesystem.service.serviceInter.PostService;

@Controller
@Api(value = "岗位管理")
@RequestMapping(value = "/post")
public class PostController {
	@Autowired
	private PostService postService;
	
	
	/**
	 * 岗位管理
	 * 默认显示全部
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET)
	@ApiOperation(value = "岗位管理入口",httpMethod = "GET")
	public String postManage(Model model){
		List<Post> posts = postService.findAll();
		model.addAttribute("posts", posts);
		return "postManage/postmanage";
	}
	/**
	 * 岗位添加
	 * 跳转到add.jsp
	 * @return
	 */
	@RequestMapping(value="/post/add",method=RequestMethod.GET)
	public String add(){
		return "postManage/postadd";
	}
	/**
	 * 岗位添加模块
	 * @param post 添加岗位的信息
	 * @return
	 */
	@RequestMapping(value="/post/add",method=RequestMethod.POST)
	public String add(Post post){
		int i = postService.insert(post);
		if(i==0){
			return "redirect:add?mesg=0";
		}
		else{
			return "redirect:add?mesg=1";
		}
	}
	/**
	 * 删除岗位模块
	 * @param id 删除岗位的ID
	 * @return
	 */
	@RequestMapping(value="/post/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id")int id){
		int i = postService.remove(id);
		if(i==0){
			return "redirect:/post?delmesg=0";
		}
		else{
			return "redirect:/post?delmesg=1";
		}
	}
	/**
	 * 岗位信息编辑
	 * @param id 编辑的岗位ID
	 * @param model 用于传递岗位信息
	 * @return
	 */
	@RequestMapping(value="/post/edit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id")int id,Model model){
		Post post = postService.selectById(id);
		model.addAttribute("post", post);
		return "postManage/postedit";
	}
	/**
	 * 
	 * @param post 更新的岗位信息
	 * @return
	 */
	@RequestMapping(value="/post/edit",method=RequestMethod.POST)
	public String edit(Post post){
		int i = postService.update(post);
		if(i==0){
			return "redirect:/post/edit/"+post.getPostNum()+"?editmesg=0";
		}
		else{
			return "redirect:/post/edit/"+post.getPostNum()+"?editmesg=1";
		}
	}
	

}
