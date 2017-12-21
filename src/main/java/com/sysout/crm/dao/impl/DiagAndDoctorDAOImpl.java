package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.DiagAndDoctorDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.DiagAndDoctorVO;
import com.sysout.crm.domain.ReserveAndDoctorVO;

public class DiagAndDoctorDAOImpl implements DiagAndDoctorDAO{
	
	private final String NAMESPACE = "Diag-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertDiagAndDoctor(DiagAndDoctorVO diagAndDoctor) throws SQLException {
		sqlSession.insert(NAMESPACE+".insertDiag", diagAndDoctor);
	}

	@Override
	public List<DiagAndDoctorVO> selectDiagAndDoctorList(String mem_pcode) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectDiagList", mem_pcode);
	}

	@Override
	public DiagAndDoctorVO selectDiagAndDoctorByNum(int diag_num) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectDiagByNum", diag_num);
	}

	@Override
	public List<DiagAndDoctorVO> selectDiagAndDoctorListCriteria(Criteria cri, String mem_pcode) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<DiagAndDoctorVO> diagList = sqlSession.selectList(NAMESPACE + ".selectDiagList", mem_pcode, rowBounds);
		return diagList;
	}

	@Override
	public int selectDiagAndDoctorListCount(String mem_pcode) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectDiagListCount", mem_pcode);
	}
	
	@Override
	public DiagAndDoctorVO selectDiagByReservNum(int reserv_num) throws SQLException {
		System.out.println(reserv_num);
		return sqlSession.selectOne(NAMESPACE+".selectDiagByReservNum", reserv_num);
	}
}
