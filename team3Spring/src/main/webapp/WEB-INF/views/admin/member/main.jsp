<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리 - 메인</title>
<style type="text/css">
.report-box{
	width: 30%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	padding: 10px;
	margin: auto;
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

/* 전체 툴 */
.me-all-box {
	padding: 50px;
    width: 1600px;
    height: 48%;
    box-shadow: 0 8px 16px rgba(0, 128, 0, 0.3);
    margin: 7% auto 10% auto;
}

/* 신고 회원 조회 */
.me_list {
	width: 600px;
	height: 400px;
	border: 2px solid green;
	border-radius: 15px;
	padding: 20px;
	margin: 20px 20px 20px 20px;
	overflow: hidden;
	display: inline-block;
	margin-left: 450px;
}

.me_list:hover{
   box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
   transition: box-shadow 0.3s ease;
}

.board_header {
    width: 100%;
    display: flex;
    justify-content: space-between;
    height: 100px;
    padding: 20px 30px 0 30px;
}

.a_btn{
	width: 70px;
	height: 50px;
	border: 1px solid green;
	color:green;
	line-height: 50px;
	border-radius: 10px;
	text-align: center;
}

.a_btn:hover {
	text-decoration: none;
	color: white;
	background-color: green;
}

/* 전체 회원 조회 */
.all-me-list {
	width: 1243px;
	height: auto;
	border: 2px solid green;
	border-radius: 15px;
	padding: 20px;
	overflow: hidden;
	display: inline-block;
	margin-bottom: 50px;
}

.all-me-list:hover{
	box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
}

table{
	width: 100%;
}
</style>
</head>
<body>
<div class="me-all-box">
	<h1 style="text-align: center;">회원 관리</h1>
	<div class="report-box me_list">
		<div class="board_header">		
			<h4>신고 회원 조회</h4>
			<a href="<c:url value="/admin/member/report"/>" class="a_btn">이동하기</a>
		</div>
		<table>
	        <thead>
	            <tr style="border-bottom: 1px solid lightgray; text-align: center;">
	                <th style="width: 25%">아이디</th>
	                <th style="width: 35%">이름</th>
	                <th style="width: 20%">휴대폰 번호</th>
	                <th style="width: 20%">신고사유</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:choose>
	                <c:when test="${meRpList != null}">
	                    <c:forEach items="${meRpList}" var="me">
	                    	<c:forEach items="${me.report}" var="report">
	                         <tr style="height: 50px; font-size: 17px; text-align: center; border-bottom: 1px solid lightgray">
	                             <td>${me.member.me_id}</td>
	                             <td>${me.member.me_name}</td>
	                             <td>${me.member.me_phone}</td>
	                             <td>${report.rp_name}</td>
	                         </tr>
	                        </c:forEach>
	                    </c:forEach>
	                </c:when>
	                <c:otherwise>
	                	<tr>
	                        <td colspan="4" style="text-align: center;height: 100px;">
	                            <h3 style="color: lightgray">신고받은 회원이 존재하지 않습니다.</h3>
	                        </td>
	                    </tr>
	                </c:otherwise>
	            </c:choose>
	        </tbody>
	    </table>
	</div>

	<div class="all-box" style="text-align: center;">
		<div class="all-me-list">
			<div class="board_header">						
				<h2 style="text-align: center;">전체 회원 조회</h2>
				<a href="<c:url value='/admin/adminpage'/>" class="a_btn">목록으로</a>
			</div>
			<table class="table table-hover mt-3" style="text-align: center;">
				<thead>
					<tr style="height: 30px;">
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>휴대폰</th>
						<th>이메일</th>
						<th>주소</th>
						<th>관심 건강분야</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="me">			
						<tr>
							<td>${me.me_id}</td>
							<td>${me.me_name}</td>
							<td>${me.me_gender}</td>
							<td>${me.me_phone}</td>
							<td>${me.me_email}</td>
							<td>${me.land.sido.sd_name} ${me.land.sgg.sgg_name} ${me.land.emd.emd_name}</td>
							<td>${me.hospitalSubject.hs_title}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="page-group">
			    <c:if test="${pm.prev}">
			        <li class="page-prev page-design">
			            <c:url var="url" value="/admin/member/main">
			                <c:param name="page" value="${pm.startPage - 1}"/>
			            </c:url>
			            <a class="page-link" href="${url}">이전</a>
			        </li>
			    </c:if>
			    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <c:set var="active" value="${pm.cri.page == i ? 'active' : ''}" />
			        <li class="page-now page-design ${active}">
			            <c:url var="url" value="/admin/member/main">
			                <c:param name="page" value="${i}"/>
			            </c:url>
			            <a class="page-link" href="${url}">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
			        <li class="page-next page-design">
			            <c:url var="url" value="/admin/member/main">
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