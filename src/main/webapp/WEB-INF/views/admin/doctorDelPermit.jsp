<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/adminSidebar.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/admin/adminBasic.css'/>">

<section class="content-wrapper">
	<div class="content">
		<div class="row">
			<br />
			<h3>의료진탈퇴승인</h3>
			<br />
		</div>
		<br>
		<div class="row">
			<div class="box">
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>의료진코드</th>
							<th>진료과</th>
							<th>성명</th>
							<th>가입일</th>
							<th>승인여부</th>
							<th>구분</th>
						</tr>
						<c:forEach items="${list}" var="DoctorVO">
							<tr>
								<td>${DoctorVO.doc_code}</td>
								<td>${DoctorVO.depart_name}</td>
								<td>${DoctorVO.doc_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${DoctorVO.doc_reg_date}" /></td>
								<c:if test="${DoctorVO.doc_use_yn eq 'R'.charAt(0)}">
									<td>승인대기</td>
								</c:if>
								<c:if test="${DoctorVO.doc_use_yn eq 'N'.charAt(0)}">
									<td>승인완료</td>
								</c:if>
								<c:if test="${DoctorVO.doc_use_yn eq 'R'.charAt(0)}">
									<td><a data-code="${DoctorVO.doc_code}" class="btn btn-default">승인</a></td>
								</c:if>
								<c:if test="${DoctorVO.doc_use_yn eq 'N'.charAt(0)}">
									<td></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${empty list}">
								<div class="emp">
									<h4>탈퇴신청한 회원이 없습니다.</h4>
								</div>
							</c:if>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="doctorDelPermit${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="doctorDelPermit${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="doctorDelPermit${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-primary">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">탈퇴승인</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">탈퇴를 승인하시겠습니까 ?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="btn_delOk" data-dismiss="modal">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="delOkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">탈퇴승인 완료</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">탈퇴승인이 완료되었습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="btn_reload"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$('.btn-default').click(function() {
		var code = $(this).data('code');
		
		$('#delModal').modal('show');
		$('#btn_delOk').click(function() {
			deleteDoctor(code);
		});
	});

	function deleteDoctor(doc_code){
		$.ajax({
			type : "POST",
			url : "doctorDel",
			data : {'doc_code' : doc_code},
			success : function() {
				$('#delOkModal').modal('show');
			}
		});
	}

	$('#btn_reload').click(function() {
		location.reload();
	});
</script>