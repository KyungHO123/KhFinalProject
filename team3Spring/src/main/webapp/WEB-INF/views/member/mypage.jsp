<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 마이페이지</title>
<style type="text/css">
.profile프로필{
width: 250px;
}
.my-subect-list{
	position: relative;bottom: 8px;
}
.body-tag {
	width: 100%;
	display: felex;
	flex-direction: column;
	align-items: center;
}

.input-box {
	border: 1px solid white;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	padding: 5px;
}

.input-tag {
	border: 1px solid #ccc;
	outline: none;
	margin-bottom: 15px;
	width: 400px;
	padding: 10px;
}

.input-tag:focus {
	border-bottom-color: #C12DFF;
	box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}

.btn {
	text-decoration: none;
	border: 1px solid #C12DFF;
	width: 100px;
}

.btn:hover {
	background-color: #C12DFF;
	color: white;
}

.signup-btn {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	width: 400px;
	height: 40px;
	border-radius: 0;
	padding: 2px;
	border-bottom: 1px solid #C12DFF;
	margin-left: 34px;
}

select {
	font-size: 16px;
	border: 1px solid #ccc;
	background-color: #ffff;
	outline: none;
	width: 200px;
}

select:focus {
	border-color: #C12DFF;
	box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}

select:hover {
	background-color: #eaeaea;
}

img {
	width: 30px;
}
.mypage-container p{
	font-size: 20px;
}
.duplicate {
	float: right;
	border-radius: 0;
	height: 43px;
}

.program {
	width: 500px;
	height: 300px;
	border: 1px solid black;
}

.hos_my_page_inner {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
}

.program_check_wrap {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-gap: 20px;
}

.mypage-container {
	width: 100%;
    height: 100%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: stretch;
}

.mypage-profile {
	width: 400px;
    height: 989px;
    border-left: 1px solid lightgray;
    border-right: 1px solid lightgray;
}

.profile-img {
	width: 250px;
	height: 250px;
	margin: 0 auto;
	margin-top: 50px;
	border-radius: 100%;
}

.profile-name {
	margin: 38px auto;
	text-align: center;
}

.profile-anything {
	border: 1px solid green;
    width: 300px;
    height: 400px;
    margin: 0px 20px 20px 48px;
    border-radius: 5px;
}

.profile-container {
	background-color: rgb(237, 250, 239);
    width: 1000px;
    height: 989px;
    display: block;
}

.mypage-profile-info {
	padding: 0 50px;
    width: 800px;
    height: 70%;
    border: 1px solid rgb(202, 238, 208);
    margin: 130px 15px 30px 95px;
    background-color: white;
    border-radius: 30px;
    box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
}

.mypage-profile-detail {
	width: 600px;
	height: 325px;
	border: 1px solid black;
	margin: 0px 20px 80px 250px;
	background-color: #FFE1E6;
	border-radius: 30px;
}

.profile-img-name-container {
	width: 100%;
	height: 150px;
	display: flex;
}

.mypage-img-name {
	display: flex;
	width:100%;
	margin: 30px auto;
	height: 125px;
	padding: 20px;
}

.hr {
	width: 100%;
	border: 1px solid lightgray;
}

.mypage-phone {
	margin:auto 0;
	height:70px;
	width: 100%;
	display: flex;
}

.mypage-email {
	height:70px;
	width: 100%;
	display: flex;
}

.mypage-hospital-name {
	display: flex;
	margin: 40px 48px 0 47px;
}

.mypage-hospital-num {
	display: flex;
	margin: 20px 48px 0 47px;
}

.mypage-job {
	width: 100%;
	height:70px;
	display: flex;
}

.mypage-hospital-address {
	display: flex;
	margin: 20px 48px 0 47px;
}

.new_me_name_hidden {
	width: 180px;
	display: none;
}

.new_me_name_hidden input {
	width: 250px; /* font-size: 1.5rem; */
}

.name_save_btn_wrap {
	display: none;
}

.new_me_phone_hidden {
	width: 180px;
	display: none;
}
.phone_save_btn_wrap {
	display: none;
}

.new_me_email_hidden {
	width: 180px;
	display: none;
}
.email_save_btn_wrap {
	display: none;
}

.new_me_job_hidden {
	width: 180px;
	display: none;
}

.new_me_job_hidden input {
	width: 300px;
	position: relative;
}

