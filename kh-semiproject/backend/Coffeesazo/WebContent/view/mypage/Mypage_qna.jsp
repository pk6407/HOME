<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="view/css/Mypage_qna.css" type="text/css">
<link rel="stylesheet" href="view/css/bootstrap.min.css">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
</head>

<body>

<main>
	
		<div class="size-controll">
			<div class="user_info">
				<div class="mypage_title">
					<h1>마이페이지</h1>
				</div>
				<div class="user_info_form">
					<img
						src="https://raw.githubusercontent.com/St4rFi5h/ETC/main/sourcce/article-user-blank.jpg"
						alt="blank_user">  ${memberName}(${id })님
				</div>
			</div>

			<!--------------전체 버튼묶음-------------->
			<div class="button">
				<ul>
					<a class="card_small" href="OrderListSelect">
						<h3 class="softblack">주문내역</h3>
						<p class="card_text">
							최근 주문내역을 </br>확인하실 수 있습니다.
						</p>

					</a>
				</ul>
		        <ul>
                    <a class="card_small" id="mypage-edit" href="mypage_edit">
                        <h3>회원정보수정</h3>
                        <p class="card_text">나의 정보를 </br>변경하실 수 있습니다.</p>

                    </a>
                </ul>
					<ul>
						<a class="card_small" href="MyQnaList">
							<h3 class="softblack">나의문의</h3>
							<p class="card_text">
								나의1:1문의를 </br>확인하실 수 있습니다.
							</p>

						</a>
					</ul>
			</div>
			<div class="edit_title">
				<h1>나의문의</h1>
			</div>
			<form method="POST" name="form1" id="form1">
				<div id="find-zone" style="float: right; margin-bottom: 20px;">
					<input type="hidden" name="findStr" id="findStr" value="${param.findStr }" placeholder="제목으로 검색" />
					<input type="hidden" id="btnFind" value="검색" onclick="Find()" />
					<input type="hidden" name="nowPage" value="${empty param.nowPage ? 1 : param.nowPage }" />
				</div>
				<!---------------------테이블 시작 --------------------->
		<c:if test="${not empty qnaList }">
				<div class="main_table">
					<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>답변여부</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>

							<!--------------------- 글 시작 --------------------->
							
								<tbody>
								
								<c:set var="no" value="${page.startNo }"/>
									<c:forEach items="${qnaList}" var="MyQna">
										<tr>
					
											<td><input type="hidden" name="qnaIndex" id="qnaIndex" value="${no}"/>${MyQna.qnaIndex }</td>
										<c:if test="${MyQna.qnaCheck == 0  }">
											<td>답변안됨</td>
											</c:if>
										<c:if test="${MyQna.qnaCheck == 1  }">
											<td>답변됨</td>
											</c:if>
											<td ><a
									href="qnaview?id=${MyQna.qnaIndex}" >${MyQna.qnaTitle }</a></td>
											<td>${id }</td>
											<td>${MyQna.writeDate }</td>
										</tr>
									</c:forEach>
								</tbody>
				
					</table>
				</div>
				</c:if>
				 <c:if test="${empty qnaList }">
               		<div style="text-align: center; font-weight: 500; font-size: 2rem;">문의내역이 없습니다.<br><br>   </div>
            
            	</c:if>
				<!--------------------- 글쓰기버튼 --------------------->
				<div class="csl-button">
					<a href="/Coffeesazo/index.jsp?inc=view/qna/qna_write.jsp">
						<button type="button" class="btn btn-outline-secondary" >글쓰기</button>
					</a>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<div class='btns'>
					<c:if test="${page.startPage > 1 }">
						<input type='button' class="btn btn-outline-secondary"  value="처음" id="btnFirst" onclick="goPage(1)" />
						<input type="button"  class="btn btn-outline-secondary" value="이전" id="btnPrev" onclick="goPage(${page.startPage - 1})"/>
					</c:if>
					
					
					<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
						<input type='button'class="btn btn-outline-secondary"  value='${i }' ${(param.nowPage == i) ? 'disabled' : '' } onclick='goPage(${i})' />
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPage }">
						<input type='button'class="btn btn-outline-secondary"  value='다음' id="btnNext" onclick="goPage(${page.endPage + 1})" />
						<input type="button"class="btn btn-outline-secondary" value="맨끝" id="btnLast" onclick="goPage(${page.totalPage})"/> 
					</c:if>
							</div>
						</ul>
					</nav>


				</div>


			</form>

		</div>
		
	</main>

	<script>
	
	

	
		function goPage(page) {
			var frm = document.form1;
			frm.action = "MyQnaList";
			frm.nowPage.value = page;
			frm.submit();
			
		}
	
		function Find() {
			var frm = document.form1;
			frm.action = "MyQnaList";
			frm.nowPage.value = 1;
			frm.submit();
		}
		
	</script>

</body>
</html>