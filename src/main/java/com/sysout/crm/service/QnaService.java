package com.sysout.crm.service;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.QnaAnswerVO;
import com.sysout.crm.domain.QnaVO;
import com.sysout.crm.domain.SearchCriteria;

public interface QnaService {

	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param QnaVO
	 * @return void
	 * @see Qna 등록
	 */
	void registerQna(QnaVO qna) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param QnaVO
	 * @return void
	 * @see Qna 수정
	 */
	void modifyQna(QnaVO qna) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int Qna번호
	 * @return void
	 * @see Qna 삭제
	 */
	void removeQna(int qna_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param void
	 * @return List<QnaVO> 
	 * @see Qna 리스트 조회
	 */
	List<QnaVO> getQnaList() throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException 
	 * @param int Qna번호
	 * @return QnaVO
	 * @see Qna 조회
	 */
	QnaVO getQnaByNum(int qna_num) throws SQLException;
		
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException;
	 * @param int Qna번호
	 * @return QnaVO
	 * @see Qna 조회 / 조회수 증가
	 */
	QnaVO getQnaByNumUpHit(int qna_num) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param Criteria 페이징 정보
	 * @return List<QnaVO>
	 * @see 페이징 처리 / 리스트 조회
	 */
	List<QnaVO> getQnaListCriteria(Criteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param SearchCriteria 페이징 정보, 검색 정보
	 * @return List<QnaVO>
	 * @see 페이징 , 검색 처리 / 리스트 조회
	 */
	List<QnaVO> getQnaListSearch(SearchCriteria cri) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param SearchCriteria 페이징 정보, 검색 정보
	 * @return int 검색 결과 Qna 개수
	 * @see 검색 조건에 대해 조회된 Qna의 개수
	 */
	int getQnaListSearchCount(SearchCriteria cri) throws SQLException;

	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param QnaAnswerVO 
	 * @return void
	 * @see Qna답변 등록
	 */
	void registerAnswer(QnaAnswerVO answer) throws SQLException;
	
	/**
	 * @date 2017. 11. 8.
	 * @throws SQLException
	 * @param int Qna번호
	 * @return QnaAnswerVO
	 * @see Qna번호에 대한 답변글 조회
	 */
	QnaAnswerVO getAnswerByNum(int qna_num) throws SQLException;
	
}
