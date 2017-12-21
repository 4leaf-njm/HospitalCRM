package com.sysout.crm.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sysout.crm.domain.AdminVO;
import com.sysout.crm.domain.DepartVO;
import com.sysout.crm.domain.DoctorVO;
import com.sysout.crm.domain.MemberVO;
import com.sysout.crm.domain.NoticeVO;
import com.sysout.crm.service.AdminService;
import com.sysout.crm.service.DoctorService;
import com.sysout.crm.service.MemberService;
import com.sysout.crm.service.NoticeService;

@Controller
@RequestMapping("/commons")

public class CommonController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private DoctorService doctorService;
	
	@Autowired 
	private AdminService adminService;
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(){
		String url="commons/login";
		
		return url;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(String id,String pwd, String users, Model model, HttpSession session) throws Exception{
		String url="commons/login";
		String message = "";
		int result = 0;
		
		if(users.equals("member")){
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(id);
			memberVO.setMem_pwd(pwd);
			result = memberService.login(memberVO);
			if(result == 1) {
				MemberVO member = memberService.getMemberById(id); 
				String pcode = member.getMem_pcode();
				session.setAttribute("pcode", pcode);
				session.setAttribute("loginVO", member);
			}
		} else if(users.equals("doctor")) {
			DoctorVO doctorVO = new DoctorVO();
			doctorVO.setDoc_code(id);
			doctorVO.setDoc_pwd(pwd);
			result = doctorService.login(doctorVO);
			if(result == 1) {
				DoctorVO doctor = doctorService.getDoctorByCode(id);
				session.setAttribute("loginVO", doctor);
			}
		} else if(users.equals("admin")){
			AdminVO adminVO = new AdminVO();
			adminVO.setAdmin_code(id); 
			adminVO.setAdmin_pwd(pwd);
			result = adminService.login(adminVO);
			if(result == 1) {
				AdminVO admin = adminService.getAdminByCode(id);
				session.setAttribute("loginVO", admin);
			}
		}
		
		if(result == 1) {
			session.setAttribute("loginId", id);
			session.setAttribute("loginUser", users);
			message ="SUCCESS";
		} else if(result == 0) {
			message ="존재하지 않는 아이디입니다.";
		} else if(result == -1){
			message ="비밀번호가 일지하지않습니다.";
		}
		
		model.addAttribute("message",message);
		return url;
	}
	
	@RequestMapping(value="/memberJoin", method = RequestMethod.GET)
	public String memberJoin(){
		String url="commons/memberJoin";
		return url;
	}
	
	@RequestMapping(value="/memberJoin", method = RequestMethod.POST)
	public String memberJoin(MemberVO member,
			 String mem_birth2, String mem_birth3,
			 String mem_phone1, String mem_phone2, 
			 String mem_phone3, String mem_email1, 
			 String mem_email2, String mem_addr_number, 
			String mem_addr2, String mem_addr3) throws Exception{
		String url="redirect:/commons/login";
		
		member.setMem_birth(mem_birth2+"-"+mem_birth3);
		member.setMem_phone(mem_phone1+"-"+mem_phone2+"-"+mem_phone3);
		member.setMem_email(mem_email1+"@"+mem_email2);
		member.setMem_addr("["+mem_addr_number+"] "+mem_addr2+" "+mem_addr3);
		memberService.join(member);
		
		return url;
	}
	
	@RequestMapping(value="/doctorJoin", method = RequestMethod.GET)
	public String doctorJoin(Model model) throws SQLException{
		String url = "commons/doctorJoin";
		
		List<DepartVO> departList = doctorService.getDepartList();
		model.addAttribute("departList",departList);
		
		return url;
	}
	
	@RequestMapping(value="/doctorJoin", method = RequestMethod.POST)
	public String doctorJoin(DoctorVO doctor, String doc_birth1, String doc_birth2, 
			String doc_phone1, String doc_phone2,String doc_phone3,
			String doc_email1, String doc_email2, String depart_field, String chk_box,
			String doc_addr_number, String doc_addr1,String doc_addr2, 
			MultipartFile partfile,HttpSession session) throws Exception{
		String url="redirect:/";
	
		String savePath = "upload/doctor";
		ServletContext context = session.getServletContext();
		String uploadPath=context.getRealPath(savePath);
		
		if(!partfile.isEmpty()){
			if(partfile.getOriginalFilename().endsWith(".jpg")){
				String fileNname = UUID.randomUUID() + "_" + partfile.getOriginalFilename();
				
				File file = new File(uploadPath, fileNname);
				partfile.transferTo(file);
				doctor.setDoc_image(fileNname);
			}
		}
		
		doctor.setDoc_birth(doc_birth1 + "-" + doc_birth2);
		doctor.setDoc_phone(doc_phone1 + doc_phone2 + doc_phone3);
		doctor.setDoc_email(doc_email1 + "@" + doc_email2);
		doctor.setDoc_addr("[" + doc_addr_number + "]" + doc_addr1 + doc_addr2);
		doctor.setDepart_code(depart_field);
		doctor.setDoc_field(chk_box);
		doctorService.join(doctor);
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	public String checkId(String id) throws Exception {
		int result = memberService.checkId(id);
		
		if(result == 1) 
			return "SUCCESS";
		else
			return "FAIL";
	} 
	
	@ResponseBody // 자바 객체를 json 으로 변환. viewResolver 를 거치지 않음.
	@RequestMapping(value="/ajaxDepartField", method=RequestMethod.POST, produces="application/json")
	public List<String> getDepartField(String depart_code) throws Exception {
		DepartVO depart = doctorService.getDepartByCode(depart_code);
		String depart_field = depart.getDepart_field();
		
		StringTokenizer st = new StringTokenizer(depart_field, ", ");
		List<String> fieldList = new ArrayList<String>();
		while(st.hasMoreTokens()) { // 다음 토큰이 있다면
			String field = st.nextToken(); // 그 토큰을 가져와라.
			fieldList.add(field); // 리스트에 담음
		} // 반복 -> 모든 진료분야가 리스트에 담겨짐
		
		return fieldList; // 진료분야 리스트 반환
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET) 
	public String logout(HttpSession session) throws Exception {
		String url = "redirect:/commons/login";
		
		session.invalidate();
		return url;
	}

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String getNoticeByNum(Model model) throws Exception {
		String url = "redirect:/";
		
		List<NoticeVO> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		return url;
	}
}