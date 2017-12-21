<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/shareSidebar.jsp"%>
<link rel="stylesheet" href='<c:url value="/resources/css/board/board.css"/>'>

<!-- Main content -->
<section class="content-wrapper">
<div class="content" style="background: #F6F6F6">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Q&A</h3>
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
					<button id='searchBtn' class="btn btn-primary">검색</button>
				</div>	
				
					<table class="table table-bordered text-center">
						<tr>
							<th style="width: 30px">번호</th>
							<th style="width: 80px">제목</th>
							<th style="width: 30px">작성자</th>
							<th style="width: 30px">등록일자</th>
							<th style="width: 30px">조회수</th>
			
						<c:forEach items="${list}" var="qna">
							<tr>
								<td>${qna.qna_num}</td>
								<td><a href='qnaContent?qna_num=${qna.qna_num }' 
								     onclick="return isOpen('${qna.mem_id}', '${qna.qna_open_yn}');"> 
									
								<c:if test="${qna.qna_open_yn eq 'N'.charAt(0)}">
									<i class="fa fa-lock" aria-hidden="true"></i>
								</c:if>
								${qna.qna_title}</a></td>
							
								<td>${qna.mem_id}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qna_reg_date}" /></td>
								<td><span class="badge bg-red">${qna.qna_hit}</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<c:if test="${sessionScope.loginUser eq 'member' }">
					<div class="btn_box pull-right">
						<a href="qnaRegister"><button class="btn btn-primary">글쓰기</button></a>
					</div>
					</c:if>
					
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
									<a href="qna?page=${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>
					
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</div>
</section>
<!-- /.content -->

<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-warning">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">안내</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">비밀글 입니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
	

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

						self.location = "qna"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();

					});

			$('#newBtn').on("click", function(evt) {

				self.location = "qnaRegister";

			});

		});
</script>

<script>
	function isOpen(mem_id, open_yn) {
		var user_id = "<%=session.getAttribute("loginId") %>";
		var user = "<%=session.getAttribute("loginUser") %>";
		
		if(user == 'doctor' || user == 'admin')
			return true;
		else if(open_yn == 'Y') 
			return true;
		else if(mem_id != user_id) {
			$('#checkModal').modal('show');
			return false;
		}
		else 
			return true;
	}
</script>