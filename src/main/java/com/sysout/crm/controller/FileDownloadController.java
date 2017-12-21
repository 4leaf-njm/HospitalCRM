package com.sysout.crm.controller;

import java.io.File;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileDownloadController implements ApplicationContextAware{
	
	private WebApplicationContext context = null; // realpath 가져오기 위함  - 1. 세션이용 2. applicationContext 이용 
    // 세션 이용 : request -> session -> context -> realpath
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;
	}
	
	@RequestMapping("/fileDownload")
	public ModelAndView download(@RequestParam("file") String fileId, 
		              	  HttpServletResponse response) throws Exception {
		File downloadFile = getFile(fileId);
		
		if(downloadFile == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
			
		                        // 뷰이름                     모델명                              값    
		return new ModelAndView("download", "downloadFile", downloadFile);
	}
	
	private File getFile(String fileId) {
		String baseDir = context.getServletContext().getRealPath("upload/notice");
		
		return new File(baseDir, fileId);
	}
}