<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" />

<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/infoSidebar.jsp"%>

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
						<h3 class="box-title">공지사항</h3>
					</div>
					<!-- /.box-header -->
				
					<div class="box-body">
						<form role="form" method="post" enctype="multipart/form-data" id="frm">
							<input type="hidden" name="admin_code" value="${sessionScope.loginId }" />
							<table class="table table-bordered table-content text-center">
								<tr>
									<th>제목</th>
									<td><input type="text" name="notice_title" id="title" class="form-control" style="width: 100%; border: 0;" /></td>
									<th>작성자</th>
									<td>홍길동</td>
								</tr>
								<tr>
									<th>파일첨부</th>
									<td style="text-align: left;">
										<input class="upload-name" placeholder="파일 선택" readonly="readonly" />
										<label for="file" class="upload-label">업로드</label>
										<input type="file" name="file" id="file" class="upload-hidden">
									</td>
									<th>작성일</th>
									<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">
										<textarea id="content" name="notice_content" rows="15"></textarea>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="box-footer">
						<div class="btn_box pull-right">
							<button type="button" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-warning">취소</button>
						</div>
					</div>
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
	$('.btn-warning').on('click', function() {
		location.href="notice";
	});
</script>

<script>
	$('.upload-hidden').on('change', function(){
		var filename = '';
		if(window.FileReader){  
			filename = $(this)[0].files[0].name;
		} 
		else {  
			filename = $(this).val().split('/').pop().split('\\').pop(); 
		}
		$(this).siblings('.upload-name').val(filename);
	});
</script>
