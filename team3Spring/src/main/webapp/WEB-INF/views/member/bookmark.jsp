<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 리스트</title>
<style type="text/css">
.area-container{
	width: 1400px; height: 48%;border-radius:13px;
	padding: 0 50px 50px 50px;
	margin: -100px auto 100px auto;
	background-color: white;
	box-shadow: 0 8px 16px rgba(0, 128, 0, 0.3);
}
.area-container:hover{
text-decoration:none;box-shadow: 0 8px 16px rgba(0, 128, 0, 0.6);
    transition: box-shadow 0.3s ease;/* 그림자 효과 추가 */
}
.aTag-btn1{
margin-right: auto; border: 2px solid rgba(0, 128, 0, 0.5);
} 
.aTag-btn2{
margin-left: auto;
} 
.aTag-btn1,
.aTag-btn2{
	padding: 20px;
	margin:90px 15px 15px 24px;
    width: 280px;
    height: 200px;
    color: black;
    text-decoration: none;
 	box-shadow: 0 8px 16px rgba(0, 128, 0, 0.2)
}

.aTag-btn1:hover,
.aTag-btn2:hover{text-decoration:none;box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;/* 그림자 효과 추가 */}
.hospital-like-list h1,.hospital-area-list h1{margin: 30px auto 50px auto;}
.hospital-list-home{width: 100%;height: 1500px;}
.hospital-list-box{width: 100%;height: 100%;margin: 0 auto;text-align: center;display: inline-block;}
.hospital-like-list{width: 100%;height: 400px;border: 1px solid #c8c8c8;margin-bottom: 150px;}
.hospital-area-list{width: 100%;height:1000px;display: grid; grid-template-columns:1fr 1fr 1fr 1fr;}
.area-select-all{width: 100%;height: 150px;padding: 30px 0;display: flex;}
.area-select{margin: 0 auto;}
.area-select-box{display: flex;border: 1px solid  #c8c8c8;width: 100%; height: 400px;margin: 100px 0 200px 0;}
.area-select-box li{list-style: none;}
.area-select-sido{width: 200px;height: 100%;text-align: left;list-style: none;}
.area-select-sgg{width: 200px;text-align: left;}
.area-select-emd{text-align: left;display: flex;width: 997px;flex-direction: column;}
.sido-list{overflow-y: auto;height: 86%;border-right: 1px solid  #c8c8c8;}
.sgg-list{overflow-y: auto;height: 86%;border-right: 1px solid #c8c8c8;}
.emd-list {width: 997px;white-space:normal; overflow-y:auto;}
.sido-list li {display: inline-block;width: 100%;padding: 7px;}
.sgg-list li {display: inline-block;padding: 7px 0; width: 100%;}
.emd-list li {display: inline-block;padding: 20px;width: 33%;text-align: left;}
.area-title{text-align: center;padding: 15px;border-bottom:1px solid  #c8c8c8;border-right: 1px solid  #c8c8c8; }
.area-title-emd{text-align: center;padding: 15px;width: 997px;border-bottom:1px solid #c8c8c8;}
.box-pagination{width:100%;display: flex;margin-top:100px; height: 100px; }
.pagination-custom{margin: 0 auto;display: flex;}
.pagination-custom li{list-style: none; }
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
 }
 .page-link{
color: green;
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
.top-img {
	height: 20px;
	width: 20px;
	color: gray;
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
.page-title{
	text-align: left;
	font-size: 50px;
	color: rgba(0, 100, 60, 0.8);
	font-weight: bold;
	margin: 0 0 80px 0;
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
<div class="hospital-list-box">
	<div class="home-box1">
		<div style="width: 80%;margin: 0 auto;padding-top: 80px">
			<div class="page-title">
				북마크
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
					<a class="here-title" 
					href="<c:url value='/member/mypage'/>"
					> 마이페이지 </a>
				</div>
				<div style="margin: auto 16px;" >
					<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
				</div>
				<div style="padding-top: 1px;">
					<a href="<c:url value="/member/bookmark"/>" class="here-title">
						북마크
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="area-container">
		<div class="hospital-area-list">
		</div>
		<div class="box-pagination" style="height: 100px; margin: 100px auto 0 auto">
			<!-- 페이지네이션 시작 -->
			<ul class="pagination-custom pagination justify-content-center"></ul>
			<!-- 페이지네이션 끝 -->
		</div>
	</div>
</div>
<script type="text/javascript">
let page = 1;
getBmkHoList();
function getBmkHoList(){
	
	$.ajax({
    	async : false,
        method : "post",
        data : {
        	"page" : page
        }, 
        url : '<c:url value="/member/bookmark"/>', // URL 수정
        success : function (data){
            let str =""
            if(data.list == null || data.list.length == 0){
                str +=`<h3 style="color: gray;line-height: 200px;text-align: center;">존재하는 병원이 없습니다.</h3>` ;
            }
            else{
                for(let ho of data.list){
                	console.log(ho);
                	if(ho.hospital_detail == null){
                		continue;
                	}
                	let hd_time = ho.hospital_detail.hd_time;
            		let timeArray = hd_time.split(",");
            		
            		   let today = new Date();
               	    let daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
               	    let dayOfWeek = daysOfWeek[today.getDay()]; 

               	    switch (dayOfWeek) {
               	        case '월':
               	            hd_time = timeArray[1];
               	            break;
               	        case '화':
               	            hd_time = timeArray[2];
               	            break;
               	        case '수':
               	            hd_time = timeArray[3];
               	            break;
               	        case '목':
               	            hd_time = timeArray[4];
               	            break;
               	        case '금':
               	            hd_time = timeArray[5];
               	            break;
               	        case '토':
               	            hd_time = timeArray[6];
               	            break;
               	        case '일':
               	            hd_time = timeArray[7];
               	            break;
               	    }
            	    
           		    let hs_title = ho.hospital_subject && ho.hospital_subject.length > 0 ? ho.hospital_subject[0].hs_title : '제목 없음';
                    str += 
                   	`
	                    <a class="aTag-btn1" href="<c:url value='/hospital/detail/detail?ho_id=\${ho.ho_id}'/>" style="padding: auto;" data-id="\${ho.ho_id}">
	                    	<div class="ho-name">\${ho.ho_name}</div>
	                    	<div class="hs-title">\${hs_title}</div>
	                    	<div class="ho-address"><img class="top-img"
								alt="위치 이미지" src="<c:url value="/resources/img/map-pin-2-fill.svg"/>">\${ho.ho_address}</div>
							<div class="hd-time"><img class="top-img"
								alt="위치 이미지" src="<c:url value="/resources/img/time-line.svg"/>">(\${dayOfWeek}요일) \${hd_time}</div>
						</a>
					`; 
                }
            }
            $(".hospital-area-list").html(str);
            displayBmkHoPagination(data.pm);
        }, 
        error : function(jqXHR, textStatus, errorThrown){

        }
    });

}

function displayBmkHoPagination(pm){
    
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
	page = $(this).data('page');
	getBmkHoList();
});
 
</script>
</body>
</html>