<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="view/css/shopping_payment.css"
	type="text/css">
<link rel="stylesheet" href="view/css/shopping_address.css"
	type="text/css">
<title>결제하기 | COFFEESAZO</title>
</head>
<body>
	<main>
		<div class="main-logo">
			<h1>결제하기</h1>
		</div>

		<form action="buyitnow" method="POST" name="form_buy" onsubmit="return checkForm(this)">
			<div id="main-container">
				<div class="top-logo">
					<h2>
						구매 정보
						</h1>
				</div>
				
					<div class="info-buy-container">
						<div class="info-buy">
							<img src="view/img/${lastElement.productImage}" alt="">
							<div class="info-buy-text">
								<strong>${lastElement.productName}</br></strong> <input type="hidden"
									value="${lastElement.productIndex }" name="index"> <input
									type="hidden" value="${lastElement.orderCount }" name="count">
								<p>
									<strong><fmt:formatNumber value="${lastElement.productPrice}" pattern="###,###,###원" /></strong>x
									${lastElement.orderCount}개
								</p>
								<u>무료배송</u>
								<p>
									<strong></strong>구매가격 &nbsp;</strong><strong><fmt:formatNumber value="${lastElement.productPrice * lastElement.orderCount }" pattern="###,###,###원" /></strong>
								</p>
							</div>
						</div>
					</div>
				
				<div class="info-user-container">
					<div class="info-user">
						<div class="top-user">
							<div class="form-container">
								<h2>주문자 정보</h2>
								<div class="form-userinfo">
									<label for="name">이름</label> <input class="name" id="name"
										type="text" style="margin-left: 46px;" name="name" value="${om.memberName }" readonly="readonly"> <br>
									<label for="E-mail">이메일</label> <input class="E-mail"
										id="E-mail" type="email" style="margin-left: 27px;"
										name="e-mail" value="${om.memberEmail }" readonly="readonly"> <br> <label for="number">연락처</label>
									<input class="number" id="number" type="text"
										style="margin-left: 27px;" name="number" value="${om.memberPhone }" readonly="readonly">
								</div>
								<div class="form-container2">
									<h2>배송 정보</h2>
									<div class="form-address">
										<input type="text" id="sample6_postcode" placeholder="우편번호"
											maxlength="5" readonly="readonly" name="postcode">
										<button type="button" class="btn btn-secondary"
											id="postbutton" onclick="sample6_execDaumPostcode()">우편번호</button>
										<br> <input type="text" id="sample6_address"
											placeholder="주소" name="address" readonly><span id="guide"
											style="color: #999; display: none"></span><span class="warn-info" id="address-required" style="margin-left: 10px;"></span><br> <input
											type="text" id="sample6_detailAddress" placeholder="상세주소"
											style="width: 300px" name="address"> <input
											type="text" id="sample6_extraAddress" placeholder="참고항목"
											name="address" readonly> <br> <label for="">배송
											시 요청 사항 </label> <br> <input class="delivery-rq"
											id="delivery-rq" type="text" name="delivery-rq" placeholder="요청 사항 입력(선택사항)"> <br>
										<label for="">수령인</label> <br> <input
											class="recipient-rq" id="recipient-rq" type="text"
											name="recipient-rq" placeholder="수령인 이름 입력"><span class="warn-info" id="name-required" style="margin-left: 10px;"></span> <br> 
											<label for="">연락처</label>
										<br> <input class="number-rq" id="number-rq" type="text"
											name="number-rq" placeholder="수령인 전화번호 입력(- 제외)"><span class="warn-info" id="phonenumber-required" style="margin-left: 10px;"></span>
									</div>
								</div>
								<div class="form-container3">
									<h2>결제 방법 선택</h2>
									<br>
									<div class="payment-radio-container">
										<div class="card">
											<input type="radio" name="gener" 
												style="height: 20px; width: 20px; margin-right: 50px;"
												value="카드결제" onclick="getPayment(event)" /> <span class="up" style="font-size: 20px;">신용카드/체크카드</span>
										</div>
										<div class="money">
											<input type="radio" name="gener"
												style="height: 20px; width: 20px; margin-right: 50px;"
												value="무통장입금" onclick="getPayment(event)" /> <span class="up" style="font-size: 20px;">무통장입금</span>
										</div>
									</div>
								</div>
								<div class="form-container4">
									<h2>주문 정보 확인</h2>
									<div class="form-checkorder">
										<table class="checkorder-table1">

											<tr>
												<td>결제방법</td>
												<td><div id="payment-result">결제방법을 선택해주세요.</div></td>
											</tr>
											<tr>
												<td>배송비</td>
												<td>0원</td>
											</tr>



										</table>
										<table class="checkorder-table2">
											<tr>
												<td>최종 결제 금액</td>
												<td><fmt:formatNumber value="${allresult}" pattern="###,###,###원" /></td>

											</tr>

										</table>
										<input type="hidden" value="${allresult}" name="allresult">




									</div>
								</div>
		
		<div class="form-container5">
			<h2>이용 약관</h2>
			<div class="tos1">
				<input type="checkbox" style="width: 25; height: 15px;" name="admit">
				<p style="display: inline-block;">개인정보 판매자 제공에 동의합니다.</p>
				<div class="TermsOfService1"
					style="display: inline-block; margin-left: 38px;">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-toggle="modal" data-bs-target="#exampleModal"
						id="servicebtn1">이용약관</button>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">이용약관</h5>

								</div>
								<div class="modal-body1">
									<!-- 약관내용 -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tos2">
				<input type="checkbox" style="width: 25; height: 15px;" name="admit">
				<p style="display: inline-block;">구매자의 정보수집 및 이용에 동의합니다.</p>
				<div class="TermsOfService2" style="display: inline-block;">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-toggle="modal" data-bs-target="#exampleModal"
						id="servicebtn1">이용약관</button>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">이용약관</h5>

								</div>
								<div class="modal-body1">
									<!-- 약관내용 -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="form-container6">
			<div class="form-submit">
				<button type="submit" class="btn btn-outline-success">구매하기</button>
			</div>

		</div>





		</div>

		</div>
		</div>


		</div>
		</div>
		</form>
	</main>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="view/js/addressApi.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="view/js/shopping_payment.js"></script>

</body>
</html>