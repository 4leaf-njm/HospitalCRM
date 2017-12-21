package com.sysout.crm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sysout.crm.domain.DiagAndDoctorVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.PageMaker;
import com.sysout.crm.domain.ReserveAndDoctorVO;
import com.sysout.crm.domain.ScheduleVO;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.DoctorService;
import com.sysout.crm.service.IntroService;
import com.sysout.crm.service.MemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private DoctorService doctorService;
	@Autowired
	private IntroService introService;
	
	@RequestMapping(value="/doc/mySchedule", method=RequestMethod.GET)
	public String mySchedule(String doc_code, Model model) throws Exception {
		String url = "mypage/doc/mySchedule";
	
		DoctorVO doctor = introService.getDoctorByCode(doc_code);
		model.addAttribute("doctor", doctor);
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/doc/ajaxScheduleList", method=RequestMethod.GET) 
	public List<ScheduleVO> getScheduleList(String doc_code) throws Exception {
		return  doctorService.getScheduleList(doc_code);
	}
	
	@ResponseBody
	@RequestMapping(value="/doc/ajaxReserveList", method=RequestMethod.GET)
	public List<ReserveAndDoctorVO> getReserveList(String doc_code) throws Exception {
		return doctorService.getReserveListByDocCode(doc_code);
	}
	
	@ResponseBody
	@RequestMapping(value="/doc/ajaxAskVacation", method=RequestMethod.POST)
	public void askVacation(ScheduleVO schedule, String start_date, String end_date) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start= sdf.parse(start_date);
		Date end = sdf.parse(end_date);
		
		schedule.setSchedule_start_date(start);
		schedule.setSchedule_end_date(end);
		doctorService.askSchedule(schedule);
	}
	
	@RequestMapping(value="/mem/memberRemove", method=RequestMethod.GET)
	public String removeMember(@RequestParam("mem_id") String mem_id, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/mem/memberRemoveInfo";
		memberService.removeAskMember(mem_id);
		
		rttr.addAttribute("message", "탈퇴 신청이 완료되었습니다.");
		return url;
	}
	
	@RequestMapping(value="/mem/memberRemoveInfo", method=RequestMethod.GET)
	public String removeMember() throws Exception {
		String url="mypage/mem/memRemove";
		
		return url;
	}
	
	@RequestMapping(value="/doc/doctorRemove", method=RequestMethod.GET)
	public String removeDoctor(@RequestParam("doc_code") String doc_code, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/doc/doctorRemoveInfo";
		
		doctorService.removeAskDoctor(doc_code);
		rttr.addAttribute("message", "탈퇴 신청이 완료되었습니다.");
		return url;
	}
	
	@RequestMapping(value="/doc/doctorRemoveInfo", method=RequestMethod.GET)
	public String removeDoctor() throws Exception {
		String url="mypage/doc/docRemove";
		
		return url;
	}
	
	@RequestMapping(value="/doc/reserveList", method=RequestMethod.GET)
	public void reserveList(@ModelAttribute("cri")SearchCriteria cri,@RequestParam("doc_code")String doc_code, Model model) throws Exception{
		List<ReserveAndDoctorVO> reserveList = doctorService.getMyReserveList(cri, doc_code);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(doctorService.getMyReserveListCount(doc_code));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", reserveList);
	}
	@ResponseBody
	@RequestMapping(value="/doc/reserveDetail", method=RequestMethod.GET)
	public ReserveAndDoctorVO reserveDetail(@RequestParam("reserv_num")int reserv_num) throws Exception{
		ReserveAndDoctorVO reserve = doctorService.getReseveByNum(reserv_num);
		return reserve;
	}

	@RequestMapping(value="/doc/diagList", method=RequestMethod.GET)
	public void diagList(@ModelAttribute("cri")SearchCriteria cri,@RequestParam("doc_code")String doc_code, Model model) throws Exception{
		List<ReserveAndDoctorVO> diagList = doctorService.getMyDiagList(cri, doc_code);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(doctorService.getMyDiagListCount(doc_code));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", diagList);
	}
	
	@ResponseBody
	@RequestMapping(value="/doc/diagDetail", method=RequestMethod.GET)
	public DiagAndDoctorVO diagDetail(@RequestParam("reserv_num")int reserv_num) throws Exception{
		DiagAndDoctorVO diag = doctorService.getDiagByReservNum(reserv_num);
		return diag;
	}
	
	@RequestMapping(value="/doc/diagUpdate", method=RequestMethod.POST)
	public String diagSave(DiagAndDoctorVO diag, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/mypage/doc/diagList";
		doctorService.modifyReserveStatusOk(diag.getReserv_num());
		doctorService.addDiag(diag);
		rttr.addAttribute("doc_code", diag.getDoc_code().replace(",", ""));
		return url;
	}
}
