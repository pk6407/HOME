<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="view/css/coffemenu.css" rel="stylesheet" type="text/css" />
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파푸아뉴기니'모리타'|COFFEESAZO</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!--favicon-->
    <link rel="shortcut icon" href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
</head>

<body>
    <main>
        <div id="menu-container">
            <div class="menu1">
                <div class="menu-toplogo">
                <c:ifEach items="${coffeeList }" var="Product_detail">
                    <h1><a href="index.jsp?inc=view/shopping/product/whole_bean.jsp">${deatil.fkCategoryIndex}</a></h1>
                </div>
                <div class="menu-toptag">
                    <a href="index.jsp?inc=view/shopping/product/whole_bean.jsp">${deatil.fkHashtagIndex}</a>
                </div>
                
                <div class="menu-productinfo">
                    

                    
                    <img src="./view/img/${detail.productImage}" alt="">
                    <div class="menu-result">
                        <form action="">
                            <div class="result-title">
                                <h2>${detail.productInfo}</h2>
                            </div>
                            <div class="result-product">
                                <h3>'모리타'</h3>
                                <p>16,000원</p>
                                <p>파푸아뉴기니</p>
                                <p>용량:200g</p>
                                <p>배송비:무료</p>
                                <p>배송 기간:이틀 예정</p>
                                <p>[영업일 기준 2일 이내 발송]</p>
                                <label for="addcount">수량</label>
                                <input type="text" class="addcount" value="1">
                             
                            </div>
                            <div class="result-button">
                              <%
                              	if(session.getAttribute("id") != null){
                              %>
                          <!-- Button trigger modal -->
<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    장바구니
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
         장바구니에 추가 되었습니다.
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">쇼핑 계속하기</button>
          <button type="button" class="btn btn-primary" onclick= " location.href = 'index.jsp?inc=view/order/shopping_cart.jsp'">장바구니로 가기</button>
        </div>
      </div>
    </div>
  </div>
                                <button type="button" class="btn btn-outline-secondary" onclick= " location.href = 'index.jsp?inc=view/order/shopping_payment.jsp'">바로구매</button>
                            </div>

                        </form>
                    </div>
                        
                </div>
            </div>
            <% } else { %>
            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    장바구니
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
         로그인을 해주세요
        </div>
      </div>
    </div>
  </div>
                                <button type="button" class="btn btn-outline-secondary" onclick= " location.href = 'index.jsp?inc=view/signin/login.jsp'">바로구매</button>
                            </div>

                        </form>
                    </div>
                        
                </div>
                <% } %>
            <div class="menu2">
                <img src="./view/img/Morita.png" alt="">
                <div class="detail-infomation">
                    <div class="detail-top">
                        <p class="p1">${detail.productText}</p>
                            <p class="p2">Papua New Guinea 'Morita'</p>
                                
                            </div>
                            <div class="detail-mid">
                                <p>국가 : PAPUA NEW GUINEA</p>
                                <p>지역 : AIYURA BALLEY,EASTERN HIGHLANDS</p>
                                <p>농장 : MORITA</p>
                                <p>농장주 : MORITA SMALL HOLDERS</p> 
                                <p>재배 고도 : 1,850M</p>
                                <p>품종 : K7,ARUSHA</p>
                                <p>가공방식 : WASHED PROCESS</p>

                            </div>

                </div>
            </div>
            </div>
	</c:ifEach>
            

    </main>
</body>

</html>