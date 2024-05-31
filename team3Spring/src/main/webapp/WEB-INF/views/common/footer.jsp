<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<style type="text/css">
.공지사항{


}
/* 푸터 입니다.*/
.footer{
width: 100%;border-top: 1px solid gray;height:400px;background-color: #5A5F5F;
color: white;
font-size: 14px;
font-weight: 300;
letter-spacing: -0.075em;

}
.footer a{
	text-decoration: none;
	color: white;

}
.footer a:hover{
	text-decoration: underline;

}

.footer-info-area{
list-style:none;
display:flex;
margin: 0 auto;
padding: 50px 0 90px;
text-align: left;
width: 90%;
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
.공지사항{
display:flex;
border-top: 1px solid #c8c8c8;
background-color:#fafafa;
width: 100%;
height: 50px;

}
.공지사항 a{
text-decoration: none;
color: gray;
}
.공지사항 a:hover{
text-decoration: underline;
}
.롤링 {
	margin: 70px auto;
	display: flex;
	width: 1950px;
	height: 400px;
	overflow: hidden;
	position: relative;
}

.롤링-내용 {
	display: flex;
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


.롤링 {
	box-shadow: 0 3px 16px rgba(0, 0, 0, 0.6);
}
</style>

</head>
<body>
<div class="롤링" >
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
			<span style="color: gray;margin-right:auto;line-height: 3.5;margin-left: 23px "  class="notice_list">
	  		</span>
		 <a href="<c:url value='/board/list?bo_num=1'/>" 
			 style="line-height: 3.5;margin-right: 50px;color: gray;border: 1px solid #fafafa;">더보기</a>
	 </div>
  	<div class="footer">
		  	<div class="footer-info-area">
			  	<div class="footer-img">
			  		<img alt="zz" class="footer-logo"
			  		src="<c:url value='/resources/img/Hospital.png'/>">
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
		 	<div class="copy-disc" style="margin-top: 68px;text-align: center;">
	        	  <p>&copy; 2024 정경호. All rights reserved.</p>
       	  	</div>
	</div>
	<script type="text/javascript">
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
	
	
</body>
</html>