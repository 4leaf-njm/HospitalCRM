package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.DepartDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.SearchCriteria;

public class DepartDAOImpl implements DepartDAO{

	private final String NAMESPACE = "Depart-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<DepartVO> selectDepartList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectDepartList"); 
	}

	@Override
	public DepartVO selectDepartByCode(String depart_code) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectDepartByCode", depart_code);
	}

	@Override
	public List<DepartVO> selectDepartListCriteria(Criteria cri) throws SQLException {
		return null;
	}

	@Override
	public List<DepartVO> selectDepartListSearch(SearchCriteria cri) throws SQLException {
		return null;
	}

	@Override
	public int selectDepartListSearchCount(SearchCriteria cri) throws SQLException {
		return 0;
	}
	
	
}
