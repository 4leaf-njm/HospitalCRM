package com.sysout.crm.service;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.DiagAndDoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.ReserveAndDoctorVO;
import com.sysout.crm.domain.ScheduleVO;

public interface MemberService {
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param MemberVO ID/PW 담김
	 * @return int 
	 * @see 로그인 처리 / ID, PW가 일치하는지 조회 후 결과 반환
	 */
	int login(MemberVO member) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param MemberVO
	 * @return void
	 * @see 회원가입 처리 / 입력한 회원 정보를 insert 시킴
	 */
	void join(MemberVO member) throws SQLException;
	
	int checkId(String id) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param MemberVO
	 * @return List<String> 찾은 ID 리스트
	 * @see 아이디 찾기 / 입력한 정보에 대한 ID들을 찾아 List로 반환
	 */
	List<String> findId(MemberVO member) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param MemberVO
	 * @return List<String> 찾은 PW 리스트
	 * @see 비밀번호 찾기 / 입력한 정보에 대한 PW들을 찾아 List로 반환
	 */
	String findPw(MemberVO member) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param MemberVO
	 * @return void
	 * @see 회원 정보 수정
	 */
	void modifyMember(MemberVO member) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 사용자 ID
	 * @return void
	 * @see 계정 탈퇴 / 관리자에게 계정 탈퇴를 요청함 (use_yn = 'R')
	 */
	void removeMember(String mem_id) throws SQLException;
	
	void removeAskMember(String mem_id) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param ReserveAndDoctorVO
	 * @param String 사용자 ID
	 * @return void
	 * @see 진료예약 
	 */
	void reserve(ReserveAndDoctorVO reserve) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 사용자 ID
	 * @return List<ReserveAndDoctorVO>
	 * @see 예약내역 조회
	 */
	List<ReserveAndDoctorVO> getReserveList(Criteria cri, String mem_pcode) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 예약 번호
	 * @return void
	 * @see 예약 취소
	 */
	void cancelReserve(int reserv_num) throws SQLException;
	
	DiagAndDoctorVO getDiagByNum(int diag_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 사용자 ID
	 * @return List<DiagAndDoctorVO>
	 * @see 진료내역 조회
	 */
	List<DiagAndDoctorVO> getDiagList(Criteria cri, String mem_pcode) throws SQLException;
	
	int getDiagListCount(String mem_pcode) throws SQLException;
	
	int getReserveListCount(String mem_pcode) throws SQLException; 
	
	List<String> getReserveTime(String doc_code, String reserv_date) throws SQLException;
	
	List<ScheduleVO> getScheduleByDate(String doc_code, String s_date) throws SQLException;
	
	MemberVO getMemberById(String mem_id) throws SQLException;
}
