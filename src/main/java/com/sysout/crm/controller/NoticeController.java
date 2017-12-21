package com.sysout.crm.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.sysout.crm.domain.Criteria;
import com.sysout.crm.domain.NoticeVO;
import com.sysout.crm.domain.PageMaker;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.NoticeService;

@Controller
@RequestMapping("/info")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public void notice(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		List<NoticeVO> noticeList =  noticeService.getNoticeListSearch(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.getNoticeListSearchCount(cri));
		model.addAttribute("list", noticeList);
		model.addAttribute("pageMaker", pageMaker);
	}
	@RequestMapping(value="/noticeContent", method=RequestMethod.GET)
	public void contentNotice(@RequestParam("notice_num") int notice_num, @ModelAttribute("cri") SearchCriteria cri,
																Model model) throws Exception {
		model.addAttribute(noticeService.getNoticeByNumUpHit(notice_num));
	}
	
	@RequestMapping(value="/noticeModify", method=RequestMethod.GET)
	public void modifyNotice(int notice_num, @ModelAttribute("cri") SearchCriteria cri,
			                                              Model model) throws Exception {
		model.addAttribute(noticeService.getNoticeByNum(notice_num));
	}
	
	@RequestMapping(value="/noticeModify", method=RequestMethod.POST)
	public String modifyNotice(NoticeVO notice, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		String url ="redirect:/info/notice";
		noticeService.modifyNotice(notice);
	
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return url;
	}
	

	//get은 url로 넘기는거
	@RequestMapping(value="/noticeRegister", method=RequestMethod.GET)
	public String registerNotice() throws Exception {
		String url="info/noticeRegister";
		
		return url;
	}
	//파라메타를 서버로 숨겨서 보냄
	@RequestMapping(value="/noticeRegister", method=RequestMethod.POST)
	public String registerNotice(NoticeVO notice, @RequestParam("file")MultipartFile mfile, RedirectAttributes rttr, HttpSession session) throws Exception {
		String url = "redirect:/info/notice";
		String savePath = "upload/notice";
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);
		
		if(!mfile.isEmpty()) {
			String fileName = UUID.randomUUID() + "_" + mfile.getOriginalFilename(); 
			
			File file = new File(uploadPath, fileName);
			mfile.transferTo(file);
			notice.setNotice_file(fileName);
		}
		noticeService.registerNotice(notice);
		rttr.addFlashAttribute("msg","SUCCESS");
		return url;
	}

	@RequestMapping(value="/noticeRemove", method=RequestMethod.POST)
	public String removeNotice(@RequestParam("notice_num") int notice_num, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		String url = "redirect:/info/notice";
	
		noticeService.removeNotice(notice_num);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return url;
	}
	
}
