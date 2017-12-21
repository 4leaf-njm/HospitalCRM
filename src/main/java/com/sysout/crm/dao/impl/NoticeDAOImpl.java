package com.sysout.crm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.NoticeDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.NoticeVO;
import com.sysout.crm.domain.SearchCriteria;

public class NoticeDAOImpl implements NoticeDAO {
	
	private SqlSession sqlsession;
	
	public void setSession(SqlSession sqlsession){
		this.sqlsession=sqlsession;
	}
	
	private static final String nameSpace = "Notice-Mapper";
	
	@Override
	public List<NoticeVO> selectNoticeList() throws SQLException {
		return sqlsession.selectList(nameSpace+".selectNoticeListSearch");
	}
	
	@Override
	public NoticeVO selectNoticeByNum(int notice_num)
			throws SQLException {
		return sqlsession.selectOne(nameSpace+".selectNoticeByNum",notice_num);
	}
	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		sqlsession.update(nameSpace+".insertNotice",notice);
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		sqlsession.update(nameSpace+".updateNotice",notice);
	}

	@Override
	public void deleteNotice(int notice_num) throws SQLException {
		sqlsession.delete(nameSpace+".deleteNotice", notice_num);
	}

	@Override
	public List<NoticeVO> selectNoticeListCriteria(Criteria cri)
			throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> noticeList = sqlsession.selectList(nameSpace + ".selectNoticeList", null, rowBounds);
		return noticeList;
	}

	@Override
	public List<NoticeVO> selectNoticeListSearch(SearchCriteria cri)
			throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset, limit);
		
		List<NoticeVO> noticeList = sqlsession.selectList(nameSpace + ".selectNoticeListSearch", cri, rowBounds);
		return noticeList;
	}

	@Override
	public int selectNoticeListSearchCount(SearchCriteria cri)
			throws SQLException {
	int listCount = sqlsession.selectOne(nameSpace+".selectNoticeListSearchCount", cri);
		return listCount;
	}

	@Override
	public void updateUpHit(int notice_num) throws SQLException {
		sqlsession.update(nameSpace+".updateUpHit", notice_num);
	}

}
