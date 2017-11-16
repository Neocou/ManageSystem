package com.uestc.managesystem.mapper;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.uestc.managesystem.entity.model.Street;

public class StreetMapperTest {
	private static SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	private StreetMapper streetMapper;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	@Before
	public void before(){
		session = sqlSessionFactory.openSession();
		streetMapper = session.getMapper(StreetMapper.class);
	}
	
	@After
	public void after(){
		session.commit();
		session.close();		
	}
	@Test
	public void test() {
		List<Street> streets = streetMapper.findAll();
		System.out.println(streets);
	}

}
