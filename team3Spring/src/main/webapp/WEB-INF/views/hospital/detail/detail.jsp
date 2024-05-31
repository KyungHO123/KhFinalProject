<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 상세 페이지 조회</title>
<style type="text/css">
/* 전체 툴 */
.detail-page {
 	box-shadow: 0px 10px 100px -20px rgba(0, 0, 0, 0.2);
    transition: box-shadow 0.3s ease;
    padding: 50px 40px;
    margin: -160px auto 200px auto;
    border-radius: 5px;
    background-color: white;
    width: 80%;
}

.detail-page-sub1 {
	display: flex;
    flex-direction: column;
    align-items: center;
}

.toggle-btn ul li{
	text-align:center;
	width: 100%;
	list-style: none;
	line-height: 30px;
}
.toggle-btn{
	padding:50px;
	display:flex;
	width: 100%;
}

.toggle-button {
	border-bottom:1px solid #c8c8c8;
	padding:30px 0 30px 0;
    height: 80px;
    color: rgba(0, 128, 0, 0.5);
    background-color: white;
    text-decoration: none;
    font-size: 40px;
    font-weight: bold;
}

.page {
	padding:50px;
    display: none;
}

.page.active {
	border-radius:15px;
    display: block;
    box-shadow:inset 0 1px 5px 2px rgba(0,0,0,0.2);
}

.body-container {
	width: 100%;
	height: 100%;
	border: 1px solid gray; 
}


.label {
	color:#555;
	text-align: center;
	font-size: 30px;
}

p {
	margin: 10px 10px 5px 10px;
}

#page3 textarea {
	outline-style:none;
	resize: none;
    overflow-y: hidden;
    width: 99%;
    border-radius: 4px;
    border: 1px solid green;
}

.hospital-subject-btn {
	font-size: 18px;
    margin: 8px 5px 8px 5px;
    display: inline-block;
    padding: 1px 5px 1px 5px;
    margin-bottom: 0px;
	font-size: 25px;
	cursor: default;
	border-radius: 50px;
	
}

.review-btn {
	font-size: 25px;
    font-weight: lighter;
    padding: 10px 10px 10px 10px;
    width: 100%;
}

.review-id {
	font-size: 22px;
	padding-left: 10px;
	font-weight: bolder;
	margin: 5px 10px;
}

.review-content {
	font-size: 20px;
	padding-left: 10px;
	width : 100%;
}

.text-review {
	width: 100%;
	text-align: left;
	margin: 5px 1px 15px 45px;
}

.vw_num {
	width: 90%;
}

.hsList {
	padding-bottom: 20px;
}

.top-label {
	 font-weight: bold; 
	 font-size: 30px;
	 text-align: left;
}

.ho_name {
	height:100px;
	width:100%;
	display:block;
	font-weight: bold;
	margin-bottom: 60px;
}

.top-span {
	font-weight: bold; 
	font-size: 30px;
	text-align: center;
}
.pagination {
	margin-top: 10%;
}
.top-img {
	height: 30px;
	width: 30px;
	vertical-align: baseline;
	margin-left: 10px;
}

.tooltip-link{
  position: absolute;
  left: 25%;
  top:80px;
}

.tooltip-link{
    position: relative;
    background-color: #aad;
    border-radius: 10px;
    border: 3px solid #eee;
    padding: 10px;
    box-sizing: border-box;
}

#myTextarea {
	width: 94%;
    height: 150px;
    border: 1px solid #c8c8c8;
    border-radius:15px;
    margin: 10px 5px 5px 30px;
    font-size: 20px;
    resize: none;
    overflow: auto;
    cursor: inherit;
    outline-style: none;
    padding: 15px;
}

#myTextarea::-webkit-scrollbar {
    width: 16px;
}

#myTextarea::-webkit-scrollbar-thumb {
    background-color: green;
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
}

