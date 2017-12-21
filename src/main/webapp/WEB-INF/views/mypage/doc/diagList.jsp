<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/doctorSidebar.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/admin/adminBasic.css'/>">

<section class="content-wrapper">
	<div class="content">
		<div class="row">
			<br />
			<h3>진료환자목록</h3>
			<br />
		</div>
		<div class="row">
			<div class="box">
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>환자코드</th>
							<th>성명</th>
							<th>핸드폰</th>
							<th>진료상태</th>
							<th>구분</th>
						</tr>
						<c:forEach items="${list}" var="ReserveAndDoctorVO">
							<tr>
								<td>${ReserveAndDoctorVO.mem_pcode}</td>
								<td>${ReserveAndDoctorVO.mem_name}</td>
								<td>${ReserveAndDoctorVO.mem_phone}</td>
								<c:if test="${ReserveAndDoctorVO.reserv_status eq '진료대기'}">
									<td style="color: green;">진료대기</td>
								</c:if>
								<c:if test="${ReserveAndDoctorVO.reserv_status eq '진료완료'}">
									<td style="color: blue;">진료완료</td>
								</c:if>
								<c:if test="${ReserveAndDoctorVO.reserv_status eq '진료대기'}">
									<td><a data-num="${ReserveAndDoctorVO.reserv_num}"
										data-code="${param.doc_code}" class="btn btn-xs btn_diag">진료<i
											class="fa fa-hand-o-up" aria-hidden="true"></i></a></td>
								</c:if>
								<c:if test="${ReserveAndDoctorVO.reserv_status eq '진료완료'}">
									<td><a data-num="${ReserveAndDoctorVO.reserv_num}"
										class="btn btn-xs btn_detail">상세보기<i
											class="fa fa-hand-o-up" aria-hidden="true"></i></a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${empty list}">
								<div class="empty">
									<h4>진료내역이 없습니다.</h4>
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

	<!-- 진료 모달 -->
	<div class="modal fade" id="diagModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 30px 30px;">
					<button type="button" class="close" data-dismiss="modal"
						style="margin-top: 7px;">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4>
						<i class="fa fa-paper-plane" aria-hidden="true"></i>진료
					</h4>
				</div>
				<form class="form-horizontal" method="post" name="frm_vac"
					action="diagUpdate">
					<div class="modal-body" style="padding: 40px 50px; height: 600px;">
						<input type="hidden" id="doc_code" name="doc_code" />
						<input type="hidden" id="reserv_num" name="reserv_num" />						
						<div class="form-group" style="display: inline-block; width: 50%;">
							<label><i class="fa fa-users" aria-hidden="true"></i>환자코드</label>
							<input type="text" class="form-control" id="mem_pcode" name="mem_pcode"
								readonly="readonly">
						</div>

						<div class="form-group"
							style="display: inline-block; width: 50%; margin-left: 40px;">
							<label><i class="fa fa-user-md" aria-hidden="true"></i>성
								명</label> <input type="text" class="form-control" id="mem_name"
								readonly="readonly">
						</div>

						<div class="form-group" style="display: inline-block; width: 50%">
							<label><i class="fa fa-calendar" aria-hidden="true"></i>예약시간</label>
							<input type="text" class="form-control" id="reserv_date"
								readonly="readonly">
						</div>

						<div class="form-group"
							style="display: inline-block; width: 50%; margin-left: 40px; position: relative;">
							<label> <i class="fa fa-paper-plane" aria-hidden="true"></i>진료상태
							</label> <input type="text" class="form-control" id="reserv_status"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label><i class="fa fa-pencil" aria-hidden="true"></i>증상</label>
							<textarea rows="5" cols="30" class="form-control"
								readonly="readonly" id="reserv_symptom" style="resize: none"></textarea>
						</div>

						<div class="form-group" style="display: inline-block;">
							<label><i class="fa fa-pencil" aria-hidden="true"></i>진단명</label>
							<input type="text" class="form-control" id="diag_disease"
								name="diag_disease" style="width: 100%">
						</div>

						<div class="form-group">
							<label><i class="fa fa-pencil" aria-hidden="true"></i>진료내용</label>
							<textarea rows="5" cols="30" class="form-control"
								id="diag_content" name="diag_content" style="resize: none"></textarea>
						</div>
						
							
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">진단완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 상세보기 모달 -->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 30px 30px;">
					<button type="button" class="close" data-dismiss="modal"
						style="margin-top: 7px;">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4>
						<i class="fa fa-paper-plane" aria-hidden="true"></i>진료기록
					</h4>
				</div>
				<form class="form-horizontal" method="post" name="frm_vac">
					<div class="modal-body" style="padding: 40px 50px; height: 360px;">
						<input type="hidden" id="doc_code" name="doc_code" />
						<div class="form-group" style="display: inline-block; width: 50%;">
							<label><i class="fa fa-users" aria-hidden="true"></i>환자코드</label>
							<input type="text" class="form-control" id="mem_pcode_d"
								readonly="readonly">
						</div>

						<div class="form-group"
							style="display: inline-block; width: 50%; margin-left: 40px;">
							<label><i class="fa fa-user-md" aria-hidden="true"></i>성
								명</label> <input type="text" class="form-control" id="mem_name_d"
								readonly="readonly">
						</div>

						<div class="form-group" style="display: inline-block; width: 50%">
							<label><i class="fa fa-pencil" aria-hidden="true"></i>진단명</label>
							<input type="text" class="form-control" id="diag_disease_d"
								name="diag_disease" readonly="readonly">
						</div>

						<div class="form-group"
							style="display: inline-block; width: 50%; margin-left: 40px;">
							<label><i class="fa fa-calendar" aria-hidden="true"></i>진료시간</label>
							<input type="text" class="form-control" id="diag_date_d"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label><i class="fa fa-pencil" aria-hidden="true"></i>진료내용</label>
							<textarea rows="5" cols="30" class="form-control"
								id="diag_content_d" name="diag_content" style="resize: none"
								readonly="readonly"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btn_reload"
							data-dismiss="modal">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	var num;
	var code;
	$('.btn_diag').click(
			function() {
				event.preventDefault();
				num = $(this).attr('data-num');
				code = $(this).attr('data-code');
				$.ajax({
					type : "GET",
					url : "reserveDetail",
					data : {
						reserv_num : num
					},
					success : 
						function(data) {
						var date = new Date(data.reserv_date);
						date = date.getFullYear() + '년' + (date.getMonth() + 1)
								+ '월' + (date.getDate()) + '일 '
								+ date.getHours() + '시' + date.getMinutes()
								+ '분';
						$('#mem_pcode').val(data.mem_pcode);
						$('#mem_name').val(data.mem_name);
						$('#reserv_date').val(date);
						$('#reserv_status').val(data.reserv_status);
						$('#reserv_symptom').val(data.reserv_symptom);
						$('#doc_code').val(data.doc_code);
						$('#reserv_num').val(data.reserv_num);
						$('#mem_pcode').val(data.mem_pcode);
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				})
				$('#diagModal').modal('show');
			});
	$('.btn_detail').click(
			function() {
				event.preventDefault();
				num = $(this).attr('data-num');
				$.ajax({
					type : "GET",
					url : "diagDetail",
					data : {
						'reserv_num' : num
					},
					success : function(data) {
						var date = new Date(data.diag_date);
						date = date.getFullYear() + '년' + (date.getMonth() + 1)
								+ '월' + (date.getDate()) + '일 '
								+ date.getHours() + '시' + date.getMinutes()
								+ '분';
						$('#mem_pcode_d').val(data.mem_pcode);
						$('#mem_name_d').val(data.mem_name);
						$('#diag_date_d').val(date);
						$('#diag_disease_d').val(data.diag_disease);
						$('#diag_content_d').val(data.diag_content);
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				})
				$('#detailModal').modal('show');
			});
	$('#btn_reload').click(function() {
		location.reload();
	});
</script>