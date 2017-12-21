package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.ReserveAndDoctorDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.ReserveAndDoctorVO;

public class ReserveAndDoctorDAOImpl implements ReserveAndDoctorDAO{

	private final String NAMESPACE = "Reserve-Mapper";
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertReserveAndDoctor(ReserveAndDoctorVO reserveAndDoctor) throws SQLException {
		sqlSession.update(NAMESPACE + ".insertReserve", reserveAndDoctor);
	}

	@Override
	public void deleteReserveAndDoctor(int reserv_num) throws SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("reserv_num", reserv_num);
		params.put("reserv_status", "취소");
		sqlSession.update(NAMESPACE + ".deleteReserve", params);
	}

	@Override
	public List<ReserveAndDoctorVO> selectReserveAndDoctorList(String mem_pcode) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectReserveList", mem_pcode);
	}

	@Override
	public ReserveAndDoctorVO selectReserveAndDoctorByNum(int reserv_num) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectReserveByNum", reserv_num);
	}

	@Override
	public List<ReserveAndDoctorVO> selectReserveAndDoctorListCriteria(Criteria cri, String mem_pcode) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ReserveAndDoctorVO> reserveList = sqlSession.selectList(NAMESPACE + ".selectReserveList", mem_pcode, rowBounds);
		return reserveList;
	}

	@Override
	public List<String> selectReserveTime(String doc_code, String reserv_date) throws SQLException{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("doc_code", doc_code);
		params.put("reserv_date", reserv_date);
		return sqlSession.selectList(NAMESPACE + ".selectReserveTime", params);
	}

	@Override
	public List<ReserveAndDoctorVO> selectReserveAndDoctorByDocCode(String doc_code) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectReserveByDocCode", doc_code);
	}
	
	@Override
	public List<ReserveAndDoctorVO> selectReserveAndDoctorListCriteriaByCode(Criteria cri, String doc_code)
			throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ReserveAndDoctorVO> reserveList = sqlSession.selectList(NAMESPACE + ".selectMyReserveList",doc_code, rowBounds);
		return reserveList;
	}

	@Override
	public int selectReserveAndDoctorListCriteriaByCodeCount(String doc_code) throws SQLException {
		int reserveCount = sqlSession.selectOne(NAMESPACE + ".selectMyReserveListCount", doc_code);
		return reserveCount;
	}

	@Override
	public List<ReserveAndDoctorVO> selectDiagListCriteriaByCode(Criteria cri, String doc_code) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ReserveAndDoctorVO> diagList = sqlSession.selectList(NAMESPACE + ".selectMyDiagList",doc_code, rowBounds);
		return diagList;
	}

	@Override
	public int selectDiagListCriteriaByCodeCount(String doc_code) throws SQLException {
		int diagCount = sqlSession.selectOne(NAMESPACE + ".selectMyDiagListCount", doc_code);
		return diagCount;
	}

	@Override
	public void updateReservationStatusOk(int reserv_num) throws SQLException {
		sqlSession.update(NAMESPACE+".updateReserveStatusOk", reserv_num);
		
	}
}
