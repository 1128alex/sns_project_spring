<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="m-4 font-weight-bold">회원가입</h1>
		<form id="signUpForm" method="post" action="/user/sign_up">
			<span class="sign-up-subject">ID</span>
			<div class="d-flex ml-3 mt-3">
				<input type="text" id="loginId" name="loginId"
					class="form-control col-6" placeholder="ID를 입력해주세요">
				<button type="button" id="loginIdCheckBtn" class="btn btn-success">중복확인</button>
			</div>
			<div class="ml-3 mb-3">
				<div id="idCheckLength" class="small text-danger d-none">ID를
					4자 이상 입력해주세요.</div>
				<div id="idCheckDuplicated" class="small text-danger d-none">이미
					사용중인 ID입니다.</div>
				<div id="idCheckOk" class="small text-success d-none">사용 가능한
					ID입니다.</div>
			</div>

			<span class="sign-up-subject">Password</span>
			<div class="m-3">
				<input type="password" name="password" id="password"
					class="form-control col-6" placeholder="비밀번호를 입력하세요">
			</div>

			<span class="sign-up-subject">Confirm Password</span>
			<div class="m-3">
				<input type="password" id="confirmPassword"
					class="form-control col-6" placeholder="비밀번호를 입력하세요">
			</div>

			<span class="sign-up-subject">Name</span>
			<div class="m-3">
				<input type="text" id="name" name="name" class="form-control col-6"
					placeholder="이름을 입력하세요">
			</div>

			<span class="sign-up-subject">이메일</span>
			<div class="m-3">
				<input type="text" id="email" name="email"
					class="form-control col-6" placeholder="이름을 입력하세요">
			</div>
			<br>
			<div class="d-flex justify-content-center m-3">
				<button type="submit" id="signUpBtn" class="btn btn-info">가입하기</button>
			</div>
		</form>
	</div>

	<script>
		$(document).ready(function() {
			$('#loginIdCheckBtn').on('click', function() {
				$('#idCheckLength').addClass('d-none'); // 숨김
				$('#idCheckDuplicated').addClass('d-none'); // 숨김
				$('#idCheckOk').addClass('d-none'); // 숨김
				let loginId = $('#loginId').val().trim();

				if (loginId.length < 4) {
					$('#idCheckLength').removeClass('d-none'); // 경고문구 노출
					return;
				}

				$.ajax({
					// request
					type : "post",
					url : "/user/is_duplicated_id",
					data : {
						"loginId" : loginId
					}

					// response
					,
					success : function(data) {
						if (data.code == 1) {
							// 성공
							$('#idCheckOk').removeClass('d-none');
						} else {
							// 실패
							$('#idCheckDuplicated').removeClass('d-none');
						}
					},
					error : function(e) {
						alert("중복확인에 실패했습니다.");
					}
				});
			});
			$('#signUpForm').on('submit', function(e) {
				e.preventDefault;

				let loginId = $('#loginId').val().trim();
				if (loginId == '') {
					alert("아이디를 입력해주세요.");
					return false;
				}

				let password = $('#password').val();
				if (password == '') {
					alert("비밀번호를 입력해주세요.");
					return false;
				}

				let confirmPassword = $('#confirmPassword').val();
				if (confirmPassword == '') {
					alert("비밀번호를 확인해주세요.");
					return false;
				}
				if (confirmPassword != password) {
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}

				let name = $('#name').val().trim();
				if (name == '') {
					alert("이름을 입력해주세요.");
					return false;
				}

				let email = $('#email').val().trim();
				if (email == '') {
					alert("이메일를 입력해주세요.");
					return false;
				}

				let url = $(this).attr('action');
				let params = $(this).serialize();

				$.post(url, params).done(function(data) {
					if (data.code == 1) {
						alert("가입을 환영합니다! 로그인 해주세요.");
						location.href = "/user/sign_in_view";
					} else {
						alert(data.errorMessage);
					}
				});
			});

		});
	</script>
</div>
