package com.sysout.crm.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.dao.DepartDAO;
import com.sysout.crm.dao.DoctorDAO;
import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.service.IntroService;

public class IntroServiceImpl implements IntroService {
	
	private DepartDAO departDAO;
	private DoctorDAO doctorDAO;
	
	public void setDepartDAO(DepartDAO departDAO) {
		this.departDAO = departDAO;
	}
	
	public void setDoctorDAO(DoctorDAO doctorDAO) {
		this.doctorDAO = doctorDAO;
	}
	
	@Override
	public List<DepartVO> getDepartList() throws SQLException {
		return departDAO.selectDepartList();
	}

	@Override
	public DepartVO getDepartByCode(String depart_code) throws SQLException {
		return null;
	}

	@Override
	public List<DoctorVO> getDoctorList() throws SQLException {
		return doctorDAO.selectDoctorList();
	}

	@Override
	public DoctorVO getDoctorByCode(String doc_code) throws SQLException {
		return doctorDAO.selectDoctorByCode(doc_code);
	}

	@Override
	public List<DoctorVO> getDoctorListByDepartCode(String depart_code) throws SQLException {
		return doctorDAO.selectDoctorListByDeptCode(depart_code);
	}
	
	
}
