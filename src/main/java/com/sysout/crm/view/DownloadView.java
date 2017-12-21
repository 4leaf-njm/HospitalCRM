package com.sysout.crm.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{ // ViewResolver 로 쓰일 클래스 
	
	public DownloadView() { // 어떤 view 인지에 대한 정보
		setContentType("application/download; charset=utf-8"); // download 하는 view 임.
		
	}
	
	@Override                               // 다운로드될 파일명을 모델에 심어 전달.
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//controller : model.addAttribute("downloadFile", downloadFile);
		File downloadFile = (File) model.get("downloadFile"); // model 에 넣어줄때 File 타입으로 넣어야함.
		
		response.setContentType(getContentType()); // 위에서 setting 한 contentType을 가져옴
		response.setContentLength((int)downloadFile.length()); // 파일 사이즈  // 길이를 파일의 길이로

		String fileName = URLEncoder.encode(downloadFile.getName(), "utf-8"); // 파일명 인코딩 처리 
		response.setHeader("Content-Disposition", "attachment;fileName=\"" + fileName + "\";"); // 브라우저가 다운로드 할 수 있게 됨
		
		OutputStream out = response.getOutputStream(); // 서버에서 클라이언트로 전송
		FileInputStream fis = null; // 해당 서버에있는 파일을 내보냄 
		
		try{
			fis = new FileInputStream(downloadFile);
			FileCopyUtils.copy(fis, out); // 읽어 들이면서 내보냄 
		}finally{
			if(fis != null) fis.close(); // 다 읽은 후 닫아줌
		}
		out.flush(); 
	} 
}
