<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>병원 중개 사이트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://fastly.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="http://fastly.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Popper JS -->
<script src="http://fastly.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://fastly.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">

.small-img {
	height: 16px;
	width: 16px;
}
.aTag-btn1{
margin-right: auto;
} 
.aTag-btn1,
.aTag-btn2{
	padding: 20px;
	margin:90px 15px 15px 24px;
    width: 280px;
    height: 200px;
    color: black;
    text-decoration: none;
 	  border: 2px solid  rgba(0, 128, 0, 0.5);
}
.aTag-btn1:hover,
.aTag-btn2:hover{text-decoration:none;box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;/* 그림자 효과 추가 */}


.join-groub li:hover{
	border-bottom:3px solid green;
	height: 94px;
}
.메뉴얼 li:hover{
	border-bottom:3px solid green;
	height: 65px;
}
body {
	font-size: 14px;
	font-weight: 300;
	letter-spacing: -0.075em;
}
a:hover{
text-decoration: underline;
}
.home-box {
	width: 100%;
	height: 953px;
	text-align: center;
	background: url('<c:url value="/resources/img/homeBack3.png"/>');
	background-repeat: no-repeat;
	background-size: cover;
    background-origin: content-box;
    background-attachment: fixed;
}

.search-box {
	margin: 0 auto;
 	position: relative;
    overflow: hidden;
    width: 800px; 
}

.search {
	margin-top: 10px;
	 border: none;
     outline: none;
     font-size: 16px;
     padding: 8px;
     width: 100%; 
     position: relative; 
}

 
.header-box.hovered {
	background-color: white;
	opacity: 0;
	animation: fadeIn 0.7s forwards;
}

.header-box:hover {
	background-color: white;
	opacity: 0;
	animation: fadeIn 0.7s forwards;
}
@keyframes fadeIn {
	from {
		opacity: 0;
	}
	to {
		opacity: 1;
	}
}

.header-box {
border-bottom: 1px solid #c8c8c8;
width: 100%;
height: 80px;
display: flex;
background-color: rgba(0, 0, 0, 0);
}

.공백 {
	width: 10%;
}

.로고 {
	display:flex;
	width: 65%;
}
.home-log{
	margin-right: auto;
}

.메뉴얼 {
	width:700px;
	display:flex;
	font-size: 16px;
	font-weight: bold;
}


.긴공백 {
	width: 10%;
}

.로그인 {
display:flex;justify-content:flex-end;
	padding: 20px 0 5px;
	margin: 0 auto;
	width: 35%;
}

.로그인 a {
	color: black;
	text-decoration: none;
}

.join-groub {
	display: flex;
}

.Logo-img {
	width: 170px;
	height: 80px;
}

.header-box a {
	color: white;
}

.header-box:hover a {
	color: black;
}
.header-box.hovered a {
	color: black;
}

.header-box img {
	filter: invert(100%);
}

.header-box:hover img {
	filter: none;
}

.header-box.hovered img {
	filter: none;
}

.홈 {
	background:#fafafa;
	width: 100%;
 	height:100%;
    height: auto;
	display: flex;
	text-align: center;
    flex-direction: column;
}
.home-body{
	padding: 0 50px 100px 50px;
	margin:0 auto;
	background-color:white;
 	width: 80%;
}

.홈왼쪽, .홈오른쪽 {
	display: flex;
	border: 1px solid white;
	width: 50px;
	height: 100%;

	background-color: white;
}

.홈왼쪽 {
	margin-right: auto;
}

.홈오른쪽 {
	margin-left: auto;
}

.여기부터내용 {
	margin:0 auto;
	margin-top: 110px;
	margin-bottom: 180px;
	min-height: calc(100vh - 100px); 
}

.롤링 {
	margin: 0 auto;
	display: flex;
	width: 1950px;
	height: 400px;
	overflow: hidden;
	position: relative;
}

