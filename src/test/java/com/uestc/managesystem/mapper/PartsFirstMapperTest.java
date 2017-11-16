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

public class PartsFirstMapperTest {
	private static SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	private PartsFirstMapper partsFirstMapper;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	@Before
	public void before(){
		session = sqlSessionFactory.openSession();
		partsFirstMapper = session.getMapper(PartsFirstMapper.class);
	}
	
	@After
	public void after(){
		session.commit();
		session.close();		
	}
	@Test
	public void test() {
		System.out.println(partsFirstMapper.findAll());
	}

}
