package com.uestc.managesystem.service.serviceImpl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uestc.managesystem.service.serviceInter.RestTimeService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class RestTimeServiceImplTest {
	@Autowired
	private RestTimeService restTimeService;
	@Test
	public void test() {
		System.out.println(restTimeService.judge());
	}

}
