<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/reserveSidebar.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reserveInf.css'/>">

 <section class="content-wrapper">
 	<div class="content">
		<div class="content_box">
			<div class="row">
				<div class="info_box">
					<h3 class="box_header">온라인 예약</h3>	
					<div class="box_body">
						<ul>
							<li>온라인 진료예약이란 홈페이지와 모바일을 통해 원하는 진료일정을 직접 선택하여 예약과 취소를 할 수 있는 손쉬운 예약방법입니다.</li>
							<li>온라인 진료예약은 진료과 선택 후 해당 의료진의 프로필을 직접 확인할 수 있는 유용한 정보들이 있습니다.</li>
							<li>온라인 진료예약 취소는 예약 하루 전일까지만 가능합니다.</li>
							<li>날짜 및 시간 선택 후 예약하기 버튼을 클릭하면 예약이 완료됩니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="time_box">
					<h3 class="box_header">접수·수납 예약 및 진료시간</h3>
					<div class="box_body">
						<table class="table">
							<tr>
								<th>접수•수납시간</th>
								<th>진료시간</th>
							</tr>
							<tr>
								<td>
									<p>평 일 : 오전 8시 ~ 오후 7시 <br />본관2층 : 오전 7시 ~ 오후 5시<br />토요일 : 오전 8시 ~ 오후 12시</p>
								</td>
								<td>
									<p>평 일 : 오전 9시 ~ 오후 4시  <br />토요일 : 오전 9시 ~ 오후 12시</p>
								</td>
							</tr>	
						</table>
						<h4 class="text">* 타 병원 영상자료 (CD, 필름)가 있으신 분은 진료시간 30분전까지 진료과에 자료를 접수하여 주시기 바랍니다.</h4>
					</div>
				</div>
			</div>
			<div class="row text-center">
				<button type="button" class="btn btn-primary btn-reserve">
					진료 예약
					<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
				</button>
			</div>
		</div>
	</div>
</section>
</body>
<!-- /.content -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>