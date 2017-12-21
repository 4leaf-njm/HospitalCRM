<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/views/include/header.jsp"%>

<link rel="stylesheet"
	href='<c:url value="/resources/css/commons/login.css" />'>


<section class="content">

	<form class="form-signin">
		<h2 class="form-signin-heading">로그인</h2>

		<div class="row">
			<label for="mem_id" class="sr-only">아이디</label> <input type="text"
				id="mem_id" name ="id" class="form-control" placeholder="ID" value=""required autofocus>
		</div>
		<br />
		<div class="row">
			<label for="mem_pwd" class="sr-only">비밀번호</label> <input
				type="password" id="mem_pwd" name="pwd" class="form-control" value="" placeholder="Password" required>
		</div>
		<div class="checkbox">
			<label> <input type="checkbox" value="remember-me">아이디 저장</label> 
			<select name="users" style="display:inline-block; width: 120px; height: 30px; margin-left: 80px;">
				<option value="member">일반 사용자</option>
				<option value="doctor">의료진</option>
				<option value="admin">관리자</option>
			</select>
		</div>
		<button class="btn btn-lg btn-primary btn-block" 
		onclick="login_go(this.form);">로그인</button>
		<a type="text" class="btn_link" href="memberJoin">회원가입</a>&nbsp;·
		<a type="text" class="btn_link" href="#">아이디/비밀번호 찾기</a>
	</form>
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
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
                  <p class="modal-message">${message} </p>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
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
                  <h4 class="modal-title">안내</h4>
               </div>
               <div class="modal-body">
                  <p class="modal-message">로그인에 성공했습니다. </p>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default btn_ok" data-dismiss="modal">확인</button>
               </div>
            </div> 
         </div>
      </div>
   </div>
   
</section>


<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	function login_go(frm) {
		frm.action = "login";
		frm.method = "post";
		
		if (frm.mem_id.value == "") {
			alert("아이디를 입력하세요.");
			frm.mem_id.focus();
			return false;;
		} else if (frm.mem_pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			frm.mem_pwd.focus();
			return false;
		}
		frm.submit();
	}
</script>

<c:if test="${!empty message }">
	<c:choose>
		<c:when test="${message eq 'SUCCESS'}">
		<script>
			$('#successModal').modal('show');
			$('#successModal .btn_ok').click(function(){
				location.href='<c:url value="/" />';
			});
		</script>
		</c:when>
		<c:otherwise>
		<script>
			$('#loginModal').modal('show');
		</script>
		</c:otherwise>
	</c:choose>
</c:if>