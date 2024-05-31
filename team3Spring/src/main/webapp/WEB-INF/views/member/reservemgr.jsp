<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 예약 관리</title>
<style type="text/css">
.post_list_box {
	width: 1400px;
	height: 93.4%;
	margin: -120px auto 100px auto;background:white;
	padding: 60px 100px;
	text-align: center;
	
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
    border-radius: 15px;
}
.hr {
	width: 100%;
	height: 0;
	border: 1px solid lightgray;
	margin: 50px 0 50px 0;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
}
.검색 {
	 border: 1px solid rgba(0, 128, 0, 0.5);
     outline-style: none;
     width: 500px;
     padding: 10px 50px 10px 10px;
     height: 100%;
}
.search-box-box{
 width: 50%;display:flex;
	height: 50px;
	margin: 80px auto 100px auto;
	text-align: center;
 }
 .search-box {
	height: 50px;
	margin: 80px 0 100px 0;
}
.search-btn {
	background-color:white;
	border:1px solid rgba(0, 128, 0, 0.5);
    width: 100px; 
    height: 50px;
    position: static;
}
.search-type {
	outline-style:none;
   	border-color: rgba(0, 128, 0, 0.5);
     padding: 5px;
     width: 150px;
     font-size: 16px; 
     color: #333; 
 }
.search-type option {
    background-color: #fff;
}
.search-btn:hover{
  background-color: rgba(0, 128, 0, 0.5);
  
  }

.search-btn:focus {
    outline: none;
}
th{
border-top: 1px solid #dee2e6;
padding: .75rem;
}
.pagination{margin-top:50px; }
.post-search-box{text-align: center;width: 100%}

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

.here-title1 {
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: bold;
}

