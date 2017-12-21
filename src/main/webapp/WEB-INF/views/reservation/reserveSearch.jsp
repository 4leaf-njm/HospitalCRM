<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/reserveSidebar.jsp" %>
<link rel="stylesheet" href='<c:url value="/resources/css/reservation/reserveSearch.css"/>'>

<section class="content-wrapper">
	<div class="content">
		<div class="content-box">
			<div class="info-box">
				<strong class="title">꼭! 읽어보세요</strong>
				<h2 class="info-title">예약조회 안내</h2>
				<ul class="info-list">
					<li>진료 예약확인은 전화 02-2320-3218번으로 연락 주시기 바랍니다.</li>
					<li>진료일 2일전에 예약확인 문자 메시지(SMS)를 발송해 드리오니 참고 하시기 바랍니다.</li>
					<li>진료의뢰서와 건강보험증을 반드시 지참하시고 예약시간 20분전 해당 진료과에 방문하여 주시기 바랍니다.</li>
					<li>수납된 예약일정은 취소하시는 경우 수납된 금액은 보험금으로 예치됩니다.</li>
				</ul>
				<h2 class="info-title">예약취소 안내</h2>
				<ul class="info-list">
					<li>진료예약 취소는 예약 하루 전일까지만 가능합니다.</li>
					<li>진료예약 변경의 오류를 최소화 하고자  진료예약 확인 및 취소만 가능합니다.</li>
				</ul>
				<strong class="reserv-info">
					<i class="fa fa-phone" aria-hidden="true"></i>&nbsp; 예약문의 1599-3213
				</strong>
				<p class="tip-txt">※가정의학과, 재활의학과, 치과는 진료의뢰서가 없어도 건강보험 혜택을 받으실 수 있습니다.</p>
			</div>
			
			<div class="section-heading">
				<h4 class="section-heading-title">예약조회</h4>
			</div>
			<div class="reserve-list-wrapper">
			<c:choose>
			<c:when test="${empty reserveList }">
			 	<div class="no-reserve">
			    	<h4 class="text">고객님의 진료예약 일정이 존재하지 않습니다.</h4>
			    </div>
			</c:when>
			<c:otherwise>
				<ul class="reserve-list">
				<c:forEach var="reserve" items="${reserveList}" varStatus="status">
					<li class="list-item">
						<div class="item-content">
							<div class="reserve-info">
								<div class="doctor-img">
									<img src='<c:url value="/upload/doctor/${reserve.doc_image}" />' alt="${reserve.doc_name }" /> 
									<div class="masking"></div>
								</div>
								<div class="content-textarea">
									<h4 class="content-title">${reserve.doc_name} 교수
									    <span class="depart">[${reserve.depart_name}]</span>
									    <span class="status" 
									        <c:if test="${reserve.reserv_status eq '예약' }">
												style="background: #5983fd"
											</c:if>
											<c:if test="${reserve.reserv_status eq '진료완료' }">
												style="background: #84dc54"
											</c:if>
											<c:if test="${reserve.reserv_status eq '취소' }">
												style="background: #ffa6ae"
											</c:if>
									      >${reserve.reserv_status}</span>
									</h4>
									<div class="content-text">
										<p>예약시간 : <fmt:formatDate value="${reserve.reserv_date }" pattern="yyyy.MM.dd(E) hh:mm"/></p>
										<p>진료과 전화번호 : ${reserve.depart_tel}</p>
										<p>예약 사유 : ${reserve.reserv_symptom}</p>
									</div>
								</div>
							</div>
							<div class="item-footer">
								<c:if test="${reserve.reserv_status eq '예약' }">
									<a data-num="${reserve.reserv_num }" class="btn_cancel">예약 취소</a>
								</c:if>
								<c:if test="${reserve.reserv_status eq '진료완료' }">
									<a href="#">진료기록 확인</a>
								</c:if>
								<c:if test="${reserve.reserv_status eq '취소' }">
									<p>고객님의 요청에 의해 예약이 취소되었습니다.</p>
								</c:if>
							</div>
						</div>
					</li>
				</c:forEach>
				</ul>
				
				<style>
					.radio {display: inline-block; margin-left: 15px;}
				</style>
				
				<nav style="text-align: center;">
				  <ul class="pagination pagination-lg text-center">
				    <li>
				    <c:choose>
					<c:when test="${pageMaker.pprev }">
				      <a href="reserveSearch?page=1&pcode=10000000" aria-label="Previous">
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
				   	  <a href="reserveSearch?page=${cri.page - pageMaker.displayPageNum }&pcode=10000000" aria-label="Previous">
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
							<a href="reserveSearch${pageMaker.makeQuery(idx)}&pcode=10000000">${idx}</a>
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
				      <a href="reserveSearch?page=${nextPage }&pcode=10000000" aria-label="Next">
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
				      <a href="reserveSearch?page=${lastPage }&pcode=10000000" aria-label="Next">
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
	
	<div class="modal fade" id="yesnoModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-primary">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title"> <!-- 제목  --> </h4>
					</div>
					<div class="modal-body">
						<p class="modal-message"> <!-- 내용 --> </p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-yes" data-dismiss="modal">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="okModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">예약취소 완료</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">예약 취소가 완료되었습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-reload" data-dismiss="modal">확인</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
	var num;
	
	$('.btn_cancel').click(function(event){
		event.preventDefault();
		num = $(this).attr('data-num');
		
		$('#yesnoModal .modal-title').text('예약취소 확인');
		$('#yesnoModal .modal-message').text('예약을 취소하시겠습니까 ?');
		$('#yesnoModal').modal('show');
	});
	
	$('.btn-yes').click(function(){
		$.ajax({
			type:"GET",
			url:"reserveCancel",
			data:{reserv_num: num},
			success: function(){
				$('#okModal .modal-title').text('예약취소 완료');
				$('#okModal .modal-message').text('예약 취소가 완료되었습니다.');
				$('#okModal').modal('show');
			}
		});
	});
	
	$('.btn-reload').click(function (){
		location.reload();
	});
</script>