<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지 등록</title>
<style type="text/css">
.info-container {
    padding: 60px 80px;
    margin: -130px auto 70px auto;
    width: 80%;
    background-color: white;
    border-radius: 15px;
    display: block;
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
}

textarea {
	  resize: none;
}

.subject-checkbox {
	display: grid;
    grid-template-columns: repeat(8, 2fr);
    align-items: center;
    margin-bottom: 30px;
    margin-left: -80px;
    font-size: 16px;
}

.info-textarea {
    width: 94%;
    height: 150px;
    border: 1px solid #c8c8c8;
    border-radius: 15px;
    margin: 10px 5px 5px 30px;
    font-size: 20px;
    resize: none;
    overflow: auto;
    cursor: inherit;
    outline-style: none;
    padding: 15px;
}

input[type="checkbox"] {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    appearance: none;
    cursor: pointer;
    background-color: #c8c8c8;
    border: 0px solid white;
    margin: 4px 20px 4px 90px;
}

/* Chrome 및 Safari에서 스크롤바의 색상 변경 */
/* 스크롤바의 Track 색상 */
.info-textarea::-webkit-scrollbar {
    width: 16px; /* 스크롤바의 너비 */
}

/* 스크롤바의 Thumb (드래그할 수 있는 부분) 색상 */
.info-textarea::-webkit-scrollbar-thumb {
    background-color: green; /* 색상 변경 */
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
}

/* 체크박스가 체크되었을 때의 스타일 */
input[type="checkbox"]:checked {
    /* 체크된 상태의 배경색 */
    background-color: transparent; /* 예: 파란색 */
    /* 체크된 상태의 외곽선 색상 */
    border-color: transparent; /* 예: 파란색 */
}

/* 체크박스가 체크되었을 때의 색상 변경 */
input[type="checkbox"]:checked::before {
    content: '\2713';
    display: flex;
    width: 20px;
    height: 20px;
    text-align: center;
    background-color: green;
    color: white;
    border-radius: 20px;
    flex-direction: row;
    align-content: stretch;
    justify-content: space-evenly;
    margin: 0px;
    flex-wrap: nowrap;
    align-items: center;
}

.hospital-btn {
	display: block;
    margin: 0 auto;
    height: 70px;
    width: 50%;
    margin-top: 20px;
    margin-bottom: 20px;
    font-size: 40px;
    font-weight: bold;
    
}

.btn-outline-success {
    color: green;
    border-color: green;
}

.btn-outline-success:hover {
    color: white;
    border-color: green;
    background-color: green;
    /* 45도 각도로 그라데이션 */
	background: linear-gradient(45deg, white, green);
	border: 0px solid white;
	animation: colorChange 1.5s infinite alternate; /* 1초 동안 반복되며 왔다갔다하는 애니메이션 적용 */
}

