<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='css/Production/Warehousing.css' />
</head>
<body>
<div id="WsMain">
<form name="Ws" method="post">
<div id="table-scroll" class="table-scroll">
  <div class="table-wrap">
    <table class="main-table">
      <thead>
        <tr>
          <th class="fixed-side" scope="col">제품 명(제품 코드)</th>
          <th scope="col">단위</th>
          <th scope="col">총 가격</th>
          <th scope="col">거래처(회사 코드)</th>
        </tr>
      </thead>
      <c:forEach var="vo" items="${list }">
      <tbody>
        <tr>
          <th class="fixed-side">${vo.product_name }</th>
          <td>${vo.warehousing_number }</td>
          <td><fmt:formatNumber value="${vo.warehousing_price }"
   			pattern="###,###,###원"></fmt:formatNumber></td>
          <td>${vo.company_name }</td>  
        </tr>
      </tbody>
      </c:forEach>
    </table>
  <input type='button' value='수정' id='btnUpdates'/>
    </div>
</div>
    <div class='btns'>
    	<input type='button' value='확인' id='btnView' onclick="PmgoUrl('/WarehousingView')"/>
  </div>
</form>
</div>
</body>
</html>