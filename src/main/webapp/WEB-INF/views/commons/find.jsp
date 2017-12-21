<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<link rel="stylesheet"
	href='<c:url value="/resources/css/commons/find.css"/>'>
	
<section class="content">
<form class="find_box">
	<h2>아이디/비밀번호 찾기</h2>
	<legend></legend>
		 <h4>아이디 찾기</h4> 
				<div class="row">
				<div class="col-md-3">
				<label for="mem_name">이름</label>
				<span class="star">*</span>
				</div>
				<input type="text" id="mem_name" 
				        name="mem_name" maxlength="20" value='' />
				<p class="validation-txt" id="messageName" style="display: none;"></p>
				</div>
				
				<br/>
				
			<div class="row">
			<div class="col-md-3">
			<label for="mem_birth">주민번호</label> 
			<span class="star">＊</span> 
			</div>
			<input type="text" id="mem_birth1" name="mem_birth1" maxlength="6" value='' />-
			<input type="password" id="mem_birth2" name="mem_birth2" maxlength="7" value='' />
		</div>
		
		<button class="btn btn-primary "
				onclick="join_Id(this.form);" href="login">
				<span class=findId">아이디 찾기</span>
			</button>

<br/>
<legend></legend>
<h4>비밀번호 찾기</h4> 

<div class="row">
<div class="col-md-3">
			<label for="mem_id">아이디</label> 
			<span class="star">*</span> 
			</div>
			<input type="text" id="mem_id" name="mem_id" maxlength="20" />
			</div>
			<br/>
			
			<div class="row">
				<div class="col-md-3">
				<label for="mem_name">이름</label>
				<span class="star">*</span>
				</div>
				<input type="text" id="mem_name2" 
				        name="mem_name2" maxlength="20" value='' />
				<p class="validation-txt" id="messageName" style="display: none;"></p>
				</div>
				
				<br/>
				
				<div class="row">
				<div class="col-md-3">
			<label for="mem_email1">이메일</label> 
		</div>
			<input type="text" id="mem_email1" name="mem_email1" maxlength="20">@
			<input type="text" id="mem_email2" name="mem_email2" maxlength="20"
				disabled="disabled" /> <select name="mem_email3"
				onchange="email3(this.value)">

				<option value="">선택하세요.</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="naver.com">naver.com</option>
				<option value="chol.com">chol.com</option>
				<option value="dreamwiz.com">dreamwiz.com</option>
				<option value="empal.com">empal.com</option>
				<option value="freechal.com">freechal.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanafos.com">hanafos.com</option>
				<option value="hanmir.com">hanmir.com</option>
				<option value="hitel.net">hitel.net</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="korea.com">korea.com</option>
				<option value="lycos.co.kr">lycos.co.kr</option>
				<option value="nate.com">nate.com</option>
				<option value="netian.com">netian.com</option>
				<option value="paran.com">paran.com</option>
				<option value="yahoo.com">yahoo.com</option>
				<option value="0">직접입력</option>
			</select>
		</div>
		
		<br />
		
		<button class="btn btn-primary "
				onclick="join_Pass(this.form);" href="login">
				<span class="findPw">비밀번호 찾기</span>
			</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn" >
			<a class="button-text" href="login">취소</a>
			</button>
		</div>
			
</form>
</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script type="text/javascript">

	function email3(emailVal) {

		$('#mem_email').attr("disabled", true);
		if (emailVal == "0") {
			$('#mem_email2').val("");
			$('#mem_email2').attr("disabled", false);
			$('#mem_email2').focus();
		} else {
			$('#mem_email2').val(emailVal);
		}
	}
	
</script>

<script>
function join_Id(frm) {
	frm.action = "find";
	frm.method = "post";
	 
	if (frm.mem_name.value == "") {
		alert("이름을 입력하세요.");
		frm.mem_name.focus();
		return false;
	} else if (frm.mem_birth1.value == "" || frm.mem_birth2.value == "") {
		alert("주민번호를 입력하세요.");
		frm.mem_birth1.focus();
		frm.mem_birth2.focus();
		return false;
	} else {
		frm.action = "searchId";
		frm.method = "post";
	}
		frm.submit();
}
</script>

<script>
function join_Pass(frm) {
	frm.action = "find";
	frm.method = "post";

if (frm.mem_id.value == "") {
	alert("아이디를 입력하세요.");
	frm.mem_id.focus();
	return false;
} else if (frm.mem_name2.value == "") {
	alert("이름을 입력하세요.");
	frm.mem_name2.focus();
	return false;
} if (frm.mem_email1.value == "" || frm.mem_email2.value == "") {
	alert("이메일를 입력하세요.");
	frm.mem_email1.focus();
	frm.mem_email2.focus();
	return false;
} else {
	frm.action = "login";
	frm.method = "post";
}
frm.submit();
}
</script>