@keyframes colorChange {
    0% { background-color: white; color: green; } /* 초기 색상 */
    50% { background-color: green; color: white; } /* 중간 색상 */
    100% { background-color: white; color: green; } /* 끝 색상 */
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

.hr-line {
	margin-top: 1rem;
    margin-bottom: 1rem;
    border: 0;
    border-top: 1px solid rgba(0, 0, 0, .1);
}

.info1-box{
	margin-top:80px;
	color:#555;
	box-shadow:inset 0 1px 5px 2px rgba(0, 0, 0, 0.2);
	padding: 50px;
	border-radius: 10px;
}

.info2-box {
	margin-top:80px;
	color:#555;
	box-shadow:inset 0 1px 5px 2px rgba(0, 0, 0, 0.2);
	padding: 50px;
	border-radius: 10px;
}

.info-label {
	padding-left:25px;
	display: flex;
    align-items: center;
    font-size: 24px;
    color: #555;
    margin-bottom: 35px;
}

.sub_label {
    color: rgb(219,0,0);
    text-align: center;
    font-size: 18px;
    font-weight: 600;
    margin: -15px 10px 0px 10px;
}

.label-box {
	display: flex;
    align-items: baseline;
}

.input {
    border: 1px solid #c8c8c8;
    border-radius: 5px;
    margin-left: 10px;
    padding: 5px;
    font-size: 20px;
}

.time_label {
	font-size: 20px;
    color: #555;
}

.time-table {
	margin: 10px 5px 5px 30px;
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
	line-height: 50px;
}

.here-title1 {
	text-decoration: none;
    color: black;
    font-size: 15px;
    font-weight: bold;
    line-height: 50px;
}

.here-title:hover {
	text-decoration: none;
	color: gray;
}
.here-title1:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px">
		<div class="page-title">
			병원 상세페이지 수정
		</div>
		<div
			style="text-align: left; display: flex; height: 50px; margin: 20px 0 50px 0;">
			<a href="<c:url value='/'/>" style="z-index: 999;line-height: 50px;">
			<img
				class="top-img" alt="위치 이미지"
				src="<c:url value='/resources/img/home-4-line.svg'/>">
			</a>
			<div style="margin: auto 16px;">
				<img 
					class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>
			<div>
				<a class="here-title" href="<c:url value='/hospital/mypage'/>"> 병원페이지 </a>
			</div>
			<div style="margin: auto 16px;">
				<img 
					class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>
			<div>
				<p class="here-title1"> 병원 상세페이지 등록/수정 </p>
			</div>
		</div>
	</div>
</div>
<div class="info-container">
	<div class="all-info-box">
				<h2 style="font-weight: bold; text-align: center; font-size: 50px; color: #555;">병원 소개</h2>
			<div class="info1-box">	
				<div class="hd_info" id="hd_info">
					<label for="hd_info" style="font-weight: bold" class="info-label">병원 소개</label>
				   	<textarea class="hd_info info-textarea" id="hd_info" name="hd_info" 
				   	placeholder="병원 소개말을 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_info}</textarea>
				</div>
				
				<hr class="hr-line">
				
				<div class="hd_time" id="hd_time">
					<div class="label-box">
						<label for="hd_time" style="font-weight: bold" class="info-label">영업 시간</label>
						<label for="hd_info_sub" class="sub_label">※숫자, "~ :", "휴무" 로만 입력가능</label>
					</div>
					<table class="hd_time time-table" id="hd_time">
						<tbody>
							<tr>
						        <td class="time_label">점심 시간</td>
						        <td><input type="text" class="input lunch" name="hd_time" placeholder="12:00~13:00"
						        onkeyup="this.value=this.value.replace(/[^0-9~:]/g,'');" required></td>
					 		</tr>
						    <tr>
						        <td class="time_label">월요일</td>
						        <td><input type="text" class="input mon" name="hd_time" placeholder="9:00~18:00"
						        onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
					 		</tr>
						 <tr>
						     <td class="time_label">화요일</td>
						     <td><input type="text" class="input tue" name="hd_time" placeholder="9:00~18:00"
						     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
						 </tr>
						 <tr>
						     <td class="time_label">수요일</td>
						     <td><input type="text" class="input wed" name="hd_time" placeholder="9:00~18:00"
						     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
						 </tr>
						 <tr>
						     <td class="time_label">목요일</td>
						     <td><input type="text" class="input thu" name="hd_time" placeholder="9:00~18:00"
						     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
						 </tr>
						 <tr>
						     <td class="time_label">금요일</td>
						     <td><input type="text" class="input fri" name="hd_time" placeholder="9:00~18:00" 
						     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
						 </tr>
						 <tr>
						     <td class="time_label">토요일</td>
						     <td><input type="text" class="input sat" name="hd_time" placeholder="9:00~18:00"
						     onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" required></td>
						 </tr>
						 <tr>
						     <td class="time_label">일요일</td> 
						     <td><input type="text" class="input sun" name="hd_time" placeholder="9:00~18:00"
						     onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" required></td>
						 </tr>
						</tbody>
					</table>
				</div>
				
				<hr class="hr-line">
				
				<div class="hd_park" id="hd_park">
					<label for="hd_park" style="font-weight: bold" class="info-label">주차 정보</label>
					<textarea class="hd_park info-textarea" id="hd_park" name="hd_park" 
					placeholder="주차 정보를 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_park}</textarea>
				</div>
				
				<hr class="hr-line">
				
				<div class="hd_announce">
					<label for="hd_announce" style="font-weight: bold" class="info-label">공지 사항</label>
					<textarea class="hd_announce info-textarea" id="hd_announce" name="hd_announce" 
					placeholder="공지 사항을 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_announce}</textarea>
				</div>
				
				<hr class="hr-line">
				
				<div class="hd_etc">
					<label for="hd_etc" style="font-weight: bold" class="info-label">기타 사항</label>
					<textarea class="hd_etc info-textarea" id="hd_etc" name="hd_etc" 
					placeholder="기타 사항을 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_etc}</textarea>
				</div>
			</div>
			<hr style="margin-top: 70px;">
			
			<h2 style="font-weight: bold; text-align: center; font-size: 50px; color: #555; margin-top: 80px;">진료 과목</h2>
			<div class="info2-box">
				<div class="hd_hs_num">
					<label for="hd_hs_num" class="info-label" style="font-weight: bold">대표 진료 과목</label>
					<div class="subject-checkbox">
					    <c:choose>
					        <c:when test="${subjects != null}">
					            <c:forEach items="${hsList}" var="hs">
					                <c:set var="isChecked" value="false"/>
					                <c:forEach items="${subjects}" var="sub">
					                    <c:if test="${sub.hsl_hs_num == hs.hs_num}">
					                        <c:set var="isChecked" value="true"/>
					                        <input type="checkbox" class="checkbox" name="hs_num" value="${sub.hsl_hs_num}" checked>${hs.hs_title}
					                    </c:if>
					                </c:forEach>
					                <c:if test="${isChecked == 'false'}">
					                    <input type="checkbox" class="checkbox" name="hs_num" value="${hs.hs_num}">${hs.hs_title}
					                </c:if>
					            </c:forEach>
					        </c:when>
					        <c:otherwise>
					            <c:forEach items="${hsList}" var="hs">
					                <input type="checkbox" class="checkbox" name="hs_num" value="${hs.hs_num}">${hs.hs_title}
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					</div>
				 </div>
				 
				 <hr class="hr-line">
				 
				<div>
				 	<label for="hd_subject_detail" class="info-label" style="font-weight: bold">상세 진료 항목</label>
				 	<textarea class="hd_subject_detail info-textarea" id="hd_subject_detail" name="hd_subject_detail" 
				 	oninput="autoTextarea(this)" placeholder="감염성 질환 / 알레르기 / 만성 질환 / 호흡기 질환 / 피부 질환...">${hoDetail.hd_subject_detail}</textarea>
				</div>
				<button type="submit" class="hospital-btn btn btn-outline-success" name="hospital-btn">병원 소개 등록</button>
			</div>
	</div>
</div>
<!-- 병원 등록시 해제한 과목이면 프로그램 삭제된다는 알림 -->
<script type="text/javascript">
$(document).on("click",".hospital-btn",function () {
    let answer = confirm('대표 진료 과목 해제 시 해제한 과목의 등록 프로그램이 모두 삭제됩니다.\n수정 하시겠습니까?');
    if (!answer) {
    	return false;
    } else {
    	insertDetail();
    }
});
</script>

<!-- 상세페이지 등록(insert) : 상세페이지와 선택한 과목 배열 서버로 전송 -->
<script type="text/javascript">
function insertDetail(){
	let hsList = getCheckedBox();
	console.log(hsList);
	let hd_info = $('[name=hd_info]').val();
	let hd_time = $('[name=hd_time]').val();
	let hd_park = $('[name=hd_park]').val();
	let hd_announce = $('[name=hd_announce]').val();
	let hd_etc = $('[name=hd_etc]').val();
	let hd_subject_detail = $('[name=hd_subject_detail]').val();
	let lunch = $('.lunch').val();
	let mon = $('.mon').val();
	let tue = $('.tue').val();
	let wed = $('.wed').val();
	let thu = $('.thu').val();
	let fri = $('.fri').val();
	let sat = $('.sat').val();
	let sun = $('.sun').val();
	let hd_time_array = [lunch, mon, tue, wed, thu, fri, sat, sun];
	let hd_times = hd_time_array.join(",");
	let detail  = {
		      "hd_info" : hd_info, 
		      "hd_time" : hd_times, 
		      "hd_park" : hd_park,
		      "hd_announce" : hd_announce,
		      "hd_etc" : hd_etc,
		      "hd_subject_detail" : hd_subject_detail,
		      "hsList" : hsList
		    }
	
	if(hsList.length == 0) {
		alert("1개 이상 대표 과목을 선택하세요.");
		return false;
	}
	
		$.ajax({
			async : false, 
			method : "post",
			url : '<c:url value="/hospital/detail/insert"/>',
			data : JSON.stringify(detail), 
			dataType : "json", 
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert(data.msg);
				location.href = '<c:url value="/"/>' + data.url
			},
	        error: function(error) {
	            console.log("Error: " + JSON.stringify(error));
	        }
		});
		return false; //submit을 사용안해서 false
}
</script>

