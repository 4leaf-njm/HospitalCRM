package com.sysout.crm.dao.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.sysout.crm.dao.AdminDAO;
import com.sysout.crm.domain.AdminVO;

/*수정필요*/
public class AdminDAOImpl implements AdminDAO{
	
	private SqlSession sqlsession;
	
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	private static final String NAMESPACE="Admin-Mapper";
	
	/*@Override
	public void insertAdminLog(AdminVO admin) throws SQLException {
		sqlsession.update(NAMESPACE+".insertAdminLog",admin);
		
	}*/

	@Override
	public void updateAdmin(AdminVO admin) throws SQLException {
		sqlsession.update(NAMESPACE+".updateAdmin",admin);
		
	}

	@Override
	public void deleteAdmin(String admin_code) throws SQLException {
		sqlsession.update(NAMESPACE+".deleteMember",admin_code);
		
	}

	@Override
	public AdminVO selectAdminByCode(String admin_code) throws SQLException {
		AdminVO admin = sqlsession.selectOne(NAMESPACE+".selectAdminByCode",admin_code);
		return admin;
	}

	@Override
	public void insertAdminLog(String admin_code) throws SQLException {
	}

}
