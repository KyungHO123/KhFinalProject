<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- 제이쿼리 CDN 방식 -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js" ></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" ></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.js" ></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.min.js" ></script>
<style type="text/css">
.body-tag{
padding:200px 0 200px;
width: 100%;
display: felex;flex-direction: column;
align-items: center;
}
.input-box{
	border:1px solid white;
	width: 547px;height:100%; 
	text-align: center;
	
}
.input-tag{
    border: 1px solid #ccc; 
    outline: none;
    margin-bottom: 15px; 
    width: 500px;
    padding: 20px;
}
.input-tag:focus {
    border-bottom-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
.insert-box{
	margin: auto 0;
	text-align: center; 
	margin-bottom: 50px;
	
}
.insert-info{
	border: solid 1px red;
	height: 100px; width: 100%;
	margin-top: 10px;
	padding: 10px;
	display: flex;
}
.btn{
	text-decoration: none;
	border:1px solid  #C12DFF;
	width: 100px;
}
.btn:hover {
	background-color:  #C12DFF;
	color: white;
}
.signup-btn{
text-align:center;font-size:20px;font-weight:bold;
width: 500px;height:40px;border-radius:0;
padding: 2px;border-bottom: 1px solid  #C12DFF;
margin-left:34px;
}
select {
	margin-left:34px;
    padding: 10px;
    font-size: 16px; 
    border: 1px solid #ccc; 
    background-color: #ffff; 
    outline: none; 
    width: 500px; 
}
select:focus {
    border-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
select:hover {
    background-color: #eaeaea;
}
.duplicate{
    float:right;
	border-radius:0;
	height: 43px;
}


</style>
</head>
<body>
<!-- 중복확인 버튼 때문에 불 필요한 여백 발생하는중 고쳐야 함 -->
<div class="body-tag">
	<form id="myForm" action="<c:url value="/member/signup"/>">
	<div class="input-box">	
		<div class="insert-box">
			<label for="item">세부 항목</label>
		    <input  type="text" id="item" name="it_name" placeholder="등록하고 싶은 항목을 입력하세요" autofocus="autofocus" class="input-tag">
		    <textarea name="it_explanation">
		    
		    </textarea>
		    <a class="btn item-inset-btn">등록</a>
		    <div class="insert-info">
		    	
		    </div>
		</div>
		<div>
	    	<input type="hidden" id="id2" name="me_id">
		</div>
		<div>
	    	<input   type="password" id="pw" name="me_pw" placeholder="비밀번호" autofocus="autofocus" class="input-tag">
		</div>
		<div>
	   	 	<input   type="password" id="pw2" name="me_pw2" placeholder="비밀번호 확인" autofocus="autofocus" class="input-tag">
		</div>
		<div>
	    	<input   type="text" id="name" name="me_name" placeholder="이름" autofocus="autofocus" class="input-tag">
		</div>
		<!-- 이메일  -->
		<div>
	    	<input  type="text" id="email" name="site_email" placeholder="이메일" autofocus="autofocus" class="input-tag">
	    	<!-- <a type="button" class="email-btn btn duplicate">중복확인</a> -->
		</div>

		<div class="subject">
		<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 560px;"></div>
			<select id="subject" name="me_hs_num" style="margin-bottom: 15px;width: 500px" >
				<option value="none">관심 병원 과목을 선택하세요</option>
				<option value="none">없음</option>
				<c:forEach items="${list}" var="hs">
					<option value="${hs.hs_num}">${hs.hs_title}</option>
				</c:forEach>
			</select>
		</div>
		<div>
		 <select name="sd_num" required class="sd_num" style="width: 500px;margin-bottom: 20px">
		 		<option value="none">시/도를 선택해주세요</option>
	        <c:forEach items="${sidoList}" var="sd">
	            <option value="${sd.sd_num}">${sd.sd_name}</option>
	        </c:forEach>
	     </select>   
		 <select name="sgg_num" class="sgg_num" required style="width: 500px;margin-bottom: 20px">
	           <option value="none">시/군/구를 선택해주세요</option>
	     </select>   
	    <select name="emd_num" class="emd_num" required style="width: 500px;margin-bottom: 20px">
	         <option value="none">읍/면/동을 선택해주세요</option>
	 	</select>
		</div>
		 
		<div>
	    	<button type="submit" id="land1" onclick="meIdForm()" class="check btn signup-btn">회원가입</button>
		</div>
	</div>	
	</form>
</div>




<script type="text/javascript">
$("form").submit(function(event){
    event.preventDefault(); // 기본 form 제출 이벤트를 막습니다.
    
    var sd_num = $("select[name='sd_num'] option:selected").text();
    var sgg_num = $("select[name='sgg_num'] option:selected").text();
    var emd_num = $("select[name='emd_num'] option:selected").text();
    var str = sd_num + sgg_num + emd_num;
    
    // Serialize된 form 데이터를 직접 사용하고 str 파라미터를 추가합니다.
    var formData = $(this).serialize();
    formData += '&str=' + str; // str 파라미터 추가
    $.ajax({
        async:true,
        url : '<c:url value="/member/signup"/>', // URL을 직접 지정
        type : 'post',
        data : formData,
        success:function(data){
            if (data === false) {
                location.href = '<c:url value="/message?res="/>' + data; // URL을 직접 지정
            } else {
                location.href = '<c:url value="/message?res="/>' + data; // URL을 직접 지정
            }
        }
    });
    return false;
})

</script>

<script type="text/javascript">
	$(".item-inset-btn").click(function(){
		let it_name = $("[name=it_name]").val();
		let it_explanation = $("[name=it_explanation]").val();
		$.ajax({
			method : "post",
			url : '<c:url value="/item/insert"/>',
			data : {"it_name" : it_name,
					"it_explanation" : it_explanation},
			success : function (data) {
				console.log(data)
			}
		});
	});
</script>

<!-- 시/도,시/군/구,읍/면/동 ajax -->
<script type="text/javascript">
/* 군 구 리스트 select로 띄우기 시작 */
	
$("[name=sd_num]").change(function(){
	let sd_num = $("[name=sd_num]").val();
	if(sd_num == 'none'){
		sd_num = -1;
	}
	$.ajax({
		method : "post",
		url : '<c:url value="/member/signup/gungoo"/>', 
		data : {"sd_num" : sd_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <option value='\${data[tmp].sgg_num}' selected>\${data[tmp].sgg_name}</option>`;
			}
			$(".sgg_num").html(str);
			
		}
    });	
});

/* 읍면동 리스트 select로 띄우기 시작 */
$("[name=sgg_num]").click(function(){
	let sgg_num = $("[name=sgg_num]").val();
	$.ajax({
		method : "post",
		url : '<c:url value="/member/signup/eupmyeondong"/>', 
		data : {"sgg_num" : sgg_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <option value='\${data[tmp].emd_num}' selected>\${data[tmp].emd_name}</option>`;
			}
			$(".emd_num").html(str);
			
		}, 
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });
});
/* 읍면동 리스트 select로 띄우기 끝 */

</script>


</body>
</html>