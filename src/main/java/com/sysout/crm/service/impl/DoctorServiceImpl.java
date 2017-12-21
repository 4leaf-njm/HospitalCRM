package com.sysout.crm.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.dao.DepartDAO;
import com.sysout.crm.dao.DiagAndDoctorDAO;
import com.sysout.crm.dao.DoctorDAO;
import com.sysout.crm.dao.ReserveAndDoctorDAO;
import com.sysout.crm.dao.ScheduleDAO;
import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.DiagAndDoctorVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.ReserveAndDoctorVO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.DoctorService;

public class DoctorServiceImpl implements DoctorService{

	private ScheduleDAO scheduleDAO;
	private ReserveAndDoctorDAO reserveDAO;
	private DiagAndDoctorDAO diagDAO;
	private DoctorDAO doctorDAO;
	private DepartDAO departDAO;
	
	public void setScheduleDAO(ScheduleDAO scheduleDAO) {
		this.scheduleDAO = scheduleDAO;
	}
	
	public void setReserveDAO(ReserveAndDoctorDAO reserveDAO) {
		this.reserveDAO = reserveDAO;
	}
	
	public void setDoctorDAO(DoctorDAO doctorDAO){
		this.doctorDAO=doctorDAO;
	}
	
	public void setDepartDAO(DepartDAO departDAO) {
		this.departDAO = departDAO;
	}
	
	public void setDiagDAO(DiagAndDoctorDAO diagDAO) {
		this.diagDAO = diagDAO;
	}
	
	@Override
	public int login(DoctorVO doctor) throws SQLException {
		DoctorVO d = doctorDAO.selectDoctorByCode(doctor.getDoc_code());
		
		if (d == null) {
			return 0;
		} else {
			if (doctor.getDoc_pwd().equals(d.getDoc_pwd())) {
				return 1;
			} else {
				return -1;
			}
		}
	}

	@Override
	public void join(DoctorVO doctor) throws SQLException {
		doctorDAO.insertDoctor(doctor);
	}
	
	@Override
	public void modifyDoctor(DoctorVO doctor) throws SQLException {
	}

	@Override
	public void removeAskDoctor(String doc_code) throws SQLException {
		doctorDAO.deleteDoctor(doc_code);
	}

	@Override
	public DoctorVO getDoctorByCode(String doc_code) throws SQLException {
		return doctorDAO.selectDoctorByCode(doc_code);
	}
	
	@Override
	public List<ScheduleVO> getScheduleList(String doc_code) throws SQLException {
		return scheduleDAO.selectScheduleListByDocCode(doc_code);
	}

	@Override
	public List<ReserveAndDoctorVO> getReserveList(String doc_code) throws SQLException {
		return null;
	}

	@Override
	public void askSchedule(ScheduleVO schedule) throws SQLException {
		scheduleDAO.insertSchedule(schedule);
	}

	@Override
	public MemberVO getMemberByPcode(String mem_pcode) throws SQLException {
		return null;
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		return null;
	}

	@Override
	public MemberVO getMemberById(String mem_id) throws SQLException {
		return null;
	}

	@Override
	public List<ReserveAndDoctorVO> getReserveList() throws SQLException {
		return null;
	}

	@Override
	public ReserveAndDoctorVO getReserveByPcode(String doc_code, int mem_pcode) throws SQLException {
		return null;
	}

	@Override
	public List<ReserveAndDoctorVO> getReserveListByDocCode(String doc_code) throws SQLException {
		return reserveDAO.selectReserveAndDoctorByDocCode(doc_code);
	}
	
	@Override
	public DepartVO getDepartByCode(String depart_code) throws SQLException {
		return departDAO.selectDepartByCode(depart_code);
	}

	@Override
	public List<DepartVO> getDepartList() throws SQLException {
		List<DepartVO> departList = departDAO.selectDepartList();
		return departList;
	}
	
	@Override
	public List<ReserveAndDoctorVO> getMyReserveList(SearchCriteria cri, String doc_code) throws SQLException {
		List<ReserveAndDoctorVO> reserveList = reserveDAO.selectReserveAndDoctorListCriteriaByCode(cri, doc_code);
		return reserveList;
	}

	@Override
	public ReserveAndDoctorVO getReseveByNum(int reserv_num) throws SQLException {
		ReserveAndDoctorVO reserve = reserveDAO.selectReserveAndDoctorByNum(reserv_num);
		return reserve;
	}


	@Override
	public int getMyReserveListCount(String doc_code) throws SQLException {
		int reserveListCount = reserveDAO.selectReserveAndDoctorListCriteriaByCodeCount(doc_code);
		return reserveListCount;
	}


	@Override
	public List<ReserveAndDoctorVO> getMyDiagList(SearchCriteria cri, String doc_code) throws SQLException {
		List<ReserveAndDoctorVO> diagList = reserveDAO.selectDiagListCriteriaByCode(cri, doc_code);
		return diagList;
	}


	@Override
	public int getMyDiagListCount(String doc_code) throws SQLException {
		int diagListCount = reserveDAO.selectDiagListCriteriaByCodeCount(doc_code);
		return diagListCount;
	}


	@Override
	public DiagAndDoctorVO getDiagByReservNum(int reserv_num) throws SQLException {
		DiagAndDoctorVO diag = diagDAO.selectDiagByReservNum(reserv_num);
		return diag;
	}
	@Override
	public void addDiag(DiagAndDoctorVO diag) throws SQLException {
		diagDAO.insertDiagAndDoctor(diag);
		
	}
	@Override
	public void modifyReserveStatusOk(int reserv_num) throws SQLException {
		reserveDAO.updateReservationStatusOk(reserv_num);
		
	}
	
}
