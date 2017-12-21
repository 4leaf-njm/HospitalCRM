<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/doctorSidebar.jsp"%>

<link href='<c:url value="/resources/plugins/fullcalendar/fullcalendar.min.css" />' rel='stylesheet' />
<link href='<c:url value="/resources/plugins/fullcalendar/fullcalendar.print.min.css" />' rel='stylesheet' media='print' />
<link rel="canonical" href="https://mdbootstrap.com/javascript/bootstrap-modal-form/" />
<script src='<c:url value="/resources/plugins/jQuery/jQuery-2.1.4.min.js"/>'></script>
<script src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>

<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			customButtons: {
				vacationButton: {
					text: '휴가신청',
					backgroundColor: '#ff0000',
					click: function() {
						$('#vacationModal #start_date').val('');
						$('#vacationModal #end_date').val('');
						$('#vacationModal #reason').val('');
						$('#vacationModal').modal('show');
					}
				}
			},
			footer: {
				right: 'vacationButton'
			},
			lang: 'ko',
			buttonText : {
				today: '오늘',
				month: '월',
				week: '주',
				day: '일',
				list: '목록'
			},
			titleFormat: 'YYYY년 MMMM',
			columnFormat: 'M/D ddd',
			timeFormat: 'h:mm',
			monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				var s = new Date(start);
				var e = new Date(end);
				
				var m = s.getMonth()+1;
				var d = s.getDate();
				if((m+'').length == 1) m = '0' + m;
				if((d+'').length == 1) d = '0' + d;
				s = s.getFullYear() + '-' + m + '-' + d;
				m = e.getMonth()+1;
				d = e.getDate();
				if((m+'').length == 1) m = '0' + m;
				if((d+'').length == 1) d = '0' + d;
				e = e.getFullYear() + '-' + m + '-' + d;
				
				$('#vacationModal #start_date').val(s);
				$('#vacationModal #end_date').val(e);
				$('#vacationModal').modal('show');
				
				$('#vacationModal .btn_ask').click(function(){
					if($('#vacationModal #start_date').val() == '') {
						$('#warningModal .modal-message').text('휴가일을 설정해주세요.');
						$('#warningModal').modal('show'); 
						return;
					}
					if($('#vacationModal #reason').val() == '') {
						$('#warningModal .modal-message').text('휴가 사유를 입력해주세요.');
						$('#warningModal').modal('show');
						return;
					}	
					
					var param = $('#frm_vac').serialize();
					$.ajax({
						type: 'POST',
						url: 'ajaxAskVacation',
						data: param,
						success: function(){
							$('#vacationModal').modal('hide');
							$('#successModal').modal('show');
							$('#successModal .btn_success').click(function(){
								console.log(s + ' ' + e);
								var eventData = {
										title: '휴가 승인대기',
										start: s,
										end: e,
										color: '#E0FFDB', 
										borderColor: '#86E57F',
										textColor: '#747474'
									};
								$('#calendar').fullCalendar('renderEvent', eventData, true); 
								image_load();
							});
						},
						error: function(){
							alert('error');
						}
					});
				});
				//$('#calendar').fullCalendar('unselect');
			},
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			eventLimitText: "더보기",
			dayPopoverFormat: 'MMMM D일 환자목록',
			fixedWeekCount: false,
			eventSources : [
                {
                	events : function(start, end, timezone, callback) {
                		var code = "<%=session.getAttribute("loginId")%>";
                		var event = '[';
                		$.ajax({
                			type: 'GET',
                			url: 'ajaxScheduleList',
                			data: {'doc_code' : code},
                			dataType: 'json',
                			success: function(data) {
                					for(var i=0; i<data.length; i++) {
                						var s = new Date(data[i].schedule_start_date);
                						var e = new Date(data[i].schedule_end_date);
                						
                						var m = s.getMonth()+1;
                						var d = s.getDate();
                						if((m+'').length == 1) m = '0' + m;
                						if((d+'').length == 1) d = '0' + d;
                						s = s.getFullYear() + '-' + m + '-' + d;
                						m = e.getMonth()+1;
                						d = e.getDate()+1;
                						if((m+'').length == 1) m = '0' + m;
                						if((d+'').length == 1) d = '0' + d;
                						e = e.getFullYear() + '-' + m + '-' + d;
                						
                						event += '{';
                						event += 'start: \"' + s + '\",';
                						event += 'end: \"' + e + '\",';
           	       						event += 'textColor: "#747474",'
										if(data[i].schedule_permit_yn == 'Y') {
											event += 'title: \"휴가\",';
											event += 'color: \"#FFD8D8\",';
	                						event += 'borderColor: \"#FFA7A7\"';
                						}
										else if(data[i].schedule_permit_yn == 'R'){
                							event += 'title: \"휴가 승인대기\",';
                							event += 'color: \"#E0FFDB\",';
	                						event += 'borderColor: \"#86E57F\"';
                						}
                							
                						if(data.length==1) event += '}';
                						else {
                							if(i != data.length - 1) event += '},';
                							else event += '}';
                						}
                					}
                			},
                			error: function() {
                				alert('error');
                			}
                		});		
                   		
                    	$.ajax({
           	       			type: 'GET',
           	       			url: 'ajaxReserveList',
           	       			data: {'doc_code' : code},
           	       			dataType: 'json',
           	       			success: function(data) {
           	       					for(var i=0; i<data.length; i++) {
           	       						var st = new Date(data[i].reserv_date);
           	       						var y = st.getFullYear();
           	       						var m = st.getMonth() + 1 
           	       						var d = st.getDate()
           	       						if((y+'').length == 1) y = '0' + y;
	           	       					if((m+'').length == 1) m = '0' + m;
	           	       					if((d+'').length == 1) d = '0' + d;
           	       						reserv_date = y + '-' + m + '-' + d;
           	       						
           	       						var h = st.getHours();
           	       						var m = st.getMinutes();
           	       						var s = st.getSeconds();
           	       						if((h+'').length == 1) h = '0' + h;
	           	       					if((m+'').length == 1) m = '0' + m;
	           	       					if((s+'').length == 1) s = '0' + s;
           	       						reserv_time = h + ':' + m + ':' + s;
           	       						reserv_name = data[i].mem_name;
           	       						
           	       						if(i==0) event += ',{';
           	       						else event += '{';
           	       						event += 'title: \"'+ reserv_name + ' 님' +'\",';
           	       						event += 'start: \"' + reserv_date + 'T' + reserv_time + '\",';
           	       						event += 'color: \"#AFE1FF\",';
           	       						event += 'borderColor: \"#5587ED\",';
           	       						event += 'textColor: "#747474"'
           	       						if(data.length==1) event += '}';
           	       						else {
           	       							if(i != data.length - 1) event += '},';
           	       							else event += '}';
           	       						}
           	       					}
	           	       				event += ']';
	                				event = eval(event);
	                				callback(event);
	                				
	                				image_load();
           	       			},
           	       			error: function() {
           	       				alert('error');
           	       			}
                  		});	
                   	}
                }    
            ]
		});
	});
