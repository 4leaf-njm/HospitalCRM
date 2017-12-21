<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href='<c:url value="/resources/css/commons/index.css"/>'>

<section class="content">
	<div class="index_box">
		<div class="doctor_box">
			<div class="inner-wrap inner-wrap-renew crucial_inter_qlist clearfix">

				<section class="medical_info_area clearfix">
					<h3 class="visuallyhidden">의료진 검색 및 진료 예약신청, 조회</h3>
					<ul class="customer_interaction_list">
						<li class="doctor_dept_srch clickparent">
							<div class="inner_clickparent type02">

								<form action="#" method="post" name="mainSearch" target="_blank">
									<h4>
										<span class="visuallyhidden">의료진/진료과 검색</span>
									</h4>
									<div class="none_block_box first">
										<p class="desc">
											진료 전, 삼성서울병원 <br>전문의료진을 검색해보세요
										</p>
										<button type="button" class="btn_itr_srch">검색</button>
									</div>
									<div class="none_block_box second off">
										<input type="text" name="query" id="query"
											placeholder="의료진/진료과"
											onkeyup="chkInputSC(this.value, this.id);" /> <a href="#"
											class="btn_srch_doc"><span class="visuallyhidden">검색</span></a>
									</div>
									<div class="doctor_srch_list showing_wrapperbox"
										style="display: none"></div>
								</form>

							</div>
						</li>
						<li class="online_reser_frm clickparent">
							<div class="inner_clickparent">
								<h4>
									<span class="visuallyhidden">온라인 예약신청</span>
								</h4>

								<p class="desc descsrch">진료 예약을 편리하게 하실 수 있습니다.</p>
								<a href="<c:url value='/reservation/reserve' />" class="btn_itr_srch">진료예약</a>
								<div class="online_reservation_frmlist showing_wrapperbox"
									style="display: none"></div>
							</div>
						</li>
						<li class="quick_online_reser clickparent">
							<div class="inner_clickparent">
								<form action="#" method="post" name="main_reservation">
									<h3>
										<span>진단서 발급</span>
									</h3>
									<p class="desc descbox">진단서 발급을 편리하게 하실 수 있습니다.</p>
									<a href="#" class="btn_itr_srch type02">발급신청</a>
									<div class="online_reservation_frmlist showing_wrapperbox"
										style="display: none"></div>
								</form>
							</div>
						</li>
					</ul>
				</section>

				<section class="crucial_pages_links clearfix">
					<h3 class="visuallyhidden">진료 링크</h3>
					<ul class="customer_interaction_list customer_interaction_list02">

						<li class="outer_exam_history exam_history_type01">
						   <a href="<c:url value='/reservation/reserveSearch?pcode=${sessionScope.pcode }' />">
								<h4>
									<span class="visuallyhidden">진료예약조회</span>
								</h4>
								<p class="desc desc_type02">
									나의 진료일정을 <br>확인해보세요
								</p>
						</a></li>


						<li class="outer_exam_history exam_history_type02"
							style="border-left: 1px solid #005000">
							<a href="<c:url value='/reservation/diagSearch?pcode=${sessionScope.pcode }' />">
								<h4>
									<span class="visuallyhidden">진료내역조회</span>
								</h4>
								<p class="desc desc_type02">
									삼성서울병원에서<br>진료 받으셨던 내역을 조회해보세요
								</p>
						</a></li>

					</ul>
				</section>
			</div>
		</div>


		<div class="wrapper_using_bodywidth">
			<div class="inner-wrap inner-wrap-renew outer_notice_etc clearfix">
				<section class="wrap_news_notice">
					<h4>공지 &middot; 사항</h4>
					<ul class="news_notice_list">
						
						<li><a href="#"> <span class="item99">공지</span>
									<p class="nntxt">12월 25일(토) 월요진료 휴진 안내</p>
									<p class="date">17/11/21</p>
						</a></li>
						
						<li><a href="#"> <span class="item99">공지</span>
									<p class="nntxt">병원 개인정보처리방침 개정 공지 - 2017년 11월 25일</p>
									<p class="date">17/11/21</p>
						</a></li>
						<li><a href="#"> <span class="item99">공지</span>
									<p class="nntxt">우리병원 처음예약 하실 분</p>
									<p class="date">17/11/21</p>
						</a></li>
						<li><a href="#"> <span class="item99">공지</span>
									<p class="nntxt">시스템 개선에 따른 홈페이지 일시 중단 안내</p>
									<p class="date">17/11/21</p>
						</a></li>
						<li><a href="#"> <span class="item99">공지</span>
									<p class="nntxt">빠른쾌유를 돕는 환자참여 4가지 방법</p>
									<p class="date">17/11/21</p>
						</a></li>
					</ul>
					<a href="#" class="btn_goto_more">더보기</a>
				</section>

				<section class="wrap_cv_guide">
					<h4>편의가이드</h4>
					<ul class="cv_guide_list">
						<li><a href="#"> <span class="page_tit">오시는 길</span></a></li>

						<li class="hospitalizationInfo"><a href="<c:url value='/share/qna' />"> <span
								class="page_tit">묻고 답하기</span></a></li>

						<li><a href="#"> <span class="page_tit">만족도 조사</span></a></li>

						<li><a href="#"> <span class="page_tit line_2">건의
									사항 </span></a></li>

						<li><a href="#"> <span class="page_tit">자주하는<br />질문
							</span></a></li>
					</ul>
				</section>

			</div>
		</div>
	</div>

