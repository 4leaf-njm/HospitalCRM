<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />'>
  
  <!-- Font Awesome -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <!-- Ionicons -->
  <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
  
  <!-- Theme style -->
  <link rel="stylesheet" href='<c:url value="/resources/dist/css/AdminLTE.min.css"/>'>
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href='<c:url value="/resources/dist/css/skins/skin-blue.min.css"/>'>
  <link rel="stylesheet" href='<c:url value="/resources/dist/css/skins/_all-skins.min.css"/>'>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
  <!-- NanumBarunGothic Font -->
  <link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
  
  <!-- custom css -->
  <link rel="stylesheet" href='<c:url value="/resources/css/commons/commons.css"/>'>
  
  <script src='<c:url value="/resources/plugins/jQuery/jQuery-2.1.4.min.js"/>'></script>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

<script>
	$(document).ready(function(){
		$('.btn-logout').click(function(e){
			e.preventDefault();
			
			var url = $(this).attr('href');
			$('#logoutModal').modal('show');
			$('#logoutModal button').click(function(){
				location.href = url;
			});
		});
	});
</script>

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
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div> 
		</div>
	</div>
</div>

	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">안내</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">로그아웃 되었습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>
				</div> 
			</div>
		</div>
	</div>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">
    <!-- Logo -->
    <a href='<c:url value="/"/>' class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>대전중앙</b>병원</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top nav-main" role="navigation">
     <!-- Navbar Left Main Menu -->
      <ul class="nav navbar-nav">
      	<li class="dropdown">
	      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><strong>병원안내</strong><span class="caret"></span></a>
	      <ul class="dropdown-menu" role="menu">
	        <li><a href="#"><strong>병원소개</strong></a></li>
	        <li><a href="<c:url value='/info/notice' />"><strong>공지사항</strong></a></li>
	        <li><a href="#"><strong>찾아오시는길</strong></a></li>
	      </ul>
	    </li>
	    <li class="dropdown">
	      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><strong>진료과/의료진</strong><span class="caret"></span></a>
	      <ul class="dropdown-menu" role="menu">
	        <li><a href="#"><strong>진료과 소개</strong></a></li>
	        <li><a href="#"><strong>의료진 소개</strong></a></li>
	      </ul>
	    </li>
	    <li class="dropdown">
	      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><strong>예약 및 조회</strong><span class="caret"></span></a>
	      <ul class="dropdown-menu" role="menu">
	        <li><a href='<c:url value="/reservation/reserve?mem_id=${sessionScope.loginId }" />'><strong>진료예약</strong></a></li>
	        <li><a href="<c:url value='/reservation/reserveSearch?pcode=${sessionScope.pcode }'/>"><strong>예약조회 및 취소</strong></a></li>
	        <li><a href="<c:url value='/reservation/diagSearch?pcode=${sessionScope.pcode }' />"><strong>진료내역 조회</strong></a></li>
	      </ul>
	    </li>
	    <li class="dropdown">
	      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><strong>나눔소통</strong><span class="caret"></span></a>
	      <ul class="dropdown-menu" role="menu">
	        <li><a href="<c:url value='/share/qna' />"><strong>묻고답하기</strong></a></li>
	        <li><a href="#"><strong>자주하는질문</strong></a></li>
	      </ul>
	    </li>
	    <c:if test="${sessionScope.loginUser eq 'admin' }">
    	<li class="dropdown">
	      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><strong>관리자</strong><span class="caret"></span></a>
	      <ul class="dropdown-menu" role="menu">
	        <li><a href="<c:url value='/admin/memberList' />"><strong>회원 목록</strong></a></li>
	        <li><a href="<c:url value='/admin/memberDelPermit' />"><strong>회원 탈퇴승인</strong></a></li>
	        <li><a href="<c:url value='/admin/doctorList' />"><strong>의료진 목록</strong></a></li>
	        <li><a href="<c:url value='/admin/vacationPermit' />"><strong>의료진 휴가승인</strong></a></li>
	        <li><a href="<c:url value='/admin/doctorDelPermit' />"><strong>의료진 탈퇴승인</strong></a></li>
	        <li><a href="<c:url value='/commons/doctorJoin' />"><strong>의료진 회원가입</strong></a></li>
	      </ul>
	    </li>
	    </c:if>
      </ul>
      
	       <div class="navbar-custom-menu">
	       <c:choose>
          	 <c:when test="${empty sessionScope.loginId }">
	          	<div class="btn_box" style="margin-top: 7px;">
	          		<a href="<c:url value='/commons/login' />" class="btn btn-primary" style="margin-right: 5px;">로그인</a>
	          		<a href="<c:url value='/commons/memberJoin' />" class="btn btn-primary" style="margin-right: 10px;">회원가입</a>
	          	</div>
          	 </c:when>
        	<c:otherwise>
	         <ul class="nav navbar-nav">
	           <li class="dropdown notifications-menu">
	             <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               <i class="fa fa-bell-o"></i>
	               <span class="label label-warning">1</span>
	             </a>
	             <ul class="dropdown-menu">
	               <li class="header" style="font-size: 13px;"><strong>1 개의 알림이 있습니다.</strong></li>
	               <li>
	                 <ul class="menu">
	                   <li>
	                    <a href="#">
	                      <i class="fa fa-users text-aqua"></i> 
	                      <span style="font-size: 10px;">홍길동 님이 11월 2일 오후 5시에 예약하였습니다.</span>
	                    </a>
	                  </li>
	                </ul>
	              </li>
	              <li class="footer"><a href="#">모두 지우기</a></li>
	            </ul>
	          </li>
          		
          	  <li class="dropdown user user-menu" style="width: 170px;">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	              <c:if test="${sessionScope.loginUser eq 'member' }"> 
	                <strong class="hidden-xs" style="font-size: 15px;">${sessionScope.loginVO.mem_name}</strong>&nbsp;&nbsp;<small style="font-size: 13px;">사 용 자</small>
	              </c:if>
	              <c:if test="${sessionScope.loginUser eq 'doctor' }"> 
	              	<img src='<c:url value="/upload/doctor/${sessionScope.loginVO.doc_image }"/>' class="user-image">
	                <strong class="hidden-xs" style="font-size: 15px;">
	           	     <c:out value="${sessionScope.loginVO.doc_name}" />
	                </strong>&nbsp;&nbsp;<small style="font-size: 13px;">의 료 진</small>
	              </c:if>
	              <c:if test="${sessionScope.loginUser eq 'admin' }"> 
	                <strong class="hidden-xs" style="font-size: 15px; text-indent: 10px; display:inline-block;">
						<c:out value="${sessionScope.loginVO.admin_name}" />
					</strong>&nbsp;&nbsp;<small style="font-size: 13px;">관 리 자</small>
	              </c:if>
	            </a>
	            <ul class="dropdown-menu">
	              <li class="user-header" style="height: 150px;">
	              	<c:if test="${sessionScope.loginUser eq 'member' }">
	              		<p style="margin-top: 35px;"><strong style="font-size: 14px;"> ${sessionScope.loginVO.mem_name} &nbsp; 님 </strong></p>
	              		<p>환영합니다.</p>
	              	</c:if>
	              	<c:if test="${sessionScope.loginUser eq 'doctor' }">
		              	<img src='<c:url value="/upload/doctor/${sessionScope.loginVO.doc_image }"/>' class="img-circle">
		                <p><strong style="font-size: 14px;"> ${sessionScope.loginVO.depart_name }&nbsp;&nbsp;&nbsp;${sessionScope.loginVO.doc_name}</strong></p>
	              	</c:if>
	              	<c:if test="${sessionScope.loginUser eq 'admin' }">
	              		<p style="margin-top: 35px;"><strong style="font-size: 14px;"> ${sessionScope.loginVO.admin_name} &nbsp; 님</strong></p>
	              		<p>환영합니다.</p>
	              	</c:if>
	              </li>
	              <li class="user-footer text-center">
	                <div style="display: inline-block;">
	                <c:if test="${sessionScope.loginUser eq 'member' }">
	              		<a href="<c:url value='/mypage/mem/memberRemoveInfo?mem_id=${sessionScope.loginId }' />" class="btn btn-default btn-flat btn-sm">마이페이지</a> &nbsp;
	              	</c:if>
	              	<c:if test="${sessionScope.loginUser eq 'doctor' }">
	              		<a href="<c:url value='/mypage/doc/mySchedule?doc_code=${sessionScope.loginId }' />" class="btn btn-default btn-flat btn-sm">마이페이지</a> &nbsp;
	              	</c:if>
	              	<c:if test="${sessionScope.loginUser eq 'admin' }">
	              		<a href="#" class="btn btn-default btn-flat btn-sm">마이페이지</a> &nbsp;
	              	</c:if>
	                </div>
	                <div style="display: inline-block;">
	                  <a href="<c:url value='/commons/logout' />" class="btn btn-default btn-flat btn-sm btn-logout">로그아웃</a>
	                </div>
	              </li>
	            </ul>
	          </li>
        </ul>
       </c:otherwise>
   </c:choose>
      </div>
    </nav>
  </header>