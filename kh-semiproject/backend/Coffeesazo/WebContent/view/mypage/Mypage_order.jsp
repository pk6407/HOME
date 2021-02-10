<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="view/css/bootstrap.min.css">
<link rel="stylesheet" href="view/css/Mypage_order.css" type="text/css">
<link
   rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>

</head>
<body>

   <main id="main_container">
      <div class="size-controll">

         <div class="user_info">
            <div class="mypage_title">

               <h1>마이페이지</h1>
            </div>
            <div class="user_info_form">
               <img
                  src="https://raw.githubusercontent.com/St4rFi5h/ETC/main/sourcce/article-user-blank.jpg"
                  alt="blank_user">  ${memberName}(${id }) 님
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


      </div>
      <div class="edit_title">
         <h1>주문내역</h1>
      </div>

      <!---------------------테이블시작 --------------------->
            <form name="orderform" id="orderform" action="deleteorder" method="POST">


         <table class="table table-hover">
            <thead>
               <tr>
                  <th>선택</th>
                  <th>주문번호</th>
                  <th>상품이미지</th>
                  <th>상품명</th>
                  <th>가격</th>
                  <th>수량</th>
                  <th>합계</th>
               </tr>
            </thead>


            <!--------------------- 테이블 각항목 --------------------->

      <c:if test="${not empty odList }">
               <tbody>
                  <c:forEach items="${odList}" var="OrderViewList">
                     <tr>
                        <td><input id="checkbox" type="checkbox" name="delete-name"
                           value="${OrderViewList.orderIndex }"></td>
                        <td><input type="hidden" name="orderIndex" id="orderIndex" value="${OrderViewList.orderIndex }"/>${OrderViewList.orderIndex }</td>
                        <td height="0">
                           <div style="height: 100%">
                              <img src="view/img/${OrderViewList.productImage }" style="width: 100px; height:100px;">
                           </div>
                        </td>                  <!------ 주문상세 맵핑필요 -------->             
                        <td onclick="gotoOrderDetail(${OrderViewList.orderIndex})">${OrderViewList.productName}</td>
                        <td><fmt:formatNumber value="${OrderViewList.productPrice }" pattern="###,###,###원"/></td>
                        <td>${OrderViewList.orderCount }개</td>
                        <td><fmt:formatNumber value="${OrderViewList.productPrice * OrderViewList.orderCount}" pattern="###,###,###원"/></td>
                     </tr>
                  </c:forEach>



               </tbody>
        

         </table>

         <!--------------------- 주문취소 버튼 --------------------->
         <div class="csl-button">
            <p>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                    주문취소
                </button>
     </p>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">선택삭제</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                               취소하시겠습니까?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-primary">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                </div>
                 </c:if>
            </form>
                
                
         
            
            <c:if test="${empty odList }">
               <div style="text-align: center; font-weight: 500; font-size: 2rem;">주문정보가 없습니다.<br><br><br><br>   </div>
            
            </c:if>

      



   </main>
   
   <script>
   function gotoOrderDetail(orderIndex) {
      var frm = document.orderform;
      var index = document.getElementById("orderIndex");
      frm.action = "orderdetail";
      index.value = orderIndex;
      console.log(index.value);
      frm.submit();
   }
   
   
   
   

    </script>
</body>
</html>