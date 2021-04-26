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
<form name="Ws" method="post">
<label>제품명</label>
<input type='text' name='subject' value='${vo.product_name }' maxLength='200'/><br>

<label>단위</label>
<input type='text' name='unit' value='${vo.release_number }' /><br>

<label>거래처</label>
<input type='text' name='company' value='${vo.company_name }'/><br>

<label>반품(리퍼비시 가능)</label>
<input type='text' name='Refurbish' value='${vo.refurbish_number}'/><br>

<label>반품(폐기)</label>
<input type='text' name='disuse' value='${vo.disuse_number }' /><br>

<label>총 가격</label>
<input type='text' name='price' <fmt:formatNumber value="${vo.release_price }"
          pattern="###,###,###원"></fmt:formatNumber>/><br>
 
<div class='btns'>
			<input type='button' value='저장' id='btnSave' />
			<input type='button' value='취소' id='btnUpdate' />
		</div>
</form>
</div>
</body>
</html>