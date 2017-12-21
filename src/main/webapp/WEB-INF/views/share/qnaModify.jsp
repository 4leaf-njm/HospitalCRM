<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/shareSidebar.jsp"%>
<link rel="stylesheet" href='<c:url value="/resources/css/board/board.css"/>'>

<!-- Main content -->
<section class="content-wrapper">
	<div class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Q&A 수정</h3>
					</div>
					<!-- /.box-header -->
	
					<form role="form" action="qnaModify" method="post">
						<input type='hidden' name='page' value="${cri.page}"> 
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<input type="hidden" name="qna_num" value="${qnaVO.qna_num }" />
						
						<div class="box-body">
							<table class="table table-bordered table-content text-center">
								<tr>
									<th>제목</th>
									<td style="text-align:left;">
										<input type="text" id="title" name="qna_title" class="form-control" value="${qnaVO.qna_title }" style="width: 100%; border: 0;">
									</td>
									<th>작성자</th>
									<td>${sessionScope.loginId }</td>
								</tr>
								<tr>
									<th>공개여부</th>
									<td style="text-align: left; width: 545px;">
										<div class="radio">
											 <label>
											 	<input type="radio" name="qna_open_yn" value="Y"
											 	  <c:if test="${qnaVO.qna_open_yn eq 'Y'.charAt(0) }" > checked</c:if>/>공개
											 </label>
										</div>
										<div class="radio">
											<label>
											 	<input type="radio" name="qna_open_yn" value="N"
											 	  <c:if test="${qnaVO.qna_open_yn eq 'N'.charAt(0) }" > checked</c:if>/>비공개
											 </label>
										</div>
									</td>
									<th>등록일</th>
									<td><fmt:formatDate value="${qnaVO.qna_reg_date}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<th>질문</th>
									<td colspan="3" style="vertical-align: top;">
										<textarea id="content" name="qna_content" rows="15">${qnaVO.qna_content }</textarea>
									</td>
								</tr>
							</table>
						</div>
						<!-- /.box-body -->
				
					<div class="box-footer">
						<div class="btn_box pull-right">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="submit" class="btn btn-warning">취소</button>
						</div>
					</div>
					
				</form>
				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->
	
		</div>
		<!-- /.row -->
	</div>
</section>
<!-- /.content -->

<%@include file="../include/footer.jsp"%>
<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		$(".btn-warning").on("click",
				function() {
					self.location = "qnaContent?qna_num=${qnaVO.qna_num}&page=${cri.page}&perPageNum=${cri.perPageNum}"
						+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

				
		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>
