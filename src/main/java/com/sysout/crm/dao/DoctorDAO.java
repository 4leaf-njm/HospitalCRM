package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.SearchCriteria;

public interface DoctorDAO {
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param DoctorVO
	 * @return void
	 * @see 의료진 등록
	 */
	void insertDoctor(DoctorVO doctor) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param DoctorVO
	 * @return void
	 * @see 의료진 수정
	 */
	void updateDoctor(DoctorVO doctor) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 의료진 코드
	 * @param char 사용 여부 / Y : 사용, R : 보류, N : 미사용 
	 * @return void
	 * @see 의료진 삭제 / use_yn = 'R' or 'N'
	 */
	void deleteDoctor(String doc_code) throws SQLException;
	
	void deleteAskDoctor(String doc_code) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param void
	 * @return List<DoctorVO> 
	 * @see 의료진 목록 조회
	 */
	List<DoctorVO> selectDoctorList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 의료진 코드
	 * @return DoctorVO
	 * @see 의료진 조회 (의료진 코드)
	 */
	DoctorVO selectDoctorByCode(String doc_code) throws SQLException;
	
	List<DoctorVO> selectDoctorListByDeptCode(String depart_code) throws SQLException;
	
List<DoctorVO> selectSearchDoctorList(SearchCriteria cri)throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return int
	* @see 의료진수 카운트
	*/
	int selectSearchDoctorListCount(SearchCriteria cri)throws SQLException;

	/**
	 * @date 2017. 11. 13.
	 * @throws SQLException
	 * @param SearchCriteria cri
	 * @return List<DoctorVO>
	 * @see 탈퇴신청한 의료진목록
	 */
	List<DoctorVO> selectDoctorDelList(SearchCriteria cri)throws SQLException;
	
	/**
	 * @date 2017. 11. 13.
	 * @throws SQLException
	 * @param SearchCriteria cri
	 * @return int
	 * @see 탈퇴신청한 의료진목록카운트
	 */
	int selectDoctorDelListCount(SearchCriteria cri)throws SQLException;
}
