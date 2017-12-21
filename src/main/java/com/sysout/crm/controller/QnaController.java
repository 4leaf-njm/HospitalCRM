package com.sysout.crm.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sysout.crm.domain.PageMaker;
import com.sysout.crm.domain.QnaAnswerVO;
import com.sysout.crm.domain.QnaVO;
import com.sysout.crm.domain.SearchCriteria;
import com.sysout.crm.service.QnaService;





@Controller
@RequestMapping("/share")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value="/qna", method=RequestMethod.GET)
	public void qna(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		List<QnaVO> qnaList =  qnaService.getQnaListSearch(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(qnaService.getQnaListSearchCount(cri));
		model.addAttribute("list", qnaList);
		model.addAttribute("pageMaker", pageMaker);
	}
	@RequestMapping(value="/qnaContent", method=RequestMethod.GET)
	public void contentQna(@RequestParam("qna_num") int qna_num, @ModelAttribute("cri") SearchCriteria cri,
																Model model) throws Exception {
		model.addAttribute(qnaService.getQnaByNumUpHit(qna_num));
	}
	
	@RequestMapping(value="/qnaAnswer", method=RequestMethod.POST)
	public String ContentQna(QnaAnswerVO answer, RedirectAttributes rttr) throws Exception {
		String url ="redirect:/share/qnaContent";
		rttr.addAttribute("qna_num", answer.getQna_num());
		qnaService.registerAnswer(answer);
	
		return url;
	}
	
	@RequestMapping(value="/qnaModify", method=RequestMethod.GET)
	public void modifyQna(int qna_num, @ModelAttribute("cri") SearchCriteria cri,
			                                              Model model) throws Exception {
		model.addAttribute(qnaService.getQnaByNum(qna_num));
	}
	
	
	
	@RequestMapping(value="/qnaModify", method=RequestMethod.POST)
	public String modifyQna(QnaVO qna, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		String url ="redirect:/share/qna";
		qnaService.modifyQna(qna);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return url;
	}
	

	//get은 url로 넘기는거
	@RequestMapping(value="/qnaRegister", method=RequestMethod.GET)
	public String registerQna() throws Exception {
		String url="share/qnaRegister";
		
		return url;
	}


	//파라메타를 서버로 숨겨서 보냄
	@RequestMapping(value="/qnaRegister", method=RequestMethod.POST)
	public String registerQna(QnaVO qna, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/share/qna";
		
		qnaService.registerQna(qna);
		rttr.addFlashAttribute("msg","SUCCESS");
		return url;
	}
	@RequestMapping(value="/qnaAnswerRegister", method=RequestMethod.POST)
	public String registerQnaAnswer(QnaAnswerVO answer, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/share/qnaContent";
		answer.setWriter_code("ADMIN001");
		qnaService.registerAnswer(answer);
		rttr.addFlashAttribute("msg","SUCCESS");
		return url;
	}
	
	

	
	@RequestMapping(value="/qnaRemove", method=RequestMethod.POST)
	public String removeQna(@RequestParam("qna_num") int qna_num, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		String url = "redirect:/share/qna";
		qnaService.removeQna(qna_num);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return url;
	}

}
