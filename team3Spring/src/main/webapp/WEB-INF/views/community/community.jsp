<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://fastly.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="http://fastly.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<script src="http://fastly.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<title>커뮤니티 메인</title>
<style type="text/css">
.board-post-box{
	padding: 50px;
	text-align: center;
}
.board-box{
	width: 40%;
	height: 400px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	margin-right: 50px;
	padding: 30px;
	text-align: center;
}
.post-box {
    width: 40%;
    height: 400px;
    border: 1px solid gray;
    border-radius: 20px;
    display: inline-block;
    padding: 30px;
    text-align: center;
    vertical-align: top; /* 상단 정렬을 유지합니다. */
    position: relative; /* 상대적 위치 설정 */
}

.box-comment-pagination {
    left: 50%; /* 가운데 정렬을 위해 왼쪽 위치를 50%로 설정 */
    margin : auto;
}

.box-comment-pagination2 {
    left: 50%; /* 가운데 정렬을 위해 왼쪽 위치를 50%로 설정 */
    margin : auto;
}
.box-comment-pagination2 >ul{
	margin-top: 20px;
}

.box-comment-pagination3 {
    left: 50%; /* 가운데 정렬을 위해 왼쪽 위치를 50%로 설정 */
    margin : auto;
}
.box-comment-pagination3 >ul{
	margin-top: 20px;
}

.delete-box{
	margin-top: 20px;
}
.delete-box > a {
    padding-top: 20px;
}
tr th,
tr td{
text-align: center;
}

.postNo
</style>
</head>
<body>

<div class="board-post-box">
	<div class="board-box">
		<h5>게시판을 선택해 주세요</h5>
		<div class="input-group mb-3">
			<select name="type" class="form-control">
				<c:forEach items="${list}" var="list">
					<option value="${list.bo_num}">${list.bo_title }</option>
				</c:forEach>
			</select>
		</div>
		<a class="btn add-btn" href="<c:url value="/community/insert"/>">게시판 등록</a>
		<a class="btn update-btn">게시판 수정</a>
		<a class="btn delete-btn">게시판 삭제</a>
	</div>
		
	<div class="post-box">
		<h5>신고를 1회 이상 받은 게시글/댓글입니다.</h5>
		<div class="input-group mb-3">
			<table class="table table-striped">
				<thead class="postthead">
					
				</thead>
				<tbody class="posttbody">
					
				</tbody>
			</table>
			<div class="box-comment-pagination">
				<ul class="pagination justify-content-center">
					
				</ul>
			</div>	
		</div>
	</div>
</div>

<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 1500px; margin: 0 auto"></div>

<div class="board-post-box">
	<div class="board-box">
		<div class="input-group mb-3">
			<select name="type2" class="form-control">
				<c:forEach items="${list}" var="list">
					<option value="${list.bo_num}">${list.bo_title }</option>
				</c:forEach>
			</select>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody class="postNo">
				
				</tbody>
			</table>
				<div class="box-comment-pagination2">
					<ul class="pagination justify-content-center">
	
					</ul>
				</div>
		</div>
	</div>
		
	<div class="post-box">
		<div class="input-group mb-3">
			<table class="table table-striped">
				<thead class="postnothead">
					
				</thead>
				<tbody class="postnotbody">
					
				</tbody>
			</table>
			<div class="box-comment-pagination3">
				<ul class="pagination justify-content-center">
					
				</ul>
			</div>	
		</div>
	</div>
</div>

<script type="text/javascript">

/* 컨트롤러에게 현재 선택한 보드 번화가 뭔지 알려주기 위한 메서드 */
$('.update-btn').click(function(){
    let bo_num = $("[name=type]").val();
    let url = '<c:url value="/community/update"/>' + '?bo_num=' + bo_num;
    location.href = url;
});

/* 컨트롤러에게 현재 선택한 보드 번화가 뭔지 알려주기 위한 메서드 게시판 삭제*/
$('.delete-btn').click(function(){
    let bo_num = $("[name=type]").val();
    if(bo_num == null){
    	alert("게시판을 선택해주세요");
    }
    let url = '<c:url value="/community/delete"/>' + '?bo_num=' + bo_num;
    location.href = url;
});



function displayPostNoDeclaration(postList){
		let str = ``;
		for(let tmp of postList){
			str+=
				`
					<tr class="tr">
						<td>
							<a href="#" class="nocomment-link po_num" data-po-num="\${tmp.po_num}">\${tmp.po_num}</a>
						</td>
						<td>\${tmp.po_title}</td>
						<td>\${tmp.sitemanagement.site_id}</td>
						<td>\${tmp.changeDate}</td>
					</tr>
				`
		}
		$('.postNo').html(str);	
}


//지우지마시오!!!
let postpage = 1;//지우지 마시오!!!
let postnopage = 1;
let commentpage=1;//지우지 마시오!!!
let commentnopage=1;
//지우지마시오!!!

