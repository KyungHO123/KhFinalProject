<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <!-- include plugin -->
    <script src="[folder where script is located]/[plugin script].js"></script>
<style type="text/css">
.page-title{
	text-align: left;
	font-size: 50px;
	color: rgba(0, 100, 60, 0.8);
	font-weight: bold;
	margin: 0 0 80px 0;
}
.home-box1 {
	width: 100%;
	height: 350px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
    background-origin: content-box;
}
.report-box li{
	list-style: none;width: 50px;height: 50px;
}
.report-box{
 	  background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}
.report-box-comment li{
	list-style: none;width: 50px;height: 50px;
}
.report-box-comment{
 	  background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}
.red_btn{
 background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;

}
.red_btn_comment{
 background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;

}
.btn-like{
 background-image:url("<c:url value="/resources/img/heart.png"/>");
	  margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}
.btn-heart{
	  background-image:url("<c:url value="/resources/img/red_heart.png"/>");
	  margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}

.btn-heart.active{
      fill: red;
}
textarea{outline-style: none;}
.post_list_container{width: 100%;height: 100%;}
.post_list_box{
	border:2px solid green;width: 1400px;height: 100%;margin:-140px auto 100px auto;background:white;
	padding:0 100px 100px 100px;	border-radius: 10px;
}
.hr{width: 100%;height: 0;border: 1px solid lightgray;margin: 50px 0 50px 0;}
.post_insert_btn{
	line-height: 50px;color: green;height: 100%;width: 100%;
	border: 1px solid green; padding: 13px;border-radius:10px;
	}
.post_list_box{
   box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
}
.post_insert_btn:hover{color: white;background-color: green;text-decoration: none;}
.post_insert_btn_box{height: 50px;width: 100px;margin: 0 20px 40px auto;}
.content_container{
width: 100%;height: 100%;padding: 5px;}
.content-input{width: 100%;display: flex;}
.content-title{width: 95%;padding: 10px;outline-style: none;border: 1px solid lightgray;}
.content-text{width: 100%;display: flex;}
.content-content{width: 95%;padding: 3px;outline-style: none; resize: none;border:1px solid lightgray;
min-height: 600px;max-height: 600px;}
.content-file{display:flex;
width: 80%;margin: 0 auto 20px 0;

}
.insert-btn{
    border: 1px solid green;
    background: white;
    width: 300px;
    padding: 8px;
}
.insert-btn:hover{
	 background: green;color: white;
}
.p_tag{margin-left:auto;display: flex;flex-direction: row-reverse;}

.writer-more{
        text-align: center;
    width: 183px;
	display: inline-block;
	color: black;
	height: 40px;
	background-color: #f5f6f8;
	line-height: 40px;
	border-radius: 8px;
}
.writer-more:hover{
	text-decoration: none;
	color: gray;
}
.comment_content{ resize: none; width: 92%;}
.box-comment{margin:30px 0 20px 0;
width: 100%;height: 60px;border-bottom: 1px solid gray;

}
.like-box{display:  flex;margin: 20px 0 80px auto;}
.user_more_post{margin-left: 53px;margin-top: 10px;}
.btn-insert-comment{
	background-color: white; color: green;border: 1px solid green;
}
.btn-insert-comment:hover{
	background-color: green; color: white;
}
.file-box{
	width: 100%;display: flex;justify-content: center;border: 1px solid #d2d2d2;margin-bottom: 120px;
}
..input-group{}
.comment_id{
	color: black;text-decoration: none;
}
.comment_id:hover {
	color: black;text-decoration: underline;
}
.page-link{
color: green;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
 }
 
 
 .modal {
	display: none;
	position: fixed;
	z-index: 990;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}
 .modal_comment {
	display: none;
	position: fixed;
	z-index: 990;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	text-align: center;
}
.modal-comment-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	text-align: center;
}

