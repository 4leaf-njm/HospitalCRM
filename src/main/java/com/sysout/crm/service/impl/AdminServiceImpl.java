package com.sysout.crm.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.dao.AdminDAO;
import com.sysout.crm.dao.DoctorDAO;
import com.sysout.crm.dao.MemberDAO;
import com.sysout.crm.dao.ScheduleDAO;
import com.sysout.crm.domain.AdminVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.AdminService;

public class AdminServiceImpl implements AdminService{
	
	private MemberDAO memberDAO;
	private DoctorDAO doctorDAO;
	private ScheduleDAO ScheduleDAO;
	private AdminDAO adminDAO;
	
	public void setMemberDAO(MemberDAO memberDAO){
		this.memberDAO=memberDAO;
	}
	public void setDoctorDAO(DoctorDAO doctorDAO) {
		this.doctorDAO = doctorDAO;
	}
	public void setScheduleDAO(ScheduleDAO scheduleDAO) {
		this.ScheduleDAO = scheduleDAO;
	}
	public void setAdminDAO(AdminDAO adminDAO){
		this.adminDAO=adminDAO;
	}
	
	@Override
	public int login(AdminVO admin) throws SQLException {
		AdminVO a = adminDAO.selectAdminByCode(admin.getAdmin_code());
 
		if (a == null) {
			return 0;
		} else {
			if (admin.getAdmin_pwd().equals(a.getAdmin_pwd())) {
				return 1;
			} else {
				return -1;
			}
		}
	}

	@Override
	public void modifyAdmin(AdminVO admin) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeAdmin(String admin_code) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void permitMemberRemove(String mem_id) throws SQLException {
		memberDAO.deleteMember(mem_id);
	}

	@Override
	public List<DoctorVO> getDoctorList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void joinDoctor(DoctorVO doctor) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void permitDoctorRemove(String doc_code) throws SQLException {
		doctorDAO.deleteDoctor(doc_code);
	}
	
	@Override
	public List<MemberVO> getMemberSearchList(SearchCriteria cri) throws SQLException {
		List<MemberVO> memberList = memberDAO.selectSearchMemberList(cri);
		return memberList;
	}

	@Override
	public int getMemberSearchListCount(SearchCriteria cri) throws SQLException {
		int countListCount = memberDAO.selectSearchMemberListCount(cri);
		return countListCount;
	}
	@Override
	public List<DoctorVO> getDoctorSearchList(SearchCriteria cri) throws SQLException {
		List<DoctorVO> doctorList = doctorDAO.selectSearchDoctorList(cri);
		return doctorList;
	}
	@Override
	public int getDoctorSearchListCount(SearchCriteria cri) throws SQLException {
		int doctorListCount = doctorDAO.selectSearchDoctorListCount(cri);
		return doctorListCount;
	}
	@Override
	public List<MemberVO> getMemberDelList(SearchCriteria cri) throws SQLException {
		List<MemberVO> memberList = memberDAO.selectMemberDelList(cri);
		return memberList;
	}
	@Override
	public int getMemberDelListCount(SearchCriteria cri) throws SQLException {
		int MemberListCount = memberDAO.selectMemberDelListCount(cri);
		return MemberListCount;
	}
	@Override
	public List<DoctorVO> getDoctorDelList(SearchCriteria cri)
			throws SQLException {
		List<DoctorVO> doctorList = doctorDAO.selectDoctorDelList(cri);
		return doctorList;
	}
	@Override
	public int getDoctorDelListCount(SearchCriteria cri) throws SQLException {
		int doctorListCount = doctorDAO.selectDoctorDelListCount(cri);
		return doctorListCount;
	}
	@Override
	public List<ScheduleVO> getScheduleList(SearchCriteria cri)
			throws SQLException {
		List<ScheduleVO> scheduleList = ScheduleDAO.selectScheduleList(cri);
		return scheduleList;
	}
	@Override
	public int getScheduleListCount(SearchCriteria cri) throws SQLException {
		int scheduleListCount = ScheduleDAO.selectScheduleListCount(cri);
		return scheduleListCount;
	}
	@Override
	public void removeSchedule(int schedule_num) throws SQLException {
		ScheduleDAO.deleteSchedule(schedule_num);
	}
	@Override
	public ScheduleVO getScheduleByNum(int schedule_num) throws SQLException {
		ScheduleVO schedule = ScheduleDAO.selectScheduleByNum(schedule_num);
		return schedule;
	}
	@Override
	public void permitSchedule(int schedule_num) throws SQLException {
		ScheduleDAO.permitSchedule(schedule_num);
		
	}
	@Override
	public void refusalSchedule(int schedule_num) throws SQLException {
		ScheduleDAO.refusalSchedule(schedule_num);
	}
	@Override
	public AdminVO getAdminByCode(String admin_code) throws SQLException {
		return adminDAO.selectAdminByCode(admin_code);
	}
}