//게시글을 불러와서 페이지에 출력하는 함수
function displayPostAndPagination(){
	let bo_num = $("[name=type]").val();
	//ajax를 이용해서 서버에 현재 댓글 페이지 정보를 보내고, 
	//서버에서 보낸 댓글 리스트와 페이지네이션 정보를 받아와서 화면에 출력
	$.ajax({
		url : '<c:url value="/post"/>',
		method : 'get',
		data : {"bo_num" : bo_num,
			"page" : postpage},
		success : function(data){
			displayPost(data.list);
			displayPostPagination(data.pm);
		}
	});
}

//게시글을 불러와서 페이지에 출력하는 함수
function displayPostNoAndPagination(){
	let bo_num = $("[name=type2]").val();
	//ajax를 이용해서 서버에 현재 댓글 페이지 정보를 보내고, 
	//서버에서 보낸 댓글 리스트와 페이지네이션 정보를 받아와서 화면에 출력
	$.ajax({
		url : '<c:url value="/post/declaration"/>',
		method : 'get',
		data : {"bo_num" : bo_num,
			"page" : postnopage},
		success : function(data){
			displayPostNoDeclaration(data.list);
			displayPostNoPagination(data.pm);
		}
	});
}

//신고된 댓글을 불러와서 페이지에 출력하는 함수
function displayCommentAndPagination(po_num){

	$.ajax({
		url : '<c:url value="/comment"/>',
		method : 'post',
		data : {"po_num" : po_num,
			"page" : commentpage},
		success : function(data){
			displayComment(data.list);
			displayCommentPagination(data.pm, po_num);
		}
	});
}

//신고 안된댓글을 불러와서 페이지에 출력하는 함수
function displayCommentNoAndPagination(po_num){
	$.ajax({
		url : '<c:url value="/commentno"/>',
		method : 'post',
		data : {"po_num" : po_num,
			"page" : commentnopage},
		success : function(data){
			displayCommentNo(data.list);
			displayCommentNoPagination(data.pm, po_num);
		}
	});
}

/* 게시글 삭제 메서드 */
$(document).on('click', '.post-delete-btn', function(){
    let po_num = prompt("삭제하고 싶은 게시글 번호를 입력하세요:");
    let bo_num = $("[name=type]").val();
    let queryParams = "po_num=" + po_num + "&po_bo_num=" + bo_num;
    if(po_num == null){
        return;
    } else {
        let url = '<c:url value="/post/delete"/>' + '?' + queryParams;    
        location.href = url;
    } 
});

/* 댓글 삭제 메서드 */
$(document).on('click', '.comment-delete-btn', function(){
    let co_num = prompt("삭제하고 싶은 댓글의 번호를 입력하세요:");
    let queryParams = "co_num=" + co_num;
    if(co_num == null){
        return;
    } else {
        let url = '<c:url value="/comment/delete"/>' + '?' + queryParams;    
        location.href = url;
    } 
});


//게시글 링크 클릭 시 신고 된 댓글 조회 함수 호출
$(document).on("click", ".comment-link", function(e){
    e.preventDefault(); // 링크 기본 동작 중단
    let po_num = $(this).data("po-num");
    displayCommentAndPagination(po_num);
});

//게시글 링크 클릭 시 신고 안된댓글 조회 함수 호출
$(document).on("click", ".nocomment-link", function(e){
    e.preventDefault(); // 링크 기본 동작 중단
    let po_num = $(this).data("po-num");
    displayCommentNoAndPagination(po_num);
});

function displayComment(CommentList){
	/* 게시판이 바뀔떄마다 그 게시판에 맞는 게시글을 가지고 옴 */
		let str = ``;
		let str2 = 
			`
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>신고 횟수</th>
					<th>버튼</th>
				</tr>
			`;
		$('.postthead').html(str2);
		for(let tmp of CommentList){
			str+=
				`
				<tr class="tr">
					<td class="co_num">\${tmp.co_num}</td>
					<td>\${tmp.co_content}</td>
					<td>\${tmp.sitemanagement.site_id}</td>
					<td>\${tmp.co_report_count}</td>
					<td><a class="btn co-del-btn">삭제</a></td>
				</tr>
				`
		}
		$('.posttbody').html(str);	
		$('.delete-box').empty(); // 기존 내용을 지우고 새로운 내용을 추가합니다.
		$('.delete-box').append('<a class="btn comment-delete-btn">댓글 삭제</a>');
}

$(document).on("click", ".co-del-btn", function(){

	let co_num = $(this).parents(".tr").find(".co_num").text();
	location.href = '<c:url value="/report/comment/delete?co_num="/>' + co_num;
})

function displayCommentNo(CommentList){
	/* 게시판이 바뀔떄마다 그 게시판에 맞는 게시글을 가지고 옴 */
		let str = ``;
		let str2 = 
			`
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>신고 횟수</th>
				</tr>
			`;
		$('.postnothead').html(str2);
		for(let tmp of CommentList){
			str+=
				`
				<tr>
					<td>\${tmp.co_num}</td>
					<td>\${tmp.co_content}</td>
					<td>\${tmp.sitemanagement.site_id}</td>
					<td>\${tmp.co_report_count}</td>
				</tr>
				`
		}
		$('.postnotbody').html(str);	
}