.job_save_btn_wrap {
	display: none;
}

.new_me_address_hidden {
	width: 180px;
	display: none;
}

.new_me_address_hidden input {
	width: 300px;
	position: relative;
}

.address_save_btn_wrap {
	display: none;
}
.new_me_subject_hidden {
	display: none;
}

.new_me_subject_hidden input {
	width: 300px;
	position: relative;
}

.subject_save_btn_wrap {
	display: none;
}

.box-name2 {
	position: relative;
}

.modal {
	display: none;
	position: fixed;
	z-index: 990;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	text-align: center;
}

.close {
	color: #aaa;
	margin: 0 24px 8px auto;
	font-size: 50px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.new_me_pw_hidden input {
	width: 300px;
}
 
 .anything-box{
 	margin-top:50px;
 }
.choose-box {
	padding:23px;
	text-align:center;
	display:flex;
	width: 100%;
	height: 75px;
 	flex-direction: column;
 	margin: 30px 0px;
}
.choose-box a {
	border-radius: 5px;
	line-height: 45px;
	margin: 0 auto;
	border: 1px solid green;
	width: 100%;
	height: 50px;
	color: green;
	text-decoration: none;
	font-size: 20px;
}

.choose-box a:hover {
	border-radius: 5px;
	line-height: 45px;
	margin: 0 auto;
	border: 1px solid green;
	width: 100%;
	height: 50px;
	color: white;
	text-decoration: none;
	font-size: 20px;
	background: green;
}

.subject{
width: 100%; 
height: 70px;

}
.phone-width{
width: 80%;
margin:auto;
display: flex;
justify-content: space-between;
}
.email-width{
width: 80%;
margin:auto;
display: flex;
justify-content: space-between;
}
.job-width{
width: 80%;
margin:auto;
display: flex;
justify-content: space-between;
}
.subject-width{
width: 80%;
margin: 20px auto;
display: flex;
justify-content: space-between;
}
.address-width{
width: 93%;
margin:auto;
display: flex;
justify-content: space-between;
}
select {
    width: 300px;
    padding: 8px; 
    font-size: 16px;
    border: 1px solid #ccc;
    appearance: none;  
    background-color: #fff;
    background-image: linear-gradient(to bottom, #f9f9f9, #e9e9e9);  
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); 
    cursor: pointer;  
}

select:hover {
    border-color: #999; 
}

select:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); 
}
.member_delete_box{
	color:gray;
	list-style: none;
	padding-left: 33px;
	margin-top: 110px;
}
.member_delete_box>li{width: 16%;}
.member_delete_box>li:hover {
	text-decoration: underline;
}
.a-btn {
	color: rgba(0, 128, 0, 0.5);
	text-decoration-line: none;
}
.a-btn:hover {
	color: green;
	font-weight: bold;
	text-decoration-line: none;
}
.name_update_btn_wrap{
    margin-left: 400px;
    margin-bottom: 10px;
}
.pw_update_btn_wrap{
	margin-left: 400px;
}
</style>
</head>
<body>
<div class="mypage-container"></div>
<!-- 마이페이지 리스트 -->
<script type="text/javascript">
let me_land = {
		   sd_name : null,
		   sgg_name : null,
		   emd_name : null
		};
