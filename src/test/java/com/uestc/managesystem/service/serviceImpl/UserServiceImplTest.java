package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.uestc.managesystem.entity.dto.UserSelect;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.service.serviceInter.UserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class UserServiceImplTest {
	
	@Autowired
	private UserService userService;

	@Test
	public void testlogin() {
		UserSelect userSelect = new UserSelect();
		userSelect.setDepartmentName("财务部");
		List<User> users = userService.userSelectCommon(userSelect);
		for(User user:users){
			System.out.println(user);
		}
	}

}
