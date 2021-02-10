<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!--favicon-->
    <link rel="shortcut icon" href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 | COFFEESAZO</title>
    <link rel=“stylesheet” href=“./view/css/bootstrap.min.css” type=“text/css”> 
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <link href="./view/css/find_id_1step.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="./view/css/header.css" type="text/css">
    <link rel="stylesheet" href="./view/css/footer.css" type="text/css">
</head>

<body>
 
    <div class="main-body"> <!--전체 div 시작-->

        <form method="post" action="findid" onsubmit= "return find_id()"> <!--form태그 시작-->
            <p class="main-title">아이디 찾기</p>
            <p>　</p>
            <p><input class="input" type="text" name="name" id="name"
                placeholder="이름을 입력해 주세요"></p> <!--이름 입력 인풋-->
            

            <p><input class="input" type="email" name="email" id="email"
            placeholder="이메일을 입력해 주세요"></p> <!--이메일 입력 인풋-->

            <p>　</p>
            <p>
                <input class="findid-button" type="submit" value="이메일로 인증번호 받기" > 
            </p>
       </form> <!--form태그 끝-->
            <p class="title">
                <a href="index.jsp?inc=view/signin/find_password_1step.jsp">비밀번호를 잊으셨나요?</a>
            </p>

    </div> <!--전체 div 끝-->
    
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="./view/js/find_id.js" charset="utf-8"></script>

</body>
</html>