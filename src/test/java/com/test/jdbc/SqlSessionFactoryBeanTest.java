package com.test.jdbc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration
@ContextConfiguration("classpath:/context/dataSource-context.xml")
public class SqlSessionFactoryBeanTest {
	
	@Autowired
	private SqlSessionFactoryBean sqlSessionFactory;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Test
	public void testSqlSessionFactory () {
		System.out.println(sqlSessionFactory);
	}
	
	@Test
	public void testSqlSession() {
		System.out.println(sqlSession);
	}
}
