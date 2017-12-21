package com.sysout.crm.service;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.AdminVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;

public interface AdminService {

	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param AdminVO ID/PW 담김
	 * @return AdminVO 
	 * @see 로그인 처리 / ID, PW가 일치하는지 조회 후 결과 반환
	 */
	int login(AdminVO admin) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param AdminVO
	 * @return void
	 * @see 관리자 정보 수정
	 */
	void modifyAdmin(AdminVO admin) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 관리자 ID
	 * @return void
	 * @see 계정 탈퇴 / 관리자의 계정을 삭제 시킴 (use_yn = 'N')
	 */
	void removeAdmin(String admin_code) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param void
	 * @return List<MemberVO>
	 * @see 사용자 목록 조회
	 */
	List<MemberVO> getMemberList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 사용자 ID
	 * @return void
	 * @see 사용자 탈퇴 승인 / 탈퇴 요청에 대한 승인 (use_yn = 'N')
	 */
	void permitMemberRemove(String mem_id) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param void
	 * @return List<DoctorVO>
	 * @see 의료진 목록 조회
	 */
	List<DoctorVO> getDoctorList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param DoctorVO
	 * @return void
	 * @see 회원가입 처리 / 입력한 의료진 정보를 insert 시킴
	 */
	void joinDoctor(DoctorVO doctor) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 의료진 ID
	 * @return void
	 * @see 의료진 탈퇴 승인 / 탈퇴 요청에 대한 승인 (use_yn = 'N')
	 */
	void permitDoctorRemove(String doc_code) throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return List<MemberVO>
	* @see 사용자목록조회(페이지,찾기)
	*/
	List<MemberVO> getMemberSearchList(SearchCriteria cri) throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return int
	* @see 사용자목록카운트
	*/
	int getMemberSearchListCount(SearchCriteria cri) throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return List<DoctorVO>
	* @see 의료진목록조회(페이지,찾기)
	*/
	List<DoctorVO> getDoctorSearchList(SearchCriteria cri) throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return int
	* @see 의료진목록카운트
	*/
	int getDoctorSearchListCount(SearchCriteria cri) throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return List<MemberVO>
	* @see 탈퇴신청한 회원목록조회
	*/
	List<MemberVO> getMemberDelList(SearchCriteria cri) throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return int
	* @see 탈퇴신청한 회원목록카운트
	*/
	int getMemberDelListCount(SearchCriteria cri) throws SQLException;

	/**
	 * @date 2017. 11. 13.
	 * @throws SQLException
	 * @param SearchCriteria cri
	 * @return List<DoctorVO>
	 * @see 탈퇴신청한 의료진목록조회
	 */
	List<DoctorVO> getDoctorDelList(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 13.
	 * @throws SQLException
	 * @param SearchCriteria cri
	 * @return int
	 * @see 탈퇴신청한 의료진목록카운트
	 */
	int getDoctorDelListCount(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 14.
	 * @throws SQLException
	 * @param SearchCriteria cri
	 * @return List<ScheduleVO>
	 * @see 휴가리스트
	 */
	List<ScheduleVO> getScheduleList(SearchCriteria cri)throws SQLException;
	
	/**
	 * @date 2017. 11. 14.
	 * @throws SQLException
	 * @param SearchCriteria cri
	 * @return int
	 * @see 휴가리스트 카운트
	 */
	int getScheduleListCount(SearchCriteria cri)throws SQLException;
	
	/**
	 * @date 2017. 11. 16.
	 * @throws SQLException
	 * @param int schedule_num
	 * @return void
	 * @see 처리된 휴가 삭제
	 */
	void removeSchedule(int schedule_num)throws SQLException;
	
	/**
	* @date 2017. 11. 18.
	* @throws SQLException
	* @param int
	* @return ScheduleVO
	* @see 휴가내역조회
	*/
	ScheduleVO getScheduleByNum(int schedule_num)throws SQLException;
	
	
	/**
	 * @date 2017. 11. 19.
	 * @throws SQLException
	 * @param int
	 * @return void
	 * @see 휴가승인
	 */
	void permitSchedule(int schedule_num)throws SQLException;
	
	/**
	 * @date 2017. 11. 19.
	 * @throws SQLException
	 * @param int
	 * @return void
	 * @see 휴가승인거부
	 */
	void refusalSchedule(int schedule_num)throws SQLException;
	
	AdminVO getAdminByCode(String admin_code) throws SQLException;
}
