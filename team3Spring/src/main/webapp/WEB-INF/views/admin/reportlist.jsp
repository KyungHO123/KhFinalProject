<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 신고 회원 조회</title>
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
    width: 70%; height: 400px;
    background-color: white;
    border-radius: 15px;
    display: block;
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
}

.btn-member-stop {
    width: 30%;
    font-size: 14px;
    height: 100%;
}

.btn-member-del {
    width: 60%;
    font-size: 14px;
    height: 100%;	
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
.table-all-container{
	height: 700px;
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
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
 }
 .page-link{
color: green;
}
td{
	text-align: center;
}
.btns{
	padding: 3px 5px;
	border: 1px solid green;
	background-color: white;
	color: green;
	border-radius: 3px;
}
.btns:hover{
	background-color: green;
	color: white;
	transition: background-color 0.3s;
}
.back_btn{
	border: 1px solid green;background: white;padding: 5px;border-radius:5px;
	 text-decoration: none;color: green; 
}
.back_btn:hover{
	text-decoration: none;background: green;transition:background 0.3s;
	color: white;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px">
		<div class="page-title">
			신고 병원 관리
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
			<div style="margin: auto 16px;" >
				<img class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
			</div>
			<div style="padding-top: 1px;">
				<a href="<c:url value='/admin/reportlist'/>" class="here-title">
					신고 병원 관리
				</a>
			</div>
		</div>
	</div>
</div>
<!-- 전체 병원 조회 박스 -->
<div class="table-all-container">
	<div class="table-container">
		<div style="width: 200px;margin-left: auto;height: 35px;">
			<a href='<c:url value="/admin/hospital"/>' class="back_btn">뒤로가기</a>
		</div>
		<table class="table table-hover">
			<thead style="text-align: center;">
				<tr>
					<th>아이디</th>
					<th>상호명</th>
					<th>사업자 번호</th>
					<th>신고 사유</th>
					<th>신고 누적 횟수</th>
					<th>정지 기간</th>
					<th>정지</th>
					<th>탈퇴</th>
				</tr>
			</thead>
			<tbody class="box-hospital-list" style="border-bottom: 1px solid lightgray;">
	
			</tbody>
		</table>
		<div class="box-pagination">
			<ul class="pagination justify-content-center"></ul>
		</div>
	</div>
</div>
<script type="text/javascript">
let cri = {
	page : 1
}
getReportList(cri);

function getReportList(cri){
	$.ajax({
		async : true,
		url : '<c:url value="/admin/reportlist"/>', 
		type : 'post', 
		data : JSON.stringify(cri),
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			displayReportList(data.list);
			displayReportPagination(data.pm);
			/* $('.report-total').text(data.pm.totalCount); */
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

function displayReportList(list){
	let str = '';
	if(list == null || list.length == 0){
		str = '<td colspan="8" style="text-align:center; font-size: 30px; color: gray;">신고된 병원이 없습니다.</td>';
		$('.box-hospital-list').html(str);
		return;
	}
	for(item of list){
		str += 
		`
			<tr class="box-hospital">
				<td>\${item.hospital.ho_id}</td>
				<td>\${item.hospital.ho_name}</td>
				<td>\${item.hospital.ho_num}</td>
				<td>\${item.rp_name}</td>
				<td>\${item.hospital.ho_report_count}</td>
				<td>\${item.hospital.changeDate}</td>
				<td>
					<select id="selectbox" data-gg="gg">
						<option value="0">선택</option>
						<option value="1">1일</option>
						<option value="3">3일</option>
						<option value="7">7일</option>
						<option value="15">15일</option>
						<option value="30">30일</option>
						<option value="60">60일</option>
						<option value="365">365일</option>
					</select>
					<button class="btns btn-ho-stop" data-id="\${item.site_num}">정지</button>
				</td>
				<td><button class="btns btn-ho-out" data-id="\${item.site_id}">탈퇴</button></td>
			</tr>
		`;
	}
	$('.box-hospital-list').html(str);
}

function displayReportPagination(pm){
    
	let str = '';
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>`;		
	}
	for(let i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? 'active' : '';
		str += `
		<li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>`;	
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
		</li>`;	
	}
	$('.box-pagination>ul').html(str);
}
$(document).on('click','.box-pagination .page-link',function(){
	cri.page = $(this).data('page');
	getReportList(cri);
})
</script>
<!-- 정지 버튼 클릭 -->
<script type="text/javascript">
$(document).on('click','.btn-ho-stop',function(){
	//정지 버튼의 바로 이전에 있는 형제 요소인 select태그 값 가져옴
	var rp_rs_name = $(this).prev().val();
	if(rp_rs_name == "0"){
		alert("정지일을 선택해주세요.");
		return;
	}
	if(!confirm("정지 처리 하시겠습니까?")){
		return;
	}
	//서버로 보낼 데이터
	let stop = {
		rp_target : $(this).data('id'),
		rp_rs_name : rp_rs_name
	}
	//서버로 데이터 전송
	$.ajax({
		async : true,
		url : '<c:url value="/admin/hospitalstop"/>', 
		type : 'post',
		data : JSON.stringify(stop),
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.res){
				alert("회원 정지가 완료되었습니다.");
				getReportList(cri);
			}else{
				alert("회원 정지에 실패하였습니다.");
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
</script>
<!-- 탈퇴 버튼 클릭 -->
<script type="text/javascript">
$(document).on('click','.btn-ho-out',function(){
	if(!confirm("탈퇴 시키시겠습니까?")){
		return;
	}
	//서버로 보낼 데이터
	let ho = {
		ho_id : $(this).data('id')
	}
	//서버로 데이터 전송
	$.ajax({
		async : true,
		url : '<c:url value="/admin/hospitalout"/>', 
		type : 'post',
		data : JSON.stringify(ho),
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.res){
				alert("회원 탈퇴가 완료되었습니다.");
				getReportList(cri);
			}else{
				alert("회원 탈퇴에 실패하였습니다.");
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
</script>
</body>
</html>