.book-btn {
	margin:0 auto;
    border-color: green;
    font-size: 40px;
 
    width: 300px;
}

.book-btn:hover {
	/* 1초 동안 반복되며 왔다갔다하는 애니메이션 적용 */
	animation: colorChange 1s infinite alternate;
}

@keyframes colorChange {
    0% { background-color: white; color: green; } /* 초기 색상 */
    50% { background-color: green; color: white; } /* 중간 색상 */
    100% { background-color: white; color: green; } /* 끝 색상 */
}

.login-btn-click{
	background-color: rgba(0, 128, 0, 0.5);
    border: 0px solid rgba(0, 128, 0, 0.5);
    color: white;
    font-size: 40px;
    font-weight: bold;
}

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

.bookmark-btn {
	margin-left:auto;
	height: 60px;
	position:relative;
	width: 70px;
}

.t_btn_box{
	width: 33.3%;
}

.box-review-list {
	display: flex;
	width: 100%;
	height: 100%;
	flex-direction: column;
}	

.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
}

.page-link {
	background-color: white;
	border-color: green;
}

.review-textarea {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
}

.ho_name_div{
	width: 100%;
	text-align: center;
}

.book_mark_container {
	width: 100%;
}

.book_mark_box {
	width: 70px;
	margin-left: auto;
}

.ho_info_box {
	width: 100%;
	text-align: left;
}

.book_btn_box {
	width: 100%;
	display: flex;
	margin: 70px 0 50px 0;
	padding: 10px;
	height: 90px;
}

.ho_info_detail {
	width: 80%;margin: 0 auto;color: #555;
}

#ho_name {
	color: #555;
	font-size: 50px;
    font-weight: bold;
}

.page_container {
	width: 100%
	;height: 100%;
	padding: 50px;
}

.box-review {
	width: 100%;
	height:100%;
	border-bottom: 1px solid #c8c8c8;
}

.review-btn-div {
	width: 14%;
}

.box-review-insert {
	width:100%;
	display: flex;
}

.hd_time_container{
	display:flex;
	border:1px solid lightgray;
	border-radius:15px;
	width: 94%;
	padding: 15px;
	margin: 10px 5px 5px 30px;
}
.hd_time_container input{
	border: none;
	outline-style: none;
	font-size: 20px;
}
.hd_time_container td{
	font-size: 20px;
	font-weight: bold;
	width: 120px;
	height: 40px;
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
	line-height: 45px;
}

