package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.SearchCriteria;

public interface MemberDAO {
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param MemberVO
	 * @return void
	 * @see 사용자 등록
	 */
	void insertMember(MemberVO member) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param MemberVO
	 * @return void 
	 * @see 사용자 수정
	 */
	void updateMember(MemberVO member) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 사용자 ID
	 * @param char 사용 여부 / Y : 사용, R : 보류, N : 미사용
	 * @return void
	 * @see 사용자 삭제 / use_yn = 'R' or 'N'
	 */
	void deleteMember(String mem_id) throws SQLException;
	
	void deleteAskMember(String mem_id) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param void
	 * @return List<MemberVO>
	 * @see 사용자 목록 조회
	 */
	List<MemberVO> selectMemberList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param String 사용자 ID
	 * @return MemberVO
	 * @see 사용자 조회 (사용자 ID)
	 */
	MemberVO selectMemberById(String mem_id) throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return List<MemberVO>
	* @see 사용자조회(페이지)
	*/
	List<MemberVO> selectSearchMemberList(SearchCriteria cri)throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return int
	* @see 멤버수 카운트
	*/
	int selectSearchMemberListCount(SearchCriteria cri)throws SQLException;
	
	/**
	* @date 2017. 11. 12.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return List<MemberVO>
	* @see 탈퇴신청한 멤버목록
	*/
	List<MemberVO> selectMemberDelList(SearchCriteria cri)throws SQLException;
	
	/**
	* @date 2017. 11. 7.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return int
	* @see 탈퇴신청한 멤버목록 카운트
	*/
	int selectMemberDelListCount(SearchCriteria cri)throws SQLException;
	
}