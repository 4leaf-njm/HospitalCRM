package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.QnaDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.NoticeVO;
import com.sysout.crm.domain.QnaAnswerVO;
import com.sysout.crm.domain.QnaVO;
import com.sysout.crm.domain.SearchCriteria;

public class QnaDAOImpl implements QnaDAO {
	
	private SqlSession sqlSession;
	
	public void setSession(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}

	private static final String nameSpace="Qna-Mapper";

	@Override
	public List<QnaVO> selectQnaList() throws SQLException {
		
		return sqlSession.selectList(nameSpace+".selectQnaListSearch");
	}
	@Override
	public QnaVO selectQnaByNum(int qna_num) throws SQLException {
		
		return sqlSession.selectOne(nameSpace+".selectQnaByNum",qna_num);
	}
	
	@Override
	public void insertQna(QnaVO qna) throws SQLException {
		sqlSession.update(nameSpace+".insertQna",qna);
	}

	@Override
	public void updateQna(QnaVO qna) throws SQLException {
		sqlSession.update(nameSpace+".updateQna",qna);
	}

	@Override
	public void deleteQna(int qna_num) throws SQLException {
		sqlSession.delete(nameSpace+".deleteQna",qna_num);
		
	}

	@Override
	public List<QnaVO> selectQnaListCriteria(Criteria cri) throws SQLException {
		
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<QnaVO> qnaList = sqlSession.selectList(nameSpace + ".selectQnaList", null, rowBounds);
		return qnaList;
	}

	@Override
	public List<QnaVO> selectQnaListSearch(SearchCriteria cri)
			throws SQLException {
	
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset, limit);
		
		List<QnaVO> qnaList = sqlSession.selectList(nameSpace + ".selectQnaListSearch", cri, rowBounds);
		return qnaList;
	}

	@Override
	public int selectQnaListSearchCount(SearchCriteria cri) throws SQLException {
	
		int listCount = sqlSession.selectOne(nameSpace+".selectQnaListSearchCount",cri);
		return listCount;
	}

	@Override
	public void updateUpHit(int qna_num) throws SQLException {
		sqlSession.update(nameSpace+".updateUpHit", qna_num);
		
	}
 
	@Override
	public void insertAnswer(QnaAnswerVO answer) throws SQLException {
		sqlSession.update(nameSpace+".insertQnaAnswer", answer);
		
	}

	@Override
	public QnaAnswerVO selectAnswerByNum(int answer_num) throws SQLException {
	
		return sqlSession.selectOne(nameSpace+".selectAnswerByNum", answer_num);
	}

}
