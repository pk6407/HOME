<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="view/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="view/css/header.css">
</head>
<body>
<header class="header">
<!-- header 시작 -->
<%
	if(session.getAttribute("id") == null) {
		
%>
        <div class="header-align">
            <div class="header-logo">
                <a href="index.jsp"><img src="view/img/logo_white.png" class="logo"></a>
            </div>
            <div class="btns-signin-signup">
                <span><a href="index.jsp?inc=view/signin/login.jsp">로그인</a></span>
                <span><a href="index.jsp?inc=view/signup/signup.jsp">회원가입</a></span>
                <span><a href="notice">고객센터</a></span>
                <span><a href="index.jsp?inc=view/signin/login.jsp" id="cart_before_login"><img src="view/img/shoppingcart_white.png" id="shoppingcart"></a></span>
            </div>
        </div>

        <div class="shopping">
            <span id="wholebean"><a href="wholebean">원두</a></span>
            <span id="stickcoffee"><a href="stickcoffee">스틱커피</a></span>
            <span id="capsulecoffee"><a href="capsulecoffee">캡슐커피</a></span>

        </div>
    
    <% } else { %>
    <div class="header-align">
            <div class="header-logo">
                <a href="index.jsp"><img src="view/img/logo_white.png" class="logo"></a>
            </div>
            <div class="btns-signin-signup">
                <span><a href="logout">로그아웃</a></span> <!--LogoutServlet 매핑 -->
                <span><a href="OrderListSelect">마이페이지</a></span>
                <span><a href="notice">고객센터</a></span>
                <span><a href="cart"><img src="view/img/shoppingcart_white.png" id="shoppingcart"></a></span>
            </div>
        </div>

        <div class="shopping">
            <span id="wholebean"><a href="wholebean">원두</a></span>
            <span id="stickcoffee"><a href="stickcoffee">스틱커피</a></span>
            <span id="capsulecoffee"><a href="capsulecoffee">캡슐커피</a></span>

        </div>
    <%} %>
</header>
<script type="text/javascript">
	var cartBeforeLogin = document.getElementById("cart_before_login");
	cartBeforeLogin.onclick = function() {
		alert("먼저 로그인해주세요. ");
	}
</script>
</body>
</html>