.here-title1 {
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: bold;
	line-height: 25px;
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
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			병원
		</div>
		<div
			style="text-align: left; display: flex; height: 50px; margin: 20px 0 50px 0;">
			<a href="<c:url value='/'/>" style="z-index: 999;line-height: 56px;">
			<img class="top-img" alt="위치 이미지"
				src="<c:url value='/resources/img/home-4-line.svg'/>">
			</a>
			<div style="margin: auto 16px;">
				<img class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>
			<div >
				<a class="here-title" href="<c:url value='/hospital/list?hs_num=${detail.hospital.ho_hs_num}'/>"> 병원 </a>
			</div>
			<div style="margin: auto 16px;">
				<img class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>
			<div >
				<p class="here-title1"> 상세페이지 </p>
			</div>
		</div>
	</div>
</div>
<div class="detail-page">
	<div class="detail-page-sub1">
		<div class="ho_name">
		<div class="book_mark_container">
			<div class="book_mark_box">
				<c:choose>
					<c:when test="${detailAlready == true}">
						<img class="btn bookmark-btn bookmark-after" data-id="${user.site_id}" alt="북마크 후" 
						data-tooltip="북마크 설정" src="<c:url value="/resources/img/bookmark-after.png"/>">
						<img class="btn bookmark-btn bookmark-before" style="display: none;" data-id="${user.site_id}" alt="북마크 전" src="<c:url value="/resources/img/bookmark-before.png"/>">			
					</c:when>
					<c:otherwise>
						<img class="btn bookmark-btn bookmark-after" style="display: none;" data-id="${user.site_id}" alt="북마크 후" src="<c:url value="/resources/img/bookmark-after.png"/>">
						<img class="btn bookmark-btn bookmark-before" data-id="${user.site_id}" alt="북마크 전" 
						src="<c:url value="/resources/img/bookmark-before.png"/>">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
			<div class="ho_name_div">
				<h1 class="ho_name1" id="ho_name" >${detail.hospital.ho_name}</h1>
			</div>
			
		</div>
		<div class="ho_info_box" >
			<div class="ho_info_detail">
				<div class="ho_address tooltip-container">
					<label class="top-label" for="ho_address">찾아오시는 길  |  </label>
					<span class="ho_address top-span" id="ho_address">${sido.sd_name} ${sgg.sgg_name} ${emd.emd_name} ${detail.hospital.ho_address}</span>
					<img class="top-img tooltip-contents" data-tooltip="data-tooltip을 활용하여 툴팁 생성하기"
					style="cursor: pointer;" alt="공유 이미지" src="<c:url value="/resources/img/detail-map.svg"/>">
				</div>
				<div class="ho_phone">
					<label class="top-label" for="ho_phone">대표 전화번호  |  </label>
					<span class="ho_phone top-span" id="ho_phone">${detail.hospital.ho_phone}</span>
					<img class="top-img" style="cursor: pointer;" alt="전화 이미지" src="<c:url value="/resources/img/detail-phone.svg"/>">
				</div>
			</div>	
		</div>
		<div class="book_btn_box">
			<a href='<c:url value="/schedule?ho_id=${detail.hospital.ho_id}"/>' class="book-btn btn btn-outline-success">예약하기</a>
		</div>
	</div>
		
	<hr >

	<div class="detail-page-sub2">
		<div class="toggle-page">
			<div class="toggle-btn">
				<ul class="t_btn_box" >
					<li role="button" id="btn1" 
					class="toggle-button login-btn-click" >병원 소개</li>
				</ul>
				<ul class="t_btn_box">
					<li role="button" id="btn2" class="toggle-button">진료 과목</li>
				</ul>
				<ul class="t_btn_box">
					<li role="button" id="btn3" class="toggle-button">리뷰</li>
				</ul>
			</div>
			<div class="page_container">	
				<div id="page1" class="page active">
					<div class="hd_info page1">
						<label class="label" for="hd_info" style="font-weight: bold;">병원 소개</label>
					   	<textarea class="hd_info" id="myTextarea"  oninput="autoResize(this)" readonly>${detail.hd_info}</textarea>
					</div>
					<hr>
					<div class="hd_time page1" id="hd_time">
						<label class="label" for="hd_time" style="font-weight: bold">영업 시간</label>
						<div class="hd_time_container">
							<table class="hd_time" id="hd_time">
								<tr>
							        <td>점심 시간</td>
							        <td><input type="text" class="lunch" name="hd_time" placeholder="12:00~13:00" value="${detail.hd_time}"
							        onkeyup="this.value=this.value.replace(/[^0-9~:]/g,'');" readonly></td>
						 		</tr>
							    <tr>
							        <td>월요일</td>
							        <td><input type="text" class="mon" name="hd_time" placeholder="9:00~18:00"value="${detail.hd_time}"
							        onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
						 		</tr>
								 <tr>
								     <td>화요일</td>
								     <td><input type="text" class="tue" name="hd_time" placeholder="9:00~18:00"value="${detail.hd_time}"
								     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
								 </tr>
								 <tr>
								     <td>수요일</td>
								     <td><input type="text" class="wed" name="hd_time" placeholder="9:00~18:00"
								     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
								 </tr>
								 <tr>
								     <td>목요일</td>
								     <td><input type="text" class="thu" name="hd_time" placeholder="9:00~18:00"
								     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
								 </tr>
								 <tr>
								     <td>금요일</td>
								     <td><input type="text" class="fri" name="hd_time" placeholder="9:00~18:00"
								     onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
								 </tr>
								 <tr>
								     <td>토요일</td>
								     <td><input type="text" class="sat" name="hd_time" placeholder="9:00~18:00"
								     onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" readonly></td>
								 </tr>
								 <tr>
								     <td>일요일</td> 
								     <td><input type="text" class="sun" name="hd_time" placeholder="9:00~18:00"
								     onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" readonly></td>
								 </tr>
							</table>
						</div>
					</div>
					<hr>
					<div class="hd_park page1" id="hd_park">
						<label class="label" for="hd_park" style="font-weight: bold">주차 정보</label>
						<textarea class="hd_park" id="myTextarea" name="hd_park" 
						readonly>${detail.hd_park}</textarea>
					</div>
					<hr>
					<div class="hd_announce page1">
						<label class="label" for="hd_announce" style="font-weight: bold">공지 사항</label>
						<textarea class="hd_announce" id="myTextarea" name="hd_announce" 
						readonly>${detail.hd_announce}</textarea>
					</div>
					<hr >
					<div class="hd_etc page1">
						<label class="label" for="hd_etc" style="font-weight: bold">기타 사항</label>
						<textarea class="hd_etc" id="myTextarea" name="hd_etc" 
						readonly>${detail.hd_etc}</textarea>
					</div>
				</div>
				
				<div id="page2" class="page">
					<div class="hsList">
						<label for="hsList" class="label">대표 진료 과목</label>
						<div class="subject-checkbox hsList">
						  	<c:forEach var="i" begin="0" end="${sub.size() - 1}">
								<button class="hospital-subject-btn btn btn-outline-success" style="cursor: text;">
								<p><c:out value="${sub.get(i).hospital_subject.hs_title}"/></p>
								</button>
						  	</c:forEach>
						</div>
					 </div>
					 <hr >
					 <div class="hd_subject_detail">
					 	<label class="label" for="hd_subject_detail">상세 진료 항목</label><br>
					 	<textarea class="hd_subject_detail" id="myTextarea" name="hd_subject_detail" style="outline-style: none;"
					 	readonly>${detail.hd_subject_detail}</textarea>
					</div>
				</div>
				
				<div id="page3" class="page">
					<div style="margin-bottom: 70px;">
						<h2 style="text-align: left;color: #555;">리뷰(<span class="review-total"></span>)</h2>
					</div>
					<div class="box-review-list">
						<div class="box-review">				
							<div class="review-id">아이디</div>
							<div class="review-content">내용</div>
						</div>
					</div>
					<div class="box-pagination">
						<ul class="pagination justify-content-center"></ul>
					</div>
					<div class="box-review-insert">
						<div class="input-group review-textarea">				
					        <textarea id="review" class="vw_num textarea-review" id="vw_num" name="vw_num"></textarea>
						</div>
						<div class="review-btn-div">
					        <button class="btn btn-outline-success review-insert-btn review-btn " name="review-btn" data-hd-num="${detail.hd_num}">리뷰 등록</button>		
					    </div>    
					</div>			
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 병원 회원은 예약 튕김 -->
<script type="text/javascript">
$('.book-btn').click(function() {
	let user = "${user.site_authority}";
	if(user == "MANAGER") {
		alert("사업자 회원은 예약할 수 없습니다.");
		return false;
	}
});
</script>

<!-- 북마크 추가 버튼 -->
<script type="text/javascript">
$('.bookmark-before').click(function() {
	//로그인 체크 여부
	if(!checkLogin()) {
		return false;
	}
	//서버에 보낼 데이터 생성
	let me_id = $(this).data('id');
	let ho_id = '${detail.hd_ho_id}';
	console.log(me_id);
	console.log(ho_id);
	let bookmark = {
			bmk_me_id : me_id, 
			bmk_ho_id : ho_id	
	}
	
	$.ajax({
		async : true,
		url : '<c:url value="/bookmark/insert"/>', 
		type : 'post', 
		data : JSON.stringify(bookmark), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function(data) {
			if(data.result) {
				alert('북마크 추가되었습니다.');
				getBookmarkAfter(data.already);
				console.log(data.already);
			}
			else {
				alert('사업자 회원은 북마크할 수 없습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){
			alert('로그인 후 이용해주세요.');
		}
	});

});

function getBookmarkAfter(already) {
	if(already) {
		let bookmarkBefore = document.querySelector('.bookmark-before');
		let bookmarkAfter = document.querySelector('.bookmark-after');
		bookmarkBefore.style.display = 'none';
		bookmarkAfter.style.display = 'inline';
	}
	else {
		return;
	}
};
</script>

<!-- 북마크 해제 버튼 -->
<script type="text/javascript">
$('.bookmark-after').click(function() {
	//로그인 체크 여부
	if(!checkLogin()) {
		return false;
	}
	
	//서버에 보낼 데이터 생성
	let me_id = $(this).data('id');
	let ho_id = '${detail.hd_ho_id}';
	console.log(me_id);
	console.log(ho_id);
	let bookmark = {
			bmk_me_id : me_id,
			bmk_ho_id : ho_id
	}
	
	$.ajax({
		async : true,
		url : '<c:url value="/bookmark/delete"/>', 
		type : 'post', 
		data : JSON.stringify(bookmark), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function(data) {
			if(data.result) {
				alert('북마크 삭제되었습니다.');
				getBookmarkBefore(data.already);
				console.log(data.already);
			}
			else {
				alert('북마크 해제 에러1');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){
			alert('로그인 후 이용해주세요.');
		}
	});
	
	function getBookmarkBefore(already) {
		if(!already) {
			let bookmarkBefore = document.querySelector('.bookmark-before');
			let bookmarkAfter = document.querySelector('.bookmark-after');
			bookmarkAfter.style.display = 'none';
			bookmarkBefore.style.display = 'inline';
		}
		else {
			return;
		}
	};
});
</script>

<!-- 리뷰 리스트 조회 -->
<script type="text/javascript">
//댓글 페이지 정보를 가지고 있는 객체 선언
let cri = {
	page : 1, 
	search : "${detail.hd_num}"
}

getReviewList(cri);

function getReviewList(cri) {
	$.ajax({
		async : true, 
		url : '<c:url value="/hospital/review/list"/>', 
		type : 'post', 
		data : JSON.stringify(cri), 
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			console.log(data.reviewList);//확인용
			displayReviewList(data.reviewList);
			displayReviewPagination(data.pm);
			$('.review-total').text(data.pm.totalCount);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.error("Error occurred:", errorThrown);
		}
	});
}

//등록된 리뷰 조회
function displayReviewList(reviewList) {
	let str = '';
	if(reviewList == null || reviewList.length == 0) {
		str = '<h3>등록된 리뷰가 없습니다.</h3>';
		$(".box-review-list").html(str);
		return;
	}
	
	//회원 아이디가 있으면 등록된 리뷰에 수정/삭제 버튼(\${btns}) 달기
	for(item of reviewList) {
		//버튼
		let boxBtns = 
		`
		<span class="box-btn float-right">
			<button class="btn btn-outline-secondary review-update-btn" data-num="\${item.vw_num}">수정</button>
			<button class="btn btn-outline-danger review-del-btn" data-num="\${item.vw_num}">삭제</button>
		</span>
		`;
		
		//유저 아이디가 있으면 달고 : 아니면 빈문자열
		let btns = '${user.site_id}' == item.vw_me_id ? boxBtns : '';
		
		//리뷰에 작성자 | 작성 내용 | 버튼
		str +=
		`
		<div class="box-review">
			<div class="review-id">\${item.vw_me_id}</div>
			<div class="review-content clearfix input-group">
				<span class="text-review c">\${item.vw_content}</span>
				\${btns}
			</div>
		</div>
		`;
	}
	$(".box-review-list").html(str);
}

//리뷰 페이지네이션
function displayReviewPagination(pm) {
	let str = '';
	if(pm.prev) {
		str += 
		`
	    <li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>
		`;
	}
	for(let i = pm.startPage; i<= pm.endPage; i++) {
		let active = pm.cri.page == i ? 'active' : '';
		str += 
		`
	    <li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>
		`;
	}
	
	if(pm.next) {
		str += 
		`
	    <li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
		</li>
		`;
	}
	$('.box-pagination>ul').html(str);
}
$(document).on('click', '.box-pagination .page-link', function() {
	cri.page = $(this).data('page');
	getReviewList(cri);
})
</script>

<!-- 리뷰 등록 -->
<script type="text/javascript">
//리뷰 등록 버튼의 클릭 이벤트를 등록
$(document).on('click', '.review-insert-btn', function() {
	//로그인 안되있으면 return
	if(!checkLogin()) {
		return false;
	}
	
	//예약 완료가 안 되있으면 return;
	if(!checkBook()) {
		return false;
	}

	let review = {
	        vw_hd_num : $(this).data('hd-num'), 
	        vw_content : $('.textarea-review').val()
	    }
	console.log(review);
	//내용이 비어있으면 return
	if(review.vw_content.length == 0) {
		alert('댓글 내용을 작성하세요.');
		return;
	}
	
	//서버에 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/hospital/review/insert"/>', 
		type : 'post', 
		data : JSON.stringify(review), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result=="성공") {
				alert('리뷰를 등록했습니다.');
				$('.textarea-review').val('');
				cri.page = 1;
				getReviewList(cri);
			}else if(data.result=="리뷰널"){
				alert('내용을 입력하세요.');
			}else if(data.result=="회원널"){
				let answer = confirm('로그인후 이용가능 합니다.\n로그인 페이지로 이동하시겠습니까?');
					if(!answer){
						return;
					}else{
						location.href='<c:url value="/main/login"/>';
					}
			}else if(data.result=="병원널"){
				alert('알아서 해 진짜');
			}else if(data.result=="예약널"){
				alert('예약후 리뷰를 작성할 수 있습니다.');
			}else if(data.result=="초과"){
				alert('작성할 수 있는 리뷰 수를 초과하였습니다.\n(예약 1번에 리뷰 1개 제한)');
			}else if(data.result=="사업자"){
				alert('병원 회원은 리뷰를 작성할 수 없습니다.');
			}else {
				alert('리뷰 작성에 실패했습니다.');
			}
			
		}, 
		error : function(xhr, textStatus, errorThrown){
			console.log(error);
		}
	});
});
</script>

