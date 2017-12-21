package com.sysout.crm.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.sysout.crm.dao.DiagAndDoctorDAO;
import com.sysout.crm.dao.MemberDAO;
import com.sysout.crm.dao.ReserveAndDoctorDAO;
import com.sysout.crm.dao.ScheduleDAO;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.DiagAndDoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.ReserveAndDoctorVO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.service.MemberService;

public class MemberServiceImpl implements MemberService{
	
	private ReserveAndDoctorDAO reserveDAO;
	private DiagAndDoctorDAO diagDAO;
	private ScheduleDAO scheduleDAO;
	private MemberDAO memberDAO;
	
	public void setReserveDAO(ReserveAndDoctorDAO reserveDAO) {
		this.reserveDAO = reserveDAO;
	}
	
	public void setDiagDAO(DiagAndDoctorDAO diagDAO) {
		this.diagDAO = diagDAO;
	}
	
	public void setScheduleDAO(ScheduleDAO scheduleDAO) {
		this.scheduleDAO = scheduleDAO;
	}
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public int login(MemberVO member) throws SQLException {
		MemberVO m = memberDAO.selectMemberById(member.getMem_id());

		if (m == null) {
			return 0;
		} else {
			if (member.getMem_pwd().equals(m.getMem_pwd())) {
				return 1;
			} else {
				return -1;
			}
		}
	}

	@Override
	public int checkId(String id) throws SQLException {
		MemberVO member = memberDAO.selectMemberById(id);
		if(member == null) return 1;
		else return 0;
	}
	
	@Override
	public void join(MemberVO member) throws SQLException {
		memberDAO.insertMember(member);
	}

	@Override
	public List<String> findId(MemberVO member) throws SQLException {
		return null;
	}

	@Override
	public String findPw(MemberVO member) throws SQLException {
		return null;
	}

	@Override
	public void modifyMember(MemberVO member) throws SQLException {
	}

	@Override
	public void removeMember(String mem_id) throws SQLException {
		memberDAO.deleteMember(mem_id);
	}

	@Override
	public void removeAskMember(String mem_id) throws SQLException {
		memberDAO.deleteAskMember(mem_id);
	}

	@Override
	public void reserve(ReserveAndDoctorVO reserve) throws SQLException {
		reserveDAO.insertReserveAndDoctor(reserve);
	}

	@Override
	public List<ReserveAndDoctorVO> getReserveList(Criteria cri, String mem_pcode) throws SQLException {
		return reserveDAO.selectReserveAndDoctorListCriteria(cri, mem_pcode);
	}

	@Override
	public void cancelReserve(int reserv_num) throws SQLException {
		reserveDAO.deleteReserveAndDoctor(reserv_num);
	}

	@Override
	public DiagAndDoctorVO getDiagByNum(int diag_num) throws SQLException {
		return diagDAO.selectDiagAndDoctorByNum(diag_num);
	}
	
	@Override
	public List<DiagAndDoctorVO> getDiagList(Criteria cri, String mem_pcode) throws SQLException {
		return diagDAO.selectDiagAndDoctorListCriteria(cri, mem_pcode);
	}

	@Override
	public int getReserveListCount(String mem_pcode) throws SQLException {
		return reserveDAO.selectReserveAndDoctorList(mem_pcode).size();
	}

	@Override
	public int getDiagListCount(String mem_pcode) throws SQLException {
		return diagDAO.selectDiagAndDoctorListCount(mem_pcode);
	}

	@Override
	public List<String> getReserveTime(String doc_code, String reserv_date) throws SQLException {
		return reserveDAO.selectReserveTime(doc_code, reserv_date);
	}

	@Override
	public List<ScheduleVO> getScheduleByDate(String doc_code, String s_date) throws SQLException {
		return scheduleDAO.selectScheduleByDate(doc_code, s_date);
	}

	@Override
	public MemberVO getMemberById(String mem_id) throws SQLException {
		return memberDAO.selectMemberById(mem_id);
	}
}
