package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.QnaAnswerVO;
import com.sysout.crm.domain.QnaVO;
import com.sysout.crm.domain.SearchCriteria;

public interface QnaDAO {

	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param QnaVO
	 * @return void
	 * @see Qna 등록
	 */
	void insertQna(QnaVO qna) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param QnaVO
	 * @return void
	 * @see Qna 수정
	 */
	void updateQna(QnaVO qna) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int Qna 번호  
	 * @return void
	 * @see Qna 삭제
	 */
	void deleteQna(int qna_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param void
	 * @return List<QnaVO>
	 * @see Qna 목록 조회
	 */
	List<QnaVO> selectQnaList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int 공지사항 번호 
	 * @return QnaVO
	 * @see Qna 조회 (Qna 번호)
	 */
	QnaVO selectQnaByNum(int qna_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param Criteria 페이징 정보
	 * @return List<QnaVO>
	 * @see Qna 목록 조회 / 페이징 처리
	 */
	List<QnaVO> selectQnaListCriteria(Criteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param SearchCriteria 페이징, 검색 정보
	 * @return List<QnaVO> 
	 * @see Qna 목록 조회 / 페이징, 검색 처리
	 */
	List<QnaVO> selectQnaListSearch(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param SearchCriteria 페이징, 검색 정보
	 * @return int 
	 * @see 검색된 Qna 개수 조회
	 */
	int selectQnaListSearchCount(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param int Qna 번호
	 * @return void
	 * @see 조회수 증가
	 */
	void updateUpHit(int qna_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param QnaAnswerVO 
	 * @return void
	 * @see Qna답변 등록
	 */
	void insertAnswer(QnaAnswerVO answer) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int Qna번호
	 * @return QnaAnswerVO
	 * @see Qna번호에 대한 답변글 조회
	 */
	QnaAnswerVO selectAnswerByNum(int qna_num) throws SQLException;
	
}
