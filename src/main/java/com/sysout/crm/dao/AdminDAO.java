package com.sysout.crm.dao;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.domain.AdminVO;

public interface AdminDAO {
	
	AdminVO selectAdminByCode(String admin_code) throws SQLException;
	
	void updateAdmin(AdminVO admin) throws SQLException;
	
	void deleteAdmin(String admin_code) throws SQLException;
	
	void insertAdminLog(String admin_code) throws SQLException;
}
