package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.DoctorDAO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.SearchCriteria;

public class DoctorDAOImpl implements DoctorDAO{
	
	private final String NAMESPACE = "Doctor-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertDoctor(DoctorVO doctor) throws SQLException {
		sqlSession.update(NAMESPACE+".insertDoctor",doctor);
	}

	@Override
	public void updateDoctor(DoctorVO doctor) throws SQLException {
		sqlSession.update(NAMESPACE+".updateDoctor",doctor);
	}

	@Override
	public void deleteDoctor(String doc_code) throws SQLException {
		sqlSession.update(NAMESPACE+".deleteDoctor", doc_code);
	}
	
	@Override
	public void deleteAskDoctor(String doc_code) throws SQLException {
		sqlSession.update(NAMESPACE+".deleteAskDoctor", doc_code);
	}
	
	@Override
	public List<DoctorVO> selectDoctorList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectDoctorList");
	}

	@Override
	public DoctorVO selectDoctorByCode(String doc_code) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectDoctorByCode", doc_code);
	}

	@Override
	public List<DoctorVO> selectDoctorListByDeptCode(String depart_code) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectDoctorListByDeptCode", depart_code);
	}
	
	@Override
	public List<DoctorVO> selectSearchDoctorList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE+".selectSearchDoctorList", null, rowBounds);
	}

	@Override
	public int selectSearchDoctorListCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectSearchDoctorListCount", cri);
	}

	@Override
	public List<DoctorVO> selectDoctorDelList(SearchCriteria cri)
			throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE+".selectDoctorDelList", null, rowBounds);
	}

	@Override
	public int selectDoctorDelListCount(SearchCriteria cri)
			throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectDoctorDelListCount", cri);
	}
}
