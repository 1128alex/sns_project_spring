<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1 class="pt-3 pb-3">회원가입</h1>
<div class="d-flex justify-content-center">
	<div class="col-5">
		<form method="post" action="">
			<div class="my-2 font-weight-bold">아이디</div>
			<div class="d-flex">
				<input type="text" class="form-control" name="loginId" id="loginId">
				<button type="button" id="duplicateCheckBtn" class="btn btn-info">중복확인</button>
			</div>
			<small class="statusArea text-danger"></small>

			<div class="my-2 font-weight-bold">비밀번호</div>
			<input type="password" class="form-control" name="password"
				id="password">
			<div class="my-2 font-weight-bold">비밀번호 확인</div>
			<input type="password" class="form-control" name="passwordCheck"
				id="passwordCheck">
			<div class="my-2 font-weight-bold">이름</div>
			<input type="text" class="form-control" name="name" id="name">
			<div class="my-2 font-weight-bold">이메일</div>
			<input type="text" class="form-control" name="email" id="email">
			<button type="submit" id="signUpBtn" class="btn btn-info w-100 mt-3">가입하기</button>
			<div class="d-flex justify-content-end my-2">
				<a href="/user/login_view">로그인하기</a>
			</div>
		</form>
	</div>
</div>