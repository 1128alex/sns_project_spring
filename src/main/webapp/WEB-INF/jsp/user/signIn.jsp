<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="login-box">
		<h1 class="mb-4">로그인</h1>
		<form id="loginForm" action="/user/sign_in" method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">ID</span>
				</div>
				<input type="text" class="form-control" id="loginId" name="loginId">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">PW</span>
				</div>
				<input type="password" class="form-control" id="password"
					name="password">
			</div>
			<button type="submit" class="btn btn-block btn-info">로그인</button>
			<a class="btn btn-block btn-dark" href="/user/sign_up_view">회원가입</a>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$('#loginForm').on('submit', function(e) {
				e.preventDefault();

				let loginId = $('#loginId').val().trim();
				let password = $('#password').val().trim();

				if (loginId == '') {
					alert("아이디를 입력해주세요.");
					return false;
				}

				if (password == '') {
					alert("비밀번호를 입력해주세요.");
					return false;
				}

				let url = $(this).attr('action');
				let params = $(this).serialize(); // loginId=aaaaa&password=aaa

				$.post(url, params).done(function(data) {
					if (data.code == 1) {
						location.href = "/post/timeline_view";
					} else {
						alert(data.errorMessage);
						$('#password').val('');
					}
				});
			});
		});
	</script>
</div>