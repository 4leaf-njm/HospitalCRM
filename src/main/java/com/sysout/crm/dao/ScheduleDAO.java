package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;

public interface ScheduleDAO {
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param String 의료진 코드
	 * @return List<ScheduleVO> 
	 * @see 일정 조회 / 의료진 코드에 해당하는 여러 일정들 조회 
	 */
	List<ScheduleVO> selectScheduleListByDocCode(String doc_code) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param ScheduleVO
	 * @return void
	 * @see 일정 등록
	 */
	void insertSchedule(ScheduleVO schedule) throws SQLException;
	
	/**
	* @date 2017. 11. 13.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return List<ScheduleAndDoctorDAO>
	* @see 의료진 휴가신청 목록
	*/
	List<ScheduleVO> selectScheduleList(SearchCriteria cri)throws SQLException;
	
	/**
	* @date 2017. 11. 13.
	* @throws SQLException
	* @param SearchCriteria cri
	* @return int
	* @see 의료진 휴가신청 카운트
	*/
	int selectScheduleListCount(SearchCriteria cri)throws SQLException;

	List<ScheduleVO> selectScheduleByDate(String doc_code, String s_date) throws SQLException;
	
	/**
	 * @date 2017. 11. 15.
	 * @throws SQLException
	 * @param String schedule_num
	 * @return ScheduleVO
	 * @see 휴가내역보기
	 */
	ScheduleVO selectScheduleByNum(int schedule_num)throws SQLException;
	
	/**
	 * @date 2017. 11. 16.
	 * @throws SQLException
	 * @param int schedule_num
	 * @return void
	 * @see 처리된 휴가삭제
	 */
	void deleteSchedule(int schedule_num)throws SQLException;
	
	/**
	 * @date 2017. 11. 19.
	 * @throws SQLException
	 * @param int schedule_num
	 * @return void
	 * @see 휴가승인
	 */
	void permitSchedule(int schedule_num)throws SQLException;
	
	/**
	 * @date 2017. 11. 19.
	 * @throws SQLException
	 * @param int schedule_num
	 * @return void
	 * @see 휴가승인거부
	 */
	void refusalSchedule(int schedule_num)throws SQLException;
}
