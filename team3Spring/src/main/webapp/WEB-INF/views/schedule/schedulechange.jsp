<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>사업자 대기 회원 조회</title>
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
	padding: 60px 80px;
    margin: -160px auto 70px auto;
    width: 80%;
    background-color: white;
    border-radius: 15px;
    display: block;
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);

}

.table thead th {
	text-align: center;
    border-bottom: 2px solid #dee2e6;
}

.table td {
	text-align: center;
}

.schedule_btn_del {
    display: none;
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
	<div style="display: flex; ">
	    <select name="hs_num" class="form-control">
				<option value="none">진료과를 선택해주세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
		<div class="input-group mb-3">
			<select name="hp_num" class="form-control">
				<option value="none">프로그램을 선택해주세요</option>
					
			</select>
		</div>
	</div>
	<table class="table table-hover" >
		<thead>
			<tr>
				<th>예약번호</th>
				<th>예약자 아이디</th>
				<th>예약 상태</th>
				<th>예약 프로그램</th>
				<th>가격</th>				
				<th>날짜</th>
				<th>시간</th>
				<th>변경/취소</th>
			</tr>
		</thead>
		<tbody class="box-hospital-list" id="reservation_table">

		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>



<!-- 변경 버튼을 눌렀을때 인풋태그가 바뀌는 코드 -->
<script type="text/javascript">
	$(document).on("click", ".change_btn", function(){
		
		let list = displayDate();
		let option = optionDate(list);
		
		$(this).parents(".tr").find(".date").html('<select name="ndate" class="ndate">'+ option +'</select>');
		$(this).parents(".tr").find(".change_btn").empty();
		$(this).parents(".tr").find(".change_btn").html('<a class="btn success_btn">확인</a>')
	})
</script>


<!-- 프로그램을 선택하면 날짜를 가져오는 메서드 -->
<script type="text/javascript">

	
	function displayDate(option){
		let hp_num = $("[name=hp_num]").val();
		let res = null;
		let arr = new Array();
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
				let dupYn = false;
				for(let i = 0; i < res.length; i++) {
				  let currElem = res[i];
				  for(let j = i+1; j < res.length; j++) {
				    if(currElem.rsDate === res[j].rsDate) {
				      arr.push(res[j])	
				      dupYn = true;
				      break;
				    }
				  }
				  
				  if(dupYn)  {
				    break;
				  }
				} 
			}
		});
		return arr;
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
			str += `<option value="\${tmp}">` + tmp + '</option>'
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
	let hp_num = $("[name=hp_num]").val();
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
	let rv_num = $(this).parents(".tr").find(".rv_num").text();
	var $tr = $(this).closest('tr');
    
    // 선택된 날짜와 시간 옵션의 값을 추출
    var date = $tr.find('.ndate option:selected').text();
    var time = $tr.find('.time option:selected').text();
	let hp_num = $("[name=hp_num]").val();
	location.href='<c:url value="/update/userschedule?rv_num="/>' + rv_num + "&date=" + date + "&time2=" + time + "&hp_num=" + hp_num;
})
</script>



<!-- 병원 과목을 선택하면 프로그램을 가져옴 -->
<script type="text/javascript">
    $("[name=hp_num]").click(function(){
        let hp_num = $("[name=hp_num]").val();
        if(hp_num == 'none'){
            hp_num = 1;
        }
        $.ajax({
            method : "post",
            url : '<c:url value="/schedule/check"/>',
            data:{
                "hp_num" : hp_num
            },
            success : function(data){
                let str = ``;
               	console.log(data)
               	if(data.msg){
               		$(".box-hospital-list").html(`<tr><td>예약이 없습니다.</td></tr>`);
               		return;
               	}
                if(data.list2 != null){
                    for(let tmp of data.list2){
                        if(tmp == null){
                            continue;
                        }else{
                            str += `<tr class="tr">    
                                        <td class="rv_num">\${tmp.rv_num}</td>
                                        <td>\${tmp.memberVO.me_id}</td>
                                        <td>\${tmp.rv_rvs_name}</td>
                                        <td class="program">\${data.HP.hp_title}</td>
                                        <td >\${data.HP.payMentMoney}</td>
                                        <td class="date">\${tmp.reservationScheduleVO.rsDate2}</td>
                                        <td class="time">\${tmp.reservationScheduleVO.rsTime}</td>
                                        <td class="schedule_btn">`;
				                            if(tmp.rv_rvs_name =='예약완료'){
				                                str += `<a class="btn change_btn">변경</a>`;
				                            }
	                            				str += `<a class="btn delete_btn">결제 취소</a>
	                                    </td>
                                  </tr>`;
                        }
                    }
                }
                $(".box-hospital-list").html(str);
            }
        });
    });
