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

		<form action="allbuy_submit" method="POST" name="form_buy" onsubmit="return checkForm(this)">
			<div id="main-container">
				<div class="top-logo">
					<h2>
						구매 정보
						</h1>
				</div>
				<c:forEach items="${pList}" var="buylist">
					<div class="info-buy-container">
						<div class="info-buy">
							<img src="view/img/${buylist.productImage}" alt="">
							<div class="info-buy-text">
								<strong>${buylist.productName}</br></strong> <input type="hidden"
									value="${buylist.productIndex }" name="index"> <input
									type="hidden" value="${buylist.orderCount }" name="count">
								<p>
									<strong><fmt:formatNumber value="${buylist.productPrice}" pattern="###,###,###원" /></strong>x
									${buylist.orderCount}개
								</p>
								<u>무료배송</u>
								<p>
									<strong></strong>구매가격 &nbsp;</strong><strong><fmt:formatNumber value="${buylist.productPrice * buylist.orderCount }" pattern="###,###,###원" /></strong>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
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
										name="e-mail" value="${om.memberEmail}" readonly="readonly"> <br> <label for="number">연락처</label>
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
												id = "check" style="height: 20px; width: 20px; margin-right: 50px;"
												value="카드결제" onclick="getPayment(event)"/> <span class="up" style="font-size: 20px;">신용카드/체크카드</span>
										</div>
										<div class="money">
											<input type="radio" name="gener"
												id = "check" style="height: 20px; width: 20px; margin-right: 50px;"
												value="무통장입금" onclick="getPayment(event)"/> <span class="up" style="font-size: 20px;">무통장입금</span>
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
									<p class="ls2 lh6 bs5 ts4"><em class="emphasis"><(주)CoffeeSajo>('http://coffeesajo/.index.jsp'이하  'CoffeeSajo')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p><p class="ls2 lh6 bs5 ts4"><em class="emphasis"><(주)CoffeeSajo>('CoffeeSajo')</em> 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p><p class="ls2">○ 본 방침은부터 <em class="emphasis">2020</em>년 <em class="emphasis">1</em>월 <em class="emphasis">12</em>일부터 시행됩니다.</p></br><p class='lh6 bs4'><strong>1. 개인정보의 처리 목적 <em class="emphasis"><(주)CoffeeSajo>('http://coffeesajo/.index.jsp'이하  'CoffeeSajo')</em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</strong></p><ul class="list_indent2 mgt10"><p class="ls2">가. 홈페이지 회원가입 및 관리</p><p class="ls2">회원자격 유지·관리 등을 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">나. 재화 또는 서비스 제공</p><p class="ls2">물품배송, 서비스 제공, 청구서 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 연령인증, 요금결제·정산, 채권추심 등을 목적으로 개인정보를 처리합니다.</p></br></ul><p class='sub_p mgt30'><strong>2. 개인정보 파일 현황</br>('http://coffeesajo/.index.jsp'이하  'CoffeeSajo')가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.</strong></p><ul class='list_indent2 mgt10'><li class='tt'><b>1. 개인정보 파일명 : 정보</b></li><li>개인정보 항목 : 이메일, 휴대전화번호, 자택주소, 자택전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름</li><li>수집방법 : 홈페이지</li><li>보유근거 : 정보</li><li>보유기간 : 10년</li><li>관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</li></ul><p class='sub_p mgt10'>※ 기타('http://coffeesajo/.index.jsp'이하  'CoffeeSajo')의 개인정보파일 등록사항 공개는 개인정보보호위원회 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.</p></br></br><p class='lh6 bs4'><strong>3. 개인정보의 처리 및 보유 기간</strong></br></br>① <em class="emphasis"><(주)CoffeeSajo>('CoffeeSajo')</em>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.</br></br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1.<제화 또는 서비스 제공></li><li class='tt'><제화 또는 서비스 제공>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<5년>까지 위 이용목적을 위하여 보유.이용됩니다.</li><li>보유근거 : 판매자제공</li><li>관련법령 : 계약 또는 청약철회 등에 관한 기록 : 5년</li><li>예외사유 : </li></ul></br></br><p class='lh6 bs4'><strong>4. 개인정보의 제3자 제공에 관한 사항</strong></br></br> ① <em class="emphasis"><(주)CoffeeSajo>('http://coffeesajo/.index.jsp'이하 'CoffeeSajo')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p><p class="sub_p mgt10">②  <span class="colorLightBlue"><(주)CoffeeSajo>('http://coffeesajo/.index.jsp')</span>은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</p><ul class="list_indent2 mgt10"><li class="tt">1. <회사></li><li>개인정보를 제공받는 자 : 회사</li><li>제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 자택전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름</li><li>제공받는 자의 보유.이용기간: 5년</li></ul></br></br><p class='lh6 bs4'><strong>5. 개인정보처리 위탁</strong></br></br> ① <em class="emphasis"><(주)CoffeeSajo>('CoffeeSajo')</em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1. <></li><li>위탁받는 자 (수탁자) : </li><li>위탁하는 업무의 내용 : </li><li>위탁기간 : </li></ul><p class='sub_p mgt10'>②  <span class='colorLightBlue'><(주)CoffeeSajo>('http://coffeesajo/.index.jsp'이하 'CoffeeSajo')</span>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p><p class='sub_p mgt10'>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
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
									<p class='sub_p mgt10'><span class='colorLightBlue'>1. 개인정보의 처리 목적</span> <(주)CoffeeSajo>(‘http://coffeesajo/.index.jsp’이하 ‘CoffeeSajo’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.</p><p class='sub_p'> - 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등</p><p class='sub_p mgt30'><strong>2. 개인정보의 처리 및 보유 기간</strong></p><p class='sub_p mgt10'>① <(주)CoffeeSajo>(‘http://coffeesajo/.index.jsp’이하 ‘CoffeeSajo’) 은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.</p><p class='sub_p mgt10'>② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.</p><p class='sub_p'>☞ 아래 예시를 참고하여 개인정보 처리업무와  개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.</p><p class='sub_p'>(예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지</p><p class='sub_p'>- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년 </p></br></br><p class='lh6 bs4'><strong>3. 개인정보의 제3자 제공에 관한 사항</strong></br></br> ① <em class="emphasis"><(주)CoffeeSajo>('http://coffeesajo/.index.jsp'이하 'CoffeeSajo')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p><p class="sub_p mgt10">②  <span class="colorLightBlue"><(주)CoffeeSajo>('http://coffeesajo/.index.jsp')</span>은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</p><ul class="list_indent2 mgt10"><li class="tt">1. <></li><li>개인정보를 제공받는 자 : </li><li>제공받는 자의 개인정보 이용목적 : </li><li>제공받는 자의 보유.이용기간: </li></ul></br></br><p class='lh6 bs4'><strong>4. 개인정보처리 위탁</strong></br></br> ① <em class="emphasis"><(주)CoffeeSajo>('CoffeeSajo')</em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1. <></li><li>위탁받는 자 (수탁자) : </li><li>위탁하는 업무의 내용 : </li><li>위탁기간 : </li></ul><p class='sub_p mgt10'>②  <span class='colorLightBlue'><(주)CoffeeSajo>('http://coffeesajo/.index.jsp'이하 'CoffeeSajo')</span>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p><p class='sub_p mgt10'>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p><br/><br/><p class="lh6 bs4"><strong>5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</strong></p><p class="ls2">① 정보주체는 (주)CoffeeSajo(‘http://coffeesajo/.index.jsp’이하 ‘CoffeeSajo) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</p><p class='sub_p'>1. 개인정보 열람요구</p><p class='sub_p'> 2. 오류 등이 있을 경우 정정 요구</p><p class='sub_p'> 3. 삭제요구</p><p class='sub_p'> 4. 처리정지 요구</p>
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