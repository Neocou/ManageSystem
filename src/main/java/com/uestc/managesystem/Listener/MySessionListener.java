package com.uestc.managesystem.Listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.mapper.UserMapper;

public class MySessionListener implements HttpSessionListener {

	@Autowired
	private UserMapper userMapper;
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		HttpSession session = se.getSession();
		User userInfo = (User)session.getAttribute("userinfo");
		if(userInfo != null){
			userMapper.setOffline(userInfo);
		}

	}

}
