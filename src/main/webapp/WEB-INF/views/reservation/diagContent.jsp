<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/reserveSidebar.jsp" %>

<link rel="stylesheet" href='<c:url value="/resources/css/reservation/diagContent.css"/>'>

<section class="content-wrapper">
	<div class="content">
		<div class="content-box">
			<div class="section-heading">
				<h4 class="section-heading-title">진료조회</h4>
			</div>
			<div class="diag-list-wrapper">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">* <strong>${diag.mem_name }</strong> 님의 진료기록 입니다.</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered text-center table-content">
							<tr>
								<th>진단명</th>
								<td colspan="5">${diag.diag_disease }</td>
							</tr>
							<tr>
								<th>진료과</th>
								<td>${diag.depart_name }</td>
								<th>의료진</th>
								<td>${diag.doc_name }</td>
								<th>진료일자</th>
								<td><fmt:formatDate value="${diag.diag_date }" pattern="yyyy.MM.dd"/></td>
							</tr>
							<tr>
								<th>진료 내용</th>
								<td colspan="5">${diag.diag_content }</td>
							</tr>
						</table>
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer pull-right">
						<button type="button" class="btn btn-primary">진단서 발급</button>
						<button type="button" class="btn btn-primary" onclick="go_list()">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
	function go_list() {
		location.href="diagSearch?pcode=${diag.mem_pcode}";
	}
</script>