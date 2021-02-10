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
    <link href="./view/css/find_password_1step.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="./view/css/header.css" type="text/css">
    <link rel="stylesheet" href="./view/css/footer.css" type="text/css">
</head>

<body>
   
    <div class="main-body"> <!-- 전체 div시작 -->
        <form method="post" action="findpwd" onsubmit= "return find_pwd()"> <!-- form 태그 시작-->
            <p class="main-title">비밀번호 재설정</p>
            <p>　</p>
            <p>
                <input class="input" type="text" name="id" id="id"
                placeholder="아이디를 입력해 주세요"> <!-- 아이디 입력 인풋 -->
            </p>

            <p>
                <input class="input" type="email" name="email" id="email"
                    placeholder="이메일을 입력해 주세요"> <!-- 이메일 입력 인풋 -->
            </p>
            <p>　</p>
            <p>
                <input class="findpassword-button" type="submit" value="이메일로 인증번호 받기">
            </p>
            
            <p class="title">
                <a href="index.jsp?inc=view/signin/find_id_1step.jsp">아이디를 잊으셨나요?</a>
            </p>
        </form> <!-- form 태그 시작-->
    </div> <!-- 전체 div 끝 -->
<script src="./view/js/find_pwd.js" charset="utf-8"></script>
</body>

</html>