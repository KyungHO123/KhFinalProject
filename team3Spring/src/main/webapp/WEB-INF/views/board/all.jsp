<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<style type="text/css">
.board_all_home_container {
	width: 100%;
	height: 100%;
	display: flex;
	margin: 0 auto;
}

.board_list_container {
	width: 1700px;
	height: 100%;
	display: grid;
	grid-template-columns: 1fr 1fr;
	padding: 25px;
	margin: -130px auto 0 auto;
}

.board_list {
	background: white; width : 800px;
	height: 417px;
	border: 2px solid green;
	border-radius: 15px;
	padding: 20px;
	margin: 20px 20px 80px 20px;
	overflow: hidden;
	width: 800px;
}

.board_list:hover {
	box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
	transition: box-shadow 0.3s ease;
}


.board_name {
	margin: 20px auto 40px auto;
}

.board_header {
	width: 100%;
	display: flex;
	justify-content: space-between;
	height: 100px;
	padding: 20px 30px 0 30px;
}

.a_btn {
	width: 70px;
	height: 50px;
	border: 1px solid green;
	color: green;
	line-height: 50px;
	border-radius: 10px;
	text-align: center;
}

.a_btn:hover {
	text-decoration: none;
	color: white;
	background-color: green;
}

.title-link {
	color: black;
}

.comment-link {
	color: red;
	font-weight: 600;
}

.comment-link:hover {
	color: black;
}

.page-title {
	text-align: left;
	font-size: 50px;
	color: rgba(0, 100, 60, 0.8);
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
}

.here-title:hover {
	text-decoration: none;
	color: gray;
}

.home-box1 {
	width: 100%;
	height: 500px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
	background-origin: content-box;
}
</style>

</head>
<body>
	<div class="home-box1">
		<div style="width: 80%; margin: 0 auto; padding-top: 80px">
			<div class="page-title">커뮤니티</div>
			<div
				style="text-align: left; display: flex; height: 50px; line-height: 50px; margin: 20px 0 50px 0;">
				<a href="<c:url value='/'/>"> <img class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/home-4-line.svg'/>">
				</a>
				<div style="margin: auto 16px;">
					<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
				</div>
				<div style="padding-top: 1px;">
					<a href="<c:url value='/board/all'/>" class="here-title"> 게시판 </a>
				</div>
			</div>
		</div>
	</div>
	<div class="board_all_home_container">
		<div class="board_list_container">
			<c:choose>
				<c:when test="${not empty boList}">
					<c:forEach items="${boList}" var="bo" varStatus="boIndex">

						<c:if test="${bo.bo_num > 1}">
							<div class="board_list">
								<div style="margin-bottom: 20px;">
									<div class="board_title_img">
										<img alt="이미지"
											src="<c:url value='/resources/img/board_img.png'/>"
											style="width: 100px; background-color: white; margin-top:-40px; position: absolute; z-index: 2;">

									</div>
									<div class="board_header">
										<h2 style="color: #555; margin-left: 100px">${bo.bo_title}</h2>
										<a href="<c:url value="/board/list?bo_num=${bo.bo_num}"/>"
											class="a_btn">이동하기</a>
									</div>
								</div>
								<table>
									<thead>
										<tr
											style="border-bottom: 1px solid lightgray; text-align: center;">
											<th style="width: 5%">No</th>
											<th style="width: 40%">제목</th>
											<th style="width: 15%">작성자</th>
											<th style="width: 20%">날짜</th>
											<th style="width: 10%">추천수</th>
											<th style="width: 10%">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty poList}">
												<c:set var="postFound" value="false" />
												<c:set var="boPostCount" value="0" />
												<!-- 각 bo_num별 게시글 수 초기화 -->
												<c:forEach items="${poList}" var="po" varStatus="poIndex">
													<c:if test="${po.po_bo_num eq bo.bo_num}">
														<c:set var="boPostCount" value="${boPostCount + 1}" />
														<tr
															style="height: 50px; font-size: 17px; text-align: center; border-bottom: 1px solid lightgray">
															<td>${boPostCount}</td>
															<td >
																<div style="display: flex;padding-left: 25px;">
																	<div style="max-width: 250px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
																	<a href="<c:url value='/board/detail?po_num=${po.po_num}'/>"
																		class="title-link">${po.po_title}
																	</a> 
																	</div>
																	<div>
																		<a href="<c:url value="/board/detail?po_num=${po.po_num}#comments-section"/>"
																		class="comment-link">&nbsp; [${po.po_co_count}]</a>
																	</div>
																</div>	
															</td>
															<td>${po.po_id}</td>
															<td>${po.changeDate1}</td>
															<td>${po.po_up}</td>
															<td>${po.po_view}</td>
														</tr>
														<c:set var="postFound" value="true" />
													</c:if>
												</c:forEach>
												<c:if test="${not postFound}">
													<tr>
														<td colspan="6" style="text-align: center; height: 100px;">
															<h3 style="color: lightgray">게시글이 존재하지 않습니다.</h3>
														</td>
													</tr>
												</c:if>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<td>
						<div>
							<h3>게시판이 존재하지 않습니다.</h3>
						</div>
					</td>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>