package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.FaqVO;
import com.sysout.crm.domain.SearchCriteria;

public interface FaqDAO {
	
	void insertFaq(FaqVO faq) throws SQLException;
	
	void updateFaq(FaqVO faq) throws SQLException;
	
	void deleteFaq(int faq_num) throws SQLException;
	
	List<FaqVO> selectFaqList() throws SQLException;
	
	FaqVO selectFaqByNum(int faq_num)throws SQLException;
	
	List<FaqVO> selectFaqListCriteria(Criteria cri)throws SQLException;
	
	List<FaqVO> selectFaqListSearch(SearchCriteria cri)throws SQLException;
	
	int selectFaqListSearchCount(SearchCriteria cri)throws SQLException;
}
