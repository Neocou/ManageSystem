package com.uestc.managesystem.Interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.uestc.managesystem.entity.model.Power;
import com.uestc.managesystem.entity.model.User;

public class RestTimeInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		User userInfo = (User) request.getSession().getAttribute("userinfo");
		List<Power> powers = userInfo.getRight();
		for(Power power:powers){
			if(power.getPowerId()==9)
				return true;
		}
		response.sendRedirect("/ManageSystem/home?powermesg=0");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
