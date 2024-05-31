<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<style type="text/css">
 .search-box {
  margin: 0 auto;
   position: relative;
   overflow: hidden;
    width: 800px; 
}

.search-input {
  margin-top: 100px;
     outline: none;
     font-size: 16px;
     padding: 8px;
     width: 100%; 
     position: relative; 
}
.header-box{
border-bottom: 1px solid #c8c8c8;
width: 100%;
height: 80px;
display: flex;
background-color:rgba(0,0,0,0);
}

.공백{
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
.메뉴얼 a:hover{
 text-decoration: none;
}
 
.긴공백{
width: 10%;
}
.로그인{
display:flex;justify-content:flex-end;
padding:20px 0 5px;
margin:0 auto;
width: 35%;
}
.로그인 a{
color: black;
text-decoration: none;
}
.join-groub{
display: flex;
}
.Logo-img{
width: 170px;height: 80px;
}
.메뉴얼 ul {
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
	height:100%;
	color:black;
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
.join-groub li:hover{
	border-bottom:3px solid green;
	height: 94px;
}
.메뉴얼 li:hover{
	border-bottom:3px solid green;
	height: 65px;
}
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
 .category-sub{
z-index:9;position:absolute;line-height:50px;
height:50px;width:100%;background-color:#FCF9F7;

}
.category-board{
z-index:9;position:absolute;line-height:50px;
height:50px;width:100%;background-color: #FCF9F7;

}
.trtr{display: flex;list-style: none;width: 75%;margin: 0 auto;}
.trtr>li a{
	margin-right: 30px;color: black;
}
.trtr>li a:hover {
	text-decoration: underline;
}
 
</style>
</head>
<body>
<div class="home-box">
	<div class="header-box">
		<div class="공백"></div>
		<div class="로고">
			<a class="nav-link home-log" href="<c:url value='/'/>">
				<img alt="로고이미지"  class="Logo-img"
				src="<c:url value='/resources/img/Hospital.png'/>">
			</a>
			<div class="메뉴얼">
				<ul>
					<li class="hos-btn-li">
						<a href="<c:url value="/hospital/list?hs_num=0"/>" class="hos-btn">병원</a> 
					</li>
					<li class="board_btn_li">
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
					<c:if test="${user == null}">	
						<li>
							<a class="nav-link" href="<c:url value='/main/login'/>">
							<img alt="로고이미지" style="width: 30px;"
							src="<c:url value='/resources/img/user-white.svg'/>"> 로그인</a>
						</li>
						<li>	
							<a class="nav-link" href="<c:url value='/main/signup'/>">회원가입</a>
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
		<div class="category-sub" style="display: none;" >
			<ul class="trtr">
			
			</ul>
  		</div>
  		<div class="category-board" style="display: none;" >
			<ul class="trtr">
			
			</ul>
  		</div>
</div>
	 
 <script>
     $('.hos-btn-li').hover(function() {
         $('.category-sub').show();
         $('.header-box').addClass('hovered');
         $('.category-board').hide();
     });
     $('.category-sub').mouseleave(function() {
    	 $('.category-sub').hide();
    	 $('.header-box').removeClass('hovered');
     });
     $('.board_btn_li').hover(function() {
    	 $('.category-sub').hide();
    	  $('.header-box').addClass('hovered');
         $('.category-board').show();
     });
     $('.category-board').mouseleave(function() {
    	 $('.category-board').hide();
     });
     
     $(document).on('mouseenter','.hos-btn, .board_btn',function() {
    	    $.ajax({
    	        async: true,
    	        method: "post",
    	        url: '<c:url value="/common/header"/>',
    	        success: function(data) {
    	            HeadList(data.list);
    	            HeadCoList(data.boList);
    	        },
    	        error: function(jqXHR, textStatus, errorThrown) {

    	        }
    	    });
    	});

     function HeadList(list) {
    	    let str = '';

    	    if (list == null) {
    	        return;
    	    } else {
    	        for (let kieun of list) {
    	            str +=
    	                `
    	              	  <li><a href="<c:url value='/hospital/list'/>?hs_num=\${kieun.hs_num}" class="hs_btn">\${kieun.hs_title}</a></li>
    	                `;
    	        }
    	    }
    	    $('.category-sub>ul').html(str); // 클래스를 사용하여 목록에 접근
    	}

    	function HeadCoList(list) {
    	    let str = '';

    	    if (list == null) {
    	        return;
    	    } else {
    	        for (let kieun of list) {
    	        	if(kieun.bo_num > 1){
	    	            str +=
	    	                `
	    	               	 <li><a href="<c:url value='/board/list'/>?bo_num=\${kieun.bo_num}" class="bo_btn">\${kieun.bo_title}</a></li>
	    	                `;
    	        	}
    	        }
    	    }
    	    $('.category-board>ul').html(str); // 클래스를 사용하여 목록에 접근
    	}


</script>
</body>
</html>