<!-- 예약 완료 회원 체크 -->
<script type="text/javascript">
function checkBook() {
	//해당 상세페이지의 병원 아이디로 "예약완료" 한 회원이면
	if("${booked}" == "true") {
		return true;
	}
	else {
		alert("진료받은 회원만 리뷰를 작성할 수 있습니다.");	
		return false;
	}
}
</script>

<!-- 로그인 체크 -->
<script type="text/javascript">
function checkLogin() {
	//로그인 했을 때
	if('${user.site_id}' != '') {
		return true;
	}
	//안했을 때
	if(confirm("로그인이 필요한 기능입니다. \n로그인 하시겠습니까?")) {
		location.href = '<c:url value="/main/login"/>';
	}
	return false;
}
</script>

<!-- 리뷰 삭제 -->
<script type="text/javascript">
$(document).on('click', '.review-del-btn', function() {
	//서버로 보낼 데이터 생성
	let review = {
		vw_num : $(this).data('num')
	}
	console.log(review);
	//서버로 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/hospital/review/delete"/>', 
		type : 'post', 
		data : JSON.stringify(review), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('리뷰를 삭제했습니다.');
				getReviewList(cri);
			}
			else {
				alert('리뷰 삭제 실패');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});
</script>

<!-- 리뷰 수정 -->
<script type="text/javascript">
//수정 버튼을 눌렀을 때
$(document).on('click', '.review-update-btn', function() {
	initReview();
	let reviewBox = $(this).parents(".box-review").find(".text-review");
	//리뷰를 수정할 수 있는 textarea로 변경
	let content = reviewBox.text();
	let str = `<textarea class="form-control">\${content}</textarea>`;
	reviewBox.after(str);
	reviewBox.hide();
	
	//수정, 삭제 버튼을 감추고
	$(this).parents(".box-review").find(".box-btn").hide();
	//수정 완료 버튼을 추가
	let vw_num = $(this).data("num");
	str = `<button class="btn btn-outline-success complete-btn" data-num="\${vw_num}">수정완료</button>`;
	$(this).parents(".box-review").find(".box-btn").after(str);
});

