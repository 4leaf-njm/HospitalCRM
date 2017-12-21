<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/reserveSidebar.jsp" %>>

<link rel="stylesheet" href='<c:url value="/resources/css/reservation/diagSearch.css"/>'>

<section class="content-wrapper">
	<div class="content">
		<div class="content-box">
			<div class="section-heading">
				<h4 class="section-heading-title">진료조회</h4>
			</div>
			<div class="diag-list-wrapper">
			<c:choose>
				<c:when test="${empty diagList }">
				    <div class="no-diag">
				    	<h4 class="text">고객님의 진료내역이 존재하지 않습니다.</h4>
				    </div>
				</c:when>
				<c:otherwise>
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">* <strong>${mem_name }</strong> 님의 진료내역 입니다.</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered text-center">
							<tr>
								<th style="width: 90px;">진료과</th>
								<th style="width: 140px;">진단명</th>
								<th style="width: 80px;">의료진</th>
								<th style="width: 100px;">진료일자</th>
								<th style="width: 80px;">구분</th>
							</tr>
							
							<c:forEach var="diag" items="${diagList }">
								<tr>
									<td>${diag.depart_name }</td>
									<td>${diag.diag_disease }</td>
									<td>${diag.doc_name }</td>
									<td><fmt:formatDate value="${diag.diag_date }" pattern="yyyy.MM.dd(E)"/></td>
									<td><a href="diagContent?diag_num=${diag.diag_num }" class="btn-detail">상세 내용
									<i class="fa fa-hand-o-up" aria-hidden="true"></i></a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
							
				<nav style="text-align: center;">
				  <ul class="pagination pagination-lg text-center">
				    <li>
				    <c:choose>
					<c:when test="${pageMaker.pprev }">
				      <a href="diagSearch?page=1&pcode=10000000" aria-label="Previous">
				        <span aria-hidden="true">&laquo;&laquo;</span>
				      </a>
					</c:when>
				    <c:otherwise>
				    	<span aria-hidden="true" class="disabled">&laquo;&laquo;</span>
				    </c:otherwise>
				    </c:choose>
				    </li>
				    <li>
				    <c:choose>
				   	<c:when test="${pageMaker.prev }">
				   	  <a href="diagSearch?page=${cri.page - pageMaker.displayPageNum }&pcode=10000000" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				   	</c:when>
				   	<c:otherwise>
				   		<span aria-hidden="true" class="disabled">&laquo;</span>
				   	</c:otherwise>
				    </c:choose>
				    </li>
				    
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="diagSearch${pageMaker.makeQuery(idx)}&pcode=10000000">${idx}</a>
						</li>
					</c:forEach>
								
				    <li>
				    <!-- 마지막 페이지 구하기 -->
				    <c:set var="last" value="${pageMaker.totalCount/pageMaker.displayPageNum}" />
				    <fmt:parseNumber var="lastPage" value="${last+(1-(last%1))%1}" type="number" integerOnly="true"/>
				   	
				   	<!-- 다음 페이지 구하기 -->
				    <c:set var="nextPage" value="${cri.page + pageMaker.displayPageNum }"/>
				    <c:if test="${nextPage > lastPage}">
				    	<c:set var="nextPage" value="${lastPage }"/>
				    </c:if>
				    <c:choose>
				    <c:when test="${pageMaker.next}">
				      <a href="diagSearch?page=${nextPage }&pcode=10000000" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </c:when>
				    <c:otherwise>
				    	<span aria-hidden="true" class="disabled">&raquo;</span>
				    </c:otherwise>
				    </c:choose>
				    </li>
				    <li>
				    <c:choose>
				    <c:when test="${pageMaker.nnext}">
				      <a href="diagSearch?page=${lastPage }&pcode=10000000" aria-label="Next">
				        <span aria-hidden="true">&raquo;&raquo;</span>
				      </a>
				    </c:when>
				    <c:otherwise>
				        <span aria-hidden="true" class="disabled">&raquo;&raquo;</span>
				    </c:otherwise>
				    </c:choose>
				    </li>
				  </ul>
				</nav>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>