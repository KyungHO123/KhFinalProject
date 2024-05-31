<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 회원 관리</title>
<style type="text/css">
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

.table-container {
	padding: 60px 80px;
    margin: -170px auto 0 auto;
    width: 60%;
    background-color: white;
    border-radius: 15px;
    display: block;
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
}

.btn-member-stop {
    padding: 3px 5px;
	border: 1px solid rgb(255, 132, 9);
	background-color: white;
	color: black;
	border-radius: 3px;
}

.btn-member-stop:hover{
	background-color: rgb(255, 132, 9);
	color: white;
	transition: background-color 0.3s;
}

.btn-member-del {
    padding: 3px 5px;
	border: 1px solid red;
	background-color: white;
	color: black;
	border-radius: 3px;	
}

.btn-member-del:hover{
	background-color: red;
	color: white;
	transition: background-color 0.3s;
}

#selectbox {
	word-wrap: normal;
    height: 100%;
    width: 40%;
    border-radius: 50px;
    margin-right: 5px;
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
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			신고 회원 관리
		</div>
		<div style="text-align: left; display: flex; height: 50px; line-height: 50px; margin: 20px 0 50px 0;">
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
				<a href="<c:url value='/admin/member/main'/>" class="here-title">
					회원 관리
				</a>
			</div>
			<div style="margin: auto 16px;" >
				<img class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>
			<div style="padding-top: 1px;">
				<a href="<c:url value='/admin/member/report'/>" class="here-title">
					신고 회원 관리
				</a>
			</div>
		</div>
	</div>
	
</div>
<!-- 신고 회원 조회 : 아이디/이름/유형/사유/정지기간/누적신고횟수/누적정지횟수    정지(정지해제)버튼/탈퇴버튼 -->
<div class="table-container">
	<table class="table table-hover">
		<thead style="text-align: center;">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>신고 사유</th>
				<th>정지 일수</th>
				<th>누적정지횟수</th>
				<th>정지기간</th>
				<th>정지</th>
				<th>탈퇴</th>
			</tr>
		</thead>
		<tbody class="report-list">
			
		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>

<!-- 신고된 회원 리스트 조회 -->
<script type="text/javascript">
let cri = {
	page : 1
}
getReportList(cri);

function getReportList(cri){
	$.ajax({
		async : true,
		url : '<c:url value="/admin/member/report"/>', 
		type : 'post', 
		data : JSON.stringify(cri),
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			displayReportList(data.list);
			displayReportPagination(data.pm);
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

function displayReportList(list){
	let str = '';
	if(list == null || list.length == 0){
		str = '<td colspan="8" style="text-align:center; font-size: 30px; color: gray;">신고된 회원이 없습니다.</td>';
		$('.report-list').html(str);
		return;
	}
	for(item of list){
				str += 
					` 
					<tr class="box-report" style="text-align: center;">
						<td>\${item.member.me_id}</td>
						<td>\${item.member.me_name}</td>
						<td>\${item.rp_name}</td>
						<td>\${item.member.me_stop_count}</td>
						<td>\${item.member.me_report_count}</td>
						<td>\${item.member.changeDate}</td>
						<td>
							<select id="selectbox">
								<option value="0">선택</option>
								<option value="1">1일</option>
								<option value="3">3일</option>
								<option value="7">7일</option>
								<option value="15">15일</option>
								<option value="30">30일</option>
								<option value="60">60일</option>
								<option value="365">365일</option>
							</select>      
							<button type="button" class="btn-member-stop" data-stop="\${item.rp_target}">정지</button>
						</td>
						<td><button type="button" class="btn-member-del" data-del="\${item.member.me_id}">탈퇴</button></td>
					</tr>
					`;

	}
	$('.report-list').html(str);
}

function displayReportPagination(pm) {
    let str = '';
    if (pm.prev) {
        str += `
        <li class="page-item">
            <a class="page-link" href='<c:url value="/admin/member/report"/>' data-page="${pm.startPage - 1}">이전</a>
        </li>`;
    }
    for (let i = pm.startPage; i <= pm.endPage; i++) {
        let active = pm.cri.page == i ? 'active' : '';
        str += `
        <li class="page-item ${active}">
            <a class="page-link" href='<c:url value="/admin/member/report?page=${i}"/>' data-page="${i}">\${i}</a>
        </li>`;
    }

    if (pm.next) {
        str += `
        <li class="page-item">
            <a class="page-link" href='<c:url value="/admin/member/report"/>' data-page="${pm.endPage + 1}">다음</a>
        </li>`;
    }
    $('.box-pagination>ul').html(str);
}

$(document).on('click','.box-pagination .page-link',function(){
	cri.page = $(this).data('page');
	getReportList(cri);
})
</script>

<!-- 정지 버튼 -->
<script type="text/javascript">
$(document).on('click', '.btn-member-stop', function() {
	//정지 버튼의 바로 이전에 있는 형제 요소인 select태그 값 가져옴
	var rp_rs_name = $(this).prev().val();
	
	if(rp_rs_name == "0") {
		alert("정지일을 선택해주세요.");
		return;
	}
	if(!confirm("정지 하시겠습니까?")) {
		return;
	}
	
	let stop = {
		rp_target : $(this).data('stop'), 
		rp_rs_name : rp_rs_name
	}
	
	//서버에 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/admin/member/stop"/>', 
		type : 'post', 
		data : JSON.stringify(stop), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('정지되었습니다.');
				getReportList(cri);
			}
			else {
				alert('회원 정지 실패');
			}
		}, 
		error : function(xhr, textStatus, errorThrown){
			console.error(xhr);
			console.error(textStatus);
		}
	}); //ajax end
});
</script>

<!-- 탈퇴 버튼 -->
<script type="text/javascript">
$(document).on('click', '.btn-member-del', function() {
	let id = {
		me_id : $(this).data('del')
	}
	
	if(!confirm("탈퇴 시키시겠습니까?")) {
		return;
	}
	
	//서버에 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/admin/member/delete"/>', 
		type : 'post', 
		data : JSON.stringify(id), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('탈퇴되었습니다.');
				getReportList(cri);
			}
			else {
				alert('회원 삭제 실패');
			}
		}, 
		error : function(xhr, textStatus, errorThrown){
			console.error(xhr);
			console.error(textStatus);
		}
	}); //ajax end
});
</script>
</body>
</html>