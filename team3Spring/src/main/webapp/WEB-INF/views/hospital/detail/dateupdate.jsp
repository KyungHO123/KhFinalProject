<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>세부 항목 수정</title>
<style type="text/css">
/* 헤더 */
.home-box1 {
	width: 100%;
	height: 500px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
    background-origin: content-box;
}

.page-title{
	color:rgba(0, 100, 60, 0.8);
	text-align: left;
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 80px 0;
}

/* 전체 툴 */
.container {
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
    border-radius: 15px;
    margin: -250px auto 70px auto;
    background-color: white;
    width: 80%;
    height: 100%;
    border: 1px solid #ced4da;
    padding: 60px 80px;
    display: block;
}

.label {
	color: black;
    text-align: center;
    font-size: 23px;
    font-weight: bold;
    margin-bottom: 2px;
}

.sub_label {
    color: rgb(219,0,0);
    text-align: center;
    font-size: 16px;
    font-weight: 600;
    margin: -15px 10px 0px 10px;
}

.hr_line {
	margin: 30px auto;
}

.update-btn {
    border-radius: 5px;
    border: 1px solid green;
    width: 50%;
    height: 40px;
    color: green;
    text-decoration: none;
    font-size: 15px;
    display: flex;
    align-items: center;
    justify-content: space-around;
	margin: auto;
}

.update-btn:hover {
	color: white;
	background: green;
	border: 0px solid white;
	border-radius: 5px;
}

.list-box {
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
}

.th {
	font-size: 18px;
}

.td {
	font-size: 16px;
}

/* ----------------------------------------------------------------------- */



.date-box input[type="date"],
.date-box input[type="time"],
.date-box input[type="number"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-sizing: border-box;
  margin-bottom: 15px;
}

.date-box input[type="date"]::-webkit-inner-spin-button,
.date-box input[type="date"]::-webkit-calendar-picker-indicator,
.date-box input[type="time"]::-webkit-inner-spin-button,
.date-box input[type="time"]::-webkit-calendar-picker-indicator {
  display: none;

}

.date-box input[type="date"]:focus,
.date-box input[type="time"]:focus,
.date-box input[type="number"]:focus {
  outline: none;
  border-color: #007bff;
}

.date-box input[type="date"]::placeholder,
.date-box input[type="time"]::placeholder,
.date-box input[type="number"]::placeholder {
  color: #6c757d;
}

.date-box input[type="date"]:hover,
.date-box input[type="time"]:hover,
.date-box input[type="number"]:hover {
  border-color: #6c757d;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			프로그램 스케쥴 수정
		</div>
	</div>
</div>
<div class="container">
	<div class="select_subject_box">		
		<label class="label">수정할 진료과</label>
		<select name="hs_num" class="form-control">
			<option value="none">진료과를 선택해주세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
	</div>
	
	<hr class="hr_line">
	
	<div class="select_program_box">
		<label class="label">수정할 프로그램</label>
		<select name="hp_num" class="form-control">
			<option value="none">수정할 프로그램을 선택해주세요</option>	
		</select>
	</div>
	
	<hr class="hr_line">
	
	<div class="date-box">
		<label class="label">날짜/시간/최대인원 변경</label>
		<label class="sub_label">※날짜/시간은 칸을 클릭 후 스페이스바를 눌러서 변경</label>
		<input type="date" name="rs_date" placeholder="날짜를 입력">
		<input type="time" id="timeInput" name="rs_time" placeholder="시간를 입력">
		<input type="number" name="rs_max_person" placeholder="최대인원을 입력하세요">
	</div>
	<div class="list-box">
		 <table class="table" style="text-align: center;">
		    <thead>
		      <tr class="th">
		        <th>번호</th>
		        <th>날짜</th>
		        <th>시간</th>
		        <th>최대인원</th>
		        <th>수정</th>
		      </tr>
		    </thead>
		    <tbody class="itemList">
		    </tbody>
		  </table>
	</div>

</div>

<script type="text/javascript">
	$("[name=hp_num]").click(function(){
		let hp_num = $("[name=hp_num]").val();
		$.ajax({
			method : "post",
			url : '<c:url value="/date/update"/>',
			data : {
				"hp_num" : hp_num
			},
			success : function(data){
				let str = ``;
				console.log(data)
				for(let tmp of data.RSlist){
					str+=
						`
							   <tr class="td">
						        <td>\${tmp.rs_num}</td>
						        <td>\${tmp.rsDate}</td>
						        <td>\${tmp.rsTime}</td>
						        <td>\${tmp.rs_max_person}</td>
						        <td> <button class="btn update-btn" data-rsnum="\${tmp.rs_num}">수정</button></td>
						      </tr>
						`
				}
				$(".itemList").html(str);
			}
		})
	})
</script>



<script type="text/javascript">
	$(document).on('click', '.update-btn', function(){
		let rs_date = $("[name=rs_date]").val();
		let rs_time = $("[name=rs_time]").val();
		let rs_max_person = $("[name=rs_max_person]").val();
		let rs_num = $(this).data('rsnum'); 
		if(rs_date == "" || rs_time == "" || rs_max_person == ""){
			alert("날짜, 시간, 최대인원을 모두 입력해주시기 바랍니다.");
			rs_date = $("[name=rs_date]").val("");
			rs_time = $("[name=rs_time]").val("");
			rs_max_person = $("[name=rs_max_person]").val("");
			return
		}
		$.ajax({
			method : 'post',
			url : '<c:url value="/date/realupdate"/>',
			data : {
				"rs_num" : rs_num,
				"rs_date": rs_date,
			    "rs_time": rs_time,
			    "rs_max_person": rs_max_person
			},
			success : function (data) {
				if(data){
					alert("수정에 성공했습니다.")
					location.href = '<c:url value="/hospital/item/insert"/>';
				}else{
					alert("수정에 실패했습니다.")
					location.href = '<c:url value="/date/update"/>';
				}
			}
		})
	})	
</script>

<script type="text/javascript">
	
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			$("[name=hp_num]").html(`<option value="none">수정할 프로그램을 선택해주세요</option>`);
			$("[name=rs_date]").val("");
			$("[name=rs_time]").val("");
			$("[name=rs_max_person]").val("");
			return;
		}		
		$.ajax({
			method : "post",
			url : '<c:url value="/program/updatecheck"/>',
			data : {"hs_num" : hs_num},
			success : function (data) {
				let str = ``
				for(let tmp of data.hpList){
					str+=`<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`
				}	
				$("[name=hp_num]").html(str);
			}
		});
	});
</script>
</body>
</html>