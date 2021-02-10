<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${List.productName}|COFFEESAZO</title>
<link href="view/css/coffemenu.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!--favicon-->
<link rel="shortcut icon"
	href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">

</head>

<body>
	<main>
		<div id="menu-container">
			<form action="cartaddone" var="orderdetail">


				<div class="menu1">
					<div class="menu-toplogo">
						<h1>
							<a href="index.jsp?inc=view/shopping/product/whole_bean.jsp">${ProductDeatil.fkCategoryIndex}</a>
						</h1>
					</div>
					<div class="menu-toptag">
						<a href="index.jsp?inc=view/shopping/product/whole_bean.jsp">${ProductDeatil.fkHashtagIndex}</a>
					</div>

					<div class="menu-productinfo">



						<img src="./view/img/${List.productImage}" alt="">
						<div class="menu-result">
							<form action="cartaddone" var="addcart">
								<div class="result-title">
									<h2>${infoArray[0]}</h2>
								</div>
								<div class="result-product">
									<h3>${List.productName}</h3>
									<p>
										<fmt:formatNumber value="${List.productPrice}"
											pattern="###,###,###원"></fmt:formatNumber>
									</p>
									<p>${infoArray[3]}</p>
									<p>${infoArray[4]}</p>
									<p>배송비: 무료</p>
									<p>배송 기간: 이틀 예정</p>
									<p>[영업일 기준 2일 이내 발송]</p>
									<label for="addcount">수량</label> <input type="button"
										id="count-plus" value="+" style="width: 30px;" /><input
										type="text" id="account" class="addcount" style="width: 50px;"
										value="1" name="product_count"><input type="button"
										id="count-minus" value="-" style="width: 30px;" /> <input
										type="hidden" value="${List.productIndex }"
										name="product_index" /> <input type="hidden"
										value="${List.productImage }" name="product_image" /> <input
										type="hidden" value="${List.productName }" name="product_name" />
									<input type="hidden" value="${List.productPrice }"
										name="product_price" />
								</div>
							</form>
							<div class="result-button">
								<%
                              	if(session.getAttribute("id") != null){
                              %>
								<!-- Button trigger modal -->
								<button type="submit" class="btn btn-outline-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									name="servlet" value="1">장바구니</button>

								<!-- Modal -->

								<button type="submit" class="btn btn-outline-secondary"
									name="servlet" value="2">바로구매</button>
							</div>

						</div>

					</div>
				</div>
			</form>
			<% } else { %>
			<button type="button" class="btn btn-outline-primary"
				data-bs-toggle="modal" data-bs-target="#exampleModal">장바구니
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"></h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">로그인을 해주세요</div>
						<div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" onclick= "location.href = 'index.jsp?inc=view/signin/login.jsp'">로그인하기</button>
                            </div>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-outline-secondary"
				data-bs-toggle="modal" data-bs-target="#exampleModal2">바로구매</button>
            <!-- Modal -->
			<div class="modal fade" id="exampleModal2" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"></h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">로그인을 해주세요</div>
						<div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" onclick= "location.href = 'index.jsp?inc=view/signin/login.jsp'">로그인하기</button>
                            </div>
					</div>
				</div>
			</div>
		</div>

		</form>
		</div>

		</div>
		<% } %>
		<div class="menu2">
			<img src="./view/img/${List.productImage}" alt="">
			<div class="detail-infomation">
				<div class="detail-top">
					<p class="p1">${List.productName}</p>
					<p class="p2">${textArray[0] }</p>

				</div>
				<div class="detail-mid">
					<c:forEach items="${textArray}" var="textArray">
						<p>${textArray}</p>
					</c:forEach>


				</div>

			</div>
		</div>

		</div>

	</main>
	<script>
var countPlus = document.getElementById("count-plus");
var countMinus = document.getElementById("count-minus");

var account = document.getElementById("account");
countPlus.onclick = function() {
	console.log(account)
	account.value = parseInt(account.value) + 1;
}

countMinus.onclick = function() {
	if(account.value > 1) {
		account.value = parseInt(account.value) - 1;	
	}
}

</script>
</body>

</html>