.롤링-내용 {
	width: 100%;
}

.rolling-item {
	flex: 0 0 33.33%;
}

.rolling-item img {
	width: 970px;
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	object-fit: cover;
}

.롤링-내용 {
	display: flex;
	transition: transform 0.5s ease;
}


.롤링-내용 {
	display: flex;
	transition: transform 0.5s ease;
}

.롤링-내용 h1 {
	flex: 0 0 1000px;
	text-align: center;
	line-height: 90px;
	margin: 0;
}

.hot-new {
	text-align: center;
	padding: 60px 0 10px;
    margin-top: 110px;
}

/*hot group*/
.hot-group { 
	box-shadow: 0 3px 16px rgba(0, 0, 0, 0.1);
	margin: 0 auto;
	padding:20px 30px 40px 30px;
	border-radius:10px; 
}
.롤링{
	box-shadow: 0 3px 16px rgba(0, 0, 0, 0.6);
}
.hot-group:hover{
	box-shadow: 0 6px 16px rgba(0, 20, 0, 0.2);
	   transition: box-shadow 0.3s ease;
}
.total-reservation:hover{
box-shadow: 0 6px 16px rgba(0, 20, 0, 0.2);
	   transition: box-shadow 0.3s ease;
}

/*검색창 시작*/
.search-main-left, .search-main-right {
	display: flex;
	width: 300px;
	height: 100%;
}

.search-main-left {
	margin-right: auto;
}

.search-main-right {
	margin-left: auto; 
}

.hot-group a:hover{
color:#a0a0a0;
text-decoration: underline;

}
.btnbtnbtn {
	padding-top: 70px;
}

.btnbtnbtn a {
	display: inline-block;
	width: 113px;
	height: 113px;
	position: relative;
	background-color: white;
	text-align: center;
	border-radius: 10px;
	line-height: 20px;
	margin: 30px;
	text-decoration: none;
	color: black;
	transition: transform 0.3s ease;
}

.btnbtnbtn a:hover {
	transform: rotate(-4deg);
	animation: shake 0.4s ease-in-out infinite alternate;
}
@keyframes shake {
	from {
		transform: rotate(-4deg);
	}
	to {
		transform: rotate(4deg);
	}
}
#scrollToTopButton {
    position: fixed;
    bottom: 20px;
    right: 20px;
    display: none;
    background-color: #c8c8c8;
    color: white;
    border: none;
    border-radius: 50%; /* 동그라미 모양을 만들기 위해 border-radius 값을 50%로 설정합니다. */
    width: 70px;
    height: 70px;
    cursor: pointer;
    outline: none; /* 클릭했을 때 버튼 주위에 파란 테두리를 없애기 위해 outline을 none으로 설정합니다. */
}

#scrollToTopButton:hover {
    background-color: #828282;
}

