package com.sysout.crm.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.ReserveAndDoctorVO;

public interface ReserveAndDoctorDAO {
	
	void insertReserveAndDoctor(ReserveAndDoctorVO reserveAndDoctor) throws SQLException;
	
	void deleteReserveAndDoctor(int reserv_num) throws SQLException;
	
	List<ReserveAndDoctorVO> selectReserveAndDoctorList(String mem_pcode) throws SQLException;
	
	ReserveAndDoctorVO selectReserveAndDoctorByNum(int reserv_num)throws SQLException;
	
	List<ReserveAndDoctorVO> selectReserveAndDoctorListCriteria(Criteria cri, String mem_pcode) throws SQLException;
	
	List<String> selectReserveTime(String doc_code, String reserv_date) throws SQLException;

	List<ReserveAndDoctorVO> selectReserveAndDoctorByDocCode(String doc_code) throws SQLException;
	
	List<ReserveAndDoctorVO> selectReserveAndDoctorListCriteriaByCode(Criteria cri, String doc_code) throws SQLException;
	
	int selectReserveAndDoctorListCriteriaByCodeCount(String doc_code) throws SQLException;
	
	List<ReserveAndDoctorVO> selectDiagListCriteriaByCode(Criteria cri, String doc_code) throws SQLException;
	
	int selectDiagListCriteriaByCodeCount(String doc_code) throws SQLException;
	
	void updateReservationStatusOk(int reserv_num) throws SQLException;
	
}