</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>


<script type="text/javascript">
	//<![CDATA[
	$(document)
			.ready(
					function() {
						$('.customer_interaction_list .inner_clickparent')
								.mouseleave(
										function() {//마우스 나갈때
											if (!$(this).hasClass('type02')) {
												$(this).parents('.clickparent')
														.removeClass('on')
											} else if ($(this).hasClass(
													'type02')) {//진료과/의료진검색에서 나갈때
												if ($(this).parents(
														'.clickparent')
														.hasClass('on'))//검색클릭한 상태에서 나갈때
												{
													$(
															'.doctor_dept_srch .none_block_box.second')
															.addClass('off');//초기화

													$(
															'.doctor_dept_srch .none_block_box.first')
															.removeClass('off');//초기화

													$(this).parents(
															'.clickparent')
															.removeClass('on');

													$(
															'.doctor_dept_srch .none_block_box.second input')
															.blur();
												} else if ($(this).parents(
														'.clickparent')
														.hasClass('onfirst')) {//처음에 오버된 상태에서 나갈때

													$(this).parents(
															'.clickparent')
															.removeClass(
																	'onfirst');
												}
											}
										});
						$('.customer_interaction_list .inner_clickparent')
								.mouseenter(
										function() {//마우스 오버시
											if (!$(this).hasClass('type02'))//
											{
												$(this).parents('.clickparent')
														.addClass('on');
											}
											if ($(this).parents('.clickparent')
													.hasClass(
															'doctor_dept_srch'))//진료과/의료진검색 경우
											{
												if (!$(this).parents(
														'.clickparent')
														.hasClass('on'))//검색클릭 안 한 상태에서만 처리
												{
													$(this)
															.parents(
																	'.clickparent')
															.addClass('onfirst');
												}
											}
											$(
													'.customer_interaction_list .userinput_tel')
													.blur();
										});

						$(
								'.customer_interaction_list .doctor_dept_srch .btn_itr_srch')
								.click(
										function() {//진료과 의료진 검색 클릭시
											$(this).parents('.clickparent')
													.siblings('li')
													.removeClass('on');
											$(this).parents('.clickparent')
													.removeClass('onfirst')
													.addClass('on');
											$(
													'.doctor_dept_srch .none_block_box.second.off')
													.removeClass('off');
											$(
													'.doctor_dept_srch .none_block_box.first')
													.addClass('off');
											$(
													'.customer_interaction_list .userinput_tel')
													.blur();
										});
					});
	//]]>
	
	$(".medical_info_area li").hover(function(){
		$(this).addClass('on');
	}, function(){
		$(this).removeClass('on');
		if($(this).hasClass('onfirst'))
			$(this).removeClass('onfirst');
	});
</script>