.here-title:hover {
	text-decoration: none;
	color: gray;
}
.here-title1:hover {
	text-decoration: none;
	color: black;
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
.btns{
	border: 1px solid green;color: green;background: white;text-decoration: none;
	border-radius:5px;list-style: none; display: inline-block; width: 40px; height: 25px;
}
.btns:hover{
	background: green;color: white;text-decoration: none;
	tranzition: background 0.3s;
}
.back_btn{
	border: 1px solid green;color: green;background: white;text-decoration: none;
	border-radius:5px;list-style: none; display: inline-block; width: 80px; height: 25px;
}
.back_btn:hover{
	background: green;color: white;text-decoration: none;
	tranzition: background 0.3s;
}
.back_btn_box{
	width: 200px;margin-left: auto;height: 30px;
}
.success_btn{
	color: green; width: 100%; height: 100%; display: inline-block;
}
.success_btn:hover{
	color: white; text-decoration: none;
}
.ho-name{
	color: black;
}
</style>
</head>
<body>
<div class="home-box1">
		<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
			<div class="page-title">내 예약관리</div>
			<div
				style="text-align: left; display: flex; height: 50px; line-height: 50px; margin: 20px 0 50px 0;">
				<a href="<c:url value='/'/>" style="z-index: 999"> <img
					class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/home-4-line.svg'/>">
				</a>
				<div style="margin: auto 16px;">
					<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
				</div>
				<div style="padding-top: 1px;">
					<a class="here-title" 
					href="<c:url value='/member/mypage'/>"
					> 마이페이지 </a>
				</div>
				<div style="margin: auto 16px;">
					<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
				</div>
				<div style="padding-top: 1px;">
					<p class="here-title1"> 예약 관리 </p>
				</div>
			</div>
		</div>
	</div>
<div class="post_list_box">
	<div style="height: 60px; width: 100%; background-color: #ededed; padding: 18px; color: gray; border-radius: 5px; font-size: 15px;">
		예약 변경 및 취소는 예약일 하루 전까지 가능합니다.
	</div>
	<div class="back_btn_box">
		<a href="<c:url value='/member/mypage'/> " class="back_btn">뒤로가기</a>
	</div>
	<div class="box-book-list">
		<!-- 예약 내역 출력 -->
	</div>
	<div class="box-pagination">
		<ul class="pagination justify-content-center">
			<!-- 페이지네이션 출력 -->
		</ul>
	</div>
	<div class="post-search-box">
		<!-- 게시글 검색 박스 출력 -->
	</div>
</div>
<script type="text/javascript">
let page = 1;
let type = 'hoName';
let search = '';
let rv_num = 0;


getPostList();
function getPostList(){
   $.ajax({
      async : true,
      url : '<c:url value="/member/reservemgr"/>', 
      type : 'post', 
      data : {
    	  page : page,
    	  type : type,
    	  search : search
      },
      success : function (data){
    	 displayPostList(data.bookList);
         displayPostPagination(data.pm);
         displayPostSearchBox();
      }, 
      error : function(jqXHR, textStatus, errorThrown){

      }
   });
}
function displayPostList(bookList){
   let str = `
	   <table style="width: 100%;">
		<thead>
			<tr>
				<th style="width: 20%;">병원명</th>
				<th style="width: 20%;">프로그램명</th>
				<th style="width: 20%;">프로그램 가격</th>
				<th style="width: 10%;">날짜</th>
				<th style="width: 10%;">시간</th>
				<th style="width: 10%;">예약상태</th>
				<th style="width: 10%;">변경/취소</th>
			</tr>
		</thead>
		<tr class="hr"></tr>
   `;
   if(bookList == null || bookList.length == 0){
      str += `
    	  <tbody>
	    	  <tr style="height: 400px;">
				<td colspan="7">
					<div>
						<h3 style="color: lightgray">예약 내역이 존재하지 않습니다.</h3>
					</div>
				</td>
			  </tr>
		  </tbody>
		</table>
      `;
      $('.box-book-list').html(str);
      return;
   }
   str += `
	   <tbody>
   `;
   for(item of bookList){
	   console.log(item);
      str += 
      ` <tr class="tr" style="height: 100px; border-bottom: 1px solid lightgray;">
			<td><a class="ho-name" href="<c:url value='/hospital/detail/detail?ho_id=\${item.hospital.ho_id}'/>">\${item.hospital.ho_name}</a></td>
			<td>\${item.hospitalProgram.hp_title}</td>
			<td>\${item.hospitalProgram.hp_payment}</td>
			<td class="date"><div class="change-box">\${item.reservationScheduleVO.rsDate}</div></td>
			<td class="time"><div class="change-box">\${item.reservationScheduleVO.rsTime}</td>
			<td>\${item.rv_rvs_name}</td>
	  `;
      var currentDate = new Date();
      if(currentDate > item.reservationScheduleVO.rs_date){
    	  str += `
    		  <td>변경/취소 불가</td>
    		</tr>
    	  `;
      }else if(item.rv_rvs_name == "예약취소"){
    	  str += `
    		  <td>취소 완료</td>
    		</tr>
    	  `;
      }else{
    	  str += `
    		  <td>
    	  		<li role="button" class="btns change_btn" data-target="\${item.rv_num}" data-hpnum="\${item.hospitalProgram.hp_num}" data-rsdate="\${item.reservationScheduleVO.rsDate}">변경</li>
    	  		<li role="button" class="btns cancelBtn" data-target="\${item.rv_num}">취소</li>
    		  </td>
    		</tr>
    	  `;
      }
	}
    str += `
			</tbody>
		</table>
    `;
	$('.box-book-list').html(str);
}

function displayPostPagination(pm){
   let str = '';
   if(pm.prev){
      str += `
		<li class="page-item">
			<a class="page-link page" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>`;
   }
   for(let i = pm.startPage; i<= pm.endPage; i++){
      let active = pm.cri.page == i ? 'active' : '';
      str += `
      <li class="page-item \${active}">
         <a class="page-link page" href="javascript:void(0);" data-page="\${i}">\${i}</a>
      </li>`;
   }
   if(pm.next){
      str += `
      <li class="page-item">
         <a class="page-link page" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
      </li>`;
   }
   $('.box-pagination>ul').html(str);
}
$(document).on('click','.box-pagination .page',function(){
   page = $(this).data('page');
   getPostList();
});

function displayPostSearchBox(){
	let str = '';
	if(type == 'hoName'){		
		str = `
			<div class="search-box-box">
				<select name="type" class="search-type">
					<option value="hoName" selected>병원명</option>
					<option value="hoProgram">프로그램명</option>
				</select>
				<input type="search" class="검색 search-search" name="search" placeholder="검색어를 입력하세요" value="\${search}">
				<button class="search-btn" type="button">검색</button>
			</div>	
		`;
	}else{
		str = `
			<div class="search-box-box">
				<select name="type" class="search-type">
					<option value="hoName">병원명</option>
					<option value="hoProgram" selected>프로그램명</option>
				</select>
				<input type="search" class="검색 search-search" name="search" placeholder="검색어를 입력하세요" value="\${search}">
				<button class="search-btn" type="button">검색</button>
			</div>	
		`;
	}
	$('.post-search-box').html(str);
}

$(document).on('click','.search-btn',function(){
   type = $('.search-type').val();
   search = $('.search-search').val();
   
   getPostList();
});

$(document).on('click','.cancelBtn',function(){
   rv_num = $(this).data('target');
   let res = confirm("예약 취소를 진행하시겠습니까?");
   if(res){
	   $.ajax({
	      async : true,
	      url : '<c:url value="/member/bookcancel"/>', 
	      type : 'post', 
	      data : {
	    	  rv_num : rv_num
	      },
	      success : function (data){
	    	  if(data){
	    		  alert("예약 취소가 완료되었습니다.");
	    		  getPostList();
	    	  }
	    	  else{
	    		  alert("예약 취소를 실패하였습니다.");
	    		  getPostList();
	    	  }
	      }, 
	      error : function(jqXHR, textStatus, errorThrown){
	
	      }
	   });
   }
});
</script>
<!-- 변경 버튼을 눌렀을때 인풋태그가 바뀌는 코드 -->
<script type="text/javascript">
let hp_num = 0;
let me_rs_date = '';
$(document).on("click", ".change_btn", function(){
	hp_num = $(this).data("hpnum");
	me_rs_date = $(this).data("rsdate");
	let list = displayDate();
	let option = optionDate(list);
	
	$(this).parents(".tr").find(".date").html('<select name="ndate" class="ndate">'+ option +'</select>');
	$(this).parents(".tr").find(".change_btn").empty();
	$(this).parents(".tr").find(".change_btn").html('<a class="success_btn">확인</a>')
})
</script>
<script type="text/javascript">
function displayDate(){
	let res = null
	let ho = "";
	$.ajax({
		async : false,
		method : "post",
		url : '<c:url value="/getdate"/>',
		data : {
			"ho" : ho,
			"hp_num" : hp_num
		},
		success : function(data){
			res = data.RSlist;
			console.log(res);
		}
	});
	return res;
}

function optionDate(list){
	str = ``;
	if(list == null){
		return list;
	}
	arr = [];
	for(let tmp of list){
		if(!arr.includes(tmp.rsDate)){
			arr.push(tmp.rsDate);
		}
	}
	for(let tmp of arr){
		if(tmp == me_rs_date){
			str += `<option value="\${tmp}" selected>` + tmp + '</option>'
		}
		else{
			str += `<option value="\${tmp}">` + tmp + '</option>'
		}
	}
	return str;
}
</script>
<!-- 날짜를 변경해서 시간대 가져오기 -->
<script type="text/javascript">
$(document).on("click", ".ndate", function(){
	let list = displayTime();
	let option = optionTime(list)
	$(this).parents(".tr").find(".time").html('<select name="time" class="time">'+ option +'</select>');
});

function optionTime(list){
	let str =``;
	if(list == null){
		return str;
	}
	for(let tmp of list){
		str+='<option>' + tmp.rsTime + '</option>'
	}
	return str;
}

function displayTime(){
	let tmp = $("[name=ndate]").val();
	//let hp_num = $("[name=hp_num]").val();
	let res = null;
	 $.ajax({
		   async : false,
	       method : "post",
	       url : '<c:url value="/gettime"/>',
	       data : {"tmp" : tmp,
	               "hp_num" : hp_num},
	       success : function (data) {
	           res=data.timeList;
	       }
	  });
	  return res;
}
</script>
<script type="text/javascript">
$(document).on("click", ".success_btn", function(){
	let rv_num = $(this).parents(".tr").find(".change_btn").data("target");
	let date = $("select.ndate option:selected").text();
	let time = $("select.time option:selected").text();
	location.href='<c:url value="/update/userschedule?rv_num="/>' + rv_num + "&date=" + date + "&time2=" + time + "&hp_num=" + hp_num;
})
</script>

</body>
</html>