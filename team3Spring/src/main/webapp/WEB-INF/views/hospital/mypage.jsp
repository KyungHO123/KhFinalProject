<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.profile프로필{
width: 250px;
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
	
	margin: 20px 0px -20px 0px;
    text-align: center;
}

.profile-anything {
	border: 1px solid green;
    width: 300px;
    height: 500px;
    margin: 50px 20px 20px 48px;
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
    width: 1000px;
    margin: 30px auto;
    height: 125px;
    padding: 25px;
    flex-direction: column;
    align-items: stretch;
    flex-wrap: wrap;
    align-content: space-between;
    justify-content: space-evenly;
}

.hr {
	width: 100%;
	border: 1px solid lightgray;
}

.mypage-phone {
	margin:3px 0px -8px 0px;
	height:70px;
	width: 100%;
	display: flex;
}

.mypage-email {
	height:70px;
	width: 100%;
	display: flex;
}

.mypage-detail-address {
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

.mypage-ceo {
	width: 100%;
	height:70px;
	display: flex;
}

.mypage-hospital-address {
	display: flex;
    justify-content: space-between;
}

.new_ho_name_hidden {
	width: 180px;
	display: none;
}

.new_ho_name_hidden input {
	width: 250px; /* font-size: 1.5rem; */
}

.name_save_btn_wrap {
	display: none;
}

.new_ho_phone_hidden {
	width: 180px;
	display: none;
}
.phone_save_btn_wrap {
	display: none;
}

.new_ho_email_hidden {
	width: 180px;
	display: none;
}
.email_save_btn_wrap {
	display: none;
}

.new_ho_ceo_hidden {
	width: 180px;
	display: none;
}

.new_ho_detail_address_hidden {
	width: 180px;
	display: none;
}

.new_ho_ceo_hidden input {
	width: 250px;
	position: relative;
}

.ceo_save_btn_wrap {
	display: none;
}
.detail_address_save_btn_wrap {
	display: none;
}
.new_ho_address_hidden {
	width: 180px;
	display: none;
}

.new_ho_address_hidden input {
	width: 300px;
	position: relative;
}

.address_save_btn_wrap {
	display: none;
}
.new_ho_subject_hidden {
	display: none;
}

.new_ho_subject_hidden input {
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

.new_ho_pw_hidden input {
	width: 300px;
}

.choose-box{
	padding:23px;
	text-align:center;
	display:flex;
	width: 100%;
	height: 75px;
 	flex-direction: column;
 	margin: 15px 0px 15px 0px;
}
.choose-box a{
	border-radius: 5px;
    line-height: 45px;
    margin: 0 auto;
    border: 1px solid green;
    width: 100%;
    height: 50px;
    color: green;
    text-decoration: none;
    font-size: 20px;
    display: flex;
    align-items: stretch;
    justify-content: space-around;
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
	
	/* background: linear-gradient(45deg, white, green); */
	border: 0px solid white;
	animation: colorChange 1.5s infinite alternate;
}

@keyframes colorChange {
    0% { background-color: white; color: green; } /* 초기 색상 */
    50% { background-color: green; color: white; } /* 중간 색상 */
    100% { background-color: green; color: white; } /* 끝 색상 */
}

.subject{
	width: 100%;
    height: 40px;
    margin: -3px 0px 8px 0px;

}
.phone-width{
	width: 90%;
	margin: 15px 0px 0px 35px;
	display: flex;
	justify-content: space-between;
}
.email-width{
	width: 90%;
    margin: 20px auto;
	display: flex;
	justify-content: space-between;
}
.ceo-width{
	width: 90%;
    margin: 20px auto;
	display: flex;
	justify-content: space-between;
}
.detail-address-width{
	width: 90%;
    margin: 15px 0px 10px 35px;
	display: flex;
	justify-content: space-between;
}
.subject-width{
	width: 90%;
    margin: 20px auto;
    display: flex;
    justify-content: space-between;
}
.address-width{
	width: 90%;
    margin: 20px auto;
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

.a-btn {
	color: rgba(0, 128, 0, 0.5);
	text-decoration-line: none;
}

.a-btn:hover {
	color: green;
	font-weight: bold;
	text-decoration-line: none;
}

.p-title {
	margin-top: 0;
    margin-bottom: 0;
    font-size: 20px;
}

.hospital_delete_box {
	color: gray;
    list-style: none;
    padding-left: 33px;
    margin: 20px 0px 0px 10px;
}

#new_ho_phone {
	width: 250px;
}

#new_ho_email {
	width: 250px;
}

#new_ho_detail_address {
	width: 250px;
}
</style>
</head>
<body>
<div class="mypage-container"></div>
<!-- 마이페이지 리스트 -->
<script type="text/javascript">
let ho_land = {
		sd_name : null,
		sgg_name : null,
		emd_name : null
}
let ho_sub = {hs_title : null};
getMypage();
function getMypage() {
	$.ajax({
	    async: true,
	    url: '<c:url value="/hospital/list"/>',
	    type: 'post',							
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function(data) {
	    	ho_sub.hs_title = data.hs.hs_title;
	    	ho_land.sd_name = data.sd_name;
	    	ho_land.sgg_name = data.sgg_name;
	    	ho_land.emd_name = data.emd_name;
	    	getMypageInfo(data.hospital, ho_sub.hs_title,
	    		 		data.sgg_name, data.sd_name, data.emd_name);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {

	    }
	  });
}

function getMypageInfo(hospital, hs, sd_name, sgg_name, emd_name) {
	
	if(hospital == null || hospital.length == 0) {
		return;
	}
	console.log(hs);
	let str = 
		`
		<div class="mypage-profile">
			<div class="profile-img">
				<img alt="asdasd" src="<c:url value='/resources/img/user-white.svg'/>" class="profile프로필">
			</div>
			<div class="profile-name" >
				<h4 style="color:#555;">${hospital.ho_id}</h4>
				<p>${hospital.ho_email}</p>
			</div>
			<div class="profile-anything">
				<div class="anything-box">				
					<div class="choose-box">			
						<a href='<c:url value="/hospital/detail/detail?ho_id=\${hospital.ho_id}"/>'>병원 상세 페이지 조회</a><br> 
					</div>
					<div class="choose-box">
						<a href='<c:url value="/hospital/detail/insert"/>'>병원 상세 페이지 등록/수정</a><br>
					</div>
					<div class="choose-box">			
						<a href='<c:url value="/hospital/item/insert"/>'>프로그램 등록/수정/삭제</a><br>
					</div>
					<div class="choose-box">
						<a href = '<c:url value="/hospital/schedule/change"/>'>예약 관리</a><br>
					</div>
					<div class="choose-box">			
						<a href='<c:url value="/hospital/community?site_id=${user.site_id}"/>'>커뮤니티 관리</a>
					</div>
				</div>
			</div>
			<div class="hospital_delete_box">
				<li role="button" class="hospital_delete_btn">회원탈퇴</li>
			</div>
		</div>
		
		<div class="profile-container">
			<div class="mypage-profile-info">
				<div class="profile-img-name-container">
					<div class="mypage-img-name">
						<h4 class="box-name" style="font-size: 40px;color:#555; font-weight: bold;">\${hospital.ho_name}</h4>
						<div class="new_ho_name_hidden">
							<input type="text" id="new_ho_name" class="box-name2" value="\${hospital.ho_name}"/>
						</div>
						<span class="name_update_btn_wrap"><a type="button" class="name-update a-btn">상호명 수정</a></span>
						<span class="name_save_btn_wrap"><a type="button" class="name_save_btn a-btn">수정 완료</a></span>
						<span class="pw_update_btn_wrap"><a type="button" class="pw-update a-btn">비밀번호 변경</a></span>
						<div id="myModal" class="modal">
							<div class="modal-content">
								<span class="close">&times;</span>
								<h2>비밀번호 변경</h2>
								<label for="old_ho_pw">현재 비밀번호를 입력하세요</label>
								<div class="new_ho_pw_hidden">
									<input type="text" id="old_ho_pw" name="ho_pw" class="box-pw2"/>
								</div>
								
								<label for="new_ho_pw">새 비밀번호를 입력하세요</label>
								<div class="new_ho_pw_hidden">
									<input type="password" id="new_ho_pw" name="ho_pw" class="box-pw2"/>
								</div>
								
								<label for="new_ho_pw">새 비밀번호 확인</label>
								<div class="new_ho_pw_hidden">
									<input type="password" id="new_ho_pw2" name="ho_pw2" class="box-pw2"/>
								</div>
								<a type="button" class="pw-update-success-btn a-btn">비밀번호 변경하기</a>
							</div>
						</div>

					</div>
				</div>
				
				<!-- 대표자명 -->
				<div class="hr"></div>
				<div class="mypage-ceo">
					<div class="ceo-width">
						<div class="new_ho_ceo_hidden">
							<input type="text" id="new_ho_ceo" class="box-ceo2" value="\${hospital.ho_ceo}"/>
						</div>
						<p class="box-ceo p-title" id="my_ceo_name">\${hospital.ho_ceo}</p>
						<span class="ceo_update_btn_wrap"><a type="button" class="ceo-update a-btn">변경</a></span>
						<span class="ceo_save_btn_wrap"><a type="button" class="ceo_save_btn a-btn">수정완료</a></span>
					</div>
				</div>

				<!-- 대표 전화번호 -->
				<div class="hr"></div>
				<div class="mypage-phone">
					<div class="phone-width">
						<div class="new_ho_phone_hidden">
							<input type="text" id="new_ho_phone" class="box-phone2" value="\${hospital.ho_phone}"/>
						</div>
						<p class="box-phone p-title">\${hospital.ho_phone}</p>
						<span class="phone_update_btn_wrap"><a type="button" class="phone-update a-btn">변경</a></span>
						<span class="phone_save_btn_wrap"><a type="button" class="phone_save_btn a-btn">수정완료</a></span>
					</div>
				</div>
				
				<!-- 이메일 -->
				<div class="hr"></div>
				<div class="mypage-email">
					<div class="email-width">
						<div class="new_ho_email_hidden">
							<input type="text" id="new_ho_email" class="box-email2" value="\${hospital.ho_email}"/>
						</div>
						<p class="box-email p-title">\${hospital.ho_email}</p>
						<span class="email_update_btn_wrap"><a type="button" class="email-update a-btn">변경</a></span>
						<span class="email_save_btn_wrap"><a type="button" class="email_save_btn a-btn">수정완료</a></span>
					</div>
				</div>
				
				<!-- 대표 진료 과목 -->
				<div class="hr"></div>
				<div class="subject">
					<div class="subject-width">
						<p class="my-hs-subject p-title" id="my-subject">\${ho_sub.hs_title}</p>
						<div class="new_ho_subject_hidden">
							<select id="subject" class="my-subject-list" name="ho_hs_num">
								<option value="none">대표 진료 과목을 선택하세요</option>
								<c:forEach items="${hsList}" var="hs">
									<option value="${hs.hs_num}">${hs.hs_title}</option>
								</c:forEach>
							</select>
						</div>
						<span class="subject_update_btn_wrap"><a type="button" class="subject-update a-btn">변경</a></span>
						<span class="subject_save_btn_wrap"><a type="button" class="subject_save_btn a-btn">수정완료</a></span>
					</div>
				</div>
				
				<!-- 지역 -->
				<div class="hr"></div>
				<div class="mypage-hospital-address">
					<div class="address-width">
						<div class="new_ho_address_hidden">
							<select name="sd_num" class="sd_num" required style="margin:5px;">
								<option value="none">시/도를 선택해주세요</option>
								<c:forEach items="${sidoList}" var="sd">
									<option value="${sd.sd_num}">${sd.sd_name}</option>
								</c:forEach>
							</select>
							<select name="sgg_num" class="sgg_num" required style="margin:5px;">
								<option value="none">시/군/구를 선택해주세요</option>
							</select>
							<select name="emd_num" class="emd_num" required style="margin:5px;">
								<option value="none">읍/면/동을 선택해주세요</option>
							</select>
						</div>
						<p class="box-address p-title">\${ho_land.sd_name} \${ho_land.sgg_name} \${ho_land.emd_name}</p>
						<span class="address_update_btn_wrap"><a type="button" class="address-update a-btn">변경</a></span>
						<span class="address_save_btn_wrap"><a type="button" class="address_save_btn a-btn">수정완료</a></span>
					</div>
				</div>
				
				<!-- 상세주소 -->
				<div class="hr"></div>
				<div class="mypage-detail-address">
					<div class="detail-address-width">
						<div class="new_ho_detail_address_hidden">
							<input type="text" id="new_ho_detail_address" class="box-detail-address2" value="\${hospital.ho_address}"/>
						</div>
						<p class="box-detail-address p-title">\${hospital.ho_address}</p>
						<span class="detail_address_update_btn_wrap"><a type="button" class="detail-address-update a-btn">변경</a></span>
						<span class="detail_address_save_btn_wrap"><a type="button" class="detail_address_save_btn a-btn">수정완료</a></span>
					</div>
				</div>
				
			</div>
		</div>
		`;
$('.mypage-container').html(str);
}
</script>

<!-- 이름 수정 -->
<script type="text/javascript">
function initMypage() {
	$('.btn-complete').remove();
	$('.box-ceo2').remove();
	$('.box-btn').show();
	$('.box-ceo').show();
	$(".ceo-update").show();
}

function resetAll() {
	$('.box-name').css('display', 'block');
    $('.name_update_btn_wrap').css('display', 'block');
    $('.new_ho_name_hidden').css('display', 'none');
    $('.name_save_btn_wrap').css('display', 'none');
    
    $('.box-ceo').css('display', 'block');
    $('.ceo_update_btn_wrap').css('display', 'block');
    $('.new_ho_ceo_hidden').css('display', 'none');
    $('.ceo_save_btn_wrap').css('display', 'none');
    
    $('.box-phone').css('display', 'block');
    $('.phone_update_btn_wrap').css('display', 'block');
    $('.new_ho_phone_hidden').css('display', 'none');
    $('.phone_save_btn_wrap').css('display', 'none');

    $('.box-email').css('display', 'block');
    $('.email_update_btn_wrap').css('display', 'block');
    $('.new_ho_email_hidden').css('display', 'none');
    $('.email_save_btn_wrap').css('display', 'none');
    
    $('.box-subject').css('display', 'block');
    $('.subject_update_btn_wrap').css('display', 'block');
    $('.new_ho_subject_hidden').css('display', 'none');
    $('.subject_save_btn_wrap').css('display', 'none');
    
    $('.box-address').css('display', 'block');
    $('.address_update_btn_wrap').css('display', 'block');
    $('.new_ho_address_hidden').css('display', 'none');
    $('.address_save_btn_wrap').css('display', 'none');
    
    $('.box-detail-address').css('display', 'block');
    $('.detail_address_update_btn_wrap').css('display', 'block');
    $('.new_ho_detail_address_hidden').css('display', 'none');
    $('.detail_address_save_btn_wrap').css('display', 'none');
}

$(document).on('click','.name-update', function(){
    resetAll();
    $('.box-name').css('display', 'none');
    $('.name_update_btn_wrap').css('display', 'none');
    $('.name_update_btn_wrap').css('flex-direction', 'row');
    $('.new_ho_name_hidden').css('display', 'block');
    $('.name_save_btn_wrap').css('display', 'block');
    $('#my_ceo_name').css('display', 'block');
    $('#my-subject').css('display','block');
    $('.pw-update').css('display', 'none');
});

$(document).on('click','.ceo-update', function(){
    resetAll();
    $('.box-ceo').css('display', 'none');
    $('.ceo_update_btn_wrap').css('display', 'none');
    $('.new_ho_ceo_hidden').css('display', 'block');
    $('.ceo_save_btn_wrap').css('display', 'block');
    $('#my-subject').css('display','block');
});

$(document).on('click','.phone-update', function(){
    resetAll();
    $('.box-phone').css('display', 'none');
    $('.phone_update_btn_wrap').css('display', 'none');
    $('.new_ho_phone_hidden').css('display', 'block');
    $('.phone_save_btn_wrap').css('display', 'block');
    $('#my_ceo_name').css('display', 'block');
    $('#my-subject').css('display','block');
});

$(document).on('click','.email-update', function(){
    resetAll();
    $('.box-email').css('display', 'none');
    $('.email_update_btn_wrap').css('display', 'none');
    $('.new_ho_email_hidden').css('display', 'block');
    $('.email_save_btn_wrap').css('display', 'block');
    $('#my_ceo_name').css('display', 'block');
    $('#my-subject').css('display','block');
});

$(document).on('click','.subject-update', function(){
    resetAll();
    $('#my-subject').css('display','none');
    $('.box-subject').css('display', 'none');
    $('.subject_update_btn_wrap').css('display', 'none');
    $('.new_ho_subject_hidden').css('display', 'block');
    $('.subject_save_btn_wrap').css('display', 'block');
    $('#my_ceo_name').css('display', 'block');
});

$(document).on('click','.detail-address-update', function(){
    resetAll();
    $('.box-detail-address').css('display', 'none');
    $('.detail_address_update_btn_wrap').css('display', 'none');
    $('.new_ho_detail_address_hidden').css('display', 'block');
    $('.detail_address_save_btn_wrap').css('display', 'block');
    $('#my_ceo_name').css('display', 'block');
    $('#my-subject').css('display','block');
});

$(document).on('click','.address-update', function(){
    resetAll();
    $('.box-address').css('display', 'none');
    $('.address_update_btn_wrap').css('display', 'none');
    $('.new_ho_address_hidden').css('display', 'block');
    $('.address_save_btn_wrap').css('display', 'block');
    $('#my_ceo_name').css('display', 'block');
    $('#my-subject').css('display','block');
});

<!-- 상호명 수정 -->
$(document).on('click', '.name_save_btn', function() {
	let hospital = {
		ho_name : $('.box-name2').val(),
		ho_id : '${hospital.ho_id}'
	};
	
	$.ajax({
	    async : true,
	    url : '<c:url value="/hospital/name"/>',
	    type : 'post',
	    data : JSON.stringify(hospital),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function(data) {
	      if(data.res){
	        alert("상호명을 수정했습니다.");
	        initMypage();
	        getMypageInfo(data.ho, ho_sub.hs_title,
    		 		data.sgg_name, data.sd_name, data.emd_name);
			return;	        
	      }else{
	        alert("수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
});

<!-- 대표자명 수정 -->
$(document).on('click', '.ceo_save_btn', function() {
	let hospital = {
		ho_ceo : $('.box-ceo2').val(),
		ho_id : '${hospital.ho_id}'
	};
	
	$.ajax({
	    async : true,
	    url : '<c:url value="/hospital/ceo"/>',
	    type : 'post',
	    data : JSON.stringify(hospital),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function(data) {
	      if(data.res){
	        alert("대표자명을 수정했습니다.");
	        initMypage();
	        getMypageInfo(data.ho, ho_sub.hs_title,
    		 		data.sgg_name, data.sd_name, data.emd_name);
			return;	        
	      }else{
	        alert("수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
});

<!-- 대표 전화번호 수정 -->
$(document).on('click', '.phone_save_btn', function() {
	let hospital = {
		ho_phone : $('.box-phone2').val(),
		ho_id : '${hospital.ho_id}'
	};
	
	$.ajax({
	    async : true,
	    url : '<c:url value="/hospital/phone"/>',
	    type : 'post',
	    data : JSON.stringify(hospital),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function(data) {
	      if(data.res){
	        alert("대표 전화번호를 수정했습니다.");
	        initMypage();
	        getMypageInfo(data.ho, ho_sub.hs_title,
    		 		data.sgg_name, data.sd_name, data.emd_name);
			return;	        
	      }else{
	        alert("수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
});

<!-- 이메일 수정 -->
$(document).on('click', '.email_save_btn', function() {
	let hospital = {
		ho_email : $('.box-email2').val(),
		ho_id : '${hospital.ho_id}'
	};
	
	$.ajax({
	    async : true,
	    url : '<c:url value="/hospital/email"/>',
	    type : 'post',
	    data : JSON.stringify(hospital),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function(data) {
	      if(data.res){
	        alert("이메일을 수정했습니다.");
	        initMypage();
	        getMypageInfo(data.ho, ho_sub.hs_title,
    		 		data.sgg_name, data.sd_name, data.emd_name);
			return;	        
	      }else{
	        alert("수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
});

<!-- 상세주소 수정 -->
$(document).on('click', '.detail_address_save_btn', function() {
	let hospital = {
		ho_address : $('.box-detail-address2').val(),
		ho_id : '${hospital.ho_id}'
	};
	
	$.ajax({
	    async : true,
	    url : '<c:url value="/hospital/detail/address"/>',
	    type : 'post',
	    data : JSON.stringify(hospital),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function(data) {
	      if(data.res){
	        alert("상세주소를 수정했습니다.");
	        initMypage();
	        getMypageInfo(data.ho, ho_sub.hs_title,
    		 		data.sgg_name, data.sd_name, data.emd_name);
			return;	        
	      }else{
	        alert("수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
});

<!-- 비밀번호 변경 -->
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
	    var oldPw = $('#old_ho_pw').val();
	    var newPw = $('#new_ho_pw').val();
	    var newPwCheck = $('#new_ho_pw2').val();

	    if (newPw == newPwCheck) {
	      updatePassword(oldPw, newPw);
	    } else {
	      alert("새로운 비밀번호가 일치하지 않습니다.");
	    }
	  });

	});
	
	function updatePassword(oldPw, newPw) {
	  $.ajax({
	    async: true,
	    url: '<c:url value="/hospital/pw"/>',
	    type: 'post',
	    data:  {
	    	oldPw: oldPw,
	    	newPw: newPw,
	    	ho_id: '${hospital.ho_id}'
		  },
	    success: function(data) {
	      if (data.res) {
	        alert("비밀번호를 수정했습니다.");
	        initMypage();
	        getMypageInfo(data.ho, ho_sub.hs_title,
    		 		data.sgg_name, data.sd_name, data.emd_name);
	      } else {
	        alert("비밀번호를 수정하지 못했습니다.");
	      }
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	
	    }
	  });
	}
	
<!-- 대표 진료 과목 수정 -->
$(document).on('click', '.subject_save_btn', function() {
	let ho_hs_num = $("select[name='ho_hs_num'] option:selected").val();
	let hospital = {
			"ho_hs_num" : ho_hs_num,
		    "ho_id" : '${hospital.ho_id}'
		  };

	$.ajax({
	    async : true,
	    url : '<c:url value="/hospital/subject"/>',
	    type : 'post',
	    data : hospital,
	    success : function(data) {
	      if(data.res){
	    	console.log(data.sub.hs_title);
	    	ho_sub.hs_title = data.sub.hs_title;
	    	console.log(data.sub.hs_title);
	    	console.log(ho_sub.hs_title + "과 목 수 정 ");
	        alert("대표 진료 과목을 수정했습니다.");
	        initMypage();
	        getMypageInfo(data.ho, ho_sub.hs_title, 
    		 		data.sgg_name, data.sd_name, data.emd_name);
			return;	        
	      }else{
	        alert("과목을 수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	});
	
<!-- 주소 수정 -->
$(document).on('click', '.address_save_btn', function() {
	var la_sd_num = $("select[name='sd_num'] option:selected").val();
	console.log("시"+la_sd_num);
    var la_sgg_num = $("select[name='sgg_num'] option:selected").val();
    console.log("군 구"+la_sgg_num);
    var la_emd_num = $("select[name='emd_num'] option:selected").val();
    console.log("읍 면 동"+la_emd_num	);
   
  let hospital = {
    la_sd_num : la_sd_num,
    la_sgg_num: la_sgg_num,
    la_emd_num: la_emd_num,
    ho_id : '${hospital.ho_id}'
  };
  
  $.ajax({
    async : true,
    url : '<c:url value="/hospital/address"/>',
    type : 'post',
    data : hospital,
    success : function (data){
      if(data.res){
	    ho_land.sd_name = data.sd_name;
    	ho_land.sgg_name = data.sgg_name;
    	ho_land.emd_name = data.emd_name;
        alert("주소를 수정했습니다.");
        initMypage();
        getMypageInfo(data.ho, ho_sub.hs_title,
		 		data.sgg_name, data.sd_name, data.emd_name);
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

<!-- 시군구 리스트 수정 -->
$(document).on('change', '[name=sd_num]', function() {
	let sd_num = $("[name=sd_num]").val();
	console.log(sd_num);
	if(sd_num == 'none'){
		sd_num = 0;
	}
	$.ajax({
		method : "post",
		url : '<c:url value="/hospital/gungoo"/>', 
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

<!-- 읍면동 리스트 수정 -->
 $(document).on('change', '[name=sgg_num]', function() {
	let sgg_num = $("[name=sgg_num]").val();
	if(sgg_num == 'none'){
		sgg_num = 0;
	}
	$.ajax({
		method : "post",
		url : '<c:url value="/hospital/eupmyeondong"/>', 
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
</script>

<!-- 회원 탈퇴 -->
<script type="text/javascript">
$(document).on("click",".hospital_delete_btn",function () {
    let answer = confirm("회원 탈퇴를 진행 하시겠습니까?");
    if (!answer) {
    	return false;
    } else {
    	location.href='<c:url value="/hospital/delete"/>';
    }
});
</script>
</body>
</html>