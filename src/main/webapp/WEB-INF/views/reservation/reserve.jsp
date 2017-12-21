<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/reserveSidebar.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reserve.css'/>">

 <section class="content-wrapper">
 	<div class="content">
		<div class="section-heading">
			<h4 class="section-heading-title">진료예약</h4>
		</div>
		<div class="user_info_area">
			<div class="left">
				<h4>환 자 정 보<i class="fa fa-hand-o-right" aria-hidden="true"></i></h4>
			</div>
			<div class="user_info">
				<ul class="info_list">
					<li>이름 : ${member.mem_name }</li>
					<li>환자번호 : ${member.mem_pcode }</li>
					<li>핸드폰번호 : ${member.mem_phone }</li>
					<li>이메일주소 : ${member.mem_email }</li>
				</ul>
				<div class="comment_text">
					<p>
						※ 개인정보 수정이 필요하시면 <span class="mypage">'마이페이지>개인정보>기본정보'</span>에서 수정하시기 바랍니다.
						<a href="#" class="btn"><i class="fa fa-pencil" aria-hidden="true"></i>바로가기</a>
					</p>
				</div>
			</div>
		</div>
		<div class="reserve_type">
			<a href="#" class="btn_online">
				<strong>직접 예약</strong>
				<p>직접 선택하신 의료진의 진료일정을<br />확인하실 수 있습니다.</p>
			</a>
			<a href="#" class="btn_counsel">
				<strong>상담 예약</strong>	
				<p>전문상담원이<br />의료진 추천을 도와 드립니다.</p>
			</a>
		</div>
		<div class="reserve_wrap">
			<ol class="steps_box">
				<li class="reser_step1">
					<p class="step_title">
						<span>STEP 1</span> <br />
						<strong>진료과 및 의료진 선택</strong>
					</p>
					<div class="detail_section" id="step1">
						<div class="flag_tab">
							<a href="#" class="dept on">진료과로 예약</a>
							<a href="#" class="doct">의료진으로 예약</a>
						</div>
						<div class="dept_list01">
							<div class="dept_list01_sel_wrap">
								<ul class="dept_list01_sel">
									<!-- 진료과 리스트 -->
								</ul>
							</div>
						</div>
						<div class="dept_list02" style="display: none;">
							<div class="outer_dept_sel">
								<p class="dept_sel_title">
									<a href="#"><span class="title_selected"></span></a>
								</p>
								<div class="dept_list02_sel_wrap" style="display: none;">
									<div class="inner_dept_area">
										<ul class="dept_list02_sel">
											<!-- <li><a href="javascript:deptSel2('가정의학과')"><strong>가정의학과</strong></a></li>
											<li><a href="javascript:deptSel2('비뇨기과')"><strong>비뇨기과</strong></a></li>
											<li><a href="#"><strong>산부인과</strong></a></li> -->
										</ul>
									</div>
								</div>
							</div>
							<div class="outer_doctorlist nano">
								<div class="nano-content" id="deptDoctor">
									<%-- <div class="card-item doctor-profile">
										<article class="card-content">
											<section class="card-item-inner">
												<a href="javascript:show_step2('홍길동')" id="107012">
													<div class="card-content-img">
														<img src='<c:url value="/upload/doctor/10000000.jpg" />' alt="홍길동" />
														<div class="masking"></div>
													</div>
													<div class="card-content-textarea">
														<h3 class="card-content-title">
															<span class="doc_name">홍길동</span>
															<span>교수</span>
															<span class="dept_name">[이비인후과]</span>
															<span class="checked"></span>
														</h3>
														<h4 class="card-field-title">[진료분야]</h4>
														<p class="card-content-text">
															척추염, 림프절염, 감염성 내막염, 폐렴, 관절염, 척추염, 림프절염, 감염성 내막염, 폐렴, 관절염, 척추염, 림프절염, 감염성 내막염, 폐렴, 관절염, 척추염, 림프절염, 감염성 내막염, 폐렴, 관절염, 척추염, 림프절염, 감염성 내막염, 폐렴, 관절염, 척추염, 림프절염, 감염성 내막염, 폐렴, 관절염
														</p>
													</div>
												</a>
											</section>
										</article>
									</div>  --%>
									
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="reser_step2">
					<p class="step_title">
						<span>STEP 2</span> <br />
						<strong>날짜 선택</strong>	
					</p>
					<div class="detail_section" id="step2">
						<div class="outer_detail_date">
							<p class="date_choice_year"></p>
							<p class="date_choice_month">
								<a href="javascript:month('201711', -1)" class="btn_show_month btn_show_prevmonth"></a>
								<strong></strong>
								<a href="javascript:month('201711', 1)" class="btn_show_month btn_show_nextmonth"></a>
							</p>
							<div class="outer_datelist01 nano">
								<div class="nano-content">
									<ul>
										<!-- 예약 날짜 리스트 -->
									</ul>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="reser_step3">
					<p class="step_title">
						<span>STEP 3</span> <br />
						<strong>시간 선택</strong>
					</p>
					<div class="detail_section" id="step3">
						<div class="outer_detail_time">
							<div class="outer_timelist01 nano">
								<div class="nano-content" style="right: -17px;">
									<ul>
										<!-- 예약 시간 리스트 -->
									</ul>
								</div>
							</div>
							<div class="wrap_txtCause_field">
								<p class="tit_head">
									<strong>진료예약사유</strong>
									<span>(30자이내)</span>
								</p>
								<div class="innerWrap_txtCause">
									<p class="txt_placeholder">예약사유를 간단하게 입력해주세요.</p>
									<textarea id="dummyMemoCtn" cols="2" rows="2" maxlength="30"></textarea>
								</div>
							</div>
							<div class="outer_final_btn">
								<a href="#" class="btn_reserve" data-pcode="${sessionScope.pcode }">예약하기</a>
								<a href="javascript:reset_to_step1();" class="btn_reset">다시 선택</a>
							</div>
						</div>
					</div>
				</li>
			</ol>
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
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<p class="modal-message"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-yes" data-dismiss="modal">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-warning">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<p class="modal-message"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn_check" data-dismiss="modal">확인</button>
					</div>
				</div> 
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
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<p class="modal-message"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-success" data-dismiss="modal">확인</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-warning">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<p class="modal-message"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-yes" data-dismiss="modal">예</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
</section>
</body>
<!-- /.content -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
	var cur_date = new Date();
	var cur_year = cur_date.getFullYear();
	var cur_month = cur_date.getMonth()+1;
	
	if(cur_month.length == 1)
		cur_month = "0" + cur_month;
	
	function deptSel1(code, name) {
		$.ajax({
			type : "POST",
			url : "ajaxDoctorList",
			dataType : "html",
			data : {'depart_code' : code},
			success : function(data) {
				$('#deptDoctor').html(data);
				
				ajaxDoctorOn();
			}
		});
		
		$('.title_selected').text(name);
		$('.dept_list01').hide();
		$('.dept_list02').show();
	}
	
	function deptSel2(code, name) {
		$.ajax({
			type : "POST",
			url : "ajaxDoctorList",
			dataType : "html",
			data : {'depart_code' : code},
			success : function(data) {
				$('#deptDoctor').html(data);
				
				ajaxDoctorOn();
			}
		});
		
		$('.outer_detail_date').hide();
		$('.outer_detail_time').hide();
		$('.title_selected').text(name);
		$(".dept_sel_title>a").toggleClass('on');
		$('.dept_list02_sel_wrap').hide();
	}
	
	function show_step2(code) {
		
	}
	
	function show_step3(date) {
		
	}
	
	function month(sel_date, move_no) {
		var start_month = cur_date.getMonth() + 1;
		var end_month = (cur_date.getMonth() + 5) >= 12 ? (cur_date.getMonth() + 5) - 12 : (cur_date.getMonth() + 5);
		
		var sel_year = sel_date.substr(0, 4);
		var sel_month = sel_date.substr(4, 2);
		
		if(sel_month == 12 && move_no == 1) {
			sel_year = parseInt(sel_year) + 1;
			sel_month = 0;
		}
		
		if(sel_month == 1 && move_no == -1) {
			sel_year = parseInt(sel_year) -1;
			sel_month = 13;
		}
		
		var m = parseInt(sel_month) + move_no;
		if((''+m).length == 1)
			m = '0' + m;
		
		date_move(sel_year, m);
		
		if(parseInt(m) == start_month)
			$('.btn_show_prevmonth').css('visibility', 'hidden');
		else
			$('.btn_show_prevmonth').css('visibility', 'visible');
		
		if(parseInt(m) == end_month)
			$('.btn_show_nextmonth').css('visibility', 'hidden');
		else
			$('.btn_show_nextmonth').css('visibility', 'visible');
	}
	
	function timeSelect() {
		
	}
	
	$('.btn_reserve').click(function(event){
		event.preventDefault();
		
		if(!$('.outer_timelist01 li > a').hasClass('on')) {
			$('#checkModal .modal-title').text('예약 확인');
			$('#checkModal .modal-message').text('예약 시간을 선택해주세요.');
			$('#checkModal').modal('show');
			return;
		}
		
		$('#yesnoModal .modal-title').text('예약 확인');
		$('#yesnoModal .modal-message').text('선택하신 사항으로 예약 하시겠습니까 ?');
		$('#yesnoModal .btn-yes').click(function(){
			goReservation();
		});
		$('#yesnoModal').modal('show');
	});
		
	function goReservation () {
		var doc_code = $('.card-item span.on').parents('a').attr('id');
		var reser_day = $('.outer_datelist01 li > a.on').attr('id');
		var reser_time = $('.outer_timelist01 li > a.on').text();
		var reser_date = reser_day + ' ' + reser_time + ':00';
		var reason = $('.innerWrap_txtCause textarea').val();
		
		var params = {
				'doc_code':doc_code,
				'mem_pcode': $('.btn_reserve').data('pcode'),
				'reserv_date':reser_date,
				'reserv_symptom':reason
		};
		$.ajax({
			type : 'POST',
			url : 'reserve',
			data: params,
			success: function(data) {
				$('#successModal .modal-title').text('예약 완료');
				$('#successModal .modal-message').text('예약이 완료되었습니다.');
				$('#successModal').modal('show');
				$('#successModal .btn-success').click(function(){
					location.reload();
				});
			}
		});
	}
	
	function reset_to_step1() {
		$('#cancelModal .modal-title').text('안내');
		$('#cancelModal .modal-message').text('선택하신 모든 예약 내용이 초기화됩니다. \n진행하시겠습니까?');
		$('#cancelModal .btn-yes').click(function() {
			$('.outer_detail_date').hide();
			$('.outer_detail_time').hide();
			$('.dept_list02').hide();
			$('.dept_list01').show()
			$('.innerWrap_txtCause textarea').val('');
		});
		$('#cancelModal').modal('show');
	}
	
	function date_move (year, month) {
		var html = '';
		
		html += '<a href=\"javascript:month(\'' + year + month + '\', -1)\" class=\"btn_show_month btn_show_prevmonth\"></a>';
		html += '<strong></strong>';
		html += '<a href=\"javascript:month(\'' + year + month + '\', 1)\" class=\"btn_show_month btn_show_nextmonth\"></a>';
		
		$('.date_choice_year').text(year);
		$('.date_choice_month').html(html);
		$('.date_choice_month > strong').text(month);
		
		date_load(year, month);
	}
	
	function date_load(year, month) {
		var days = ['일', '월', '화', '수', '목', '금', '토'];
		var start_date = new Date(year, month, 1).getDate();
		var end_date = new Date(year, month, 0).getDate();
		var html = '';
		
		var doc_code = $('.card-item span.on').parents('a').attr('id');
		var s_date = year + '-' + month;
	
		$.ajax({
			type : "POST",
			url : "reserveDate",
			data : {'doc_code' : doc_code, 's_date' : s_date},
			dataType : 'json',
			success : function(data) {
				for(var i=start_date; i<=end_date; i++){
					if((''+i).length == 1)
						i = '0' + i;
					
					var day = new Date(year, month-1, i).getDay();
					html += '<li><a href=\"javascript:show_step3(\'' + year + month + i + '\')\" id=\"' + year + '-' + month + '-' + i + '\">' + i + '&nbsp;' + days[day] + '</a></li>';
				}
				
				$('.outer_datelist01 ul').html(html);
				
				for(var i=0; i<data.length; i++) {
					var s_date = new Date(data[i].schedule_start_date);
					var e_date = new Date(data[i].schedule_end_date);
					
					var s_month = s_date.getMonth() + 1;
					var e_month = s_date.getMonth() + 1;
					
					var s_day = s_date.getDate();
					var e_day = e_date.getDate();
					
					if(s_month < e_month) e_day = end_date;
					
					for(var j=s_day; j<=e_day; j++) {
						$('.outer_datelist01 ul li').each(function() {
							var day = parseInt($(this).text().substr(0, 2));
							var week = $(this).text().substr(3, 1);
							if(j == day) {
								if((''+j).length == 1) j = '0' + j;
								var html = '<span class="disabled" title="진료일이 아님"><span class=\"dis_txt\">휴무</span>' + j + '&nbsp;' + week + '</span>'
								$(this).html(html);
							}
						});
					}
				}
				dateClickEvent();
			},
			error : function () {
				alert('error');
			}
		});
	}
	
	function time_load() {
		var times = new Array();
		
		var h = 9;
		var m = 0;
		
		while(true) {
			if(parseInt(h) == 5) break;
			if(parseInt(h) == 1) {h = 2; continue;}
			
			if((''+h).length == 1) 
				h = '0' + h;
			if((''+m).length == 1)
				m = '0' + m;
			
			var time = h + ':' + m;
			times.push(time);
			
			m = parseInt(m) + 30;
			if(parseInt(m) >= 60) {
				m = parseInt(m)- 60;
				h = parseInt(h) + 1;	
			}
			if(parseInt(h) > 12) h = 1;
		}
		var doc_code = $('.card-item span.on').parents('a').attr('id');
		var reser_day = $('.outer_datelist01 li > a.on').attr('id');

		$.ajax({
			type : 'GET',
			url : 'reserveTime',
			dataType : 'json',
			data : {'doc_code' : doc_code, 'reserv_date' : reser_day},
			success : function(data){
				var html = '';
				var flag = true;
				
				for(var i=0; i<times.length; i++){
					flag = true;
					for(var j=0; j<data.length; j++) {
						if(data[j].indexOf(times[i]) > -1){
							flag = false;
							break;
						}
					}
					if(flag) 
						html += '<li><a href="#">' + times[i] + '</a></li>';
					else
						html += '<li><span class=\"disabled\">' + times[i] + '</span></li>';  
				}
				
				$(".outer_timelist01 ul").html(html);
				timeClickEvent();
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		     }
		});
	}
