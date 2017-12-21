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
	
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">공지사항</h3>
					</div>
					<div class="box-body">
					
					<div class="search_box pull-right">
							<select name="searchType" class="form-control one">
								<option value="n"
									<c:out value="${cri.searchType == null?'selected':''}"/>>
									---</option>
								<option value="t"
									<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
									제목</option>
								<option value="c"
									<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
									내용</option>
								<option value="tc"
									<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
									제목, 내용</option>
							</select> 
							<input type="text" name='keyword' id="keywordInput" class="form-control two"
								value='${cri.keyword }'>
							<button id='searchBtn' class="btn btn-primary">
								<i class="fa fa-search" aria-hidden="true"></i>검색
							</button>
						</div>	
						
						<table class="table table-bordered text-center">
							<tr>
								<th style="width: 30px">번호</th>
								<th style="width: 80px">제목</th>
								<th style="width: 30px">작성자</th>
								<th style="width: 30px">등록일자</th>
								<th style="width: 30px">조회수</th>
	
							<c:forEach items="${list}" var="notice">
	
								<tr>
									<td>${notice.notice_num}</td>
									<td><a href='noticeContent?notice_num=${notice.notice_num}' class="title">${notice.notice_title}
										<c:if test="${!empty notice.notice_file }">
											<i class="fa fa-floppy-o" aria-hidden="true"></i>
										</c:if>
									</a></td>
									<td>관리자</td>
									<td><fmt:formatDate value="${notice.notice_reg_date }" pattern="yyyy-MM-dd"/></td>
									<td><span class="badge bg-red">${notice.notice_hit}</span></td>
								</tr>
	
							</c:forEach>
	
						</table>
					</div>
					<!-- /.box-body -->
	
	
					<div class="box-footer">
						<div class="btn_box pull-right">
							<c:if test="${loginUser eq 'admin'}">
								<a href="noticeRegister"><button class="btn btn-primary">글쓰기</button></a>
							</c:if>
						</div>
	
						<div class="text-center">
							<ul class="pagination">
	
								<c:if test="${pageMaker.prev}">
									<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
								</c:if>
	
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
										<a href="notice?page=${idx}">${idx}</a>
									</li>
								</c:forEach>
	
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="${pageMaker.endPage +1}">&raquo;</a></li>
								</c:if>
	
							</ul>
						</div>
	
	
					</div>
					<!-- /.box-footer-->
				</div>
			</div>
			<!--/.col (left) -->
	
		</div>
		<!-- /.row -->
	</div>
</section>
<!-- /.content -->


<%@include file="../include/footer.jsp"%>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
<script>	
$(document).ready(
		function() {

			$('#searchBtn').on(
					"click",
					function(event) {

						self.location = "notice"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();

					});

			$('#newBtn').on("click", function(evt) {

				self.location = "noticeRegister";

			});

		});
</script>