<!-- 상세 페이지 수정(update) -->
<script type="text/javascript">
$(document).ready(function() {
	document.querySelector('element').removeAttribute('style');
});
</script>

<!-- 체크박스로 체크한 객체를 배열로 넣는 스크립트 -->
<script type="text/javascript">
//체크된 리스트 가져오기
function getCheckedBox() {
    var checkedValues = new Array(); // 체크된 값들을 담을 배열
    $("input[name='hs_num']:checked").each(function() {
        checkedValues.push($(this).val());
    });
    return checkedValues;
}

</script>

<!-- 체크한 체크박스들 숨기기 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var element = document.querySelector('element');
    element.removeAttribute('style');
});
</script>

<!-- 여러개의 진료과목 선택하는 스크립트(안씀) -->
<script type="text/javascript">
// 체크박스 클릭 시 hd_hs_num 업데이트
function updateHdHsNums() {
    var checkedBoxes = document.querySelectorAll('.subject-checkbox.hd_hs_num input[type="checkbox"]:checked');
    var selectedHsNums = [];
    checkedBoxes.forEach(function(checkbox) {
        selectedHsNums.push(checkbox.value);
    });
    document.getElementById('hd_hs_num').value = selectedHsNums.join(',');
}

// 페이지 로딩 시 선택된 체크박스 업데이트
window.onload = function() {
    var hd_hs_num = "${hd_hs_num}";
    var selectedHsNums = hd_hs_num.split(',');
    selectedHsNums.forEach(function(hsNum) {
        var checkbox = document.querySelector('.subject-checkbox.hd_hs_num input[value="' + hsNum + '"]');
        if (checkbox) {
            checkbox.checked = true;
        }
    });
};
</script>

<!-- 영업 시간 : 배열로 저장된 시간들 인덱스와 클래스 이름 매핑(안씀) -->
<script type="text/javascript">
//서버에서 받은 hd_time 문자열
let hd_time = "${hoDetail.hd_time}";
//쉼표로 문자열 분할
let timeArray = hd_time.split(',');
//각 요일에 대한 인덱스와 클래스 이름 매핑
let days = {
	'lunch' : 0,
	'mon' : 1,
	'tue' : 2,
	'wed' : 3,
	'thu' : 4,
	'fri' : 5,
	'sat' : 6,
	'sun' : 7
};

//각 요일의 input 필드에 시간 설정
for(let day in days) {
	let index = days[day];
	let inputField = document.querySelector('.' + day);
	
	//시간이 존재하면 input 필드에 설정
	if(timeArray[index]) {
		inputField.value = timeArray[index];
	}
}
</script>
</body>
</html>
