package com.sysout.crm.service;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.FaqVO;
import com.sysout.crm.domain.SearchCriteria;

public interface FaqService {
	void registerFaq(FaqVO faq) throws SQLException;
	void modifyFaq(FaqVO faq) throws SQLException;
	void removeFaq(int faq_num) throws SQLException;
	
	List<FaqVO> getFaqList() throws SQLException;
	FaqVO getFaqByNum(int faq_num) throws SQLException;

	List<FaqVO> getFaqListCriteria(Criteria cri) throws SQLException;
	List<FaqVO> getFaqListSearch(SearchCriteria cri) throws SQLException;
	int getFaqListSearchCount(SearchCriteria cri) throws SQLException;
}
