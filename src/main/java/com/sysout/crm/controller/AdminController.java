package com.sysout.crm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.PageMaker;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public void MemberList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		List<MemberVO> memberList = adminService.getMemberSearchList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getMemberSearchListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", memberList);
	}
	
	@RequestMapping(value="/doctorList",method=RequestMethod.GET)
	public void DoctorList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		List<DoctorVO> doctorList = adminService.getDoctorSearchList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getDoctorSearchListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", doctorList);
	}
	
	@RequestMapping(value="/memberDelPermit",method=RequestMethod.GET)
	public void MemberPermitList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		List<MemberVO> memberList = adminService.getMemberDelList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getMemberDelListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", memberList);
	}
	
	@RequestMapping(value="/doctorDelPermit",method=RequestMethod.GET)
	public void DoctorPermitList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		List<DoctorVO> doctorList = adminService.getDoctorDelList(cri);
		PageMaker pageMaker = new PageMaker(); 
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getDoctorDelListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", doctorList);
	}
	
	@RequestMapping(value="/memberDel",method=RequestMethod.POST)
	public String MemberDelPermit(@RequestParam("mem_id")String mem_id)throws Exception{
		String url="redirect:/admin/memberDelPermit";
		adminService.permitMemberRemove(mem_id);
		return url;
	}
	
	@RequestMapping(value="/doctorDel", method=RequestMethod.POST)
	public String DoctorDelPermit(@RequestParam("doc_code")String doc_code)throws Exception{
		String url="redirect:/admin/doctorDelPermit";
		adminService.permitDoctorRemove(doc_code);
		return url;
	}
	
	@RequestMapping(value="vacationPermit", method=RequestMethod.GET)
	public void VacationList(@ModelAttribute("cri")SearchCriteria cri, Model model)throws Exception{
		List<ScheduleVO> scheduleList = adminService.getScheduleList(cri);
		PageMaker pageMaker = new PageMaker(); 
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getScheduleListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", scheduleList);
	}
	
	@RequestMapping("/memberListExcel")
	public String memberListExcel(@ModelAttribute("cri")SearchCriteria cri, Model model)throws Exception{
		List<MemberVO> memberList = adminService.getMemberSearchList(cri);
		String url = "memberListExcel";
		model.addAttribute("memberList", memberList);
		return url;
	}
	
	@RequestMapping("/doctorListExcel")
	public String doctorListExcel(@ModelAttribute("cri")SearchCriteria cri, Model model)throws Exception{
		List<DoctorVO> doctorList = adminService.getDoctorSearchList(cri);
		String url = "doctorListExcel";
		model.addAttribute("doctorList", doctorList);
		return url;
	}
	
	@RequestMapping(value="/scheduleDel", method=RequestMethod.POST)
	public String ScheduleDel(@RequestParam("list")ArrayList<Integer> numList)throws Exception{
		String url = "redirect:/admin/vacationPermit";
		for (int schedule_num : numList) {
			adminService.removeSchedule(schedule_num);			
		}
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/vacationDetail", method=RequestMethod.GET)
	public ScheduleVO vacationDetail(@RequestParam("schedule_num")int schedule_num)throws Exception{
		ScheduleVO schedule=adminService.getScheduleByNum(schedule_num);
		return schedule;
	}
	
	@RequestMapping(value="/vacationPermitOk", method=RequestMethod.POST)
	public String vacationPermitOk(@RequestParam("schedule_num")int schedule_num)throws Exception{
		String url = "redirect:/admin/vacationPermit";
		adminService.permitSchedule(schedule_num);
		return url;
	}
	
	@RequestMapping(value="/vacationPermitRefusal", method=RequestMethod.POST)
	public String vacationPermitRefusal(@RequestParam("schedule_num")int schedule_num)throws Exception{
		String url = "redirect:/admin/vacationPermit";
		adminService.refusalSchedule(schedule_num);
		return url;
	}
}
