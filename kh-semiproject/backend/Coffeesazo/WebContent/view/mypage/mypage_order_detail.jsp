<%@page import="com.coffeesazo.mypages.model.vo.OrderDetailListVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문상세보기 |  COFFEESAZO</title>
    <!--favicon-->
	<link rel="stylesheet" type="text/css" href="view/css/mypage_order_detail.css">
    <link rel="shortcut icon"
        href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">

</head>

<body>
<%
	String orderAddress = (String) request.getAttribute("orderAddress");
	List<OrderDetailListVo> orderDetailList = (List)request.getAttribute("orderDetailList");
%>
    <div class="main-container">
        <h1>주문상세보기</h1>
        <!-- 주문정보 테이블 시작 -->
        <h3 class="table-title">주문 정보</h3>
        <form method="POST" name="orderform">
            <table class="order-detail">
                <thead>
                    <tr>
                        <th scope="row">주문번호</th>
                        <td><input type="hidden" name="orderIndex" value="<%=orderDetailList.get(0).getOrderIndex()%>"/><%=orderDetailList.get(0).getOrderIndex()%></td>
                    </tr>
                    <tr>
                        <th scope="row">주문일자</th>
                        <td><%=orderDetailList.get(0).getOrderDate()%></td>
                    </tr>
                    <tr>
                        <th scope="row">주문자</th>
                        <td><%=orderDetailList.get(0).getOrderName()%></td>
                    </tr>
                    <tr>
                        <th scope="row">연락처</th>
                        <td><%=orderDetailList.get(0).getOrderPhone()%></td>
                    </tr>
                    </thead>
        
        </table>
        <!-- 결제정보 테이블 -->
        <h3 class="table-title">결제 정보</h3>
        <table class="payment-detail">
            
                <thead>
                    <tr>
                        <th scope="row">총 주문 금액</th>
                        <td><fmt:formatNumber value="<%=orderDetailList.get(0).getOrderTotalPrice()%>" pattern="###,###,###원"/></td>
                    </tr>
                    <tr>
                        <th scope="row">결제수단</th>
                        <td><%=orderDetailList.get(0).getOrderPayment()%></td>
                    </tr>
                </thead>
            
        </table>
        <!-- 주문상품정보 테이블 -->
        <h3 class="table-title">주문 상품 정보</h3>
        <table class="order-product-detail">
            
                <thead>
                    <tr>
                        <th id="order-number">주문번호</th>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th id="order-count">수량</th>
                        <th id="product-price">판매가</th>
                    </tr>
                </thead>

                <!-- 테이블 각 항목 -->
                <tbody>
                <%
                	for(OrderDetailListVo o : orderDetailList) {
                %>
                    <tr>
                        <!-- <td rowspan="2">20201223-01</td> -->
                        <td><%=o.getOrderIndex() %></td>
                        <td><img src="view/img/<%=o.getProductImage()%>" style="width: 100px; height:100px;"></td>
                        <td><%=o.getProductName() %></td>
                        <td><%=o.getOrderCount() %></td>
                        <td><fmt:formatNumber value="<%=o.getProductPrice() %>" pattern="###,###,###원"/></td>
                    </tr>
               	<% }%>
                   <!--  <tr>
                        <td>20201223-01</td>
                        <td><img src="..." alt="..."></td>
                        <td>부산제</td>
                        <td>1</td>
                        <td>14,000원</td>
                    </tr> -->
                </tbody>
            
        </table>
        <!-- 배송지정보 테이블 -->
        <h3 class="table-title">배송지 정보</h3>
        <table class="destination-info">
            
                <thead>
                    <tr>
                        <th scope="row">받으시는 분</th>
                        <td><%=orderDetailList.get(0).getOrderReceiver() %></td>
                    </tr>
                    <tr>
                        <th scope="row">우편번호</th>
                        <td><%=orderDetailList.get(0).getOrderZipcode() %></td>
                    </tr>
                    <tr>
                        <th scope="row">주소</th>
                        <td><%= orderAddress %></td>
                    </tr>
                    <tr>
                        <th scope="row">연락처</th>
                        <td><%=orderDetailList.get(0).getOrderReceiverPhone() %></td>
                    </tr>
                    <tr>
                        <th scope="row">요청사항</th>
                        <td><%=orderDetailList.get(0).getOrderText() %></td>
                    </tr>

                </thead>
        </table>
        <div class="btns-orderlist">
        <!-- 매핑 js로 다시 하기 -->
            <span><input type="button" value="주문내역으로" id="goto-orderlist"/></span>
            <span><input type="submit" id="order-cancel" value="주문취소" action=""></span>
        </div>

        </form>
    </div>
     <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>   
<script>
	var orderCancel = document.getElementById("order-cancel");
	orderCancel.onclick = function() {
		if (confirm("주문을 취소하시겠습니까?") == true) {
			var frm = document.orderform;
			var index = document.getElementById("orderIndex");
			frm.action = "cancelorder";
			alert("주문이 취소되었습니다.");
			console.log(index);
			frm.submit();
		} else {
			return;
		}	
	}
	
	var btnOrderList = document.getElementById("goto-orderlist");
	btnOrderList.onclick = function() {
		location.href = "OrderListSelect";
	}
	
</script>
</body>

</html>