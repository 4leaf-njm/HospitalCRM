<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="sidebar-wrapper">
	<aside class="main-sidebar">
	  <!-- sidebar: style can be found in sidebar.less -->
	  <section class="sidebar">
	    <!-- Sidebar Menu -->
	    <ul class="sidebar-menu" data-widget="tree">
	      <li class="header"><h3><strong>예약 및 조회</strong></h3></li>
	      <li class="treeview">
	        <a href="<c:url value='/reservation/reserve?mem_id=${sessionScope.loginId }' />"><span>진료예약</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	      <li class="treeview">
	        <a href="<c:url value='/reservation/reserveSearch?pcode=${sessionScope.pcode }' />"><span>예약조회 및 취소</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	      <li class="treeview">
	        <a href="<c:url value='/reservation/diagSearch?pcode=${sessionScope.pcode }' />"><span>진료내역 조회</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	    </ul>
	    <!-- /.sidebar-menu -->
	  </section>
	  <!-- /.sidebar -->
	</aside>
</section>