let me_sub = {hs_title : null};
getMypage();
function getMypage() {
	  $.ajax({
	    async: true,
	    url: '<c:url value="/member/list"/>',
	    type: 'post',							
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function(data) {
	    	me_sub.hs_title = data.sub.hs_title;
	    	me_land.sd_name = data.sd_name;
	    	me_land.sgg_name = data.sgg_name;
	    	me_land.emd_name = data.emd_name;
	      getMypageInfo(data.member,data.sgg_name,data.sd_name,data.emd_name,me_sub.hs_title);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {

	    }
	  });
}
function getMypageInfo(member,sgg_name,sd_name,emd_name,sub) {
	if(member == null || member.length == 0)
		return;
	console.log(sub);
	var str =
		`
		<div class="mypage-profile">
			<div class="profile-img">
				<img alt="asdasd" src="<c:url value='/resources/img/user-white.svg'/>" class="profile프로필">
			</div>
			<div class="profile-name">
				<h4 style="color:rgba(51, 51, 51, 0.9);">${member.me_id}</h4>
				<p>${member.me_email}</p>
			</div>
			<div class="profile-anything">
				<div class="anything-box">		
					<div class="choose-box">
						<a href='<c:url value="/member/reservemgr?site_id=${user.site_id}"/>'>예약 관리</a><br>
					</div>
					<div class="choose-box">
						<a href='<c:url value="/member/bookmark"/>'>북마크</a><br>
					</div>
					<div class="choose-box">
						<a href='<c:url value="/member/community?id=${user.site_id}"/>'>커뮤니티</a>
					</div>
				</div>
			</div>
			<div class="member_delete_box">
				<li role="button" class="member_delete_btn">회원탈퇴</li>
			</div>
		</div>
	<div class="profile-container">
		<div class="mypage-profile-info">
		<div class="profile-img-name-container">
			
			<div class="mypage-img-name">
			
				<div>
					<div>
						<h4 class="box-name"style="font-size: 33px; font-weight: bold;color:rgba(51, 51, 51, 0.9);">\${member.me_name}</h4>
					</div>
					<div class="new_me_name_hidden">
						<input type='text' id="new_me_name" style="padding:10px;"
						class="box-name2" value="\${member.me_name}"/>
					<div class="name_save_btn_wrap">
						<a  style="margin-left:auto;cursor:pointer;color:black;" class="name_save_btn a-btn">수정완료</a>
					</div>
					</div>
					<div>
						<p>\${member.me_email}</p>
					</div>
				</div>	
				
				<div style="width:100%;">
					<div class="name_update_btn_wrap">
						<a type="button" class="name-update a-btn">실명수정</a>
					</div>
				
					<div class="pw_update_btn_wrap">
						<a type="button" class="pw-update a-btn">비밀번호 변경</a>
					</div>
				</div>
				
				
				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close">&times;</span>
				    <h2>비밀번호 변경</h2>
				    <label for="old_me_pw">현재 비밀번호를 입력하세요</labe>
				    <div class="new_me_pw_hidden">
				      <input type='text' id="old_me_pw" name="me_pw" class="box-pw2"/>
				    </div>
				    
				    <label for="new_me_pw">새 비밀번호를 입력하세요</labe>
				    <div class="new_me_pw_hidden">
				      <input type='password' id="new_me_pw" name="me_pw" class="box-pw2"/>
				    </div>
				    <label for="new_me_pw">새 비밀번호 확인</labe>
				    <div class="new_me_pw_hidden">
				      <input type='password' id="new_me_pw2"name="me_pw2" class="box-pw2"/>
				    </div>
				    <a type="button" class="pw-update-success-btn">비밀번호 변경하기</a>
		  		  </div>
				</div>
			</div>
		</div>
			<div class="hr"></div>
			<div class="mypage-phone">
				<div class="phone-width">
				<div class="new_me_phone_hidden">
					<input type='text' id="new_me_phone" class="box-phone2" value="\${member.me_phone}"/>
				</div>	
					<p class="box-phone">\${member.me_phone}</p>
					<span class="phone_update_btn_wrap"><a type="button" class="phone-update a-btn">변경</a></span>
					<span class="phone_save_btn_wrap"><a type="button" class="phone_save_btn a-btn">수정완료</a></span>
				</div>
			</div>
			<div class="hr"></div>
			<div class="mypage-email">
				<div class="email-width">
				<div class="new_me_email_hidden">
					<input type='text' id="new_me_email" class="box-email2" value="\${member.me_email}"/>
				</div>	
					<p class="box-email">\${member.me_email}</p>
					<span class="email_update_btn_wrap"><a type="button" class="email-update a-btn">변경</a></span>
					<span class="email_save_btn_wrap"><a type="button" class="email_save_btn a-btn">수정완료</a></span>
				</div>
			</div>
				<!-- 관심 과목 시작 -->
				<div class="subject">
					<div class="hr"></div>
					<div class="subject-width">
						<p class="my-hs-subject" id="my-subject">\${me_sub.hs_title}</p>
						<div class="new_me_subject_hidden">
							<select id="subject" class="my-subect-list" name="me_hs_num"  >
								<option value="none">관심 병원 과목을 선택하세요</option>
								<option value="none">없음</option>
								<c:forEach items="${hslist}" var="hs">
									<option value="${hs.hs_num}">${hs.hs_title}</option>
								</c:forEach>
							</select>
						</div>
						<span class="subject_update_btn_wrap"><a type="button" class="subject-update a-btn">변경</a></span>
						<span class="subject_save_btn_wrap"><a type="button" class="subject_save_btn a-btn">수정완료</a></span>
					</div>
					
				</div>
				<!-- 관심 과목 끝 -->
				<div class="hr"></div>
				<div class="mypage-hospital-address">
					<div class="address-width">
					<div class="new_me_address_hidden">
						 <select name="sd_num" required class="sd_num" style="margin:5px;">
						 		<option value="none">시/도를 선택해주세요</option>
					        <c:forEach items="${sidoList}" var="sd">
					            <option value="${sd.sd_num}">${sd.sd_name}</option>
					        </c:forEach>
					     </select>   
						 <select name="sgg_num" class="sgg_num" required style="margin:5px;">
					           <option value="none">시/군/구를 선택해주세요</option>
					     </select>   
					    <select name="emd_num" class="emd_num" required  style="margin:5px;">
					         <option value="none">읍/면/동을 선택해주세요</option>
					 	</select>
					</div>
						<p  class="box-address">\${me_land.sd_name} \${me_land.sgg_name} \${me_land.emd_name}</p>
					<span class="address_update_btn_wrap"><a type="button" class="address-update a-btn">변경</a></span>
					<span class="address_save_btn_wrap"><a type="button" class="address_save_btn a-btn">수정완료</a></span>
					</div>
				</div>
			</div>
 		</div>
		`;	
$('.mypage-container').html(str);
}
</script>
<!--이름 수정 -->
<script type="text/javascript">
//수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
function initComment(){
	  $('.btn-complete').remove();
	  $('.box-btn').show();
	  $(".job-update").show();
}
function resetAll() {
    $('.box-name').css('display', 'block');
    $('.name_update_btn_wrap').css('display', 'block');
    $('.new_me_name_hidden').css('display', 'none');
    $('.name_save_btn_wrap').css('display', 'none');

    $('.box-phone').css('display', 'block');
    $('.phone_update_btn_wrap').css('display', 'block');
    $('.new_me_phone_hidden').css('display', 'none');
    $('.phone_save_btn_wrap').css('display', 'none');

    $('.box-email').css('display', 'block');
    $('.email_update_btn_wrap').css('display', 'block');
    $('.new_me_email_hidden').css('display', 'none');
    $('.email_save_btn_wrap').css('display', 'none');
    $('.job_update_btn_wrap').css('display', 'block');


    $('.box-address').css('display', 'block');
    $('.address_update_btn_wrap').css('display', 'block');
    $('.new_me_address_hidden').css('display', 'none');
    $('.address_save_btn_wrap').css('display', 'none');
    
    $('.box-subject').css('display', 'block');
    $('.subject_update_btn_wrap').css('display', 'block');
    $('.new_me_subject_hidden').css('display', 'none');
    $('.subject_save_btn_wrap').css('display', 'none');
}

$(document).on('click','.name-update', function(){
    resetAll();
    $('.box-name').css('display', 'none');
    $('.name_update_btn_wrap').css('display', 'none');
    $('.new_me_name_hidden').css('display', 'block');
    $('.name_save_btn_wrap').css('display', 'block');
    $('#my-subject').css('display','block');
});
  
$(document).on('click','.phone-update', function(){
    resetAll();
    $('.box-phone').css('display', 'none');
    $('.phone_update_btn_wrap').css('display', 'none');
    $('.new_me_phone_hidden').css('display', 'block');
    $('.phone_save_btn_wrap').css('display', 'block');
    $('#my-subject').css('display','block');
});

$(document).on('click','.email-update', function(){
    resetAll();
    $('.box-email').css('display', 'none');
    $('.email_update_btn_wrap').css('display', 'none');
    $('.new_me_email_hidden').css('display', 'block');
    $('.email_save_btn_wrap').css('display', 'block');
    $('#my-subject').css('display','block');
});

$(document).on('click','.address-update', function(){
    resetAll();
    
    $('.box-address').css('display', 'none');
    $('.address_update_btn_wrap').css('display', 'none');
    $('.new_me_address_hidden').css('display', 'block');
    $('.address_save_btn_wrap').css('display', 'block');
    $('#my-subject').css('display','block');
});
$(document).on('click','.subject-update', function(){
    resetAll();
    $('#my-subject').css('display','none');
    $('.box-subject').css('display', 'none');
    $('.subject_update_btn_wrap').css('display', 'none');
    $('.new_me_subject_hidden').css('display', 'block');
    $('.subject_save_btn_wrap').css('display', 'block');
});

	$(document).on('click', '.name_save_btn', function(){
	  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
	  let member = {
	    me_name : $('.box-name2').val(),
	    me_id : '${member.me_id}'
	  };
	  console.log(member);
	  //서버에 ajax로 데이터를 전송 후 처리
	  $.ajax({
	    async : true,
	    url : '<c:url value="/member/name"/>',
	    type : 'post',
	    data : JSON.stringify(member),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function (data){
	      if(data.res){
	        alert("이름을 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me,me_land.sd_name,me_land.sgg_name,me_land.emd_name,me_sub.hs_title);
			return;	        
	      }else{
	        alert("이름을 수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	});

<!-- 폰 번호 수정 -->
	$(document).on('click', '.phone_save_btn', function(){
	  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
		  let member = {
		    me_phone : $('.box-phone2').val(),
		    me_id : '${member.me_id}'
		  };
		  console.log(member);
		  //서버에 ajax로 데이터를 전송 후 처리
		  $.ajax({
		    async : true,
		    url : '<c:url value="/member/phone"/>',
		    type : 'post',
		    data : JSON.stringify(member),
		    contentType : "application/json; charset=utf-8",
		    dataType : "json",
		    success : function (data){
		      if(data.res){
		        alert("휴대폰 번호를 수정했습니다.");
		        initComment();
		        getMypageInfo(data.me,me_land.sd_name,me_land.sgg_name,me_land.emd_name,me_sub.hs_title);
				return;	        
		      }else{
		        alert("휴대폰 번호를 수정하지 못했습니다.");
		        return;
		      }
		    },
		    error : function(jqXHR, textStatus, errorThrown){
	
		    }
		  });
		});

<!-- 이메일 수정 -->
	$(document).on('click', '.email_save_btn', function(){
		  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
		  let member = {
		    me_email : $('.box-email2').val(),
		    me_id : '${member.me_id}'
		  };
		  console.log(member);
		  //서버에 ajax로 데이터를 전송 후 처리
		  $.ajax({
		    async : true,
		    url : '<c:url value="/member/email"/>',
		    type : 'post',
		    data : JSON.stringify(member),
		    contentType : "application/json; charset=utf-8",
		    dataType : "json",
		    success : function (data){
		      if(data.res){
		        alert("이메일을 수정했습니다.");
		        initComment();
		        getMypageInfo(data.me,me_land.sd_name,me_land.sgg_name,me_land.emd_name,me_sub.hs_title);
				return;	        
		      }else{
		        alert("이메일을 수정하지 못했습니다.");
		        return;
		      }
		    },
		    error : function(jqXHR, textStatus, errorThrown){
		
		    }
		  });
		});

<!-- 주소 수정 -->
$(document).on('click', '.address_save_btn', function(){
   		var la_sd_num = $("select[name='sd_num'] option:selected").val();
    	console.log("시"+la_sd_num);
	    var la_sgg_num = $("select[name='sgg_num'] option:selected").val();
	    console.log("군 구"+la_sgg_num);
	    var la_emd_num = $("select[name='emd_num'] option:selected").val();
	    console.log("읍 면 동"+la_emd_num	);
	   
	  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
	  let member = {
	    la_sd_num : la_sd_num,
	    la_sgg_num: la_sgg_num,
	    la_emd_num: la_emd_num,
	    me_id : '${member.me_id}'
	  };
	  console.log(member);
	  
	  //서버에 ajax로 데이터를 전송 후 처리
	  $.ajax({
	    async : true,
	    url : '<c:url value="/member/address"/>',
	    type : 'post',
	    data : member,
	    success : function (data){
	      if(data.res){
    	    me_land.sd_name = data.sd_name;
	    	me_land.sgg_name = data.sgg_name;
	    	me_land.emd_name = data.emd_name;
	        alert("주소를 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me,me_land.sd_name,me_land.sgg_name,me_land.emd_name,me_sub.hs_title);
			return;	        
	      }else{
	        alert("주소를 수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	});
	
 /* 관심 과목 수정!*/
$(document).on('click', '.subject_save_btn', function(){
	let me_hs_num = $("select[name='me_hs_num'] option:selected").val();
	console.log("과 목 "+me_hs_num);
	let member = {
			me_hs_num : me_hs_num,
		    me_id : '${member.me_id}'
		  };
	  console.log(member);
	  //서버에 ajax로 데이터를 전송 후 처리
	  $.ajax({
	    async : true,
	    url : '<c:url value="/member/subject"/>',
	    type : 'post',
	    data : member,
	    success : function (data){
	      if(data.res){
	    	//$('#my-subject').val(me_sub.hs_title);
	    	console.log(data.sub.hs_title);
	    	me_sub.hs_title = data.sub.hs_title;
	    	console.log(me_sub.hs_title + "과 목 수 정 ");
	        alert("과목을 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me,me_land.sd_name,me_land.sgg_name,me_land.emd_name,me_sub.hs_title);
	       
			return;	        
	      }else{
	        alert("과목을  수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	}); 
/* 군 구 리스트 select로 띄우기 시작 */
$(document).on('change', '[name=sd_num]', function(){
	let sd_num = $("[name=sd_num]").val();
	console.log(sd_num);
	if(sd_num == 'none'){
		sd_num = 0;
	}
	$.ajax({
		method : "post",
		url : '<c:url value="/member/gungoo"/>', 
		data : {"sd_num" : sd_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <option value='\${data[tmp].sgg_num}' selected>\${data[tmp].sgg_name}</option>`;
			}
			$(".sgg_num").html(str);
		}, 
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });
});
/* 읍면동 리스트 select로 띄우기 시작 */
 $(document).on('change', '[name=sgg_num]', function(){
	let sgg_num = $("[name=sgg_num]").val();
	if(sgg_num == 'none'){
		sgg_num = 0;
	}
	$.ajax({
		method : "post",
		url : '<c:url value="/member/eupmyeondong"/>', 
		data : {"sgg_num" : sgg_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <option value='\${data[tmp].emd_num}' selected>\${data[tmp].emd_name}</option>`;
			}
			$(".emd_num").html(str);
			
		}, 
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });
});
/* 읍면동 리스트 select로 띄우기 끝 */

//비밀번호 변경
$(document).ready(function() {
	  // 비밀번호 변경 버튼 클릭 시
	  $(document).on('click', '.pw-update', function() {
	    resetAll();
	    // 모달 창 보이기
	    $("#myModal").css("display", "block");
	  });

	  // 닫기 버튼 클릭 시 모달 닫기
	  $(document).on('click', '.close', function() {
	    $("#myModal").css("display", "none");
	  });

	  // 비밀번호 변경 확인 버튼 클릭 시
	  $(document).on('click', '.pw-update-success-btn', function() {
	    var oldPw = $('#old_me_pw').val();
	    var newPw = $('#new_me_pw').val();
	    var newPwCheck = $('#new_me_pw2').val();

	    if (newPw == newPwCheck) {
	      updatePassword(oldPw, newPw);
	    } else {
	      alert("새로운 비밀번호가 일치하지 않습니다.");
	    }
	  });

	});
	function updatePassword(oldPw, newPw) {
	  let member = {
		  oldPw: oldPw,
		  newPw: newPw,
    	  me_id: '${member.me_id}'
	  };
	  // 비밀번호 업데이트 AJAX 요청
	  $.ajax({
	    async: true,
	    url: '<c:url value="/member/pw"/>',
	    type: 'post',
	    data:  {
	    	oldPw: oldPw,
	    	newPw: newPw,
		    me_id: '${member.me_id}'
		  },
	    success: function(data) {
	      if (data.res) {
	        alert("비밀번호를 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me,me_land.sd_name,me_land.sgg_name,me_land.emd_name,me_sub.hs_title);
	      } else {
	        alert("비밀번호를 수정하지 못했습니다.");
	      }
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      // 오류 처리
	    }
	  });
	}
	
    $(document).on("click",".member_delete_btn",function () {
        let answer = confirm("회원 탈퇴를 진행 하시겠습니까?");
        if (!answer) {
        	return;
        } else {
        	location.href='<c:url value="/user/delete"/>';
        }
    });
</script>

</body>
</html>