.close {
	color: #aaa;
	margin: 0 24px 8px auto;
	font-size: 50px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.p_tag>a{
 color: black;
 text-decoration: none;
}
.p_tag>a:hover {
	text-decoration: underline;
	color:  rgba(0, 128, 0, 0.5);
}

.delete-button{cursor: pointer;margin-left:5px;color:#b4b4b4; }
.delete-button:hover{color: gray;}
.fileList_box{width: 100%;height: 50px;}
#fileList{display: flex;list-style: none;}
#fileList li{margin: 10px;border: 1px solid lightgray;background-color: lightgray;padding: 5px;border-radius: 7px;}

 .board_title_container{width: 100%;}
 	.board_location,.board_location>a{
 		color: #555;
 	}
   .board_location{
   display:flex;
   	height: 80px;padding-top: 20px;width: 1000px;line-height: 80px;
   }
   .prev_btnBtn{color: black;}
   
   }
  .here-title-box a {
        text-decoration: none;
        color: black;
        font-size: 15px;
        font-weight: bold;
    }

    .here-title-box .atitle:hover {
        color: gray;
    }

    .top-img {
        height: 20px;
        width: 20px;
        color: gray;
    }

    .here-title-box > a:hover {
        color: gray;
    }
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%;margin: 0 auto;padding-top: 80px">
		<div class="page-title">
			게시글 수정
		</div>
	</div>
</div>
<form action="<c:url value='/board/update?po_num=${post.po_num}'/>" method="post"  enctype="multipart/form-data">
	<div class="post_list_container">
		<div class="post_list_box">
			<div class="board_location">
						<a href="<c:url value='/'/>" >
							<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/home-4-line.svg'/>">
					</a>
					<div style="margin: auto 16px;">
						<img class="top-img" alt="위치 이미지"
							src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
					</div>	
					<div style="padding-top: 1px;" class="here-title-box" >
						<a href="<c:url value='/board/all'/>" class="here-title"style="padding-top: 1px;text-decoration: none;
						color: black;font-size: 15px;font-weight: bold;"  onmouseover="this.style.color='gray'" 
  						 onmouseout="this.style.color='black'">
							게시판
						</a>
					</div>
					<div style="margin: auto 16px;" >
						<img class="top-img" alt="위치 이미지"
							src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
					</div>	
					<div style="padding-top: 1px;" class="here-title-box">
						<a  class="here-title" style="padding-top: 1px;text-decoration: none;
						color: black;font-size: 15px;font-weight: bold;"  onmouseover="this.style.color='gray'" 
 						  onmouseout="this.style.color='black'"
							href="<c:url value='/board/list?po_bo_num=${post.po_bo_num}'/>"> 게시글
						</a>
					</div> 
					<div style="margin: auto 16px;" >
						<img class="top-img" alt="위치 이미지"
							src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
					</div>	
					<div style="padding-top: 1px;"class="here-title-box">
						<a href="<c:url value="/board/detail?po_num=${post.po_num}"/>"style="padding-top: 1px;text-decoration: none;
						color: black;font-size: 15px;font-weight: bold;"  onmouseover="this.style.color='gray'" 
 						  onmouseout="this.style.color='black'" class="here-title">
							상세페이지
						</a>
					</div> 
					<div style="margin: auto 16px;" >
						<img class="top-img" alt="위치 이미지"
							src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
					</div>	
					<div style="padding-top: 1px;" class="here-title-box">
						<a  class="here-title atitle"style="padding-top: 1px;text-decoration: none;
						color: black;font-size: 15px;font-weight: bold;" >
							게시글 수정
						</a>
					</div> 
			</div>
			<div style="text-align: center;">
				<h1 style="color: #555">${post.po_bo_title}</h1>
			</div>
			<div class="post_insert_btn_box">
		    	<a href="<c:url value="/board/detail?po_num=${post.po_num}"/>" class="post_insert_btn">뒤로가기</a>
			</div>
			<div class="hr"></div>
			<div class="content_container">
				<input type="hidden" name="po_bo_num" value="${post.po_bo_num}"  >
				<div class="content-input">
					<label style="width: 5%;">제목</label>
					<input type="text" class="content-title" name="po_title" value="${post.po_title}" required="required"placeholder="제목을 입력하세요"> 
				</div>   	
				<div class="content-text" style="margin-top: 40px">
					<label style="width: 5%;">내용</label>
					<textarea class="content-content" name="po_content"  required="required"  
					style="max-height: 400px;">${post.po_content}</textarea>
				</div>
			
			  </div> 
		 		<div class="content-file">
					<label style="margin: 0 20px 0 58px;">첨부파일</label>
					<input type="file" name="file" multiple="multiple" id="fileInput">
				</div>   
				<div class="fileList_box">
					<div class="form-group box-attachment">
						 <ul id="fileList">
							 <c:forEach items="${fileList}" var="file" >	
					 			<li>
					 				<span>${file.fi_ori_name }</span>
					 				<a href="javascript:void(0);" class="btn-del" data-num="${file.fi_num}">&times;</a>
					 			</li>
						 	</c:forEach>
						 </ul>
					</div>	 
				</div>	
				<div class="insert-btn-box"style="text-align: center;margin-top: 30px;">	
					<button class="insert-btn">수정하기</button>
				</div>
			</div>	
		</div>
</form>	
<!-- 썸머노트 -->
<script type="text/javascript">
   $('[name=po_content]').summernote({
      placeholder: '내용을 입력하세요',
      tabsize: 2,
      maxHeight: 600,
      minHeight: 600,
      width:1200
   });
</script>
<script type="text/javascript">
$(document).ready(function() {
    $('#fileInput').on('change', function(event) {
        let fileList = event.target.files;
        let $listContainer = $('#fileList');
        

        for (let file of fileList) {
            let $listItem = $('<li>').append(
                $('<span>').text(file.name), 
                $('<a>').addClass('btn-del').attr('href', 'javascript:void(0);').attr('data-num', file.fi_num).html('&times;') // 삭제 버튼
            );
            $listContainer.append($listItem);
        }
    });
});
$('#fileList').on('click', '.btn-del', function() {
	let num = $(this).data("num");
	$(this).parents(".box-attachment").prepend(`<input type="hidden" name="delNums" value="\${num}">`)
	$(this).parents(".box-attachment").append(`<input type="hidden" class="form-control" name="file">`);	
	  $(this).closest('li').remove();
});
 
</script>
 </body>
</html>