<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!--favicon-->
    <link rel="shortcut icon" href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정 | COFFEESAZO</title>
    <link rel=“stylesheet” href=“./view/css/bootstrap.min.css” type=“text/css”> 
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <link href="./view/css/find_password_3step.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="./view/css/header.css" type="text/css">
    <link rel="stylesheet" href="./view/css/footer.css" type="text/css">
</head>

<body>
 
    <div class="main-body"> <!--전체 div-->

    <form method="post" action="change" onsubmit= "return change_pwd()"> <!--form 태그 시작-->
        <p class="main-title">비밀번호 재설정</p>
        <p> </p>
        <p class="sub-title">새로운 비밀번호를<br>설정해 주세요</p>
        <p>　</p>
        
        <p>
            <input class="input" type="password" name="password" id="pwd"
            placeholder="비밀번호 입력(영문, 숫자, 특수문자 조합 최소8자)"> <!--비번 입력 인풋-->
        </p>
        
        <p>
            <input class="input" type="password" name="pwd" id="pwd2"
                placeholder="다시 한 번 입력해 주세요"> <!--비번 확인 입력 인풋-->
        </p>
        <p>　</p>
        
        <p>
            <input class="findpassword-button" type="submit" value="비밀번호 재설정">
        </p>
     </form> <!--form 태그 끝-->
    </div> <!--전체 div 끝-->
<script src="./view/js/change_pwd.js" charset="utf-8"></script>
</body>
</html>