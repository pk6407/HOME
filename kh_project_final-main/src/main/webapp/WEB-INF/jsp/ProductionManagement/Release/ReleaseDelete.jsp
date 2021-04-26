<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='css/Production/Release.css' />
</head>
<body>
<div id="WsMain">
<form name="Rs" method="post">
<div id="table-scroll" class="table-scroll">
  <div class="table-wrap">
    <table class="main-table">
      <thead>
        <tr>
          <th class="fixed-side" scope="col">제품 명(제품 코드)</th>
          <th scope="col">단위</th>
          <th scope="col">거래처(회사 코드)</th>
          <th scope="col">반품(리퍼비시 가능)</th>
          <th scope="col">반품(폐기)</th>
          <th scope="col">총 가격</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th class="fixed-side">${vo.product_name }</th>
          <td>${vo.release_number }</td>
          <td>${vo.company_name }</td>
          <td>${vo.refurbish_number}</td>  
          <td>${vo.disuse_number }</td>
          <td><fmt:formatNumber value="${vo.release_price }"
          pattern="###,###,###원"></fmt:formatNumber></td>
        </tr>
      </tbody>
    </table>
    <div class='btns'>
    	<input type='button' value='삭제' id='btnDelect' />
  </div>
  </div>
</div>
</form>
</div>
</body>
</html>