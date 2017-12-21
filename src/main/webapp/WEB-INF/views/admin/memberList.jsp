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
			<h3>회원목록</h3>
			<br />
		</div>
		<div class="row">
			<div class="leftButtonRow">
				<a href="memberListExcel" class="btn btn-primary">엑셀출력</a>
			</div>
			<div class="seachRow">
				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null?'selected':''}"/>>전체</option>
					<option value="mem_id"
						<c:out value="${cri.searchType eq 'mem_id'?'selected':''}"/>>아이디</option>
					<option value="mem_name"
						<c:out value="${cri.searchType eq 'mem_name'?'selected':''}"/>>성명</option>
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
							<th>환자번호</th>
							<th>아이디</th>
							<th>성명</th>
							<th>주민등록번호</th>
							<th>연락처</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>사용여부</th>
						</tr>
						<c:forEach items="${list}" var="MemberVO">
							<tr>
								<td>${MemberVO.mem_pcode}</td>
								<td>${MemberVO.mem_id}</td>
								<td>${MemberVO.mem_name}</td>
								<td>${MemberVO.mem_birth}</td>
								<td>${MemberVO.mem_phone}</td>
								<td>${MemberVO.mem_email}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${MemberVO.mem_reg_date}" /></td>
								<c:if test="${MemberVO.mem_use_yn eq 'Y'.charAt(0)}">
									<td>사용</td>
								</c:if>
								<c:if test="${MemberVO.mem_use_yn eq 'R'.charAt(0)}">
									<td>사용</td>
								</c:if>
								<c:if test="${MemberVO.mem_use_yn eq 'N'.charAt(0)}">
									<td>미사용</td>
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
									href="memberList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="memberList${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="memberList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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
							self.location = "memberList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});
</script>