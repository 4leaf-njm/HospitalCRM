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
			<h3>휴가신청목록</h3>
			<br />
		</div>
		<div class="row">
			<div class="box">
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th><input type="checkbox" id="all_check"></th>
							<th>진료과</th>
							<th>성명</th>
							<th>신청일자</th>
							<th>승인여부</th>
							<th>구분</th>
						</tr>
						<c:forEach items="${list}" var="ScheduleVO">
							<tr>
								<c:if test="${ScheduleVO.schedule_permit_yn eq 'Y'.charAt(0) }">
									<td><input type="checkbox" name="check"
										value="${ScheduleVO.schedule_num}"></td>
								</c:if>
								<c:if test="${ScheduleVO.schedule_permit_yn eq 'R'.charAt(0) }">
									<td><input type="checkbox" disabled
										value="${ScheduleVO.schedule_num}"></td>
								</c:if>
								<c:if test="${ScheduleVO.schedule_permit_yn eq 'N'.charAt(0) }">
									<td><input type="checkbox" name="check"
										value="${ScheduleVO.schedule_num}"></td>
								</c:if>
								<td>${ScheduleVO.depart_name}</td>
								<td>${ScheduleVO.doc_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${ScheduleVO.schedule_reg_date}" /></td>
								<%-- <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ScheduleVO.schedule_start_date}" /> ~ <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ScheduleVO.schedule_end_date}" /></td> --%>
								<c:if test="${ScheduleVO.schedule_permit_yn eq 'R'.charAt(0)}">
									<td>승인대기</td>
								</c:if>
								<c:if test="${ScheduleVO.schedule_permit_yn eq 'Y'.charAt(0)}">
									<td>승인완료</td>
								</c:if>
								<c:if test="${ScheduleVO.schedule_permit_yn eq 'N'.charAt(0)}">
									<td>승인거부</td>
								</c:if>
								<td><a data-num="${ScheduleVO.schedule_num}" data-permit="${ScheduleVO.schedule_permit_yn}"
									class="btn btn-xs btn_detail">상세보기<i
										class="fa fa-hand-o-up" aria-hidden="true"></i></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="box-footer">
					<div class="leftButtonRow">
						<a class="btn btn-default btn_delete">삭제 <span class="badge">0</span></a>
					</div>
					<div class="text-center">
						<ul class="pagination">
							<c:forEach items="${list}" var="ScheduleVO">
								<c:if test="${empty ScheduleVO}">
									<div class="empty">
										<h4>휴가신청한 의료진이 없습니다.</h4>
									</div>
								</c:if>
							</c:forEach>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="vacationPermit${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="vacationPermit${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="vacationPermit${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 확인 모달 -->
	<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-primary">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">목록에서 삭제</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">삭제하시겠습니까 ?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="btn_delOk"
							data-dismiss="modal">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 성공 모달 -->
	<div class="modal fade" id="delOkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">삭제 완료</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">삭제가 완료되었습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="btn_reload"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 휴가 상세보기 모달 -->
	<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 30px 30px;">
					<button type="button" class="close" data-dismiss="modal"
						style="margin-top: 7px;">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4>
						<i class="fa fa-paper-plane" aria-hidden="true"></i>휴가 신청 내역
					</h4>
				</div>
				<form class="form-horizontal" method="post" name="frm_vac">
					<div class="modal-body" style="padding: 40px 50px; height: 360px;">
						<input type="hidden" id="doc_code" />
						<div class="form-group" style="display: inline-block; width: 50%;">
							<label><i class="fa fa-users" aria-hidden="true"></i>진료과</label>
							<input type="text" class="form-control" id="depart_name" readonly="readonly">
						</div>

						<div class="form-group"
							style="display: inline-block; width: 50%; margin-left: 40px;">
							<label><i class="fa fa-user-md" aria-hidden="true"></i>성
								명</label> <input type="text" class="form-control" id="doc_name" readonly="readonly">
						</div>

						<div class="form-group" style="display: inline-block; width: 50%">
							<label><i class="fa fa-calendar" aria-hidden="true"></i>휴가
								시작일</label> <input type="text" class="form-control" id="schedule_start_date" readonly="readonly">
						</div>

						<div class="form-group"
							style="display: inline-block; width: 50%; margin-left: 40px; position: relative;">
							<label> <i class="fa fa-calendar" aria-hidden="true"></i>휴가
								종료일
							</label> <input type="text" class="form-control" id="schedule_end_date"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label><i class="fa fa-pencil" aria-hidden="true"></i>휴가
								사유</label>
							<textarea rows="5" cols="30" class="form-control" readonly="readonly" id="schedule_reason"
								style="resize: none"></textarea>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success" id="btn_permitOk">
							<i class="fa fa-check" aria-hidden="true"></i>승인
						</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal" id="btn_permitRefusal">
							<i class="fa fa-times" aria-hidden="true"></i>승인거부
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 휴가 승인 거절 모달 -->
	<div class="modal fade" id="permitRefusalModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">승인 거절</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">휴가 거절이 완료되었습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="btn_reload"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 휴가 승인 완료 모달 -->
	<div class="modal fade" id="permitOkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">승인 완료</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">휴가 승인이 완료되었습니다.</p>
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
	$(function() {
		$('#all_check').click(function() {
			if ($('#all_check').prop('checked')) {
				$('input[name=check]').prop('checked', true);
			} else {
				$('input[name=check]').prop('checked', false);
			}
		});
	});
	var numList = [];
	$('input[type=checkbox]').change(function() {
		if (this.checked) {
			numList = $('input[name=check]:checked');
		} else {
			numList = $('input[name=check]:checked');
		}
		if (!$.isEmptyObject(numList)) {
			$('.badge').text(numList.length);
		} else {
			$('.badge').text(0);
		}
	});
	$('.btn_delete').click(function() {
		event.preventDefault();
		if (!$.isEmptyObject(numList)) {
			$('#delModal').modal('show');
		} else {
			alert('체크된 항목이 없습니다.');
		}
	});
	$('#btn_delOk').click(function() {
		var list=[];
		$('input[name=check]:checked').each(function(){
			list.push($(this).attr('value'));
		});
		jQuery.ajaxSettings.traditional = true;// ajax로 배열 넘길때 꼭해줘야한다.
		$.ajax({
			type : "POST",
			url : "scheduleDel",
			data : {
				'list' : list
			},
			success : function() {
				$('#delOkModal').modal('show');
			},
			error : function() {
				alert('error');
			}
		})
	});

	$('#btn_reload').click(function() {
		location.reload();
	});

	var num;
	var permit;
	$('.btn_detail').click(function() {
		event.preventDefault();
		num = $(this).attr('data-num');
		permit = $(this).attr('data-permit');
		$.ajax({
			type : "GET",
			url : "vacationDetail",
			data : {'schedule_num' : num},
			success: function(data) {
				var start = new Date(data.schedule_start_date);
				var end = new Date(data.schedule_end_date);
				start = start.getFullYear() + '-' + (start.getMonth() + 1) + '-' + (start.getDate());
				end = end.getFullYear() + '-' + (end.getMonth() + 1) + '-' + (end.getDate());
				$('#doc_name').val(data.doc_name);
				$('#depart_name').val(data.depart_name);
				$('#schedule_start_date').val(start);
				$('#schedule_end_date').val(end);
				$('#schedule_reason').val(data.schedule_reason);
				if(permit.charAt(0)=='R'){
					$('#btn_permitRefusal').attr('disabled',false);				
					$('#btn_permitOk').attr('disabled',false);				
				}else{
					$('#btn_permitRefusal').attr('disabled',true);
					$('#btn_permitOk').attr('disabled',true);
				}
			}, 
			error:function(request,status,error){
	              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	           }
		})
		$('#scheduleModal').modal('show');
	});

	$('#btn_permitOk').click(function() {
		$.ajax({
			type : "POST",
			url : "vacationPermitOk",
			data : {
				"schedule_num" : num
			},
			success : function() {
				$('#scheduleModal').modal('hide');
				$('#permitOkModal').modal('show');
			}
		});
	});
	$('#btn_permitRefusal').click(function() {
		$.ajax({
			type : "POST",
			url : "vacationPermitRefusal",
			data : {
				"schedule_num" : num
			},
			success : function() {
				$('#scheduleModal').modal('hide');
				$('#permitRefusalModal').modal('show');
			}
		});
	});
</script>