.main-area {
	display: flex;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

.btnbtnbtn a span {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	font-size: 13px;
	font-weight: bold;
}

.search {
	width: 800px;
	height: 56px;
	line-height: 56px;
	font-size: 20px;
	font-weight: 300;
	color: #333;
	padding: 0 68px 0 10px;
	border-radius: 5px;
}

.search-btn {
	width: 50px;
	height: 56px;
	position: absolute;
	bottom: 0;
	right:-15px; 
	transform : translateX( -50%);
	transition: all 0.3s;
	transform: translateX(-50%);
	border-radius:0 6px 6px 0;
}

.search-btn .search-btn {
	width: 20px;
	height: auto;
}

.btnbtnbtn img {
	margin-top: 15px;
	width: 60px;
	height: 60px;
}

a {
	text-decoration: inherit;
	color: inherit;
}
.hospital-group{
text-align: center;
margin-top: 200px;

}
.button-link {
width: 100px;
height: 40px;
border: 1px solid #a0a0a0;
line-height: 50px;
text-decoration: none;
color: #a0a0a0;
padding: 10px;
}

.button-link:hover {
text-decoration:none;
 color: #a0a0a0;
}
.공지사항{
display:flex;
border-top: 1px solid #c8c8c8;
background-color:#fafafa;
width: 100%;
height: 50px;
}
.공지사항 a:hover{
text-decoration: underline;
}

/* 푸터 입니다.*/
.footer{
width: 100%;border-top: 1px solid gray;height:400px;background-color: #5A5F5F;
color: white;text-align: center;
}
.footer a:hover{
color: white;
text-decoration: underline;
}

.footer-info-area{
list-style:none;
display:flex;
margin: 0 auto;
padding: 50px 0 90px;
width: 90%;
text-align: left
}
.footer-logo{
width: 200px;
height: 140px;
margin-right: 4px;
background-size: 100% auto;

}
.footer-content{
width:23%;
border-right: 1px solid #989898;
padding-right: 15px;
margin-right: 50px;

}
.copy-disc{
bottom: 0;
}
.footer-content ul li a{
margin-top: 15px;
}


/*전체 예역 현황*/

.total-reservation{
border-radius:10px;
padding:30px;display:grid;grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
    box-shadow: 0 3px 16px rgba(0, 0, 0, 0.1);width: 100%;height: 460px;margin: 0 auto;
}
.hos-sub{
width:85%;height:120px;border:2px solid green;
margin:15px;padding:10px;
}
.reservation-box{
width:100%;
display: flex;

}
.category{
z-index:9999;position:absolute;line-height:50px;
height:50px;width:100%;background-color: #FCF9F7;

}
.category-board{
z-index:9999;position:absolute;line-height:50px;
height:50px;width:100%;background-color: #FCF9F7;

}



.메뉴얼 ul {
	margin:0;
    list-style-type: none; 
    padding: 0; 
    display: flex; 
    justify-content: center; 
}

.메뉴얼 li {
	white-space:nowrap;
    margin: 15px 10px; 
}

.메뉴얼 a {
	margin:20px;
	line-height: 53px;
    text-decoration: none; 
    padding: 10px; 
}

.join-groub ul{
	position:relative;
	margin:-50px;
    list-style-type: none; 
    padding: 0; 
    display: flex; 
    justify-content: center; 
}
.join-groub li{
	white-space:nowrap;
    margin: 15px 10px; 
}
.join-groub a{
	margin:20px;
	line-height: 53px;
    text-decoration: none; 
    padding: 10px; 
}
.new_hospital-sub{
	width: 100%;height: 150px;padding: 3px;margin-top:10px; 
	
}
.hs_btn,.bo_btn{
margin: 10px;
}
.rolling-item{width: 100%;height: 100%;}
.hot-group td{
	white-space: nowrap;
}

.ho-name{
	font-weight: bold;
	color: rgba(0, 128, 0, 0.5);
	font-size: 23px;
	margin-top: 20px;
	text-align: left;
}
.hs-title{
	color: gray;
	font-size: 16px;
	text-align: left;
	margin-top: 10px;
}
.hd-time{
	text-align: left;
	margin-top: 5px;
}
.ho-address{
	text-align: left;
	margin-top: 5px;
}
.text-boxBox{
	width:100%;height:300px;
	text-align: center;
	
}

.search-title1{
	color: white;
	font-size: 38px;
	margin-top: 160px;
}
.search-title2{
	font-weight: 500;
	font-size: 40px;
	margin-bottom: -5px;
}

.search_title_container .search-title1,
.search_title_container .search-title2 {
    text-shadow: 0 1px 4px rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body>
	<div class="home-box">
		<div class="header-container">
			<div class="header-box">
				<div class="공백"></div>
				<div class="로고">
					<a class="nav-link home-log" href="<c:url value='/'/>"> <img alt="로고이미지"
						style="width: 170px; height: 80px;" class="Logo-img"
						src="<c:url value='/resources/img/Hospital.png'/>">
					</a>
					<div class="메뉴얼">
						<ul>
							<li class="hos-btn-li">
								<a href="<c:url value="/hospital/list?hs_num=0"/>" class="hos-btn">병원</a> 
							</li>
							<li class="board_btn-li">
								<a href="<c:url value="/board/all"/>" class="board_btn">커뮤니티</a> 
							</li>
							<li>
								<a href="<c:url value='/board/list?bo_num=1'/>">공지사항</a>
							</li>
							<c:if test='${user.getSite_authority().equals("USER")}'>	
								<li>
									<a href="<c:url value="/member/bookmark"/>">북마크</a>
								</li>
							</c:if>
							<li>
								<c:if test='${user.getSite_authority().equals("USER")}'>
									<a href="<c:url value='/member/reservemgr?site_id=${user.getSite_id()}'/>">예약관리</a> 
								</c:if>
								<c:if test='${user.getSite_authority().equals("MANAGER")}'>
									<a href="<c:url value='/hospital/schedule/change'/>">예약관리</a>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
				<div class="긴공백"></div>
				<div class="로그인">
					<div class="join-groub">
						<ul>	
							<c:if test="${user == null }">
								<li>
									<a class="nav-link a " href="<c:url value='/main/login'/>"><img alt="로고이미지" 
									src="<c:url value='/resources/img/user-white.svg'/>"> 로그인</a>
								</li>
								<li>	
									<a class="nav-link a" href="<c:url value='/main/signup'/>">회원가입</a>
								</li>	
							</c:if>
							<c:if test="${user != null}">
								<li>
									<a class="nav-link" href='<c:url value="/logout"/>'>로그아웃</a>
								</li>
							</c:if>
							<c:if test="${user != null && user.getSite_authority().equals('ADMIN')}">
								<li>
									<a class="nav-link" href='<c:url value="/admin/adminpage"/>'>관리자 페이지</a>
								</li>
							</c:if>
							<c:if test="${user != null && user.getSite_authority().equals('USER')}">
							    <li>				
							        <a class="nav-link" href='<c:url value="/member/mypage"/>'>마이페이지</a>
							    </li>
							</c:if>
							<c:if test="${user != null && user.getSite_authority().equals('MANAGER')}">
								<li>
									<a class="nav-link" href='<c:url value="/hospital/mypage"/>'>병원페이지</a>
								</li>	
							</c:if>	
						</ul>		
					</div>
				</div>
				<div class="공백"></div>
			</div>
			<div class="category" style="display: none;" >
		        <c:forEach items="${list}" var="hs">
		            <tr>
		                <th><a href="<c:url value="/hospital/list?hs_num=${hs.hs_num}"/>" class="hs_btn">${hs.hs_title}</a></th>
		            </tr>
		        </c:forEach>
	  		</div>
			<div class="category-board" style="display: none ;" >
		        <c:forEach items="${boList}" var="bo">
		        	<c:if test="${bo.bo_num > 1}">
			            <tr>
			                <th><a href="<c:url value="/board/list?bo_num=${bo.bo_num}"/>" class="bo_btn">${bo.bo_title}</a></th>
			            </tr>
		            </c:if>
		        </c:forEach>
	  		</div>
  		</div>
  		
		<div class="main-area">
			<div class="search-main-left"></div>
			<div class="main-search-area">
				<div class="search_title_container">
					<div class="search-title1">예약을 원하시는<br>
					<p class="search-title2">진료 과목을 검색해보세요.</p></div>
				</div>
				<div class="search-box">
					<input type="search" class="search" id="autoComplete"> 
					  <span class="typing-placeholder"></span>
					<input type="image" value="" class="search-btn" src="<c:url value='/resources/img/sarchbtn.png'/>">
				</div>
				<div class="btnbtnbtn">
					<a href="<c:url value="/hospital/list?hs_num=0"/>"> <img alt="병원이미지"
						src="<c:url value='/resources/img/hospital5.png'/>"> <span>병원</span>
					</a> <a href="<c:url value="/board/all"/>"> <img alt="커뮤니티이미지"
						src="<c:url value='/resources/img/comu.png'/>"> <span>커뮤니티</span>
					</a> 
					<a href="<c:url value='/board/list?bo_num=1'/>"><img alt="로고이미지"
						src="<c:url value='/resources/img/공지사항.png'/>"> <span>공지사항</span>
					</a> 
					<c:if test='${user.getSite_authority().equals("USER")}'>	
						<a href="<c:url value="/member/bookmark"/>"> <img alt="로고이미지"
							src="<c:url value='/resources/img/bookmark.png'/>"> <span>북마크</span>
						</a>
					</c:if>
					<c:if test='${user.getSite_authority().equals("MANAGER")}'>	
						<a href="<c:url value="/hospital/schedule/change"/>"> <img alt="로고이미지"
							src="<c:url value='/resources/img/book.png'/>"> <span>예약관리</span>
						</a>
					</c:if>
					
					
				</div>
			</div>
			<div class="search-main-right"></div>
		</div>
	</div>
	<div class="홈">
		<div class="home-body">
		<div class="여기부터내용">
			<div class="hot-new">
				<h3 style="font-weight: bold;color: #555">&lt;Hot & New&gt;</h3>
				<p style="color: gray;">새롭고 재밌는 소식들을 여기서!</p>
			</div>
			<div class="hot-group" style="display: flex;margin:0 auto;width: 100%;margin-bottom: 35px;">
				<table style="width: 100%;text-align: center;height: 50px;">
					<thead style="width: 100%;margin-bottom: 20px;">
						<tr style="height: 60px;">	
							 <th style="width: 5%">No</th>
                             <th style="width: 40%">제목</th>
                             <th style="width: 15%">작성자</th>
                             <th style="width: 20%">날짜</th>
                             <th style="width: 10%">좋아요</th>
                             <th style="width: 10%">조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${poList}" var="po">
					    <c:set var="boPostCount" value="${boPostCount + 1}"/> 
						<c:if test="${boPostCount eq null }">
						<h2>게시글이 없습니다.</h2>
						</c:if>
						<c:if test="${poList ne null}">
							<tr style="height: 50px;border-bottom: 2px solid #ffebec;font-size: 18px;color: #555">
								<td>${boPostCount}</td>
								<td style=" white-space: nowrap;
								    overflow: hidden;
								    text-overflow: ellipsis;
								    max-width: 100px;
									"><a href="<c:url value='/board/detail?po_num=${po.po_num}'/>">${po.po_title}</a></td>
								<td><a href="<c:url value='/board/userpost?po_id=${po.po_id}'/>">${po.po_id}</a></td>
								<td>${po.changeDate1}</td>
								<td>${po.po_up}</td>
								<td>${po.po_view}</td>
							</tr>
						</c:if>	
					</c:forEach>	
					</tbody>
				</table>
			</div>
			<div style="text-align: center;width: 100%;margin: 0 auto;display: block;" >
			<div class="hr" style="margin-bottom:40px;border: 1px solid #d2d2d2;width: 100%;"></div>
				<a href="<c:url value='/board/all'/>"  class="button-link" style="margin-top: 50px">더보기</a>
			</div>
			<div class="hospital-group">
			<h3 style="font-weight: bold;color: #555">&lt;내 지역 병원&gt;</h3>
			<p style="color: gray;">내 지역 병원 소개!</p>
			<div class="hot-group" style="display: flex;width: 100%;height:400px;text-align: center;margin-bottom: 35px">
				<c:if test="${user==null}">
					<div class="text-boxBox">
						<h4 style=" color: #c8c8c8;line-height:100px;">로그인후 확인 가능합니다</h4>
					</div>	
				</c:if>
				<c:if test="${user != null }">
					<c:choose>
						<c:when test="${empty hoList}">
							<h4 style="color: #c8c8c8; text-align: center;">현재 지역에 있는 병원이 없습니다.</h4>
						</c:when>
						<c:otherwise>
							<c:forEach items="${hoList}" var="ho">
								 <a class="aTag-btn1" href="<c:url value='/hospital/detail/detail?ho_id=${ho.ho_id}'/>" style="padding: auto;">
									<!-- 병원명,병원ceo명,과목명,주소 넣기 -->
									<div class="ho-name">${ho.ho_name}</div>
									<div class="hs-title">${ho.hs.hs_title}</div>
									<div class="ho-address"><img class="small-img"
			   								alt="위치 이미지" src="<c:url value="/resources/img/map-pin-2-fill.svg"/>">${ho.ho_address}</div>
								 </a>
							 </c:forEach>
						 </c:otherwise>
					</c:choose>
				</c:if>
			</div>
			<div style="text-align: center;width: 100%;">
			<div class="hr" style="margin-bottom:40px;border: 1px solid #d2d2d2;width: 100%;"></div>
				<a href="<c:url value='/hospital/list?hs_num=0'/>" class="button-link" style="margin-top: 50px">더보기</a>
			</div>
			
			
			<div class="hospital-reservation" style="margin-top: 150px">
					<div class="new_hospital-res" style="margin:0 auto;">
						<h4 style="font-weight: bold;color: #555">< 실시간 예약 현황 ></h4>
						<p style="color: gray;">실시간 예약 현황들은 여기서!</p>
					</div>
					<div class="reservation-box">	
						<div class="total-reservation">
							<c:choose>
								<c:when test="${user != null}">
									<c:forEach items="${reList}" var="re">
									<div class="new_hospital-sub">
										<div class="hos-sub">
											<h5><a href="<c:url value='/hospital/detail/detail?ho_id=${re.schedule.program.hp_ho_id}'/>">${re.schedule.program.hospital.ho_name}</a></h5>
											<p>${re.schedule.program.hsList.hospital_subject.hs_title}</p>
											<p>${re.maskedId}님</p>
											<p>${re.changeDate}</p>
										</div>
									</div>	
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="new_hospital-sub" >
										<div class="text-boxBox"style="right: 10px; position: absolute;" >
											<h4 style=" color: #c8c8c8;line-height: 100px;">로그인후 확인 가능합니다</h4>
										</div>
									</div>	
								</c:otherwise>
							</c:choose>
						</div>
					 <hr>
				  </div>
			</div>
			</div>
		</div>	
		</div>	
	</div>
	<div class="롤링" style="margin-bottom: 50px">
		<div class="롤링-내용">
			<div class="rolling-item">
				<img alt="" src="<c:url value='/resources/img/척추골절.jpg'/>">
			</div>
			<div class="rolling-item">
				<img alt="" src="<c:url value='/resources/img/레전드.jpg'/>">
			</div>
			<div class="rolling-item">
				<img alt="" src="<c:url value='/resources/img/의료개혁.jpg'/>">
			</div>
			<div class="rolling-item">
				<img alt="" src="<c:url value='/resources/img/성형.jpg'/>">
			</div>
			<div class="rolling-item">
				<img alt="" src="<c:url value='/resources/img/윤승규.jpg'/>">
			</div>
			<div class="rolling-item">
				<img alt="" src="<c:url value='/resources/img/이재욱.jpg'/>">
			</div>
		</div>
	</div>
			 <div class="공지사항">
				 <img alt="미니공지" style="width: 48px;margin-left: 100px"
				 src="<c:url value='/resources/img/미니공지.png'/>">
				 <span style="color: gray;margin-right:auto;line-height: 3.5;margin-left: 23px " class="notice_list">
						 
				 </span>
				 <a href="<c:url value='/board/list?bo_num=1'/>"
				 style="line-height: 3.5;margin-right: 50px;color: gray;border: 1px solid #fafafa;"
				 >더보기</a>
			</div>
			
		  <div class="footer">
		  	<div class="footer-info-area">
			  	<div class="footer-img">
			  		<img alt="zz" class="footer-logo"
			  		src="<c:url value='/resources/img/Hospital.png'/>">
			  		<img alt="" src="">
			  		<img alt="" src="">
			  	</div>	
			  	<div class="footer-content">
			  		<ul>
			  			<li>
			  				<a href="#">회사소개</a>
			  			</li>
			  			<li>
			  				<a href="#">이용약관</a>
			  			</li>
			  			<li>
			  				<a href="#">위치기반서비스이용약관</a>
			  			</li>
			  			<li>
			  				<a href="#">제휴문의</a>
			  			</li>
			  			<li>
			  				<a href="#">개인정보처리방침</a>
			  			</li>
			  			<li>
			  				<a href="#">익명신고센터</a>
			  			</li>
			  		</ul>
			  	</div>
			  	<div class="footer-content">
			  		<ul>
			  			<li>
			  				<a href="#">저작권규약</a>
			  			</li>
			  			<li>
			  				<a href="#">책임한계 및 법적고지</a>
			  			</li>
			  			<li>
			  				<a href="#">이메일 무단수집거부</a>
			  			</li>
			  			<li>
			  				<a href="#">기사배열방침</a>
			  			</li>
			  			<li>
			  				<a href="#">고객센터문의</a>
			  			</li>
			  		</ul>
		  	</div>	
		  	<div class="company-info" >
			  	<div style="font-size: 14px; line-height: 18px; margin-bottom: 8px;">
			  		Hospital주식회사 | 대표 : 정경호<br>
			  		서울특별시 강남구 강남구 테헤란로14길 6‎ 6층 (역삼동)<br>
			  		사업자 번호 :123-456-7890 | 통신판매업:2024-서울강남-1234호<br>
			  		인터넷뉴스서비스등록번호:서울,가12345(등록일자:2024.04.14)<br>
			  		발행ㆍ편집인:정경호 | 기사배열책임자:정경호 | 청소년보호책임자 : 정경호<br>
			  	</div>
			  	<span>영업문의:<em>010-4407-1418</em></span>
			  	<span>중개회원문의:<em>010-4407-1418</em></span>
			  	<span>팩스:<em>02-123-4567</em></span>
		 	</div> 	
    	</div>
		 	<div class="copy-disc" style="margin-top: 68px">
	        	  <p>&copy; 2024 정경호. All rights reserved.</p>
       	  	</div>
	</div>


</body>
<button id="scrollToTopButton" onclick="scrollToTop()">위로가기</button>
<script>
     $('.hos-btn-li').hover(function() {
         $('.category').show();
         $('.header-box').addClass('hovered');
         $('.category-board').hide();
     });
     $('.category').mouseleave(function() {
    	 $('.category').hide();
    	 $('.header-box').removeClass('hovered');
     });
     $('.board_btn-li').hover(function() {
    	 $('.category').hide();
    	  $('.header-box').addClass('hovered');
         $('.category-board').show();
     });
     $('.category-board').mouseleave(function() {
    	 $('.category-board').hide();
    	 $('.header-box').removeClass('hovered');
     });
     $('.board_btn-li').mouseleave(function() {
    	 $('.category-board').hide();
    	 
    	 $('.header-box').removeClass('hovered');
     });
$(document).ready(function() {
    function roll() {
        var container = $('.롤링');
        var firstItem = container.find('.rolling-item:first');
        var itemWidth = firstItem.outerWidth();

        container.find('.롤링-내용').animate({
            marginLeft: -itemWidth
        }, 10000, 'linear', function() {
            $(this).css('marginLeft', 0).append(firstItem);
            roll();  
        });
    }

    roll();  
});
$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 20) {
            $("#scrollToTopButton").fadeIn();
        } else {
            $("#scrollToTopButton").fadeOut();
        }
    });
    $("#scrollToTopButton").click(function() {
        $("html, body").animate({ scrollTop: 0 }, "slow");
        return false;
    });
});
     $(document).ready(function() {
        var searchInput = $('.search');
        var defaultTexts = [
            "내과", "외과", "안과", "소아과", "정형외과", "이비인후과", "치과",
            "산부인과", "신경과", "신경외과", "성형외과", "피부과", "비뇨기과", 
            "건강검진", "마취통증학과", "신경과"
        ];
        let currentTextIndex = 0;
        let currentIndex = 0;

        function typeText() {
            var currentWord = defaultTexts[currentTextIndex];
            var currentTypedText = currentWord.substring(0, currentIndex);
            searchInput.attr("placeholder", currentTypedText);
            currentIndex = (currentIndex + 1) % (currentWord.length + 1);
            if (currentIndex === 0) {
                currentTextIndex = (currentTextIndex + 1) % defaultTexts.length;
            }
        }

        setInterval(typeText, 400); 
    }); 
