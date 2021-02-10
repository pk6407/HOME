<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="./view/css/coffemenu.css" type="text/css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>'카페 아메리카노'|COFFEESAZO</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!--favicon-->
    <link rel="shortcut icon" href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
</head>
<body>
    <main>
        <div id="menu-container">
            <div class="menu-1">
                <div class="menu-toplogo">
                    <h1><a href="index.jsp?inc=view/shopping/product/stick_coffee.jsp">스틱</a></h1>
                </div>
                <div class="menu-toptag">
                    <a href="index.jsp?inc=view/shopping/product/stick_coffee.jsp">#쉽고간편한</a>
                </div>
                
                <div class="menu-productinfo">
                    

                    
                    <img src="./view/img/cafe_americano.png" alt="gold">
                    <div class="menu-result">
                        <form action="">
                            <div class="result-title">
                                <h2>아메리카노</h2>
                            </div>
                            <div class="result-product">
                                <h3>'카페 아메리카노'</h3>
                                <p>11,000원</p>
                                <p>NS물</p>
                                <p>용량:500g(100개입)</p>
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
                <img src="./view/img/cafe_americano.png" alt="">
                <div class="detail-infomation">
                    <div class="detail-top">
                        <p class="p1">NS몰'카페 아메리카노'</p>
                            <p class="p2">NS Mall 'Cafe Americano'</p>
                                
                            </div>
                            <div class="detail-mid">
                                <p>국가 : 콜롬비아,에티오피아</p>
                                <p>지역 : 콜롬비아,에티오피아</p>
                                <p>품종 : 칼라스 수프리모,예가체프</p>
                                <p>칼라스 수프리모의 깊은 향미와 깔끔함</p> 
                                <p>>'마일드 커피'의 대명사로 명성이 높은 고급 원두 커피</p>
                                <p>예가체프의 풍부한 아로마,부드러운 바디감</p>
                                <p>세련된 맛과 향때문에 '커피의 귀부인'이라고 불림</p>

                            </div>

                </div>
            </div>
            </div>

    </main>
</body>
</html>