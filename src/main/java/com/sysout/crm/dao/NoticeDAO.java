package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.NoticeVO;
import com.sysout.crm.domain.SearchCriteria;

public interface NoticeDAO {
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param NoticeVO
	 * @return void
	 * @see 공지사항 등록
	 */
	void insertNotice(NoticeVO notice) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param NoticeVO
	 * @return void
	 * @see 공지사항 수정
	 */
	void updateNotice(NoticeVO notice) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 공지사항 번호
	 * @return void 
	 * @see 공지사항 삭제
	 */
	void deleteNotice(int notice_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param void 
	 * @return List<NoticeVO>
	 * @see 공지사항 목록 조회
	 */
	List<NoticeVO> selectNoticeList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 공지사항 번호
	 * @return NoticeVO
	 * @see 공지사항 조회 (공지사항 번호)
	 */
	NoticeVO selectNoticeByNum(int notice_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param Criteria 페이징 정보
	 * @return List<NoticeVO>
	 * @see 공지사항 목록 조회 / 페이징 처리
	 */
	List<NoticeVO> selectNoticeListCriteria(Criteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param SearchCriteria 페이징 정보, 검색 정보
	 * @return List<NoticeVO>
	 * @see 공지사항 목록 조회 / 페이징, 검색 처리
	 */
	List<NoticeVO> selectNoticeListSearch(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param SearchCriteria
	 * @return int 검색된 공지사항 개수
	 * @see 검색된 공지사항 개수 조회 
	 */
	int selectNoticeListSearchCount(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 공지사항 번호 
	 * @return void
	 * @see 조회수 증가
	 */
	void updateUpHit(int notice_num) throws SQLException;
}
