<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="contents-box">
		<%-- 글쓰기 영역: 로그인 된 상태에서만 보여짐 --%>
		<div class="write-box border rounded m-3">
			<textarea id="writeTextArea" placeholder="내용을 입력해주세요"
				class="w-100 border-0"></textarea>

			<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
			<div class="d-flex justify-content-between">
				<div class="file-upload d-flex">
					<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
					<input type="file" id="file" class="d-none"
						accept=".gif, .jpg, .png, .jpeg">
					<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
					<a href="#" id="fileUploadBtn"><img width="35"
						src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="ml-2"></div>
				</div>
				<button id="writeBtn" class="btn btn-info">게시</button>
			</div>
		</div>
		<%--// 글쓰기 영역 끝 --%>


		<c:forEach var="card" items="${cards}">
			<%-- 타임라인 영역 --%>
			<div class="timeline-box my-5">
				<%-- 카드1 --%>
				<div class="card border rounded mt-3">
					<%-- 글쓴이, 더보기(삭제) --%>
					<div class="p-2 d-flex justify-content-between">
						<span class="font-weight-bold">${card.user.loginId}</span>
						<c:if test="${card.user.loginId eq userLoginId}">
							<%-- 더보기 --%>
							<a href="#" class="more-btn" data-toggle="modal"
								data-target="#modal" data-post-id="${card.post.id}"> <img
								src="https://www.iconninja.com/files/860/824/939/more-icon.png"
								width="30">
							</a>
						</c:if>
					</div>

					<%-- 카드 이미지 --%>
					<c:if test="${not empty card.post.imagePath}">
						<div class="card-img">
							<img src="${card.post.imagePath}" class="w-100" alt="본문 이미지">
						</div>
					</c:if>

					<%-- 좋아요 --%>
					<div class="card-like m-3">
						<%-- 좋아요가 되어있을 때 --%>
						<c:if test="${card.filledLike eq true}">
							<a href="#" class="like-btn" data-user-id="${userId}"
								data-post-id="${card.post.id}"> <img
								src="https://www.iconninja.com/files/527/809/128/heart-icon.png"
								width="18px" height="18px" alt="filled heart">
							</a>
						</c:if>
						<%-- 좋아요가 해제되어 있을 때 --%>
						<c:if test="${card.filledLike eq false}">
							<a href="#" class="like-btn" data-user-id="${userId}"
								data-post-id="${card.post.id}"> <img
								src="https://www.iconninja.com/files/214/518/441/heart-icon.png"
								width="18" height="18" alt="empty heart">
							</a>
						</c:if>
						좋아요 ${card.likeCount}개
					</div>

					<%-- 글 --%>
					<div class="card-post m-3">
						<span class="userId_of_post font-weight-bold">${card.user.loginId}</span>
						<span>${card.post.content}</span>
					</div>

					<%-- 댓글 --%>
					<div class="card-comment-desc border-bottom">
						<div class="ml-3 mb-1 font-weight-bold">댓글</div>
					</div>

					<%-- 댓글 목록 --%>
					<div class="card-comment-list m-2">
						<c:forEach var="comment" items="${card.comments}">
							<div class="card-comment m-1">
								<span class="font-weight-bold">${comment.user.loginId}</span> <span>${comment.comment.content}</span>

								<%-- 댓글 삭제 버튼 --%>
								<a
									href="/comment/delete_comment?commentId=${comment.comment.id}"
									class="commentDelBtn"> <img
									src="https://www.iconninja.com/files/603/22/506/x-icon.png"
									width="10px" height="10px">
								</a>
							</div>
						</c:forEach>

						<%-- 댓글 쓰기 --%>
						<c:if test="${not empty userLoginId}">
							<div class="comment-write d-flex border-top mt-2">
								<input type="text" id="comment-text"
									class="form-control border-0 mr-2" placeholder="댓글 달기" />
								<button type="button" class="comment-btn btn btn-light"
									data-post-id="${card.post.id}">게시</button>
							</div>
						</c:if>
					</div>
					<%--// 댓글 목록 끝 --%>
				</div>
				<%--// 카드1 끝 --%>
			</div>
			<%--// 타임라인 영역 끝  --%>
		</c:forEach>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal">
	<%-- modal-sm: 작은 모달 창 --%>
	<%-- modal-dialog-centered: 모달 창을 수직으로 가운데 정렬 --%>
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content text-center">
			<div class="py-3 border-bottom">
				<a href="#" id="deletePostBtn">삭제하기</a>
			</div>
			<div class="py-3">
				<%-- data-dismiss="modal" 모달창 닫힘 --%>
				<a href="#" data-dismiss="modal">취소하기</a>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 목록 버튼 클릭 => 글 목록
		$('#fileUploadBtn').on('click', function(e) {
			e.preventDefault();
			$('#file').click(); // input file을 클릭한 것과 같은 효과
		});

		$('#writeBtn').on('click', function() {
			let content = $('#writeTextArea').val();
			let file = $('#file').val();
			// 파일이 업로드 된 경우에만 확장자 체크

			if (file != '') {
				let ext = file.split(".").pop().toLowerCase();
				if ($.inArray(ext, [ 'jpg', 'jpeg', 'png', 'gif' ]) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val('');
					return;
				}
			}

			let formData = new FormData();
			formData.append("content", content);
			formData.append("file", $('#file')[0].files[0]);

			$.ajax({
				type : "POST",
				url : "/post/create_post",
				data : formData,
				enctype : "multipart/form-data", // 파일 업로드를 위한 필수 설정
				processData : false, // 파일 업로드를 위한 필수 설정
				contentType : false, // 파일 업로드를 위한 필수 설정
				success : function(data) {
					if (data.code == 1) {
						alert("게시물 업로드 성공");
						location.reload();
					}
				},
				error : function(e) {
					alert("에러" + e);
				}
			});
		});

		// 사용자가 이미지를 선택했을 때 유효성 확인 및 업로드 된 파일 이름 노출
		$('#file').on('change', function(e) {
			let fileName = e.target.files[0].name;
			$('#fileName').text(fileName);
			// alert(fileName);

			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase();
			if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#file').val(''); // 파일 태그에 실제 파일 제거
				$('#fileName').text(''); // 파일 이름 비우기
				return;
			}

			// 유효성 통과한 이미지
			$('#fileName').text();
		});

		$('.like-btn').on('click', function(e) {
			e.preventDefault();

			let userId = $(this).data('user-id');
			//alert(userId);
			if (userId == '') {
				alert("로그인을 해주세요");
				return;
			}

			let postId = $(this).data('post-id');
			//alert(postId);
			$.ajax({
				// request
				url : "/like/" + postId

				// response
				,
				success : function(data) {
					if (data.code == 1) {
						location.reload(true);
					} else {
						alert(data.errorMessage);
					}
				},
				error : function(e) {
					alert("좋아요/해제 하는데 실패했습니다.");
				}
			});
		});

		$('.comment-btn').on('click', function() {
			let postId = $(this).data('post-id');
			let comment = $(this).siblings('input').val();

			if (comment == '') {
				alert("댓글 내용을 입력해주세요");
				return false;
			}
			$.ajax({
				type : "get",
				url : "/comment/create_comment",
				data : {
					"comment" : comment,
					"postId" : postId
				},
				success : function(data) {
					if (data.code == 1) {
						location.reload();
					} else {
						alert("실패");
					}

				},
				error : function(jqXHR, textStatus, errorThrown) {
					var errorMsg = jqXHR.responseJSON.status;
					alert(errorMsg + ":" + textStatus)
				}
			});
		});

		// 더보기 버튼(...) 클릭 (글 삭제를 위해)
		$('.more-btn').on('click', function(e) {
			e.preventDefault();
			let postId = $(this).data("post-id"); // getting

			$('#modal').data("post-id", postId); // setting 모달 태그에 data-post-id를 심어 넣어줌
			$('#modal #deletePostBtn').on('click', function() {
				$.ajax({
					type : "delete",
					url : "/post/delete",
					data : {
						"postId" : postId
					},
					success : function(data) {
						if (data.code = 1) {
							alert("삭제 완료!");
							location.reload();
						} else {
							alert(data.errorMessage);
						}
					},
					error : function(e) {
						alert("ajax error " + e);
					}
				});
			});
		});
	});
</script>
