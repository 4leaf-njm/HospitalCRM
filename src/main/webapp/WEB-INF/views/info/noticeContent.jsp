<%@page import="com.sysout.crm.domain.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/infoSidebar.jsp"%>

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
						<h3 class="box-title">공지사항</h3>
					</div>
					<!-- /.box-header -->
	
					<form role="form" method="post">
						<input type='hidden' name='notice_num' value="${noticeVO.notice_num}">
						<input type="hidden" name="page" value="${cri.page }" />
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }" />
					</form>
	
					<div class="box-body">
						<table class="table table-bordered table-content text-center">
							<tr>
								<th>제목</th>
								<td style="text-align:left;">${noticeVO.notice_title}</td>
								<th>작성자</th>
								<td>관리자</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td style="text-align: left; width: 545px;">
									<c:choose>
										<c:when test="${empty noticeVO.notice_file }">
											* 등록된 파일이 없습니다.
										</c:when>
										<c:otherwise>
											<a href="<c:url value='/fileDownload?file=${noticeVO.notice_file }' />">
												${noticeVO.notice_file }
											<i class="fa fa-floppy-o" aria-hidden="true"></i></a>
										</c:otherwise>
									</c:choose>
								</td>
								<th>등록일</th>
								<td><fmt:formatDate value="${noticeVO.notice_reg_date }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3" style="vertical-align: top;">
									<textarea id="content" name="notice_content" rows="15" style="resize:none; width: 100%; border: 0; padding: 10px; background: #fff;" readonly="readonly">${noticeVO.notice_content }</textarea>
								</td>
								
							</tr>
						</table>
					</div>
	
					<!-- /.box-body -->
	
					<div class="box-footer">
						<div class="btn_box pull-right">
							<button type="submit" class="btn btn-primary">목록</button>
							<c:if test="${loginUser eq 'admin' }">
								<button type="submit" class="btn btn-warning">수정</button>
								<button type="submit" class="btn btn-danger">삭제</button>
							</c:if>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->
		</div>
		<!-- /.row -->
	</div>
	
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
						<p class="modal-message">이 게시글을 삭제하시겠습니까 ?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-yes" data-dismiss="modal">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "noticeModify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "noticeRemove");
			
			$('#yesnoModal .btn-yes').click(function(){
				formObj.submit();
			});
			$('#yesnoModal').modal('show');
		});

		$(".btn-primary").on("click", function() {
			self.location = "notice";
		});

	});
</script>
