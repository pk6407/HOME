<%@page import="com.coffeesazo.notice.model.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 조회 | COFFEESAZO</title>
<!-- 부트스트랩 불러오기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="index copy.css" type="text/css">
<!--favicon-->
<link rel="shortcut icon"
	href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link href="./view/css/notice_detail.css" rel="stylesheet" type="text/css" />
<style>

#btnList {
	width: 100px;
	height: 40px;
	border: 0;
	padding: 5px;
	background-color: #4d2600;
	color: white;
}

#btnList:hover {
	background-color: burlywood;
	transition: 0.3s;
	cursor: pointer;
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
						</a> <a href="qna" class="navi02"> <span>1:1 문의</span>
						</a>
					</div>
				</div>
			<form name="form1" method="POST">
				<div class="base-table"> 
				<input type="hidden" id="noticeIndex" name="noticeIndex" value="${noticeIndex }"/> 
					<table border="1" summary>
						<caption>게시판 목록</caption>
						<tbody>					
							<tr>
								<th scope="row">제목</th>
								<td>${noticevo.noticeTitle }</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>관리자</td>
							</tr>
							<tr>
								<th scope="row">작성일</th>
								<td>${noticevo.noticeDate }</td>
							</tr>
					</table>

				</div>
				<tr class="view">
					<div class="detail">
						<div class="view-article">
							<p style="margin-top: 20px;">${noticevo.noticeText }</p>
							<c:if test="${noticevo.noticeFile != null }">
								<p style="text-align: center; margin-bottom: 70px;">
									<img src="${noticevo.noticeFile }" style="width: 400px; height: 600px; padding-top: 70px;">
								</p>
							</c:if>
						</div>
					</div>
				</tr>
			</form>
				<!-- <div class="bottom-table">
					<ul>
						<li class="prev"><strong>이전글</strong> 
						<a href="#">공지사항 어쩌꼬 저쩌꼬</a></li>
						<li class="next"><strong>다음글</strong> 
						<a href="#">공지사항 어쩌꼬 저쩌꼬</a></li>
					</ul>
				</div> -->
				<hr/>
				<div class="list-button" style="text-align: center; margin-top: 20px;">
					<a href="notice" id="btnList" class="btn-board">목록으로</a>
				</div>
			</div>
		</div>
	</main>
	<!-- 부트스트랩 자바스크립트 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>