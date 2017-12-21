package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.DiagAndDoctorVO;

public interface DiagAndDoctorDAO {
	
	void insertDiagAndDoctor(DiagAndDoctorVO diagAndDoctor) throws SQLException;
	
	List<DiagAndDoctorVO> selectDiagAndDoctorList(String mem_pcode) throws SQLException;
	
	List<DiagAndDoctorVO> selectDiagAndDoctorListCriteria(Criteria cri, String mem_pcode) throws SQLException;
	
	DiagAndDoctorVO selectDiagAndDoctorByNum(int diag_num)throws SQLException;
	
	int selectDiagAndDoctorListCount(String mem_pcode) throws SQLException;
	
	DiagAndDoctorVO selectDiagByReservNum(int reserv_num) throws SQLException;
}
