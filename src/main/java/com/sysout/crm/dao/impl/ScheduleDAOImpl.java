package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.ScheduleDAO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;

public class ScheduleDAOImpl implements ScheduleDAO{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	private static final String NAMESPACE = "Schedule-Mapper";
	@Override
	public List<ScheduleVO> selectScheduleListByDocCode(String doc_code)
			throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectScheduleListByDocCode", doc_code);
	}

	@Override
	public void insertSchedule(ScheduleVO schedule) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertSchedule", schedule);
	}

	@Override
	public List<ScheduleVO> selectScheduleList(SearchCriteria cri)
			throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList(NAMESPACE+".selectScheduleList", null, rowBounds);
	}

	@Override
	public int selectScheduleListCount(SearchCriteria cri)
			throws SQLException {
		
		return sqlSession.selectOne(NAMESPACE+".selectScheduleListCount", cri);
	}

	@Override
	public List<ScheduleVO> selectScheduleByDate(String doc_code, String s_date) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("doc_code", doc_code);
		params.put("s_date", s_date);
		return sqlSession.selectList(NAMESPACE + ".selectScheduleByDate", params);
	}
	
	@Override
	public ScheduleVO selectScheduleByNum(int schedule_num) throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectScheduleByNum", schedule_num);
	}

	@Override
	public void deleteSchedule(int schedule_num) throws SQLException {
		sqlSession.update(NAMESPACE+".deleteSchedule", schedule_num);
	}

	@Override
	public void permitSchedule(int schedule_num) throws SQLException {
		sqlSession.update(NAMESPACE+".permitSchedule", schedule_num);
	}

	@Override
	public void refusalSchedule(int schedule_num) throws SQLException {
		sqlSession.update(NAMESPACE+".refusalSchedule", schedule_num);
	}

}