$(document).ready(function() {
    let boPostCount = "${boPostCount}";
    
	if(boPostCount == null || boPostCount.length == 0 || boPostCount == ""){	
	   return;
	}else{
		 boPostCount = "${boPostCount}";
		 $("tr").each(function() {
	        let countCell = $(this).find("td:first-child"); 
	        if (countCell.text() == "1" || countCell.text() == "2" || countCell.text() == "3") {
	            $(this).css("background-color", "#fff8f6"); 
	        }
	    });
	}
});
$(document).ready(function () {
	
	$('#autoComplete').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "<c:url value='/hospital/autocomplete'/>"   
		         , type : "POST"
		         , data : {value: request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		             response(
		                 $.map(data, function(item) {
		                     return {
		                    	     label : item.hs_title   	// 목록에 표시되는 값
		                           , value : item.hs_title 		// 선택 시 input창에 표시되는 값
		                           , idx : item.hs_num // index
		                     };
		                 })
		             );    //response
		         }
		         ,error : function(){ //실패
		             alert("오류가 발생했습니다.");
		         }
		     });
		}
		,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
		}
		,minLength: 1// 최소 글자수
		,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
		,delay: 100	//autocomplete 딜레이 시간(ms)
		,select : function(evt, ui) { 
	      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
				console.log(ui.item.label);
				console.log(ui.item.idx);
		 }
	});
	
	
	
	$('.search-btn').click(function () {
		homeSearch();
	})//search-btn end;
	$('.search').keypress(function () {
		 if (event.keyCode === 13) {
			 homeSearch();
		    }
		
	})//search end;
	function homeSearch() {
		
		let search = $('.search').val();
		
		$.ajax({
			method : "post",
			url : "<c:url value='/hospital/search'/>",
			success : function (data){
				console.log(data);
				for(item of data){
					let A = false;
					console.log(item.hs_num);
					if(item.hs_title == search){
						A = true;
						location.href=`<c:url value="/hospital/list?hs_num=\${item.hs_num}"/>`;
						return;
					}
				}
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
		
		
		
	}
});//function end;

</script>
<script type="text/javascript">
notice();
function notice() {
    $.ajax({
        async: true,
        method: "get",
        url: '<c:url value="/footer"/>',
        success: function(data) {
        	if(data.notice){
        		for(let po of data.notice){
	        		let str = 
	        			`
	        				공지사항 : &emsp;
	        				<a href="<c:url value='/board/detail?po_num=\${po.po_num}'/>" style="font-weight:bold">\${po.po_title}</a>
	        			`;
	        		$('.notice_list').html(str);
	        	}
        	}
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error: " + textStatus, errorThrown);
        }
    });
}

</script>
</html>