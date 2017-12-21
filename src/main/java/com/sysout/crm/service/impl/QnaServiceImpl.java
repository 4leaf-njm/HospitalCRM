package com.sysout.crm.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.dao.QnaDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.QnaAnswerVO;
import com.sysout.crm.domain.QnaVO;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.QnaService;


public class QnaServiceImpl implements QnaService {

	private QnaDAO qnaDAO;
	
	public void setQnaDAO(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}


	@Override
	public void registerQna(QnaVO qna) throws SQLException {
		
		qnaDAO.insertQna(qna);
	}


	@Override
	public void modifyQna(QnaVO qna) throws SQLException {
		
		qnaDAO.updateQna(qna);
	}


	@Override
	public void removeQna(int qna_num) throws SQLException {
		
		qnaDAO.deleteQna(qna_num);
	}


	@Override
	public List<QnaVO> getQnaList() throws SQLException {
	
		return qnaDAO.selectQnaList();
	}


	@Override
	public QnaVO getQnaByNum(int qna_num) throws SQLException {
	
		return qnaDAO.selectQnaByNum(qna_num);
	}


	@Override
	public List<QnaVO> getQnaListCriteria(Criteria cri) throws SQLException {
	
		return qnaDAO.selectQnaListCriteria(cri);
	}


	@Override
	public List<QnaVO> getQnaListSearch(SearchCriteria cri) throws SQLException {
	
		return qnaDAO.selectQnaListSearch(cri);
	}


	@Override
	public int getQnaListSearchCount(SearchCriteria cri) throws SQLException {
		
		return qnaDAO.selectQnaListSearchCount(cri);
	}
	
	@Override
	public QnaVO getQnaByNumUpHit(int qna_num) throws SQLException {
		qnaDAO.updateUpHit(qna_num);
		QnaVO qna = qnaDAO.selectQnaByNum(qna_num);
		return qna;
	}

	@Override
	public void registerAnswer(QnaAnswerVO answer) throws SQLException {
		qnaDAO.insertAnswer(answer);
		
	}


	@Override
	public QnaAnswerVO getAnswerByNum(int qna_num) throws SQLException {
		
		return qnaDAO.selectAnswerByNum(qna_num);
	}




	

}
