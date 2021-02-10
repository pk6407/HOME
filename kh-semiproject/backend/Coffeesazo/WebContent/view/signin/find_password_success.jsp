<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!--favicon-->
    <link rel="shortcut icon" href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 | COFFEESAZO</title>
    <link rel=“stylesheet” href=“./view/css/bootstrap.min.css” type=“text/css”> 
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <link href="./view/css/find_password_success.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="./view/css/header.css" type="text/css">
    <link rel="stylesheet" href="./view/css/footer.css" type="text/css">
</head>

<body>

    <!--findPassword-finish start!-->
    <div class="main-body"> <!--전체 div시작-->
        <form> 
            <div class="wrapper">
                <p class="main-title">비밀번호 재설정</p>
                <p>　</p>
                <p class="sub-title">비밀번호가 정상적으로<br>변경 되었습니다.</p>
                <%
                session.invalidate();
                %>
                <p>　</p>
                <p>
                    <input class="findid-button" type="button" value="로그인 하러 가기"
                    onclick="location.href='index.jsp?inc=view/signin/login.jsp'">
                </p>
            </div>
        </form> 
    </div> <!--전체 div 끝-->

</body>

</html>