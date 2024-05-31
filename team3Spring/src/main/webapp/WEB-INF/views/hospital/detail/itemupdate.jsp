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
    padding: 60px 80px 40px;
    display: block;
}

.label {
	color: black;
    text-align: center;
    font-size: 23px;
    font-weight: bold;
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
    font-size: 24px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    margin-top: 30px;
}

.update-btn:hover {
	color: white;
	background: green;
	border: 0px solid white;
	border-radius: 5px;
    
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			세부항목 수정
		</div>
	</div>
</div>
<form action='<c:url value="/item/update"/>' method="post">
	<div class="container">
		<div class="select_subject_box">
			<label class="label">수정할 진료과를 선택하세요</label>		
			<select name="hs_num" class="form-control">
					<option value="none">진료과를 선택해주세요</option>
				<c:forEach items="${list}" var="list">
					<option value="${list.hs_num}">${list.hs_title}</option>
				</c:forEach>
			</select>
		</div>
		
		<hr class="hr_line">
			
		<div class="select_detail_box">
			<label class="label">수정할 세부항목을 선택하세요</label>	
			<select name="type" class="form-control">
				<option value="none">세부항목을 선택해주세요</option>
			</select>
		</div>
				
		<hr class="hr_line">
			
		<div class="update_detail_box">
			<label class="label" for="it_name">수정할 세부항목 이름을 적으세요</label>
			<input class="form-control" placeholder="항목이름을 입력해주세요" name="it_name">
		</div>
				
		<hr class="hr_line">
			
		<div class="update_explan_box">
			<label class="label" for="it_explanation">세부항목 설명을 수정하세요</label>
			<input class="form-control" placeholder="항목 설명을 입력해주세요" name="it_explanation">
		</div>
		<div class="">
			<button class="btn update-btn" type="submit">항목 수정</button>
		</div>
	</div>
</form>
<script type="text/javascript">
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			hs_num = 1;
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/subject/item"/>',
			data: {
				"hs_num": hs_num
			},
			success : function (data) {
				console.log(data);
				if(data.itemList == null){
					$("[name=type]").html(`<option value="none">세부항목을 선택해주세요</option>`);
					return;
				}
				let str = ``;
				for(let tmp of data.itemList){
					str += 
						`
							<option value="\${tmp.it_num}">\${tmp.it_name}</option>
						`
				}
				$("[name=type]").html(str);
			}
		})		
	})
	
</script>
</body>
</html>