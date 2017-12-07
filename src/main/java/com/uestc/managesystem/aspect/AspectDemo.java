package com.uestc.managesystem.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.UserService;

@Component
@Aspect
public class AspectDemo {
	@Autowired
	private UserService userService;
	@Autowired
	private  HttpServletRequest request;

	/**
	 * 改变用户状态
	 * @param status
	 */
	public void aopSet(String status){
		User userinfo = (User) request.getSession().getAttribute("userinfo");
		userinfo.setUserStatus(status);
		userService.setStatus(userinfo);
	}


	/**
	 * 权限管理记录
	 */
	@Before("execution(* com.uestc.managesystem.controller.UserManageController.user(..))")
	public void AfterUserManageController(){
		aopSet("用户管理中");
	}
	@Before("execution(* com.uestc.managesystem.controller.RoleController.roleManage(..))")
	public void AfterRoleController(){
		aopSet("角色管理中");
	}

	/**
	 * 信息管理记录
	 */
	@Before("execution(* com.uestc.managesystem.controller.DepartmentController.depmanage(..))")
	public void AfterDepartmentController(){
		aopSet("部门管理中");
	}
	@Before("execution(* com.uestc.managesystem.controller.PostController.postManage(..))")
	public void AfterPostController(){
		aopSet("岗位管理中");
	}
	@Before("execution(* com.uestc.managesystem.controller.UserToGridController.getGrids(..))")
	public void AfterUserToGridController(){
		aopSet("区块管理中");
	}
	/**
	 * 事部件管理记录
	 */
	@Before("execution(* com.uestc.managesystem.controller.PartController.get(..))")
	public void AfterPartController(){
		aopSet("部件管理中");
	}
	@Before("execution(* com.uestc.managesystem.controller.EventController.get(..))")
	public void AfterEventController(){
		aopSet("事件管理中");
	}
	/**
	 * 时限管理记录
	 */
	@Before("execution(* com.uestc.managesystem.controller.CasesController.setTime(..))")
	public void AfterCasesController(){
		aopSet("案件设时中");
	}
	@Before("execution(* com.uestc.managesystem.controller.RestTimeController.get(..))")
	public void AfterRestTimeController(){
		aopSet("休息设定中");
	}
	/**
	 * 工作流记录
	 */
	@Before("execution(* com.uestc.managesystem.controller.OnlineController.getAll(..))")
	public void AfterOnlineController(){
		aopSet("在线查看中");
	}
	@Before("execution(* com.uestc.managesystem.controller.CasesController.view(..))")
	public void AfterCasesControllerView(){
		aopSet("案件查看中");
	}
	/**
	 * 公告和知识库记录
	 */
	@Before("execution(* com.uestc.managesystem.controller.NoticeController.getNotice(..))")
	public void AfterNoticeController(){
		aopSet("公告库管理中");
	}
	@Before("execution(* com.uestc.managesystem.controller.QuestionController.get(..))")
	public void AfterQuestionController(){
		aopSet("知识栏管理中");
	}
	/**
	 * 系统管理记录
	 */
	@Before("execution(* com.uestc.managesystem.controller.DBController.dbmanage(..))")
	public void AfterDBController(){
		aopSet("数据库管理中");
	}
	@Before("execution(* com.uestc.managesystem.controller.OperationRecordController.operationView(..))")
	public void AfterOperationRecordController(){
		aopSet("记录查看中");
	}
}
