<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원 조회</title>
<style type="text/css">
.ho-mgr-title{
	
}
.ho-all-box{
	padding: 50px;
    width: 1600px;
    height: 48%;
    box-shadow: 0 8px 16px rgba(0, 128, 0, 0.3);
    margin: -150px auto 10% auto;background: white;
}
.wait-report-box{
	padding: 20px;
	text-align: center;
}
tr th,
tr td{
text-align: center;
}
.page-group {
	text-align:center;
    list-style: none;
    padding: 0;
    margin: 0 auto;
}

.page-design {
    display: inline-block;
    margin-right: 5px; 
    border-radius: 3px; 
}

.page-design a {
    color: black;
    text-decoration: none; 
}
.ho_list{
	width: 600px;height: 400px;border: 2px solid green;border-radius: 15px;padding: 20px;margin: 20px 20px 20px 20px; overflow: hidden; display: inline-block;
}
.ho_list:hover{
   box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
}
.all-box{
	text-align: center;
}
.all-ho-list{
	width: 1243px;height: auto;border: 2px solid green;border-radius: 15px;padding: 20px;overflow: hidden; display: inline-block;
	margin-bottom: 50px;
}
.all-ho-list:hover{
	box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
}
table{
	width: 100%
}
/* .hr{
width: 80%;border: 1px solid lightgray;
} */
.board_name{
	margin: 20px auto 40px auto;
}
.board_header{
width: 100%;display: flex;justify-content: space-between;height: 100px;padding: 20px 30px 0 30px;
}
.a_btn{
width: 70px;height: 50px;border: 1px solid green;color:green; line-height: 50px;border-radius: 10px;text-align: center;
}
.a_btn:hover {
	text-decoration: none; color: white;background-color: green;
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
.here-title{
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
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px">
		<div class="page-title">
			병원 관리
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
				<a href="<c:url value='/admin/adminpage'/>" class="here-title">
					관리자페이지
				</a>
			</div>
			<div style="margin: auto 16px;" >
				<img class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>
			<div style="padding-top: 1px;">
				<a href="<c:url value='/admin/hospital'/>" class="here-title">
					병원 관리
				</a>
			</div>
			
		</div>
	</div>
</div>
<div class="ho-all-box">
	<!-- 가입대기 + 신고 박스 -->
	<div class="wait-report-box">
		<div class="ho-mgr-title">
			<h2>병원관리</h2>
		</div>
		<!-- 가입 대기 병원 조회 박스 -->
		<div class="ho_list wait-list">
	        <div class="board_header">
	            <h4>대기 병원 조회</h4>
	            <a href="<c:url value="/admin/waitlist"/>" class="a_btn">이동하기</a>
	        </div>
	        <table>
	            <thead>
	                <tr style="border-bottom: 1px solid lightgray;text-align: center;">
	                    <th style="width: 35%">상호명</th>
	                    <th style="width: 20%">사업자 번호</th>
	                    <th style="width: 20%">전화번호</th>
	                    <th style="width: 25%">소재지</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:choose>
	                    <c:when test="${not empty hoWaitList}">
	                        <c:forEach items="${hoWaitList}" var="ho">
	                            <tr style="height: 50px;font-size: 17px;text-align: center;border-bottom: 1px solid lightgray">
	                                <td>${ho.ho_name}</td>
	                                <td>${ho.ho_num}</td>
	                                <td>${ho.ho_phone}</td>
	                                <td>${ho.ho_address}</td>
	                            </tr>
	                        </c:forEach>
	                    </c:when>
	                    <c:otherwise>
	                    	<tr>
	                            <td colspan="4" style="text-align: center;height: 100px;">
	                                <h3 style="color: lightgray">대기 병원이 존재하지 않습니다.</h3>
	                            </td>
	                        </tr>
	                    </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	    </div>
		
		<!-- 신고받은 병원 조회 박스 -->
		<div class="ho_list report-list">
	        <div class="board_header">
	            <h4>신고 병원 조회</h4>
	            <a href="<c:url value="/admin/reportlist"/>" class="a_btn">이동하기</a>
	        </div>
	        <table>
	            <thead>
	                <tr style="border-bottom: 1px solid lightgray;text-align: center;">
	                    <th style="width: 25%">아이디</th>
	                    <th style="width: 35%">상호명</th>
	                    <th style="width: 20%">사업자 번호</th>
	                    <th style="width: 20%">신고사유</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:choose>
	                    <c:when test="${not empty hoRpList}">
	                        <c:forEach items="${hoRpList}" var="ho">
	                            <tr style="height: 50px;font-size: 17px;text-align: center;border-bottom: 1px solid lightgray">
	                                <td>${ho.hospital.ho_id}</td>
	                                <td>${ho.hospital.ho_name}</td>
	                                <td>${ho.hospital.ho_num}</td>
	                                <td>${ho.rp_name}</td>
	                            </tr>
	                        </c:forEach>
	                    </c:when>
	                    <c:otherwise>
	                    	<tr>
	                            <td colspan="4" style="text-align: center;height: 100px;">
	                                <h3 style="color: lightgray">신고받은 병원이 존재하지 않습니다.</h3>
	                            </td>
	                        </tr>
	                    </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	    </div>
	</div>
	<!-- 전체 병원 조회 박스 -->
	<div class="all-box">
		<div class="all-ho-list">
			<div style="display: flex; align-items: center;">
			    <h4 style="margin-right: auto;">전체 병원 조회</h4>
			    <a href="<c:url value='/admin/adminpage'/>" class="a_btn">목록으로</a>
			</div>    
			<table class="table table-hover mt-3">
				<thead>
					<tr>
						<th>아이디</th>
						<th>상호명</th>
						<th>대표자명</th>
						<th>사업자 번호</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>주소</th>
						<th>상세 주소</th>
						<th>신고 받은 횟수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<c:choose>
					   <c:when test="${empty hoList}">
					       <tr>
					           <td colspan="7"><h2>등록된 병원이 없습니다.</h2></td>
					       </tr>
					   </c:when>
					   <c:otherwise>
					       <c:forEach items="${hoList}" var="ho">
					           <tr>
					               <td>${ho.ho_id}</td>
					               <td>${ho.ho_name}</td>
					               <td>${ho.ho_ceo}</td>
					               <td>${ho.ho_num}</td>
					               <td>${ho.ho_phone}</td>
					               <td>${ho.ho_email}</td>
					               <td>${ho.land.sido.sd_name} ${ho.land.sgg.sgg_name} ${ho.land.emd.emd_name}</td>
					               <td>${ho.ho_address}</td>
					               <td>${ho.ho_report_count}</td>
					           </tr>
					       </c:forEach>
					   </c:otherwise>
				</c:choose>
					</tr>
				</tbody>
			</table>
			<ul class="page-group">
			    <c:if test="${pm.prev}">
			        <li class="page-prev page-design">
			            <c:url var="url" value="/admin/hospital">
			                <c:param name="page" value="${pm.startPage - 1 }"/>
			            </c:url>
			            <a class="page-link" href="${url}">이전</a>
			        </li>
			    </c:if>
			    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <c:set var="active" value="${pm.cri.page == i ? 'active' : ''}" />
			        <li class="page-now page-design ${active}">
			            <c:url var="url" value="/admin/hospital">
			                <c:param name="page" value="${i }"/>
			            </c:url>
			            <a class="page-link" href="${url }">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
			        <li class="page-next page-design">
			            <c:url var="url" value="/admin/hospital">
			                <c:param name="page" value="${pm.endPage + 1}"/>
			            </c:url>
			            <a class="page-link" href="${url}">다음</a>
			        </li>
			    </c:if>
			</ul>
		</div>
	</div>
</div>
</body>
</html>