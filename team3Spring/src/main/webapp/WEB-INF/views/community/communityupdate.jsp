<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>커뮤니티 메인</title>

</head>
<body>
<div class="container">
	<h1>게시판 추가</h1>
	<form action='<c:url value="/community/update"/>' method="post">
		<div>
			<label for="board">선택된 게시판 이름</label>
			<input class="form-control" value="${board.bo_title}" readonly>
		</div>
		<div>
			<label for="board">수정할 게시판 이름 게시판 이름</label>
			<input class="form-control" placeholder="수정할 게시판 이름을 입력해주세요" name="new_BoardName">
		</div>
		<input type="hidden" name="bo_num" value="${board.bo_num}">
		<input type="hidden" name="bo_title" value="${board.bo_title}">
		<button class="btn" type="submit">게시판 수정</button>
	</form>

</div>
</body>
</html>