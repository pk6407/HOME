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
          <th class="fixed-side" scope="col">제품 명</th>
          <th scope="col">단위</th>
          <th scope="col">총 가격</th>
          <th scope="col">거래처</th>
          <th scope="col">입고시간</th>
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
          <td><fmt:formatDate value="${vo.time }" pattern="YYYY-MM-dd"/></td>
        </tr>
      </tbody>
      </c:forEach>
    </table>
  </div>
</div>
<div class="container">
  <div class="donut-chart-block block"> 
                    <h2 class="titular">제품</h2>
                    <div class="donut-chart">
                    <c:forEach var="vo" items="${list }">
      <div id="porcion1" class="recorte"><div class="quesito ios" data-rel="21"></div></div>
     <div id="porcion2" class="recorte"><div class="quesito mac" data-rel="39"></div></div>
     <div id="porcion3" class="recorte"><div class="quesito win" data-rel="31"></div></div>
     <div id="porcionFin" class="recorte"><div class="quesito linux" data-rel="9"></div></div>
 <p class="center-date"><fmt:formatDate value="${vo.time }" pattern="YYYY-MM"/><br><span class="scnd-font-color"></span></p>        
                </c:forEach>
                    </div>
                    <ul class="os-percentages horizontal-list">
                    <c:forEach var="vo" items="${list }">
                  
                        <li>
                             <c:if test ="$({vo.product_name[0]}) == $({vo.product_name[0]})"/> <p class="ios os scnd-font-color">${vo.product_name }</p>
                            <p class="os-percentage">21<sup>%</sup></p>	
                            <p class="mac os scnd-font-color">${vo.product_name }</p>
                            <p class="os-percentage">39<sup>%</sup></p>
                            <p class="linux os scnd-font-color">${vo.product_name }</p>
                            <p class="os-percentage">9<sup>%</sup></p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                </div>
               <div class='btns'>
               <input type='button' value='등록' id='btnInsert' onclick="PmgoUrl('/WarehousingInsert')"/>
			<input type='button' value='수정' id='btnUpdate' onclick="PmgoUrl('/WarehousingUpdate')"/>
			<input type='button' value='삭제' id='btnDelete' onclick="PmgoUrl('/WarehousingDelete')"/>
		</div>
      </form>
</div>
</body>
</html>