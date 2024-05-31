<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
.전체화면박스 {
	height: 100%;
	width: 100%;
	display: flex;
}

.signup-select {
	text-align: center;
	margin: -285px auto 0 auto;
	width: 100%;
	height: 750px;
}

.choice {
	display: flex;
	margin: 0 auto;
	width: 800px;
	height: 700px;
}

.aTag-btn1 {
	margin-right: auto;
}

.aTag-btn2 { 2
	margin-left: auto;
}

.aTag-btn1, .aTag-btn2 {
	margin-top: 150px;
	display: inline-block;
	background: white;
	width: 300px;
	border-radius: 10px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	text-decoration: none;
	border: 2px solid rgba(0, 128, 0, 0.5);
	font-size: 25px;
	color: green;
}

.aTag-btn1:hover, .aTag-btn2:hover {
	box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
	transition: box-shadow 0.3s ease;
	text-decoration: none;
	font-size: 25px;
	font-weight: bold;
	color: green;
}

.home-box1 {
	width: 100%;
	height: 500px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
	background-origin: content-box;
}

.page-title {
	color: rgba(0, 100, 60, 0.8);
	text-align: left;
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 80px 0;
}

.top-img {
	height: 20px;
	width: 20px;
	color: gray;
}

.here-title {
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: bold;
}

.here-title:hover {
	text-decoration: none;
	color: gray;
}
</style>
</head>
<body>
	<div class="home-box1">
		<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
			<div class="page-title">회원가입</div>
			<div style="text-align: left; display: flex; height: 50px; line-height: 50px; margin: 20px 0 50px 0;">
			      <a href="<c:url value='/'/>" style="z-index: 999"> <img class="top-img" alt="위치 이미지" 
					src="<c:url value='/resources/img/home-4-line.svg'/>">
				</a>
				<div style="margin: auto 16px;">
					<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
				</div>
				<div style="padding-top: 1px;">
					<a class="here-title"> 회원가입 </a>
				</div>
			</div>
		</div>
	</div>
	<div class="전체화면박스">
		<div class="signup-select">
			<div class="choice">
				<a class="aTag-btn1" href="<c:url value='/main/certification?num=1'/>">개인 회원가입</a> 
				<a class="aTag-btn2" href="<c:url value='/main/certification?num=2'/>">사업자 회원가입</a>
			</div>
		</div>
	</div>
</body>
</html>