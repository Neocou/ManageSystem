package com.uestc.managesystem.mapper;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.uestc.managesystem.entity.model.User;



public class UserMapperTest {
	private static SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	private UserMapper userMapper;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	@Before
	public void before(){
		session = sqlSessionFactory.openSession();
		userMapper = session.getMapper(UserMapper.class);
	}
	
	@After
	public void after(){
		session.commit();
		session.close();		
	}
	@Test
	public void test() {
		User user = new User();
		user.setUserNumber(1);
		user.setPassWord("1234567");
		System.out.println(userMapper.selectByUser(user));
	}

}
