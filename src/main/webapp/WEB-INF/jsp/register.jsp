<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- jquery slim 제거-->
<!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<header class="bg-secondary">
			<jsp:include page=".../include/header.jsp" />
		</header>
		<h2 class="text-center pt-3 pb-3">회원가입</h2>
		<div class="d-flex justify-content-center">
			<div class="col-4">
				<div class="my-2 font-weight-bold">아이디</div>
				<div class="d-flex">
					<input type="text" class="form-control" name="loginId" id="loginId">
					<button type="button" id="duplicateCheckBtn" class="btn btn-info">중복확인</button>
				</div>

				<div class="my-2 font-weight-bold">비밀번호</div>
				<input type="password" class="form-control" name="password"
					id="password">
				<div class="my-2 font-weight-bold">비밀번호 확인</div>
				<input type="password" class="form-control" name="passwordCheck"
					id="passwordCheck">
				<div class="my-2 font-weight-bold">이메일</div>
				<input type="text" class="form-control" name="email" id="email">
				<div class="my-2 font-weight-bold">이름</div>
				<input type="text" class="form-control" name="name" id="name">
				<button type="button" id="signUpBtn" class="btn btn-info w-100 mt-3">가입하기</button>
				<div class="d-flex justify-content-end my-2">
					<a href="/sns/sign_in_view">로그인하기</a>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#duplicateCheckBtn').on('click', function() {
				let loginId = $('#loginId').val();

				$.ajax({
					type : "get",
					url : "/user/check_duplication",
					data : {
						"loginId" : loginId
					},
					success : function(data) {
						if (data.exist) {
							alert("존재하는 아이디 입니다.");
						} else {
							alert("사용가능한 아이디 입니다.");
						}
						location.href = "/user/login_view"
					},
					error : function(e) {
						alert("에러 " + e);
					}
				});
			});
		});
	</script>

</body>
</html>