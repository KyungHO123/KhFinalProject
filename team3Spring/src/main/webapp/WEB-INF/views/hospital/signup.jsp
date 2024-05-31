<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>사업자 회원가입</title>
<style type="text/css">
.body-tag {
padding:0 0 200px 0;
width: 100%;
display: felex;flex-direction: column;
align-items: center;
}
.input-box {
	border:1px solid white;
	width: 547px;height:100%; 
	margin: 0 auto;
	padding: 5px;
}
.input-tag {
	border: 1px solid #ccc; 
    outline: none;
    margin-bottom: 15px; 
    width: 500px;
    padding: 20px;
}
.input-tag:focus {
    border-bottom-color: green;
    box-shadow: 0 0 5px rgba(0, 128, 0, 0.5);
}
.btn {
	text-decoration: none;
	border:1px solid green;
	width: 100px;
}
.btn:hover {
	background-color: rgba(0, 128, 0, 0.5);
	color: white;
}
.signup-btn {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	width: 500px;
	height: 50px;
	padding: 2px;
	border-bottom: 1px solid green;
	border-radius: 5px;
	margin-left: 34px;
	margin-top: 10px;
}

.signup-btn:hover {
	background-color: green;
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
    border-color: rgba(0, 128, 0, 0.5); 
    box-shadow: 0 0 5px rgba(0, 128, 0, 0.5);
}
select:hover {
    background-color: #eaeaea;
}

img {
 width: 30px;
}

.duplicate {
    float:right;
	border-radius:0;
	height: 43px;
}

label {
	margin-left: 30px;
}

