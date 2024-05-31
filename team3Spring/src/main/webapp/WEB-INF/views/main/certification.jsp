<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이메일 인증</title>

<style type="text/css">
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

.all-container {
	padding: 60px 80px 100px;
	margin: -125px auto 70px auto;
	width: 55%;
	background-color: white;
	border-radius: 15px;
	display: block;
	box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
}

.email-box {
	margin-bottom: 20px;
}

.label {
	color: #555;
	text-align: center;
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 0px;
}

.btn-email, .btn-ce {
	margin-top: 10px;
	float: right;
}

.number_box {
	margin-top: 10px;
}

.spinner-container {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.3);
	display: none;
	text-align: center;
	color: white;
	line-height: 100vh;
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
}

.here-title1 {
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: bold;
}

.here-title:hover {
	text-decoration: none;
	color: gray;
}
.here-title1:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<div class="home-box1">
		<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
			<div class="page-title">이메일 인증</div>
			<div
				style="text-align: left; display: flex; height: 50px; line-height: 50px; margin: 20px 0 50px 0;">
				<a href="<c:url value='/'/>" style="z-index: 999"> <img
					class="top-img" alt="위치 이미지"
					src="<c:url value='/resources/img/home-4-line.svg'/>">
				</a>
				<div style="margin: auto 16px;">
					<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
				</div>
				<div style="padding-top: 1px;">
					<a class="here-title"> 회원가입 </a>
				</div>
				<div style="margin: auto 16px;">
					<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
				</div>
				<div style="padding-top: 1px;">
					<p class="here-title1"> 이메일 인증 </p>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 700px;">
		<div class="all-container">
			<div class="email-box">
				<label for="email" class="label">이메일 입력</label> <input type="text"
					class="form-control" id="email" name="email"
					placeholder="이메일을 입력하세요.">
				<button class="btn btn-outline-success btn-email bbbbb">이메일
					인증</button>
				<div class="spinner-container">
					<span class="spinner-border text-primary"></span>
				</div>
			</div>
			<br>
			<div class="ce_numbox"></div>
		</div>
	</div>


	<!-- 이메일 인증 보내기 -->
<script type="text/javascript">
let code = null;

async function emailCheck() {
    return new Promise((resolve, reject) => {
        var email = $("#email").val();
        if (email.length == 0 || email == "") {
            alert("이메일을 입력 하세요.");
            reject(false);
            return;
        }
        $.ajax({
            async: true,
            url: '<c:url value="/hospital/checkEmail"/>',
            type: "get",
            data: { "site_email": email },
            success: function(response) {
                if (response.hoEmailCheck == null) {
                    resolve(true);
                } else {
                    alert("이미 사용중인 이메일입니다.");
                    resolve(false);
                }
            },
            error: function() {
                alert("이메일 인증에 문제가 생겼습니다. 다시 시도해 주세요");
                reject(false);
            }
        }); // ajax end;
    });
}

$(".btn-email").click(async function() {
    spinner();
    try {
        let res = await emailCheck();
        if (res) {
            code = await displaySuccessBtn();
            console.log(code);
        } else {
            $('.spinner-container').hide();
        }
    } catch (error) {
        $('.spinner-container').hide();
    }
});

async function displaySuccessBtn() {
    try {
        let res = await emailCheck();
        if (!res) {
            return null;
        }

        let email = $('[name=email]').val();
        return new Promise((resolve, reject) => {
            $.ajax({
                async: true,
                url: '<c:url value="/certification/email"/>',
                type: 'post',
                data: {
                    "email": email
                },
                success: function(data) {
                    alert("이메일로 인증번호를 보냈습니다.");
                    $('.spinner-container').hide();
                    let str = 
	                    `
	                        <div class="number_box">
	                            <label for="ce_num" class="label">인증번호</label>
	                            <input type="text" class="form-control" id="ce_num" name="ce_num" placeholder="인증번호를 입력하세요.">
	                            <button class="btn btn-outline-success btn-ce">인증하기</button>
	                        </div>
	                    `;
                    $(".ce_numbox").html(str);
                    resolve(data.ctfEmail);
                },
                error: function() {
                    alert("이메일 인증에 문제가 생겼습니다. 다시 시도해 주세요");
                    location.reload(true);
                    reject(null);
                }
            });
        });
    } catch (error) {
        return null;
    }
}


$(document).on("click", ".btn-ce", function(){
	let newCeNum = $("[name=ce_num]").val();
	let url = document.referrer;
    // ceNum 함수의 매개변수로 전달된 값도 함께 보냅니다.
    $.ajax({
        async : 'true',
        url : '<c:url value="/certification/num"/>', 
        type : 'post', 
        data : { "newCeNum": newCeNum, "data": code },
        success: function(data) {
            if(!data){
                alert("인증에 실패했습니다");
            }else{
                alert("인증에 성공했습니다. 회원가입 페이지로 이동합니다.");
               	let email= $("[name=email]").val();
               	if(${num} == 2){               		
               		location.href = '<c:url value="/hospital/signup"/>?email=' + encodeURIComponent(email);
               	}else if(${num} == 1){
               		location.href = '<c:url value="/member/signup"/>?email=' + encodeURIComponent(email);
               	}else{
               		alert("잘못된 접근입니다.");
               		location.reload(true);
               	}
            }
        }
    });
})
function spinner() {
    $('.spinner-container').show();
   
       
   
}
</script>
</body>
</html>
