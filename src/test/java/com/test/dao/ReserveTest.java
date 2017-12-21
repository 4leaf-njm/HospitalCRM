package com.test.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sysout.crm.dao.ReserveAndDoctorDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/context/dataSource-context.xml", "classpath:/context/root-context.xml"})
public class ReserveTest {
	
	@Autowired
	private ReserveAndDoctorDAO reserveDAO;
	
	@Test
	public void testSelectReserveTime() throws Exception {
		List<String> list = reserveDAO.selectReserveTime("AA971001", "2017-11-03");
		
		for(String str : list) {
			System.out.print(str + " ");
		}
	} 
}