function displayPost(postList){
	/* 신고 받은 게시판이 바뀔떄마다 그 게시판에 맞는 게시글을 가지고 옴 */
		let str = ``;
		let str2 = 
			`
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>신고 횟수</th>
					<th>버튼</th>
				</tr>
			`;
		$('.postthead').html(str2);
		for(let tmp of postList){
			str+=
				`
				<tr class="tr">
					<td><a href="#" class="comment-link po_num" data-po-num="\${tmp.po_num}">\${tmp.po_num}</a	></td>
					<td>\${tmp.po_title}</td>
					<td>\${tmp.sitemanagement.site_id}</td>
					<td>\${tmp.po_report_count}</td>
					<td><a class="btn po-del-btn">삭제</a></td>
				</tr>
				`
		}
		$('.posttbody').html(str);	
		$('.delete-box').empty(); // 기존 내용을 지우고 새로운 내용을 추가합니다.
		$('.delete-box').append('<a class="btn post-delete-btn">게시글 삭제</a>');
}

$(document).on("click", ".po-del-btn", function(){
	let po_num = $(this).parents(".tr").find(".po_num").data("po-num");
	location.href = '<c:url value="/report/post/delete?po_num="/>'+po_num
	
})


//신고 받은 페이지네이션이 주어지면 게시글 페이지네이션을 화면에 출력하는 함수
function displayPostPagination(pm){
	let str = '';
	//이전 버튼 활성화
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link post-page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
		</li>`;
	}
	
	for(i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? "active" : "";
		str += 
		`<li class="page-item \${active}">
			<a class="page-link post-page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>`
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link post-page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
		</li>`;
	}
	$(".box-comment-pagination>ul").html(str);
}

//신고 받지 않은 페이지네이션이 주어지면 게시글 페이지네이션을 화면에 출력하는 함수
function displayPostNoPagination(pm){
	let str = '';
	//이전 버튼 활성화
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link post-no-page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
		</li>`;
	}
	
	for(i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? "active" : "";
		str += 
		`<li class="page-item \${active}">
			<a class="page-link post-no-page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>`
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link post-no-page-link asd" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
		</li>`;
	}
	$(".box-comment-pagination2>ul").html(str);
}

//신고 받은 페이지네이션이 주어지면 댓글 페이지네이션을 화면에 출력하는 함수
function displayCommentPagination(pm, po_num){
	let str = '';
	//이전 버튼 활성화
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link comment-page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
		</li>`;
	}
	
	for(i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? "active" : "";
		str += 
		`<li class="page-item \${active}">
			<a class="page-link comment-page-link" href="javascript:void(0);" data-page="\${i}" data-po-num="\${po_num}">\${i}</a>
		</li>`
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link comment-page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
		</li>`;
	}
	$(".box-comment-pagination>ul").html(str);
}

function displayCommentNoPagination(pm, po_num){
	let str = '';
	//이전 버튼 활성화
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link comment-comment-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
		</li>`;
	}
	
	for(i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? "active" : "";
		str += 
		`<li class="page-item \${active}">
			<a class="page-link comment-comment-link" href="javascript:void(0);" data-page="\${i}" data-po-num="\${po_num}">\${i}</a>
		</li>`
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link comment-comment-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
		</li>`;
	}
	$(".box-comment-pagination3>ul").html(str);
}

$('[name=type]').click(function(){
	commentpage = 1;
	postpage = 1;
	displayPostAndPagination();
})

$("[name=type2]").click(function(){
	postnopage=1
	commentnopage=1
	displayPostNoAndPagination();
})

//신고받은 게시글 페이지네이션 클릭 이벤트
$(document).on("click",".box-comment-pagination .post-page-link", function(){
	postpage = $(this).data("page");
	displayPostAndPagination(postpage);
});

//신고 받지 않은 게시글 페이지네이션 클릭 이벤트
$(document).on("click",".box-comment-pagination2 .post-no-page-link", function(){
	postnopage = $(this).data("page");
	displayPostNoAndPagination(postnopage);
});

//신고 받은 댓글 페이지네이션 클릭 이벤트
$(document).on("click",".box-comment-pagination .comment-page-link", function(){
	commentpage = $(this).data("page");
	let po_num = $(this).data("po-num");
	displayCommentAndPagination(po_num, commentpage);
});

//신고 받지 않은 댓글 페이지네이션 클릭 이벤트
$(document).on("click",".box-comment-pagination3 .comment-comment-link", function(){
	commentnopage = $(this).data("page");
	let po_num = $(this).data("po-num");
	displayCommentNoAndPagination(po_num, commentnopage);
});

</script>
</body>
</html>