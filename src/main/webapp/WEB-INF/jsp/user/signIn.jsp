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
				<input type="text" class="form-control" name="loginId">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">PW</span>
				</div>
				<input type="password" class="form-control" id="">
			</div>
			<button type="submit" class="btn btn-block btn-info">로그인</button>
			<a class="btn btn-block btn-dark" href="/user/sign_in">회원가입</a>
		</form>
	</div>
</div>