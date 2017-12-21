package com.sysout.crm.service;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.DoctorVO;


public interface IntroService {
	
	/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 
	    * @return 진료과 리스트
	    * @see 진료과리스트 뿌리기
	    */
	List<DepartVO> getDepartList() throws SQLException;
	
	/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 진료과코드
	    * @return 진료과 하나
	    * @see 진료과코드로 진료과 찾기
	    */
	DepartVO getDepartByCode(String depart_code) throws SQLException;
	
	/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 
	    * @return 의료진 리스트
	    * @see 의료진리스트뿌리기
	    */
	List<DoctorVO> getDoctorList() throws SQLException;
	
	/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 의료진코드
	    * @return 의료진 한명
	    * @see 의료진코드로 의료진 찾기
	    */
	DoctorVO getDoctorByCode(String doc_code) throws SQLException;
	
	 /**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param depart_code
	    * @return 의료진리스트
	    * @see 진료과코드로 의료진리스트 조회
	    */
	List<DoctorVO> getDoctorListByDepartCode(String depart_code) throws SQLException;
	
}