</script>

<style>
	#calendar {
		max-width: 900px;
		margin: 60px auto;
	}
	.fc-sun {color:#e31b23}
	.fc-sat {color:#007dc3}
	.fc-day-top .fc-day-number {color: #353535}
    .fc-sun .fc-day-number { color:#FF0000; }    /* 일요일 */
    .fc-sat .fc-day-number { color:#0000FF; }     /* 토요일 */
    .fc-day-grid-event {margin: 4px 2px 0};
    .fc-event-container .fc-content > i {display: inline-block; margin-right: 5px;}
    .fc-event .fc-content {text-align: center;}
    #vacationModal i {display: inline-block; margin-right: 7px;}
    #vacationModal input[readonly="readonly"] {background: #F6F6F6;}
</style>

<section class="content-wrapper">
	<div class="content">
		<div id='calendar'></div>
	</div>
	
	
	<div class="modal fade" id="vacationModal" role="dialog"  tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 30px 30px;">
					<button type="button" class="close" data-dismiss="modal" style="margin-top: 7px;">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4><i class="fa fa-paper-plane" aria-hidden="true"></i>휴가 신청</h4>
				</div>

				<form class="form-horizontal" method="post" id="frm_vac">
					<div class="modal-body" style="padding: 40px 50px; height: 360px;">
						<input type="hidden" name="doc_code" value="${doctor.doc_code }" />
						<div class="form-group" style="display: inline-block; width: 50%;">
							<label><i class="fa fa-users" aria-hidden="true"></i>진료과</label>
							<input type="text" class="form-control" value="${doctor.depart_name }" readonly="readonly">
						</div>
						
						<div class="form-group" style="display: inline-block; width: 50%; margin-left: 40px;">
							<label><i class="fa fa-user-md" aria-hidden="true"></i>성 명</label>
							<input type="text" class="form-control" value="${doctor.doc_name }" readonly="readonly">
						</div>
						
						<div class="form-group" style="display: inline-block; width: 50%">
							<label><i class="fa fa-calendar" aria-hidden="true"></i>휴가 시작일</label>
							<input type="text" class="form-control" id="start_date" name="start_date" readonly="readonly">
						</div>
						
						<div class="form-group" style="display: inline-block; width: 50%; margin-left: 40px; position: relative;">
							<label>
								<i class="fa fa-calendar" aria-hidden="true"></i>휴가 종료일
								<button type="button" class="btn btn-primary btn-xs" id="date_setting" style="position:absolute; top: 0; right: 0;">설 정</button>							
							</label>
							<input type="text" class="form-control" id="end_date" name="end_date" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label><i class="fa fa-pencil" aria-hidden="true"></i>휴가 사유</label> 
							<textarea rows="5" cols="30" class="form-control" id="reason" name="schedule_reason" style="resize: none"></textarea>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success btn_ask" >
							<i class="fa fa-check" aria-hidden="true"></i>신 청
						</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times" aria-hidden="true"></i>취 소
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">휴가신청 완료</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">휴가신청이 완료되었습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn_success" data-dismiss="modal">확인</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="warningModal" tabindex="-1" role="dialog" aria-hidden="true">
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
						<p class="modal-message"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script src='<c:url value="/resources/plugins/fullcalendar/moment.min.js" />'></script>
<script src='<c:url value="/resources/plugins/fullcalendar/fullcalendar.min.js" />'></script>

<script>
	$('#date_setting').click(function(){
		$('#vacationModal').modal('hide');
	});

	function image_load() {
		$('.fc-event-container .fc-content').each(function(){
			var title = $(this).find('.fc-title').text();
			if(title.indexOf('승인대기') > -1) 
				$(this).prepend('<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>');
			else if(title.indexOf('휴가') > -1)
				$(this).prepend('<i class="fa fa-check-circle-o" aria-hidden="true"></i>');
			else
				$(this).prepend('<i class="fa fa-stethoscope" aria-hidden="true"></i>');
		});
	}
</script>