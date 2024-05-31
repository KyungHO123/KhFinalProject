	<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
* {
   margin: 0;
   padding: 0;
}
#toggle-slider {
    display: none;
}

label {
    cursor: pointer;
    width: 60px; 
    height: 30px; 
    text-indent: -9999em;
    background: #dff7fa;
    border-radius: 15px;
    position: relative;
    transition: 0.4s ease-out;
}

label::after {
    content: "";
    width: 20px; 
    height: 20px; 
    background: #a5cace;
    position: absolute;
    border-radius: 50%;
    top: 5px;
    left: 5px; 
    transition: 0.4s ease-out;
}

#toggle-slider:checked+label {
    background: #96e7ef;
}

#toggle-slider:checked+label::after {
    background: #1d6269;
    left: 35px; /* 좌측 위치 조정 */
}




#toggle-slider1 {
    display: none;
}

label {
    cursor: pointer;
    width: 60px; 
    height: 30px; 
    text-indent: -9999em;
    background: #dff7fa;
    border-radius: 15px;
    position: relative;
    transition: 0.4s ease-out;
}

label::after {
    content: "";
    width: 20px; 
    height: 20px; 
    background: #a5cace;
    position: absolute;
    border-radius: 50%;
    top: 5px;
    left: 5px; 
    transition: 0.4s ease-out;
}

#toggle-slider1:checked+label {
    background: #96e7ef;
}

#toggle-slider1:checked+label::after {
    background: #1d6269;
    left: 35px; /* 좌측 위치 조정 */
}

.login-box-container {
   background: url('<c:url value="/resources/img/homeBack2.png"/>');
   background-repeat: no-repeat;
   background-size: cover;
    background-origin: content-box;
    background-attachment: fixed;
   display:flex;
   width: 100%;
    height: 100%;
}

.login-btn {
   margin: 0;
   padding: 0;
   width: 200px;
   height: 40px;
   color: gray;
   border: 1px solid gray;
   box-sizing: border-box;
}

.member-login-btn {
    height: 50px;
   width:50%;
   border: none;
      border-top: 4px solid #d5d5d5;
   color:rgba(0, 0, 0, .5);
    background-color: #f4f4f4;
    border-bottom: 3px solid #c8c8c8;
   margin-right: -3px;
}

.hospital-login-btn {
       height: 50px;
   width:50%;
    border: none;
   border-top: 4px solid #d5d5d5;
   color:rgba(0, 0, 0, .5);
    background-color: #f4f4f4;
    border-bottom: 3px solid #c8c8c8;
}

.login-btn-click {
    border: 2px solid white;
   border-top:3px solid #8AE634;
    margin-bottom: 1px;
    border-bottom: 3px solid white;
   color: black;
   background: white;
   font-weight: bold;
}

.member-login-btn:hover {
   color: black;
   background: white;
}

.hospital-login-btn:hover {
   color: black;
   background: white;
}

.login-form {
   height:468px;
   width: 100%;
    margin-top: 40px;
   text-align: center;
   display: inline-block;
   background-color: white;
}

.input-group {
   margin-top: 40px;
   display: inline-block;
}

.input-box {
   width: 300px;
   height: 40px;
   margin-bottom: 10px;
   padding: 10px;
}

.submit-btn {
   width: 300px;
   height: 40px;
   margin-top: 20px;
}

.hospital-form-box {
   display: none;
}

.find-signup-box {
   margin-top: 20px;
   font-size: 13px;
   font-weight: bold;
}
.login-btn-r{
   padding:20px 0;height:65px; border-radius:5px;font-size:18px;
   width:460px;border:1px solid green;
   color: green;background: white;
   
}
.login-btn-r:hover{
   background: green; 
   transition: background 0.5s ease;
}
.login-btn-r:hover{
   border-style:none;
   background:#8AE634   ;
   color: white;
}
.login-input-tag{
   position: relative;
    display: inline-block;
}
.auto-login{
   width:100%;display:flex;    padding-left: 72px;
   margin-bottom: 5px;
}

.input-box.id{
   width:460px;
    margin-bottom: 10px;
         padding: 30px 40px 30px 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-image: url('<c:url value="/resources/img/user.svg"/>'); 
    background-repeat: no-repeat; 
    background-position: right 10px center; 
    background-size: 30px; 
}
.input-box.pw{
   width:460px;
    margin-bottom: 10px;
      padding: 30px 40px 30px 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-image: url('<c:url value="/resources/img/passwordcheck.svg"/>'); 
    background-repeat: no-repeat; 
    background-position: right 10px center; 
    background-size: 30px; 
}
.input-box.num{
   width:460px;
    margin-bottom: 10px;
     padding:30px 40px 30px 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-image: url('<c:url value="/resources/img/quote.svg"/>'); 
    background-repeat: no-repeat; 
    background-position: right 10px center; 
    background-size: 30px; 
}
.login-box-second{

background-color: white;
}
.login-box{
   background:white;
   width: 600px;height: 550px;margin:auto;
}
.auto_login_box{
   width: 300px;display: flex; 
}
.login_title_container{
text-align:center;
	width: 500px;margin:150px auto 0 auto;height: 200px;line-height: 200px;
}
.login_title_container_box{width: 100%;}
p{margin: 0;}
.login_title{
width: 100%; height: 500px; display: flex;flex-direction: column;margin-top: 50px;
}

