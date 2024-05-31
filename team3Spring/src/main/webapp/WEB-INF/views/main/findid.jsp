<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
.home-box1 {
	width: 100%;
	height: 500px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
    background-origin: content-box;
}

.page-title{
color:rgba(0, 100, 60, 0.8);
	text-align: left;
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 80px 0;
}

.all-container {
	padding: 60px 80px;
    margin: -250px auto 70px auto;
    width: 55%;
    background-color: white;
    border-radius: 15px;
    display: block;
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
}

.input-container {
	margin-bottom: 10px;
	margin-top: -35px;
}

.email-box {
	margin-bottom: 25px;
}

.label {
	color:#555;
	text-align: center;
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 0px;
}

.sub_label {
	color: red;
	font-weight: 500;
	font-size: 15px;
	margin-bottom: 0px;
}
.btn-find {
	float: right;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			아이디 찾기
		</div>
	</div>
</div>
<div class="all-container">
	<div class="input-container">
		<div class="email-box">		
			<label for="site_email" class="label">이메일 입력</label>
			<input type="text" class="form-control site_email" id="site_email" name="site_email" placeholder="이메일을 입력하세요">
		</div>
		<div class="phone-box">
			<label for="site_phone" class="label">휴대폰 번호 및 대표 전화번호 입력</label>
			<label for="site_phone" class="sub_label">  ※"-"제외한 숫자만 입력</label>
			<input type="text" class="form-control site_phone" id="site_phone" name="site_phone" placeholder="휴대폰 번호 및 대표 전화번호를 입력하세요">
		</div>
	</div>
	<button class="btn btn-outline-success btn-find">아이디 찾기</button>
</div>

<script type="text/javascript">
$('.btn-find').click(function() {
	let obj = {
		email : $('[name=site_email]').val(),
		phone : $('[name=site_phone]').val()
	}
	
	$.ajax({
		async : true,
		url : '<c:url value="/main/findid"/>',
		type : 'post', 
		data : obj, 
		dataType : "json", 
		success : function (data) {
			if(data.result == true) {
				alert("회원님의 아이디는 " + data.user.site_id + " 입니다.");
				location.href="<c:url value='/main/login'/>";
			}
			else if(data.result == false) {				
				alert('일치하는 이메일 또는 일치하는 전화번호가 없습니다.');
			}
			else {
				alert('알 수 없는 오류 발생!');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});
</script>
</body>
</html>