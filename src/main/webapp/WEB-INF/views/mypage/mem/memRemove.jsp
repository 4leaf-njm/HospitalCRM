<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/memberSidebar.jsp"%>

<section class="content-wrapper" style="background: #F6F6F6">
	<div class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">회원탈퇴</h3>
				</div>
				<h3>안내사항</h3>
				<h4>
					회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br>
					사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
					탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br>
					탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.<br>
					회원정보 및 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
					삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.<br><br>
					탈퇴 후에도 진료기록 및 게시판 기록은 그대로 남아 있습니다.<br>
					진료기록 및 게시판 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. <br>
					삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다. <br>
					탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.<br>
				</h4>
				<!-- /.box-body -->


				<div class="box-footer">
				<a href="memberRemove?mem_id=${sessionScope.loginId }"><button class="btn btn-primary">탈퇴</button></a>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
	</div>
</section>
<!-- /.content -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
</script>
