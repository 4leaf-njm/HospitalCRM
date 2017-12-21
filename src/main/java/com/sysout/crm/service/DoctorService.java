package com.sysout.crm.service;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.DiagAndDoctorVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.ReserveAndDoctorVO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;

public interface DoctorService {
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 의료진코드, 의료진비밀번호
	    * @return 의료진 한명
	    * @see 의료진코드가 있는지 확인하고 비밀번호가 맞는지 확인(로그인)
	    */
	int login(DoctorVO doctor) throws SQLException;
	
	void join(DoctorVO doctor) throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 의료진VO
	    * @return 
	    * @see 의료진 정보 수정
	    */
	void modifyDoctor(DoctorVO doctor) throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 의료진VO
	    * @return 
	    * @see 의료진 탈퇴 승인 요청 (UseYN 변경) use_yn = 'R'
	    */
	void removeAskDoctor(String doc_code) throws SQLException;
	
	DoctorVO getDoctorByCode(String doc_code) throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 의료진코드
	    * @return 휴가일정
	    * @see 의료진코드로 휴가일정 조회
	    */
	List<ScheduleVO> getScheduleList(String doc_code) throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 의료진코드
	    * @return 예약리스트
	    * @see 의료진코드로 예약일정 조회, 예약조회
	    */
	List<ReserveAndDoctorVO> getReserveList(String doc_code) throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 일정VO
	    * @return
	    * @see 의료진코드로 휴가 신청
	    */
	void askSchedule(ScheduleVO schedule) throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 환자코드
	    * @return 사용자정보
	    * @see 환자코드로 사용자 한명 조회
	    */
	MemberVO getMemberByPcode(String mem_pcode) throws SQLException;
	
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 
	    * @return 사용자리스트
	    * @see 전체 사용자 조회
	    */
	List<MemberVO> getMemberList() throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 사용자아이디
	    * @return 사용자한명
	    * @see 사용자아이디로 사용자 한명 조회
	    */
	MemberVO getMemberById(String mem_id) throws SQLException;
	
	/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param void
	    * @return 예약리스트
	    * @see 전체 예약 목록 조회
	    */
	List<ReserveAndDoctorVO> getReserveList() throws SQLException;
	
		/**
	    * @date 2017. 11. 7.
	    * @throws SQLException
	    * @param 의사코드,환자코드
	    * @return 예약하나 조회
	    * @see 해당 의사코드의 예약목록에서 환자코드로 예약상세조회
	    */
	ReserveAndDoctorVO getReserveByPcode(String doc_code, int mem_pcode) throws SQLException;
	
	List<ReserveAndDoctorVO> getReserveListByDocCode(String doc_code) throws SQLException;
	
	DepartVO getDepartByCode(String depart_code) throws SQLException;
	
	List<DepartVO> getDepartList() throws SQLException;
	
	/**
	* @date 2017. 11. 20.
	* @throws SQLException
	* @param SearchCriteria, String doc_code
	* @return List<ReserveAndDoctorVO>
	* @see 해당의료진 예약환자목록
	*/
	List<ReserveAndDoctorVO> getMyReserveList(SearchCriteria cri, String doc_code) throws SQLException;
	
	/**
	* @date 2017. 11. 20.
	* @throws SQLException
	* @param SearchCriteria cri, String doc_code
	* @return int
	* @see 해당의료진 예약환자목록카운트
	*/
	int getMyReserveListCount(String doc_code) throws SQLException;
	
	/**
	* @date 2017. 11. 20.
	* @throws SQLException
	* @param int reserv_num
	* @return ReserveAndDoctorVO
	* @see 예약정보확인
	*/
	ReserveAndDoctorVO getReseveByNum(int reserv_num) throws SQLException;
	
	/**
	* @date 2017. 11. 20.
	* @throws SQLException
	* @param SearchCriteria, String doc_code
	* @return List<ReserveAndDoctorVO>
	* @see 해당의료진 진료환자목록
	*/
	List<ReserveAndDoctorVO> getMyDiagList(SearchCriteria cri, String doc_code) throws SQLException;
	
	/**
	* @date 2017. 11. 20.
	* @throws SQLException
	* @param SearchCriteria cri, String doc_code
	* @return int
	* @see 해당의료진 진료환자목록카운트
	*/
	int getMyDiagListCount(String doc_code) throws SQLException;
	
	/**
	* @date 2017. 11. 21.
	* @throws SQLException
	* @param (int reserv_num
	* @return DiagAndDoctorVO
	* @see 예약번호로 진료기록보여주기
	*/
	DiagAndDoctorVO getDiagByReservNum(int reserv_num)throws SQLException;
	
	/**
	 * @date 2017. 11. 21.
	 * @throws SQLException
	 * @param DiagAndDoctorVO diag
	 * @return void
	 * @see 진료기록추가
	 */
	void addDiag(DiagAndDoctorVO diag)throws SQLException;
	
	/**
	 * @date 2017. 11. 21.
	 * @throws SQLException
	 * @param int reserv_num
	 * @return void
	 * @see 예약상태를 진료완료로 바꿈
	 */
	void modifyReserveStatusOk(int reserv_num)throws SQLException;
}
