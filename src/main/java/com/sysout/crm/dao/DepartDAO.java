package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.SearchCriteria;

public interface DepartDAO {
	
	List<DepartVO> selectDepartList() throws SQLException;
	
	DepartVO selectDepartByCode(String depart_code)throws SQLException;
	
	List<DepartVO> selectDepartListCriteria(Criteria cri)throws SQLException;
	
	List<DepartVO> selectDepartListSearch(SearchCriteria cri)throws SQLException;
	
	int selectDepartListSearchCount(SearchCriteria cri)throws SQLException;
	
}