.a {
	color: black;
	font-size: 15px
}

.a:hover {
	text-decoration: none;
	color: green;
}
</style>
</head>
<body>
<div style="height: 1300px">
   <div class="login-box-container">
  	 <div class="login_title_container_box">
	   	  <div class="login_title_container">
		   	 <div class="login_title"> 
		   	  	<h1 style="color: white;font-weight:bold;position: absolute;margin-left: 190px;">로그인</h1>
		   	  	<p style="color: white;font-size: 20px;font-weight:bold;">저희 사이트를 방문 해주셔서 감사합니다.</p>
		   	  </div>	
	   	  </div>
	      <div class="login-box">   
	         <div class="login-box-second"></div>
	         <div class="login-btns">
	            <button type="button" class="login-btn member-login-btn login-btn-click">회원</button>
	            <button type="button" class="login-btn hospital-login-btn">병원</button>
	         </div>
	         <div class="form-box member-form-box" style="height: 100%;">
	            <div class="login-form">
	               <form action="<c:url value="/member/login"/>" method="post">
	                  <div class="input-group">
	                     <div class="auto-login">
	                        <div class="auto_login_box">
	                           <span style="margin-right: 5px;">자동로그인</span>
	                            <input type="checkbox" id="toggle-slider" value="true" name="autoLogin">
	                            <label for="toggle-slider">On/Off</label>
	                         </div>   
	                      </div>
	                      <div class="login-input-tag">
	                        <input type="text" placeholder="아이디" name="me_id" class="input-box id"> 
	                     </div>
	                      <div class="login-input-tag">
	                        <input type="password" placeholder="비밀번호" name="me_pw" class="input-box pw">
	                     </div>
	                  </div>
	                  <button class="submit-btn login-btn-r">로그인</button>
	               </form>
	               <div class="find-signup-box">
                    <a class="a" href="<c:url value="/main/findid"/>">아이디 찾기</a> <span> | </span>
                    <a class="a" href="<c:url value="/main/findpw"/>">비밀번호 찾기</a> <span> | </span>
                    <a class="a" href="<c:url value="/main/signup"/>">회원가입</a>
	               </div>
	            </div>
	         </div>
	         <div class="form-box hospital-form-box">
	            <div class="login-form">
	               <form action="<c:url value="/hospital/login"/>" method="post">
	                  <div class="input-group">   
	                     <div  class="auto-login">
	                        <div>
	                           <span style="margin-right: 5px;">자동로그인</span>
	                        </div>
	                        <div>
	                            <input type="checkbox" id="toggle-slider1" value="true" name="autoLogin">
	                            <label for="toggle-slider1">On/Off</label>
	                         </div>
	                     </div>
	                     <div class="login-input-tag">
	                        <input type="text" placeholder="사업자번호" name="ho_num"
	                           class="input-box num" maxlength="10"> 
	                     </div>   
	                     <div class="login-input-tag">
	                        <input type="text" placeholder="아이디" name="ho_id" class="input-box id"> 
	                     </div>
	                     <div class="login-input-tag">
	                        <input type="password" placeholder="비밀번호" name="ho_pw" class="input-box pw">
	                     </div>
	                     <button class="submit-btn login-btn-r">로그인</button>
	                  </div>
	               </form>
	               <div class="find-signup-box">
                    <a class="a" href="<c:url value="/main/findid"/>">아이디 찾기</a> <span> | </span>
                    <a class="a" href="<c:url value="/main/findpw"/>">비밀번호 찾기</a> <span> | </span>
                    <a class="a" href="<c:url value="/main/signup"/>">회원가입</a>
	               </div>
	            </div>
	         </div>
	      </div> 
     </div>

   </div>
</div>   
</body>
<script type="text/javascript">
   $(".member-login-btn").click(function() {
      $(".hospital-form-box").hide();
      $(".member-form-box").show();
      $(".member-login-btn").addClass("login-btn-click");
      $(".hospital-login-btn").removeClass("login-btn-click");
   });
   $(".hospital-login-btn").click(function() {
      $(".member-form-box").hide();
      $(".hospital-form-box").show();
      $(".hospital-login-btn").addClass("login-btn-click");
      $(".member-login-btn").removeClass("login-btn-click");
   });
</script>
<script type="text/javascript">
   //300655f18482c4d8c0a57b772e5720fc
</script>
</html>