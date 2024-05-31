<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>세부 항목  수정</title>
<style type="text/css">
.container {
  margin: 20px auto;
  max-width: 800px;
  padding: 20px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.list-box {
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
}

.date-box {
  margin-top: 20px;
}

.date-box input[type="date"],
.date-box input[type="time"],
.date-box input[type="number"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-sizing: border-box;
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
<div class="container">
			<h3>삭제하고 싶은 스케줄의 번호를 클릭해주세요</h3>
		<select name="hs_num" class="form-control">
				<option value="none">진료과를 선택해주세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
		<div class="input-group mb-3">
			<select name="hp_num" class="form-control">
				<option value="none">수정할 프로그램을 선택해주세요</option>
					
			</select>
		</div>

		<div class="list-box">
			 <table class="table">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>날짜</th>
			        <th>시간</th>
			        <th>최대인원</th>
			        <th>버튼</th>
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
							   <tr>
						        <th>\${tmp.rs_num}</th>
						        <th>\${tmp.rsDate}</th>
						        <th>\${tmp.rsTime}</th>
						        <th>\${tmp.rs_max_person}</th>
						        <th><a class="rs-btn" data-rsnum="\${tmp.rs_num}">삭제</a></th>						        
						      </tr>
						`
				}
				$(".itemList").html(str);
			}
		})
	})
</script>

<script type="text/javascript">
	$(document).on('click', '.rs-btn', function(){
		let rs_num = $(this).data('rsnum'); 
		$.ajax({
			method : 'post',
			url : '<c:url value="/date/delete"/>',
			data : {
				"rs_num" : rs_num,
			},
			success : function (data) {
				if(data){
					alert("삭제에 성공했습니다.")
					location.href = '<c:url value="/hospital/item/insert"/>';
				}else{
					alert("삭제에 실패했습니다.")
					location.href = '<c:url value="/hospital/item/insert"/>';
				}
			}
		})
	})	
</script>

<script type="text/javascript">
	
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			hs_num = 1;
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