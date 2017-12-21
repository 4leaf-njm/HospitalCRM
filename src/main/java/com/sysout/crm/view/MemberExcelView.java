package com.sysout.crm.view;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.sysout.crm.domain.MemberVO;

// 현업에서는 xml 을 만들고 I Report 사용 (view x) -> excel, pdf 변환 
// view 클래스는 AbstractView 를 상속 받아야함  (Excel 은 ExcelView)
public class MemberExcelView extends AbstractExcelView{ // 엑셀은 다운 로드 됨, pdf 는 브라우저로 열림

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 엑셀이니 다운로드 하라고 설정.
		response.setHeader("Content-Disposition", "attachment;filename=\"pageRankList.xls\";");
		
		HSSFSheet sheet = createFirstSheet(workbook); // workbook 을통해 sheet 를 만듬
		createColumnLabel(sheet); // sheet 를 넘겨서 라벨을 만듬.
		List<MemberVO> memberList = (List<MemberVO>)model.get("memberList");
		
		int rowNum = 1;
		for(MemberVO member : memberList) {
			createMemberRow(sheet, member, rowNum++);
		}
	}
	
	private HSSFSheet createFirstSheet(HSSFWorkbook workbook) {
		HSSFSheet sheet = workbook.createSheet(); 
		workbook.setSheetName(0, "사용자정보"); // sheet 명
		sheet.setColumnWidth(1, 256*30); // 1 - 두번째열 , 너비 : 256 * 30  (한글자가 256) / 30글자의 너비
		sheet.setColumnWidth(2, 256*30);
		sheet.setColumnWidth(3, 256*30);
		sheet.setColumnWidth(4, 256*30);
		sheet.setColumnWidth(5, 256*30);
		sheet.setColumnWidth(6, 256*30);
		sheet.setColumnWidth(7, 256*30);
		return sheet;
	}
	private void createColumnLabel(HSSFSheet sheet) {
		HSSFRow firstRow = sheet.createRow(0);
		HSSFCell cell = firstRow.createCell(0);
		cell.setCellValue("환자번호");
		
		cell = firstRow.createCell(1);
		cell.setCellValue("아이디");
		
		cell = firstRow.createCell(2);
		cell.setCellValue("성명");
		
		cell = firstRow.createCell(3);
		cell.setCellValue("주민등록번호");
		
		cell = firstRow.createCell(4);
		cell.setCellValue("연락처");
		
		cell = firstRow.createCell(5);
		cell.setCellValue("이메일");
		
		cell = firstRow.createCell(6);
		cell.setCellValue("가입일");
		
		cell = firstRow.createCell(7);
		cell.setCellValue("사용여부");
	}
	
	private void createMemberRow(HSSFSheet sheet, MemberVO member, int rowNum) {
		HSSFRow row = sheet.createRow(rowNum);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue(member.getMem_pcode());
		
		cell = row.createCell(1);
		cell.setCellValue(member.getMem_id());
		
		cell = row.createCell(2);
		cell.setCellValue(member.getMem_name());
		
		cell = row.createCell(3);
		cell.setCellValue(member.getMem_birth());
		
		cell = row.createCell(4);
		cell.setCellValue(member.getMem_phone());
		
		cell = row.createCell(5);
		cell.setCellValue(member.getMem_email());
		
		cell = row.createCell(6);
		cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(member.getMem_reg_date()));
		
		cell = row.createCell(7);
		if(String.valueOf(member.getMem_use_yn()).equals("N")){
			cell.setCellValue("미사용");			
		}else{
			cell.setCellValue("사용");						
		}
		
	}
}
