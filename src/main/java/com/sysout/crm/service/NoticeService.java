package com.sysout.crm.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.jdbc.SQL;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.NoticeVO;
import com.sysout.crm.domain.SearchCriteria;

public interface NoticeService {
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param NoticeVO
	 * @return void
	 * @see 공지사항 등록
	 */
	void registerNotice(NoticeVO notice) throws SQLException;

	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param NoticeVO
	 * @return void 
	 * @see 공지사항 수정
	 */
	void modifyNotice(NoticeVO notice) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 공지사항 번호
	 * @return void
	 * @see 공지사항 삭제
	 */
	void removeNotice(int notice_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQL Exception
	 * @param void
	 * @return List<NoticeVO>  
	 * @see 공지사항 목록 조회
	 */
	List<NoticeVO> getNoticeList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 공지사항 번호
	 * @return NoticeVO
	 * @see 공지사항 조회 (공지사항 번호)
	 */
	NoticeVO getNoticeByNum(int notice_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param Criteria 페이징 정보
	 * @return List<NoticeVO> 
	 * @see 공지사항 목록 조회 - 페이징 처리
	 */ 
	List<NoticeVO> getNoticeListCriteria(Criteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param SearchCriteria 페이징 / 검색 정보
	 * @return List<NoticeVO>
	 * @see 공지사항 목록 조회 (검색) - 페이징, 검색 처리
	 */
	List<NoticeVO> getNoticeListSearch(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param SearchCriteria
	 * @return int
	 * @see 공지사항 개수 (검색)
	 */
	int getNoticeListSearchCount(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 공지사항 번호 
	 * @return NoticeVO
	 * @see 공지사항 조회 (조회수 증가)
	 */
	NoticeVO getNoticeByNumUpHit(int notice_num) throws SQLException;
}
