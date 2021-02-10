<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | COFFEESAZO</title>
<!-- 부트스트랩 불러오기 -->
<link rel="stylesheet" href="./view/css/bootstrap.min.css">
<link rel="stylesheet" href="index copy.css" type="text/css">
<!--favicon-->
<link rel="shortcut icon"
	href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link href="./view/css/notice.css" rel="stylesheet" type="text/css" />
<style>
	.subject:hover {
		cursor: pointer;
		text-decoration: underline;
	}
	
	#btnFind {
		width: 50px;
		height: 30px;
		border: 0;
		background-color: #4d2600;
		color: white;
	}
	
	#btnFind:hover {
		background-color: burlywood;
		transition: 0.3s;
		cursor: pointer;
	
	}
	
	#findStr {
		width: 200px;
		height: 30px;
		border: 0;
		border-bottom: 2px solid #8B4F1D;
		padding-left: 8px;
	}
	
	#findStr:focus {
		outline: none;
	}
	
	
</style>

</head>
<body>
	<main>
		<input type='hidden' name='noticeIndex' />
		<div id="container">
			<div id="contents">
				<a href="notice"><h1>고객센터</h1></a>
				<div class="title-area">
					<div class="boardnavi">
						<a href="notice" class="navi01"> <strong>공지사항</strong>
						</a> <a href="qna" class="navi02"> <span>1:1
								문의</span>
						</a>
					</div>
				</div>
				<form method="POST" name="form1" id="form1" >
				<div id="find-zone" style="float: right; margin-bottom: 20px;">
				<input type="text" name="findStr" id="findStr" value="${param.findStr }" placeholder="제목으로 검색"/>
				<input type="button" id="btnFind" value="검색" onclick="Find()" />
				<input type="hidden" name="nowPage" value="${empty param.nowPage ? 1 : param.nowPage }"/>
				</div>
				<div class="base-table">
					<table border="1" summary>
						<caption>게시판 목록</caption>
						<thead class="element-box">
							<tr>
								<th scope="col">순번</th>
								<th scope="col" class="displaynone">카테고리</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th> 
							</tr>
						</thead>
						<tbody class="index-box">
						<c:set var="no" value="${page.startNo }"/>
							<c:forEach items="${noticeList}" var="noticevo">
							<tr style="background-color: #FFFFFF; color: black;">
								<td><input type="hidden" name="noticeIndex" id="noticeIndex" value="${no}"/>${noticevo.noticeIndex }</td>
								
								<td class="displaynone"></td>
								<!--<td class="subject"><a href="noticedetail">${noticevo.noticeTitle }</a></td>-->
								<td class="subject" onclick="view(${noticevo.noticeIndex});">${noticevo.noticeTitle }</td>
								<td>관리자</td>
								<td class="txtLess ">${noticevo.noticeDate }</td>
							</tr>
							</c:forEach>
						
						</tbody>
					</table>
				</div>
				<div class='btns'>
					<c:if test="${page.startPage > 1 }">
						<input type='button' value="처음" id="btnFirst" onclick="goPage(1)" />
						<input type="button" value="이전" id="btnPrev" onclick="goPage(${page.startPage - 1})"/>
					</c:if>
					
					
					<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
						<input type='button' value='${i }' ${(param.nowPage == i) ? 'disabled' : '' } onclick='goPage(${i})' />
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPage }">
						<input type='button' value='다음' id="btnNext" onclick="goPage(${page.endPage + 1})" />
						<input type="button" value="맨끝" id="btnLast" onclick="goPage(${page.totalPage})"/> 
					</c:if>
				</div>
				</form>
			</div>
		</div>
		
	</main>
	<!-- 부트스트랩 자바스크립트 추가 -->
	<script src = "js/notice.js"></script>
	<script>
	function view(noticeIndex){
		var frm = document.form1;
		var index = document.getElementById("noticeIndex");
		frm.action="noticedetail";
		index.value = noticeIndex;
		console.log(index.value);
		frm.submit();
	}
	function goPage(page) {
		var frm = document.form1;
		frm.action = "notice";
		frm.nowPage.value = page;
		frm.submit();
		
	}
	
	function Find() {
		var frm = document.form1;
		frm.action = "notice";
		frm.nowPage.value = 1;
		frm.submit();
	}
	</script>
	<script>
      
   </script>
</body>
</html>