</script>


<!-- 

여기부터 시작 메서드 만들어서 PMNUM가져와서  merchant_uid 넘겨주기메서드랑
결제 취소하는 메서드 만들기
그리고 포트원 키 다시 받아서 해보기
-->

<!-- 결제 취소 버튼 -->
<script type="text/javascript">
$(document).on("click", ".delete_btn", function(){
	let rv_num = $(this).parents(".tr").find(".rv_num").text();
	let res2 = false;
	if(confirm("예약을 취소하히겠습니까?")){
		let res = shceduleChange(rv_num);
		if(!res){
			alert("예약취소에 실패했습니다.");
			location.reload(true);
		}else{
			let pm_num = getPmNum(rv_num);
			console.log(pm_num);
			res2 = cancleReservation(pm_num);
			if(res2){
				$(this).parents(".tr").find(".schedule_btn").addClass('schedule_btn_del')
				alert("환불이 완료 되었습니다.");
				location.reload(true);				
			}else{
				alert("환불도중 문제가 발생 하였습니다.");
				location.reload(true);								
			}
		}
	}
})

/* 결재 정보를 가져오는 메서드 */

function getPmNum(rv_num){
	let pm_num = ""
	$.ajax({
		async : false,
		method : "post",
		url : '<c:url value="/get/pmnum"/>',
		data : {
			  "rv_num" : rv_num
			},
		success:function(data){
			pm_num = data.payment.pm_num;
		}
	})
	return pm_num;
}

/* 포트원에 환불을 요청하는 메서드 */

function cancleReservation(pm_num){
	let res = false;
	$.ajax({
		async : false,
		method : "post",
		url : '<c:url value="/payments/cancel"/>',
		data : {
			  "code": 1,
			  "merchant_uid": pm_num,
			  "response": null
			},
		success:function(data){
			//밥 먹고 와서 ajax로 다시 짜기
			res = reservationStateChange(pm_num);
		}
	})
	return res;
}

/* 결제 완료 결제 취소로 만드는 메서드 */
function reservationStateChange(pm_num){
	let res = false;
	$.ajax({
		async : false,
		method : "post",
		url : '<c:url value="/payment/state/change"/>',
		data : {
			"pm_num" : pm_num
		},
		success : function(data){
			res = data;
		}
	})
	return res;
}

/* 예약 완료 상태인 회원을 결제 취소를 하면 예약 취소가 되게 하는 메서드 */
function shceduleChange(rv_num){
	let res = null;
	$.ajax({
		async : false,
		method : "post",
		url : '<c:url value="/delete/schedule"/>',
		data : {
			  "rv_num": rv_num
			},
		success:function(data){
			res = data;
		}
	})
	return res;
}
</script>



<!-- 병원 과목을 선택하면 프로그램을 가져오는 메서드  -->
<script type="text/javascript">
	$("[name=hs_num]").change(function(){
		let list = selectProgram();
		displayHospitalProgram(list);
	});
	
	function selectProgram(){
	    let hp_num = $("[name=hp_num]").val();
	    let hs_num = $("[name=hs_num]").val();
	    if(hs_num == 'none'){
	      
	       return;
	    }
	    let ho = '${ho.site_id}';
	 	let res = null;
	    $.ajax({
	    	async : false,
	        method : "post",
	        url : '<c:url value="/program/updatecheck2"/>',
	        data : {"hs_num" : hs_num,
	                "ho" : ho},
	        success : function (data) {
	            res=data.hpList;
	        }
	    });
	    return res;
	}
	function displayHospitalProgram(hpList){
		let str = ``;
		if(hpList == null){
			 $("[name=hp_num]").html(`<option value="none">프로그램을 선택해주세요</option>`);
			 $(".box-hospital-list").html("");
			return;
		}
        for(let tmp of hpList){
            str += `<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`;
        }
        $("[name=hp_num]").html(str);
	}

</script> 

</body>
</html>