</script>

<script>
	$('.reserve_type > a').hover(function(){
		$(this).addClass('on');
	}, function(){
		$(this).removeClass('on');
	});
	
	$('.reserve_type > .btn_online').click(function(event){
		event.preventDefault();
		
		$.ajax({
			type : "GET",
			url : "ajaxDepartList",
			dataType : "html",
			success : function(data) {
				$('.dept_list01_sel').html(data);
			}
		});
		$(this).parent().hide();
		$('.reserve_wrap').show();
	});
	
	$('.flag_tab > a').click(function(event){
		event.preventDefault();
		$('.flag_tab > a').each(function(){
			$(this).removeClass('on');
		});
		$(this).addClass('on');
	});
	
	$('.dept_sel_title > a').click(function(event){
		event.preventDefault();
		$(this).toggleClass('on');
		
		if($(this).hasClass('on')) {
			$.ajax({
				type : "GET",
				url : "ajaxDepartList2",
				dataType : "html",
				success : function(data) {
					$('.dept_list02_sel').html(data);
					ajaxDoctorOn();
				}
			});
			
			$('.dept_list02_sel_wrap').show();
		}else {
			$('.dept_list02_sel_wrap').hide();
		}
	});
	
	function ajaxDoctorOn() {
		$('.card-item a').click(function(){
			$('.btn_show_prevmonth').css('visibility', 'hidden');
			
			$('span.checked').each(function(){
				$(this).removeClass('on');
			});
			$(this).find('span.checked').addClass('on');
			date_move(cur_year, cur_month);
			$('.outer_detail_date').show();
		});
	}
	function dateClickEvent() {
		$('.outer_datelist01 li > a').click(function(){
			$('.outer_datelist01 li > a').each(function(){
				$(this).removeClass('on');
			});
			$(this).addClass('on');
			time_load();
			$('.outer_detail_time').show();
		});
	}
	
	function timeClickEvent() {
		$('.outer_timelist01 li > a').click(function(event){
			event.preventDefault();
			
			$('.outer_timelist01 li > a').each(function(){
				$(this).removeClass('on');
			});
			$(this).addClass('on');
		});
	}
	
	$('.innerWrap_txtCause textarea').click(function(){
		$(this).parent().find('.txt_placeholder').hide();
	});
	
</script>

<c:if test="${empty sessionScope.loginUser }">
	<script>
		$(document).ready(function(){
			$('#checkModal .modal-title').text('안내');
			$('#checkModal .modal-message').text('로그인이 필요한 서비스입니다.');
			$('#checkModal').modal('show');
			$('#checkModal .btn_check').click(function(){
				location.href="<c:url value='/commons/login'/>";
			});
		});
	</script>
</c:if>