<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='css/Production/WarehousingInsert.css' />
</head>
<body>
<div id="WsMain">
<form name="Ws" class='Insert' method="post">
<label>제품명</label>
<input type='text' name='subject' value='${vo.product_name}' maxLength='200'/><br>

<label>단위</label>
<input type='text' name='unit' value='${vo.warehousing_number }'/><br>

<label>총 가격</label>
<input type='text' name='price' <fmt:formatNumber value="${vo.warehousing_price }"
          pattern="###,###,###원"></fmt:formatNumber>/><br>

<label>거래처</label>
<input type='text'name='company' value='${vo.company_name }'/><br>

<div class='btns'>
	<input type='button' value='저장' id='btnSave' />
	<input type='button' value='취소' id='btnSelect' />
</div>
</form>
</div>
</body>
</html>