package com.sysout.crm.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.DiagAndDoctorVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.PageMaker;
import com.sysout.crm.domain.ReserveAndDoctorVO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.service.IntroService;
import com.sysout.crm.service.MemberService;

@Controller
@RequestMapping("/reservation")
public class ReserveController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private IntroService introService;
	
	@RequestMapping(value="/reserveInfo", method=RequestMethod.GET)
	public String reserve() throws Exception{
		String url = "reservation/reserveInfo";
		
		return url;
	}
	
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public String reserve(@ModelAttribute("mem_id") String mem_id, Model model) throws Exception{
		String url = "reservation/reserve";
		MemberVO member = memberService.getMemberById(mem_id);
		System.out.println(member);
		model.addAttribute("member", member);
		return url;
	}
	
	@RequestMapping(value="/reserve", method=RequestMethod.POST)
	public void reserve(ReserveAndDoctorVO reserve) throws Exception {
		memberService.reserve(reserve);
	}
	
	@ResponseBody
	@RequestMapping(value="/reserveDate", method=RequestMethod.POST, produces="application/json")
	public List<ScheduleVO> reserveDate(String doc_code, String s_date) throws Exception {
		return memberService.getScheduleByDate(doc_code, s_date);
	}
	
	@ResponseBody
	@RequestMapping(value="/reserveTime", method=RequestMethod.GET, produces="application/json")
	public List<String> reserveTime(String doc_code, String reserv_date) throws Exception{
		return memberService.getReserveTime(doc_code, reserv_date);
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxDepartList", method=RequestMethod.GET, produces="application/text; charset=utf8")
	public String getDepartList() throws Exception {
		List<DepartVO> departList = introService.getDepartList();
		StringBuilder sb = new StringBuilder();
		
		for(DepartVO depart : departList) {
			sb.append("<li><a href=\"javascript:deptSel1(\'" + depart.getDepart_code() +
					  "\', \'" + depart.getDepart_name() + "\');\"><strong>" + depart.getDepart_name() +
					  "</strong></a></li>");
		}
		return sb.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxDepartList2", method=RequestMethod.GET, produces="application/text; charset=utf8")
	public String getDepartList2() throws Exception {
		List<DepartVO> departList = introService.getDepartList();
		StringBuilder sb = new StringBuilder();
		
		for(DepartVO depart : departList) {
			sb.append("<li><a href=\"javascript:deptSel2(\'" + depart.getDepart_code() +
					  "\', \'" + depart.getDepart_name() + "\');\"><strong>" + depart.getDepart_name() +
					  "</strong></a></li>");
		}
		return sb.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxDoctorList", method=RequestMethod.POST, produces="application/text; charset=utf8")
	public String getDoctorList(String depart_code, HttpServletRequest request) throws Exception {
		List<DoctorVO> doctorList = introService.getDoctorListByDepartCode(depart_code);
		StringBuilder sb = new StringBuilder();
		
		for(DoctorVO doctor : doctorList) {
			sb.append("<div class=\"card-item doctor-profile\">");
			sb.append("<article class=\"card-content\">");
			sb.append("<section class=\"card-item-inner\">");
			sb.append("<a href=\"javascript:show_step2(\'" + doctor.getDoc_code() + "\', \'" + 
			          doctor.getDoc_name() + "\')\" id=\"" + doctor.getDoc_code() + "\">");
			sb.append("<div class=\"card-content-img\">");
			sb.append("<img src=\"" + request.getContextPath() + "/upload/doctor/" + doctor.getDoc_image() + "\" alt=\"" + doctor.getDoc_name() + "\" />");
			sb.append("<div class=\"masking\"></div>");
			sb.append("</div>");
			sb.append("<div class=\"card-content-textarea\">");
			sb.append("<h3 class=\"card-content-title\">");
			sb.append("<span class=\"doc_name\">" + doctor.getDoc_name() + "</span>");
			sb.append("<span>교수</span>");
			sb.append("<span class=\"dept_name\">[" + doctor.getDepart_name() + "]</span>");
			sb.append("<span class=\"checked\"></span>");
			sb.append("</h3>");
			sb.append("<h4 class=\"card-field-title\">[진료분야]</h4>");
			sb.append("<p class=\"card-content-text\">");
			sb.append(doctor.getDoc_field());
			sb.append("</p></div></a></section></article></div>");
		}
		return sb.toString();
	}
	
	@RequestMapping(value="/reserveSearch", method=RequestMethod.GET)
	public String reserveSearch(Criteria cri, String pcode, Model model) throws Exception {
		String url = "reservation/reserveSearch";
		
		cri.setPerPageNum(3);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberService.getReserveListCount(pcode));
		
		List<ReserveAndDoctorVO> reserveList = memberService.getReserveList(cri, pcode);
		
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		
		return url; 
	}
	
	@ResponseBody
	@RequestMapping(value="/reserveCancel", method=RequestMethod.GET)
	public void reserveCancel(int reserv_num) throws Exception{
		memberService.cancelReserve(reserv_num);
	}
	
	@RequestMapping(value="/diagSearch", method=RequestMethod.GET)
	public String diagSearch(Criteria cri, String pcode, Model model) throws Exception {
		String url = "reservation/diagSearch";
		
		cri.setPerPageNum(5);
		List<DiagAndDoctorVO> diagList = memberService.getDiagList(cri, pcode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberService.getDiagListCount(pcode));

		model.addAttribute("diagList", diagList);
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);
		if(diagList.size() > 0) 
			model.addAttribute("mem_name", diagList.get(0).getMem_name());
		
		return url;
	}
	
	@RequestMapping(value="/diagContent", method=RequestMethod.GET)
	public String diagContent(@ModelAttribute("cri")Criteria cri, int diag_num, Model model) throws Exception{
		String url = "reservation/diagContent";
		
		DiagAndDoctorVO diag = memberService.getDiagByNum(diag_num);
		
		model.addAttribute("diag", diag);
		
		return url;
	}
}