.signup_img{
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
<div class="body-tag">
	<div style="margin: 50px auto 0 auto; width: 300px; height: 180px;">
		<img alt="asd" src="<c:url value='/resources/img/Hospital.png'/>" class="signup_img">
	</div>
	<form action='<c:url value="/hospital/signup"/>' id="myForm">
		<div class="input-box">
			<div>
				<img alt="아이디 이미지" src="<c:url value="/resources/img/ceo.svg"/>">
				<input type="text" class="input-tag" id="id" name="site_id" maxlength="15" required autofocus="autofocus" placeholder="아이디"/>
				<label class="itext text-danger textId" id="id-error"></label>
			</div>
			<div>
		    	<input type="hidden" id="id2" name="ho_id">
			</div>
			<div>
				<img alt="비번 이미지" src="<c:url value="/resources/img/password.svg"/>">
				<input type="password" class="input-tag" id="pw" name="ho_pw" maxlength="18" required autofocus="autofocus" placeholder="비밀번호"/>
				<label id="pw-error" class="error text-danger" for="pw"></label>
			</div>
			<div>
				<img alt="비번확인 이미지" src="<c:url value="/resources/img/passwordcheck.svg"/>">
				<input type="password" class="input-tag" id="pw2" name="ho_pw2" maxlength="18" required autofocus="autofocus" placeholder="비밀번호 확인"/>
				<label id="pw2-error" class="error text-danger" for="pw2"></label>
			</div>
			<div>
				<img alt="이메일 이미지" src="<c:url value="/resources/img/email.svg"/>">
				<input type="email" class="input-tag" id="email" name="site_email" maxlength="50" readonly autofocus="autofocus" value="${email}"/>
				<label id="email-error" class="etext error text-danger" for="email"></label>
			</div>
			<div>
		    	<input type="hidden" id="email2" name="ho_email" value="${email}">
			</div>
			<div>
				<img alt="상호명 이미지" src="<c:url value="/resources/img/quote.svg"/>">
				<input type="text" class="input-tag" id="name" name="ho_name" required autofocus="autofocus" placeholder="상호명"/>
				<label id="name-error" class="error text-danger" for="name"></label>
			</div>
			<div>
				<img alt="대표자명 이미지" src="<c:url value="/resources/img/user.svg"/>">
				<input type="text" class="input-tag" id="ceo" name="ho_ceo" 
				required autofocus="autofocus" placeholder="대표자명"/>
				<label id="ceo-error" class="error text-danger" for="ceo"></label>
			</div>
			<div>
				<img alt="사업자번호 이미지" src="<c:url value="/resources/img/job.svg"/>">
				<input type="text" class="input-tag" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="10"
				id="num" name="ho_num" required autofocus="autofocus" placeholder="사업자번호('-'제외 10자)"/>
				<label id="num-error" class="error text-danger" for="num"></label>
			</div>
			<div>
				<img alt="주소 이미지" src="<c:url value="/resources/img/job.svg"/>">
				<input type="text" class="input-tag" onKeyup="this.value=this.value.replace(/^[a-zA-Zㄱ-힣0-9]{1,100});"
				id="ho_address" name="ho_address" required autofocus="autofocus" placeholder="상세 주소를 입력해주세요"/>
				<label id="ho_address" class="error text-danger" for="ho_address"></label>
			</div>
			<div>
				<img alt="대표 전화번호 이미지" src="<c:url value="/resources/img/phone2.svg"/>">
				<input type="text" class="input-tag" maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
				id="phone" name="site_phone" required autofocus="autofocus" placeholder="대표 전화번호('-'제외 최대 11자)"/>
				<label id="phone-error" class="ptext error text-danger" for="phone"></label>
			</div>
			<div>
		    	<input type="hidden" id="phone2" name="ho_phone">
			</div>
			<div class="hr" style="margin-top:0px; margin-bottom:30px; border: 1px solid #d2d2d2; width: 560px;"></div>
			<div class="subject">
				<select id="subject" name="ho_hs_num" style="width: 500px; margin-bottom: 20px" required>
					<option value="none">진료과목을 선택하세요</option>
					<c:forEach items="${hospitalList}" var="hs">
						<option value="${hs.hs_num}">${hs.hs_title}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<select name="sd_num" class="sd_num" style="width: 500px; margin-bottom: 20px" required>
					<option value="none">시/도를 선택해주세요</option>
					<c:forEach items="${sidoList}" var="sd">
						<option value="${sd.sd_num}">${sd.sd_name}</option>
					</c:forEach>
				</select>	
				<select name="sgg_num" class="sgg_num" style="width: 500px; margin-bottom: 20px" required>
					<option value="none">시/군/구를 선택해주세요</option>
				</select>	
			 	<select name="emd_num" class="emd_num" style="width: 500px; margin-bottom: 20px" required>
			         <option value="none">읍/면/동을 선택해주세요</option>
			    </select>
			</div>
			<div>
				<button class="check btn signup-btn" type="submit">회원가입</button>
			</div>
		</div>
	</form>
</div>
<!-- 정규표현식 -->
<script type="text/javascript">
$("form").validate({
	//규칙
	rules : {
		ho_id : {
			required : true, //message
			regex : /^\w{8,15}$/ //\w : 영어 대소문자 + 숫자
		},
		ho_pw : {
			required : true,
			regex : /^[a-zA-Z0-9!@#$]{8,18}$/
		},
		ho_pw2 : {
			equalTo : pw //name이 아닌 id를 써 줌
		},
		ho_email : {
			required : true,
			email : /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
		},
		ho_name : {
			required : true,
			regex : /^[a-zA-Zㄱ-힣0-9]{1,50}$/
		},
		ho_ceo : {
			required : true,
			regex : /^[ㄱ-힣]{1,5}$/
		},
		ho_num : {
			required : true,
			regex : /^[0-9]{10}$/
		},
		ho_address : {
			required : true,
			regex : /^[a-zA-Zㄱ-힣0-9]{1,100}$/
		},
		ho_phone : {
			required : true,
			regex : /^[0-9]{8,11}$/
		}
	},
	//규칙에 대한 메세지
	messages : {
		ho_id : {
			required : "", //message
			regex : ""
		},
		ho_pw : {
			required : "필수 항목입니다.",
			regex : "비번은 숫자, 영문, !@#$ 8~18자 입니다."
		},
		ho_pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		ho_email : {
			required : "",
			email : ""
		},
		ho_name : {
			required : "필수 항목입니다.",
			regex : "상호명은 한영, 숫자 최대50자 입니다."
		},
		ho_ceo : {
			required : "필수 항목입니다.",
			regex : "대표자명은 한글 최대 5자 입니다."
		},
		ho_num : {
			required : "필수 항목입니다.",
			regex : "사업자 번호는 '-'제외한 10자리를 입력하세요."
			//,digits : "숫자만 입력하세요."
		},
		ho_address : {
			required : "필수 항목입니다.",
			regex : "소재지 주소를 입력하세요."
		},
		ho_phone : {
			required : "필수 항목입니다.",
			regex : "대표 전화번호는 '-'제외한 번호를 입력하세요."
			//,digits : "숫자만 입력하세요."
		}
	}
});

$.validator.addMethod(
	"regex",
	function (value, element, regexp) {
		var re = RegExp(regexp);
		return this.optional(element) || re.test(value);
	},
	"정규표현식에 맞지 않습니다."
)
</script>



<script type="text/javascript">
$(document).ready(function(){
    $("#id").keyup(function() {
        var meId = $(this).val(); 
        $("#id2").val(meId);
    });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
    $("#email").keyup(function() {
        var meId = $(this).val(); 
        $("#email2").val(meId);
    });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
    $("#phone").keyup(function() {
        var meId = $(this).val(); 
        $("#phone2").val(meId);
    });
});
</script>
<!-- 시군구, 읍면동 select 띄우기 -->
<script type="text/javascript">
/* 군 구 리스트 select로 띄우기 시작 */
$("[name=sd_num]").click(function(){
	let sd_num = $("[name=sd_num]").val();
	if(sd_num == 'none'){
		sd_num = 1;
	}
	$.ajax({
		method : "post",
		url : '<c:url value="/member/signup/gungoo"/>', 
		data : {"sd_num" : sd_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <option value='\${data[tmp].sgg_num}'>\${data[tmp].sgg_name}</option>`;
			}
			$(".sgg_num").html(str);
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})

/* 읍면동 리스트 select로 띄우기 끝 */

/* 읍면동 리스트 select로 띄우기 시작 */
$("[name=sgg_num]").click(function(){
	let sgg_num = $("[name=sgg_num]").val();
	if(sgg_num == 'none'){
		sgg_num = 1;
	}
	$.ajax({
		method : "post",
		url : '<c:url value="/member/signup/eupmyeondong"/>', 
		data : {"sgg_num" : sgg_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <option value='\${data[tmp].emd_num}'>\${data[tmp].emd_name}</option>`;
			}
			$(".emd_num").html(str);
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
/* 읍면동 리스트 select로 띄우기 끝 */
</script>

<!-- 아이디, 이메일, 폰번호 중복체크 ajax 정규표현식 적용 시키기 -->
<script type="text/javascript">
$(document).ready(function() {
	   var idCheck = false;
	    $("#id").keyup(function() {
	        var id = $("#id").val();
	        if(id.length == 0 || id==""){
	          $(".itext").text("아이디를 입력해주세요.");
	          return;
	       }
	        if (!/^\w{8,15}$/.test(id)) {
	            $(".itext").text("영문 숫자 2가지 이상 조합 (8~15자)").css("color", "red");
	            return;
	        }
	        if (/[\u3131-\uD79D]/.test(id) || /[!@#$%^&*(),.?":{}|<>]/.test(id)) {
	          $(".itext").text("한글이나 특수문자는 아이디로 사용할 수 없습니다.");
	          return;
	        }
	        $.ajax({
	            url: '<c:url value="/hospital/checkId"/>',
	            type: "get",
	            data: {site_id : id}, 
	            success: function(response) {
	                if (response.hoIdCheck == null) {
	                	        $(".itext").text("사용 가능한 아이디입니다.").css("color", " #C12DFF");
	                	        idCheck = true;
	                	        setTimeout(function() {
	                	            $(".itext").text("");
	                	        }, 2000);
	                	        return;
	                	
	                	}else if(response.hoIdCheck != null && id.length >= 8){
	                		$(".itext").text("이미 사용중인 아이디입니다.");
	                		idCheck = false;
	                } 
	            },
	            error: function(xhr, status, error) {
	                console.error("에러에러", error);
	            }
	        });
	    });
	 	var phoneCheck = false;
	    $("#phone").keyup(function() {
	        var phone = $("#phone").val();
	        if(phone.lengh == 0 || phone == "" ||phone.length < 8){
	        	$(".ptext").text("대표 전화번호를 입력하세요(8~11자)");
	        	return;
	        }
	        
	        $.ajax({
	            url: '<c:url value="/hospital/checkPhone"/>',
	            type: "get",
	            data: { site_phone: phone}, 
	            success: function(response) {
	                if (response.hoPhoneCheck == null) {
	                	if(8<= phone.length <= 11){
	                    $(".ptext").text("사용가능한 번호입니다.");
	                    phoneCheck = true;
	                    setTimeout(function() {
	        	            $(".ptext").text("");
	        	        }, 2000);
	                    return;
	                	}
	                } else if(response.hoPhoneCheck != null ){
	                	 $(".ptext").text("이미 사용중인 번호입니다.");
	               	 	phoneCheck = false;
	                    return;
	                }
	            },
	            error: function(xhr, status, error) {
	            	 $("#idcheck-phone").text("대표 전화번호를 제대로 입력해주세요.");
	            }
	        });
	    });  
	   var emailCheck = false;
	    $("#email").on("keyup",function() {
	        var email = $("#email").val();
	        if (email.length == 0 || email == "") {
	           $(".etext").text("이메일을 입력하세요.");
	            return;
	        }
	        if (email.length < 12) {
	           $(".etext").text("이메일을 올바르게 입력하세요.");
	            return;
	        }
	        if (!email.endsWith('.com')||
	        		email.indexOf('.com') != email.lastIndexOf('.com')) {
	            $(".etext").text("올바른 이메일 주소를 입력하세요 (예: example@example.com).");
	            return;
	        }
	        $.ajax({
	            url: '<c:url value="/hospital/checkEmail"/>',
	            type: "get",
	            data: {site_email: email}, 
	            success: function(response) {
	                if (response.hoEmailCheck == null) {
	                	if(email.length >= 12){
	                  	 $(".etext").text("사용 가능한 이메일입니다.");
	                  	 emailCheck = true;
	                  	setTimeout(function() {
	        	            $(".etext").text("");
	        	        }, 2000);
	        	        return;
	        	    }
	                } else if(response.hoEmailCheck != null){
	               		$(".etext").text("이미 사용중인 이메일입니다.");
	                   emailCheck = false;
	                   return;
	                }
	            },
	            error: function(xhr, status, error) {
	            }
	        }); // ajax end;
	    }); 
     $(".check").click(function(){
       if(!idCheck){
          alert("아이디 중복 확인을 해주세요.");
          $("#id").focus();
          return false;
       }
       /* if(!emailCheck){
          alert("이메일 중복 확인을 해주세요.");
          $("#email").focus();
          return false;
       } */
       if(!phoneCheck){
          alert("휴대폰 번호 중복 확인을 해주세요.");
          $("#phone").focus();
          return false;
       }
    }); 
});
</script>
<script type="text/javascript">
$("form").submit(function(event){
    event.preventDefault(); // 기본 form 제출 이벤트를 막습니다.
    
    var la_sd_num = $("select[name='sd_num'] option:selected").val();
    console.log("시"+la_sd_num);
    var la_sgg_num = $("select[name='sgg_num'] option:selected").val();
    console.log("군 구"+la_sgg_num);
    var la_emd_num = $("select[name='emd_num'] option:selected").val();
    console.log("읍 면 동"+la_emd_num	);

 // Serialize된 form 데이터를 직접 사용하고 str 파라미터를 추가합니다.
    var formData = $(this).serialize();
    formData += '&la_sd_num=' + la_sd_num + '&la_sgg_num=' + la_sgg_num + '&la_emd_num=' + la_emd_num; // str 파라미터 추가
    
    $.ajax({
    	   async : true, //비동기 : true(비동기), false(동기)
    	   url : '<c:url value="/hospital/signup"/>', 
    	   type : 'post', 
    	   data : formData,
    	   success : function (data){
    		   if(data == false){
    			   location.href = '<c:url value="/message?res="/>' + data;
    		   }else{
    			   location.href = '<c:url value="/message?res="/>' + data;
    		   }
    	   }, 
    	   error : function(jqXHR, textStatus, errorThrown){

    	   }
    	});
    return false;
})
</script>

<!-- 병원 과목 추가 -->
<!-- <script type="text/javascript">
$("form").submit(function (event) {
	
	$.ajax({
 	   async : true, //비동기 : true(비동기), false(동기)
 	   url : '<c:url value="/hospital/signup"/>', 
 	   type : 'post', 
 	   data : formData,
 	   success : function (data){
 		   if(data == false){
 			   location.href = '<c:url value="/message?res="/>' + data;
 		   }else{
 			   location.href = '<c:url value="/message?res="/>' + data;
 		   }
 	   }, 
 	   error : function(jqXHR, textStatus, errorThrown){

 	   }
 	});
	return false;
});
</script> -->
</body>
</html>