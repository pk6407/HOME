<%@page import="com.coffeesazo.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COFFEESAZO</title>
    <!--favicon-->
    <link rel="shortcut icon"
        href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
    <link rel="stylesheet" href="./view/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./view/css/signup_complete.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>

<body>
    <!-- 회원가입 완료 -->
    <div class="section">
        <div class="welcome-message">
            <h1>회원가입이 완료되었습니다.</h1>
            <div class="youridis">
                <!-- jsp에서 회원가입한 아이디 db에서 가져오도록 -->
                <span>회원님의 아이디는 <b><%= request.getAttribute("memberId") %></b>입니다.</span>
            </div>
        </div>
        <div class="signin-and-gotomain">
            <input type="button" value="로그인하기" onclick="location.href='index.jsp?inc=view/signin/login.jsp'"/>
            <input type="button" value="메인으로 이동" onclick="location.href='./index.jsp'" />
        </div>
    </div>

</body>

</html>