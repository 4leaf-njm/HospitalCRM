<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" />

<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/shareSidebar.jsp"%>>
<link rel="stylesheet" href='<c:url value="/resources/css/board/board.css"/>'>

<!-- Main content -->
<section class="content-wrapper" style="background: #F6F6F6">
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
	
		<form role="form" method="post" id="frm">
			<input type="hidden" name="mem_id" value="${sessionScope.loginId }" />
			<div class="box-body">
				<table class="table table-bordered table-content text-center">
					<tr>
						<th>제목</th>
						<td style="text-align:left;">
							<input type="text" id="title" name="qna_title" class="form-control" style="width: 100%; border: 0;">
						</td>
						<th>작성자</th>
						<td>${sessionScope.loginId }</td>
					</tr>
					<tr>
						<th>공개여부</th>
						<td style="text-align: left; width: 545px;">
							<div class="radio">
								 <label><input type="radio" name="qna_open_yn" value="Y">공개</label>
							</div>
							<div class="radio">
								 <label><input type="radio" name="qna_open_yn" value="N">비공개 </label>
							</div>
						</td>
						<th>등록일</th>
						<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th>질문</th>
						<td colspan="3" style="vertical-align: top;">
							<textarea id="content" name="qna_content" rows="15"></textarea>
						</td>
					</tr>
				</table>
			</div>
		<!-- /.box-body -->
	
		<div class="box-footer">
			<div class="btn_box pull-right">
				<button type="button" class="btn btn-primary">등록</button>
				<button type="button" class="btn btn-warning">취소</button>
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

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$('.btn-primary').on('click', function(){
		if($('#title').val() == '') {
			alert('제목을 입력해주세요.');
			$('#title').focus();
			return;
		}
		if($('#content').val() == '') {
			alert('내용을 입력해주세요.');
			$('#content').focus();
			return;
		}
		
		$('#frm').submit();	
	});
	
	$('.btn-warning').on('click', function(){
		location.href="qna";
	});
</script>
