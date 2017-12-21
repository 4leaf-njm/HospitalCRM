<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="sidebar-wrapper">
	<aside class="main-sidebar">
	  <!-- sidebar: style can be found in sidebar.less -->
	  <section class="sidebar">
	    <!-- Sidebar Menu -->
	    <ul class="sidebar-menu" data-widget="tree">
	      <li class="header"><h3><strong>병원안내</strong></h3></li>
	      <li class="treeview">
	        <a href="#"><span>병원소개</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	      </li>
	      <li class="treeview">
	        <a href="<c:url value='/info/notice' />"><span>공지사항</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	      </li>
	      <li class="treeview">
	        <a href="#"><span>찾아오시는길</span>
	          <span class="pull-right-container">
	            </span>
	        </a>
	    </ul>
	    <!-- /.sidebar-menu -->
	  </section>
	  <!-- /.sidebar -->
	</aside>
</section>