package com.sysout.crm.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.dao.NoticeDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.NoticeVO;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.NoticeService;


public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO){
		this.noticeDAO=noticeDAO;
	}

	@Override
	public void registerNotice(NoticeVO notice) throws SQLException {
	noticeDAO.insertNotice(notice);
	}

	@Override
	public void modifyNotice(NoticeVO notice) throws SQLException {
		noticeDAO.updateNotice(notice);
		
	}

	@Override
	public void removeNotice(int notice_num) throws SQLException {
		noticeDAO.deleteNotice(notice_num);
		
	}

	@Override
	public List<NoticeVO> getNoticeList() throws SQLException {
		
		return noticeDAO.selectNoticeList();
	}

	@Override
	public NoticeVO getNoticeByNum(int notice_num) throws SQLException {
	
		return noticeDAO.selectNoticeByNum(notice_num);
	}

	@Override
	public List<NoticeVO> getNoticeListCriteria(Criteria cri)
			throws SQLException {
		return noticeDAO.selectNoticeListCriteria(cri);
		
	}

	@Override
	public List<NoticeVO> getNoticeListSearch(SearchCriteria cri)
			throws SQLException {
		
		return noticeDAO.selectNoticeListSearch(cri);
	}

	@Override
	public int getNoticeListSearchCount(SearchCriteria cri) throws SQLException {
		
		return noticeDAO.selectNoticeListSearchCount(cri);
	}

	@Override
	public NoticeVO getNoticeByNumUpHit(int notice_num) throws SQLException {
		noticeDAO.updateUpHit(notice_num);
		NoticeVO notice = noticeDAO.selectNoticeByNum(notice_num);
		return notice;
	}

	

	
}
