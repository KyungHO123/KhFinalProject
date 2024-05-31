<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>병원 중개 사이트</title>
<style type="text/css">
.here-title{
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: bold;
}
  
.here-title1{
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: bold;
}
  
.here-title:hover{
	text-decoration: none;
	color: gray;
}
  
.top-img {
	height: 20px;
	width: 20px;
	color: gray;
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
color:rgba(0, 100, 60, 0.8);
	text-align: left;
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 80px 0;
}
  
.전체화면박스{
width: 100%;
}
  
.왼쪽여백,
.오른쪽여백 {
 width: 20%;
 height: 700px;
 }
  
 .signup-select{
 text-align:center;
width: 100%;
height: 700px;
 }
  
.choice{
display:flex;
margin:-240px auto;
width: 1000px;
height: 700px;
}
  
.aTag-btn1{
margin-right: auto;
} 
  
.aTag-btn2{
margin-left: auto;
} 

.aTag-btn1, 
.aTag-btn2 {
	background:white;
  border-radius:10px;
	margin-top:150px;
    display: inline-block;
    width: 300px;
    height: 200px;
    color: black;
    text-decoration:none;
    text-align: center;
    line-height: 200px;
    text-decoration: none;
    border: 2px solid rgba(0, 128, 0, 0.5);
    font-size: 25px;
    color: green;
}

.aTag-btn1:hover, 
.aTag-btn2:hover {
	box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
	text-decoration: none;
	font-size: 25px;
    font-weight: bold;
    color: green;
}

.btn-box {
	margin: 0 auto;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px">
		<div class="page-title">
			관리 목록
		</div>
		<div style="text-align: left;display: flex;height: 50px;line-height: 50px; margin: 20px 0 50px 0;">
			<a href="<c:url value='/'/>">
				<img class="top-img" alt="위치 이미지"
				src="<c:url value='/resources/img/home-4-line.svg'/>">
			</a>
			<div style="margin: auto 16px;" >
				<img class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>	
			<div style="padding-top: 1px;">
				<p  class="here-title1">
					관리자페이지
				</p>
			</div>
		</div>
	</div>
</div>
<div class="전체화면박스">
	<div class="signup-select" >
		<div class="choice">
			<a class="aTag-btn1" href="<c:url value='/admin/hospital'/>">병원 관리</a>
			<a class="aTag-btn1" style="margin-left: 26px;" href="<c:url value='/admin/member/main'/>">회원 관리</a>
			<a class="aTag-btn2" style="margin-left: 26px;"href="<c:url value='/community'/>">커뮤니티 관리</a>
			<a class="aTag-btn2" style="margin-left: 26px;"href="<c:url value='/sales'/>">매출액 관리</a>
		<!-- /main/certification 사업자 회원가입 데이터 저장 후 다시 바꿔넣기 -->
		</div>
	</div>
</div>
	

</body>
</html>