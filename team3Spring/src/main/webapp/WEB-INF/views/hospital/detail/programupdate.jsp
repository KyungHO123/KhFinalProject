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

.form-control {
    display: block;
    width: 95%;
    height: auto;
    padding: 8px;
    margin: auto 10px;
    font-size: 16px;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 5px;
}

.update-btn {
    border-radius: 5px;
    line-height: 45px;
    margin: 0 auto;
    border: 1px solid green;
    width: 20%;
    height: 50px;
    color: green;
    text-decoration: none;
    font-size: 20px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    margin-top: 20px;
}

.update-btn:hover {
	color: white;
	background: green;
	border: 0px solid white;
	border-radius: 5px;
}

.check-box-group {
	display: grid;
    grid-template-columns: repeat(14, 2fr);
    align-items: center;
    margin-bottom: 30px;
    font-size: 16px;
    margin-left: -20px;
}

input[type="checkbox"] {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    appearance: none;
    cursor: pointer;
    background-color: #c8c8c8;
    border: 0px solid white;
    margin: 4px 0px 4px 30px;
}

input[type="checkbox"]:checked::before {
    content: '\2713';
    display: flex;
    width: 20px;
    height: 20px;
    text-align: center;
    background-color: green;
    color: white;
    border-radius: 20px;
    flex-direction: row;
    align-content: stretch;
    justify-content: space-evenly;
    margin: 0px;
    flex-wrap: nowrap;
    align-items: center;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			프로그램 수정
		</div>
	</div>
</div>
<div class="container">
	<div class="select_subject_box">
		<label class="label">수정할 진료과</label>
		<select name="hs_num" class="form-control">
				<option value="none">수정할 진료과를 선택하세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
	</div>
	
	<hr class="hr_line">
	
	<div class="select_program_box">
		<label class="label">수정할 프로그램</label>
		<select name="hp_num" class="form-control">
			<option value="none">수정할 프로그램을 선택하세요</option>
		</select>
	</div>
	
	<hr class="hr_line">
	
	<div class="update_pay_box">
		<label class="label" for="hp_payment">추가 및 삭제할 세부항목 선택</label>
		<label class="sub_label">※다중선택 가능</label>
		<div class="check-box-group" id="check-box-group"></div>
	</div>
	
	<hr class="hr_line">
	
	<div class="update_title_box">
		<label class="label" for="hp_title">새 프로그램명 입력</label>
		<input class="form-control" placeholder="새 프로그램 입력하세요" name="hp_title">
	</div>
	
	<hr class="hr_line">
	
	<div class="update_pay_box">
		<label class="label" for="hp_payment">프로그램 가격 변경</label>
		<label class="sub_label" for="hp_payment">※숫자만 입력(원단위는 생략)</label>
		<input type="number" class="form-control" placeholder="프로그램 가격을 변경하세요" name="hp_payment">
	</div>
	<button class="btn update-btn">프로그램 수정</button>

</div>

<script type="text/javascript">
	
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			$("[name=hp_num]").html(`<option value="none">프로그램을 선택해주세요</option>`);
			$(".check-box-group").empty();
			return
		}		
		$.ajax({
			method : "post",
			url : '<c:url value="/program/updatecheck"/>',
			data : {"hs_num" : hs_num},
			success : function (data) {
				let str = ``
				if(data.hpList.length == 0){
					str+=`<option value="none">등록된 프로그램이 없습니다</option>`
				}else{
					for(let tmp of data.hpList){
						str+=`<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`
					}						
				}
				
				$("[name=hp_num]").html(str);
			}
		});
	});
</script>

<!-- 프로그램을 선택하면 체크박스 자동으로 체크되어 있게하기 -->
<script type="text/javascript">

$("[name=hp_num]").change(function(){
	let hp_num = $(this).val();
	let hs_num = $("[name=hs_num]").val();
	$.ajax({
		method : "post",
		url : '<c:url value="/program/item/check"/>',
		data : {"hp_num" : hp_num,
				"hs_num" : hs_num},
		success : function (data) {
			$(".check-box-group").empty();
			let str2 = ``;
			for(let tmp of data.itemList){
				let res = false;
				for(let j of data.list){
					if(tmp.it_num == j.item.it_num){
						str2+=`<input type="checkbox" value="\${tmp.it_num}" name="li_list" checked>\${tmp.it_name}`;
						res = true;
						break;
					}
				}
				if(!res){
					str2+=`<input type="checkbox" value="\${tmp.it_num}" name="li_list">\${tmp.it_name}`					
				}
			}
			$(".check-box-group").html(str2);
		}
	});
})

	
</script>

 <script type="text/javascript">
	$(".update-btn").click(function(){
		let hp_num = $("[name=hp_num]").val();
		let hp_title = $("[name=hp_title]").val();
		let hp_payment = $("[name=hp_payment]").val();
		let list = getCheckedValues();
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			alert("과를 선택해주세요");
			return;
		}
		if(hp_num == 'none'){
			alert("수정할 프로그램을 선택해주세요");
			return;
		}
		if(list.length == 0){
			alert("상세항목을 체크해주세요.");
			$("[name=hp_title]").val("");
			$("[name=hp_payment]").val("");
			return;
		}
		if(hp_title.length == 0 || hp_payment.length == 0){
			alert("프로그램 명과 가격을 제대로 작성해주세요");
			return;
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/program/update"/>',
			data : {
						"hp_num" : hp_num,
						"hp_title" : hp_title,
						"hp_payment" : hp_payment,
						"list" : list,
						"hs_num" : hs_num
					},
			success : function (data) {
					if(data){
						alert("수정에 성공했습니다.");
						location.href = '<c:url value="/hospital/item/insert"/>';
					}else{
						alert("수정에 실패했습니다.");
						location.href = '<c:url value="/hospital/item/insert"/>';
					}
			}
		});
	});
	
	//체크된 리스트 가져오기
	function getCheckedValues() {
	    var checkedValues = new Array(); // 체크된 값들을 담을 배열
	    $("input[name='li_list']:checked").each(function() {
	        checkedValues.push($(this).val());
	    });
	    return checkedValues;
	}
</script>
</body>
</html>