<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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

.spinner-container {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0,0,0,0.3);
	display: none;
	text-align: center;
	color: white;
	line-height: 100vh;
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

.label {
	color:#555;
	text-align: center;
	font-size: 20px;
	font-weight: 600;
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
			비밀번호 찾기
		</div>
	</div>
</div>
<div class="all-container">
	<div class="input-container">
		<label for="site_id" class="label">아이디 입력</label>
		<input type="text" class="form-control" id="site_id" name="site_id" placeholder="아이디를 입력하세요" >
	</div>
	<button class="btn btn-outline-success btn-find">비밀번호 찾기</button>
	<div class="spinner-container">
		이메일을 보내는 중...
		<span class="spinner-border text-primary"></span>
	</div>
</div>
<script type="text/javascript">
$('.btn-find').click(function() {
	//아이디를 가져옴(데이터 생성)
	let obj = {
		id : $('[name=site_id]').val()
	}
	$('.container-spinner').show();
	//서버로 전송
	$.ajax({
		async : true,
		url : '<c:url value="/main/findpw"/>',
		type : 'post', 
		data : obj, 
		dataType : "json", 
		success : function (data) {
			console.log(data.result);
			if(data.result) {
				alert('새 비번이 이메일로 전송됐습니다.');
			}
			else {
				alert('일치하는 아이디가 없습니다.');
			}
			$('.container-spinner').hide();
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});
</script>
</body>
</html>