//수정완료 버튼을 눌렀을 때
$(document).on('click', '.complete-btn', function() {
	//전송할 데이터를 생성(리뷰 번호, 리뷰 내용)/페이지 번호는 컨트롤러에서 받아옴
	let review = {
		vw_content : $(".box-review").find("textarea").val(),
		vw_num : $(this).data("num")
	}
	//서버에서 ajax로 데이터를 전송 후 처리
	$.ajax({
		async : true,
		url : '<c:url value="/hospital/review/update"/>', 
		type : 'post', 
		data : JSON.stringify(review), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('리뷰를 수정했습니다.');
				getReviewList(cri);
			}
			else {
				alert('리뷰 수정 실패');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});

//수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글은 원상태로 돌려주는 함수
function initReview() {
	$('.complete-btn').remove();
	$('.box-review').find('textarea').remove();
	$('.box-btn').show();
	$('text-review').show();
}
</script>

<!-- 여러개 선택한 진료과목을 체크박스에 띄우는 스크립트 -->
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

<!-- 토글 버튼 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	let btn1 = document.getElementById('btn1');
	let btn2 = document.getElementById('btn2');
	let btn3 = document.getElementById('btn3');
    
	btn1.addEventListener('click', function() {
		//activatePage 함수는 페이지의 id값을 인자로 받는다.
		activatePage('page1');
	});
	
	btn2.addEventListener('click', function() {
		activatePage('page2');
	});
	
	btn3.addEventListener('click', function() {
		activatePage('page3');
	});
	
	function activatePage(pageId) {
		//모든 화면의 active 클래스 제거
		document.querySelectorAll('.page').forEach(p => {
			p.classList.remove('active');
		});
		
		//선택한 화면에 active 클래스 추가
		let page = document.getElementById(pageId);
        if (page) {
            page.classList.add('active');
        } else {
            console.error("Page not found:", pageId);
        }
	}
});
</script>

<!-- 영업 시간 : 배열로 저장된 시간들 인덱스와 클래스 이름 매핑(안씀) -->
<script type="text/javascript">
//서버에서 받은 hd_time 문자열
let hd_time = "${detail.hd_time}";
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


<script type="text/javascript">
$("#btn1").click(function() {
	$("#btn1").addClass("login-btn-click");
	$("#btn2").removeClass("login-btn-click");
	$("#btn3").removeClass("login-btn-click");
});
$("#btn2").click(function() {
	$("#btn1").removeClass("login-btn-click");
	$("#btn3").removeClass("login-btn-click");
	$("#btn2").addClass("login-btn-click");
});
$("#btn3").click(function() {
	$("#btn3").addClass("login-btn-click");
	$("#btn1").removeClass("login-btn-click");
	$("#btn2").removeClass("login-btn-click");
});
</script>
</body>
</html>