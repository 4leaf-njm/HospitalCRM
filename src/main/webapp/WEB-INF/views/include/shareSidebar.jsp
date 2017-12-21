<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="sidebar-wrapper">
	<aside class="main-sidebar">
	  <!-- sidebar: style can be found in sidebar.less -->
	  <section class="sidebar">
	    <!-- Sidebar Menu -->
	    <ul class="sidebar-menu" data-widget="tree">
	      <li class="header"><h3><strong>나눔소통</strong></h3></li>
	      <li class="treeview">
	        <a href="<c:url value='/share/qna' />"><span>묻고답하기</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	      <li class="treeview">
	        <a href="#"><span>자주하는질문</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	    </ul>
	    <!-- /.sidebar-menu -->
	  </section>
	  <!-- /.sidebar -->
	</aside>
</section>