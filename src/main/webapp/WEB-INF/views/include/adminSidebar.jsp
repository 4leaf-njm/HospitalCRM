<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="sidebar-wrapper">
	<aside class="main-sidebar">
	  <!-- sidebar: style can be found in sidebar.less -->
	  <section class="sidebar">
	    <!-- Sidebar Menu -->
	    <ul class="sidebar-menu" data-widget="tree">
	      <li class="header"><h3><strong>관리자</strong></h3></li>
	      <li class="treeview">
	        <a href="#"><span>회원목록</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	        <ul class="treeview-menu">
	          <li><a href="<c:url value='/admin/memberList' />">전체사용자목록</a></li>
	          <li><a href="<c:url value='/admin/doctorList' />">전체의료진목록</a></li>
	        </ul>
	      </li>
	      <li class="treeview">
	        <a href="<c:url value='/commons/doctorJoin' />"><span>의료진회원가입</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	      <li class="treeview">
	        <a href="<c:url value='/admin/vacationPermit' />"><span>의료진휴가승인</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	      </li>
	      <li class="treeview">
	        <a href="#"><span>탈퇴승인</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	        <ul class="treeview-menu">
	          <li><a href="<c:url value='/admin/memberDelPermit' />">사용자탈퇴승인</a></li>
	          <li><a href="<c:url value='/admin/doctorDelPermit' />">의료진탈퇴승인</a></li>
	        </ul>
	      </li>
	    </ul>
	    <!-- /.sidebar-menu -->
	  </section>
	  <!-- /.sidebar -->
	</aside>
</section>