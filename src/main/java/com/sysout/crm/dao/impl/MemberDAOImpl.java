package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.MemberDAO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.SearchCriteria;

public class MemberDAOImpl implements MemberDAO {

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private static final String NAMESPACE = "Member-Mapper"; 
	
	@Override
	public void insertMember(MemberVO member) throws SQLException {
		sqlSession.update(NAMESPACE+".insertMember", member);
	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		sqlSession.update(NAMESPACE+".updateMember", member);
	}

	@Override
	public void deleteMember(String mem_id) throws SQLException {
		sqlSession.update(NAMESPACE+".deleteMember", mem_id);
	}

	@Override
	public void deleteAskMember(String mem_id) throws SQLException {
		sqlSession.update(NAMESPACE+".deleteAskMember", mem_id);
	}	
	
	@Override
	public List<MemberVO> selectMemberList() throws SQLException {
		return sqlSession.selectList(NAMESPACE+".selectMemberList");
	}

	@Override
	public MemberVO selectMemberById(String mem_id) throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectMemberById", mem_id);
	}

	@Override
	public List<MemberVO> selectSearchMemberList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE+".selectSearchMemberList", null, rowBounds);
	}

	@Override
	public int selectSearchMemberListCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectSearchMemberListCount", cri);
	}

	@Override
	public List<MemberVO> selectMemberDelList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE+".selectMemberDelList", null, rowBounds);
	}

	@Override
	public int selectMemberDelListCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectMemberDelListCount",cri);
	}
}
