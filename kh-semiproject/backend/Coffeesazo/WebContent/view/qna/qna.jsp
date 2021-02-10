<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 | COFFEESAZO</title>
<!-- 부트스트랩 불러오기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="index copy.css" type="text/css">
<!--favicon-->
<link rel="shortcut icon"
	href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="view/css/qna.css" type="text/css">
<style>
.find {
	float: right;
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
		<div id="container">
			<div id="contents">
				<a href="notice"><h1>고객센터</h1></a>
				<div class="title-area">
					<div class="boardnavi">
						<a href="notice" class="navi01"> <span>공지사항</span>
						</a> <a href="qna" class="navi02"> <strong>1:1 문의</strong>
						</a>
					</div>
				</div>
				<form name='frm_qna' method='post' id='frm_qna'>
					<!-- 	<input type='button' value='입력' id='btnInsert' /> -->
					<div class="find">
						<input type='text' name='findStr' class='findStr' value='${param.findStr}' placeholder="제목으로 검색"/> 
						<input type='button' value='검색' id='btnFind' onclick="view()" /> 
						<input type='hidden' name='nowPage' value='${(empty param.nowPage)? 1 : param.nowPage }' />
					</div>
				</form>
				<div class="base-table">
					<table border="1" summary>
						<caption>게시판 목록</caption>
						<thead class="element-box">
							<tr>
								<th scope="col">순번</th>
								<th scope="col" class="displaynone">카테고리</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col" class>작성일</th>
							</tr>
						</thead>

						<tbody class="index-box">
							<c:forEach items="${qnaList }" var="qnavo">
								<tr style="background-color: #FFFFFF; color: black;">
									<td>${qnavo.qnaIndex }</td>
									<td class="displaynone"></td>
									<td class="subject"><a href="qnaview?id=${qnavo.qnaIndex}">${qnavo.qnaTitle }</a></td>
									<!--인덱스 값 넘기기  -->
									<td>${qnavo.fkMemberId }</td>
									<td class="txtLess ">${qnavo.qnaDate }</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
				
					<div class='btns'>
						<c:if test="${page.startPage>1 }">
							<input type='button' value='맨첨' id='btnFirst' onclick='goPage(1)' />
							<input type='button' value='이전' id='btnPrev' onclick='goPage(${page.startPage-1})' />
						</c:if>
	
						<c:forEach var="i" begin='${page.startPage }' end='${page.endPage }'>
							<input type='button' value='${i}' ${(param.nowPage == i)? 'disabled' : '' } onclick='goPage(${i})' />
						</c:forEach>
	
						<c:if test="${page.endPage<page.totalPage }">
							<input type='button' value='다음' id='btnNext' onclick='goPage(${page.endPage+1})' />
							<input type='button' value='맨끝' id='btnLast' onclick='goPage(${page.totalPage})' />
						</c:if>
					<div class="bottom-button">
						<a href="#" class="bottom-button" onclick="bottom_button();">등록하기</a>
					</div>
					</div>
				</div>
			</div>
		
	</main>
	<!-- 부트스트랩 자바스크립트 추가 -->
	<script src="./js/bootstrap.min.js"></script>
	<script>
	function bottom_button() {
		var id = '<%=(String) session.getAttribute("id")%>';
		
		if(id == "null") {
			alert("로그인이 필요한 항목입니다."); 
			location.href = "index.jsp?inc=view/signin/login.jsp";
		} else {
			location.href = "index.jsp?inc=view/qna/qna_write.jsp";
		}
	 }

	function registration_button() {
		var id = '<%=(String) session.getAttribute("id")%>';
		var idvalue = document.getElementById("test").value;
		
		console.log(id);
		console.log(idvalue);
		
		if(id != idvalue){
			alert("접근 권한이 없습니다....");
		}
	}
	
	function goPage(page) { // 파라미터로 page를 받음
		var frm = document.frm_qna;
		frm.action = "qna";
		frm.nowPage.value = page;
		frm.submit();
	}
	
	function view() {
		var frm = document.frm_qna;
		frm.action = "qna";
		frm.nowPage.value = 1; 
		frm.submit();
	}
	</script>
</body>
</html>