package com.uestc.managesystem.aspect;

import static org.junit.Assert.*;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.uestc.managesystem.service.serviceInter.UserService;
@Aspect
public class AspectDemoTest {
	@Autowired
	private UserService userService;
	@Autowired
	private  HttpServletRequest request;
	@Test
	public void Hello(){
		System.out.println("2222");
	}
	@After("execution(* com.uestc.managesystem.aspect.AspectDemo.Hello(. .))")
	public void test() {
		System.out.println("11111");
	}

}
