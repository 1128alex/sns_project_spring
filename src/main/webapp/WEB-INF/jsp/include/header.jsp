<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header bg-info d-flex justify-content-between">
	<div class="logo d-flex align-items-center">
		<h1 class="text-white ml-3">
			<a href="/timeline/timeline_view" class="text-white">Marondalgram</a>
		</h1>
	</div>
	<div class="login-info d-flex align-items-end mb-3 mr-5">
		<c:choose>
			<c:when test="${userName eq null}">
				<a href="/user/sign_in_view"
					class="ml-2 text-white font-weight-bold">로그인</a>
			</c:when>
			<c:otherwise>
				<span class="text-white"><b>${userName}</b>님 안녕하세요</span>
				<a href="/user/sign_out" class="ml-2 text-white font-weight-bold">로그
					아웃</a>
			</c:otherwise>
		</c:choose>

	</div>


</div>