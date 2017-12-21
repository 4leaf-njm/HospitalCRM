<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/adminSidebar.jsp"%>
<%@ page session="false"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/admin/adminBasic.css'/>">

<section class="content-wrapper">
	<div class="content">
		<div class="row">
			<br />
			<h3>의료진목록</h3>
			<br />
		</div>
		<div class="row">
			<div class="excelRow">
				<a href="doctorListExcel" class="btn btn-primary">엑셀출력</a>
			</div>
			<div class="seachRow">
				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null?'selected':''}"/>>전체</option>
					<option value="doc_code"
						<c:out value="${cri.searchType eq 'doc_code'?'selected':''}"/>>의료진코드</option>
					<option value="doc_name"
						<c:out value="${cri.searchType eq 'doc_name'?'selected':''}"/>>성명</option>
				</select> <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword }'>
				<button id='searchBtn'>
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</div>
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
							<th>주민등록번호</th>
							<th>연락처</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>사용여부</th>
						</tr>
						<c:forEach items="${list}" var="DoctorVO">
							<tr>
								<td>${DoctorVO.doc_code}</td>
								<td>${DoctorVO.depart_name}</td>
								<td>${DoctorVO.doc_name}</td>
								<td>${DoctorVO.doc_birth}</td>
								<td>${DoctorVO.doc_phone}</td>
								<td>${DoctorVO.doc_email}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${DoctorVO.doc_reg_date}" /></td>
								<c:if test="${DoctorVO.doc_use_yn eq 'Y'.charAt(0)}">
									<td>사용</td>
								</c:if>
								<c:if test="${DoctorVO.doc_use_yn eq 'R'.charAt(0)}">
									<td>사용</td>
								</c:if>
								<c:if test="${DoctorVO.doc_use_yn eq 'N'.charAt(0)}">
									<td style="color: red;">미사용</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="doctorList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="doctorList${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="doctorList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "doctorList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});
</script>