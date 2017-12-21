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
						<h3 class="box-title">Q&A</h3>
					</div>
					<!-- /.box-header -->
	
					<form role="form" action="qna" method="get">
						<input type='hidden' name='qna_num' value="${qnaVO.qna_num}">
						<input type="hidden" name="page" value="${cri.page }" />
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }" />
					</form>
	
					<div class="box-body">
						<table class="table table-bordered table-content text-center">
							<tr>
								<th>제목</th>
								<td style="text-align:left;">${qnaVO.qna_title}</td>
								<th>작성자</th>
								<td>${qnaVO.mem_id }</td>
							</tr>
							<tr>
								<th>공개여부</th>
								<td style="text-align: left; width: 545px;">
									<div class="radio">
										 <label>
										 	<input type="radio" name="qna_open_yn" value="Y" disabled 
										 	  <c:if test="${qnaVO.qna_open_yn eq 'Y'.charAt(0) }" > checked</c:if>/>공개
										 </label>
									</div>
									<div class="radio">
										<label>
										 	<input type="radio" name="qna_open_yn" value="N" disabled 
										 	  <c:if test="${qnaVO.qna_open_yn eq 'N'.charAt(0) }" > checked</c:if>/>비공개
										 </label>
									</div>
								</td>
								<th>등록일</th>
								<td><fmt:formatDate value="${qnaVO.qna_reg_date }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<th>질문</th>
								<td colspan="3" style="vertical-align: top;">
									<textarea id="content" name="notice_content" rows="15" style="background: #fff;" readonly="readonly">${qnaVO.qna_content }</textarea>
								</td>
							</tr>
							
							<c:if test="${!empty qnaVO.answer_content }">
							<tr>
								<th>답변</th>
								<td colspan="3" style="vertical-align: top;">
									<textarea id="content" name="qna_answer" rows="15" style="background: #fff;" readonly="readonly">${qnaVO.answer_content}</textarea>
								</td>
							</tr>
							</c:if>
						</table>
							
						<form role="form" action="qnaAnswer" method="post">
							<input type='hidden' name='qna_num' value="${qnaVO.qna_num}">
							<div class="form-group answer">
									<label for="exampleInputPassword1">답변 내용</label>
									<textarea class="form-control" name="answer_content" rows="5"></textarea>
							</div>
						</form>
					</div>
	
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="btn_box pull-right">
							<div class="content_box">
								<c:if test="${sessionScope.loginUser eq 'member' }">
									<button type="submit" class="btn btn-warning btn_update"
										<c:if test="${!empty qnaVO.answer_content }" > disabled </c:if> >수정</button>
									<button type="submit" class="btn btn-danger btn_delete"
										<c:if test="${!empty qnaVO.answer_content }" > disabled </c:if> >삭제</button>
								</c:if>
								
								<c:if test="${sessionScope.loginUser ne 'member' }">
									<button type="button" class="btn btn-primary btn_insert" 
										<c:if test="${!empty qnaVO.answer_content }" > disabled</c:if>>답변등록</button>
								</c:if>
								<button type="submit" class="btn btn-primary btn_qna">목록</button>
							</div>
							
							<div class="answer_box">
								<button type="submit" class="btn btn-primary btn_save">완료</button>
								<button type="submit" class="btn btn-warning btn_cancel">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->
	
		</div>
		<!-- /.row -->
</div>
<!-- /.content -->
</section>

	<div class="modal fade" id="yesnoModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-primary">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">안내</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">이 글을 삭제하시겠습니까 ?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-yes" data-dismiss="modal">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div> 
			</div>
		</div>
	</div>

<%@include file="../include/footer.jsp"%>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		$(".btn_update").on("click", function() {
			formObj.attr("action", "qnaModify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn_delete").on("click", function() {
			formObj.attr("action", "qnaRemove");
		
			$('#yesnoModal .btn-yes').click(function(){
				formObj.submit();
			});
			$('#yesnoModal').modal('show');
		});

		$(".btn_qna").on("click", function() {
			self.location = "qna";
		});
		
		$(".btn_insert").on("click", function() {
					
			$('.answer').show();
				
		});
		$(".btn_save").on("click", function() {
			formObj.attr("action", "qnaAnswer");
			formObj.submit();
			
			$('.content_box').show();
			$('.answer_box').hide();
		});
		$('.btn_cancel').on('click', function() {
			$('.content_box').show();
			$('.answer_box').hide();
			$('.answer').hide();
		});
	});
</script>

<script>
	$('.btn_insert').on('click', function(){
		$('.content_box').hide();
		$('.answer_box').show();
	});
</script>
