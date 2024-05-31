<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 금액 확인</title>
<style type="text/css">
.btn {
  display: inline-block;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #007bff;
  color: #fff;
  font-size: 16px;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

/* 버튼 호버 효과 */
.btn:hover {
  background-color: #0056b3;
}

/* 버튼 클릭 효과 */
.btn:active {
  background-color: #004080;
}
.all-box{
	width: 100%;
	margin-top: 100px;
	/* border: 1px solid black; */
	height: 800px;
    margin-bottom: 50px;
	padding: 20px 20px;
	box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
	border-radius: 15px;

}

.table thead th {
	text-align: center;
    border-bottom: 2px solid #dee2e6;
}

.table td {
	text-align: center;
}
/* 위 타이틀 */
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
	line-height: 50px;
}

.here-title1 {
	text-decoration: none;
    color: black;
    font-size: 15px;
    font-weight: bold;
    line-height: 50px;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px">
		<div class="page-title">
			예약 관리
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
				<p class="here-title1"> 예약 관리 </p>
			</div>
		</div>
	</div>
</div>
<!-- 전체 병원 조회 박스 -->

<div class="all-box container">

	
	<table class="table table-hover" >
		<thead>
			<tr>
				<th>번호</th>
				<th>병원 아이디</th>
				<th>예약자 아이디</th>
				<th>프로그램 명</th>
				<th>가격</th>				
				<th>예약 날짜</th>
				<th>결재 날짜</th>
			</tr>
		</thead>
		<tbody class="box-hospital-list" id="reservation_table">
			 <c:forEach items="${list}" var="list">
				<tr>
					<th>${list.rv_num}</th>
					<th>${list.reservationScheduleVO.program.hp_ho_id}</th>
					<th>${list.reservationScheduleVO.program.hp_title}</th>
					<th>${list.reservationScheduleVO.program.payMentMoney}</th>
					<th>${list.reservationScheduleVO.program.payMentMoney}</th>
					<th>${list.changeDate}</th>
					<th>${list.reservationScheduleVO.rsDate}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>
</body>
<script type="text/javascript">
console.log(${list});
</script>
</html>