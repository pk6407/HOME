<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!--favicon-->
<link rel="shortcut icon"
	href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 | COFFEESAZO</title>
<link rel="stylesheet" href="./view/css/bootstrap.min.css" type="text/css" >
<link rel="stylesheet" href="../view/css/header.css" type="text/css">
<link rel="stylesheet" href="../view/css/footer.css" type="text/css">
<link href="./view/css/login.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="./view/js/login.js" charset="utf-8"></script>
</head>

<body>
	<!-- login start -->
	<div class="main-body">
		<!--form태그 시작-->
		<form method="post" action="Login" onsubmit="return login();">
			<h1 class="main-title">L O G I N</h1>
			<p>
				<input class="input" type="text" name="id" id="id"
					placeholder="아이디를 입력해 주세요">
			</p>
			<p>
				<input class="input" type="password" name="pwd" id="pwd"
					placeholder="비밀번호를 입력해 주세요">
			</p>
			<p class="title">
				<a href="index.jsp?inc=view/signin/find_id_1step.jsp">아이디 찾기 |</a> <a
					href="index.jsp?inc=view/signin/find_password_1step.jsp">비밀번호
					재설정</a>
			</p>
			<p>
				<input class="login-button" type="submit" value="로그인">
			</p>
		</form>
		<!--form태그 끝-->
		<p class="title">──────────────────────</p>
		<h2 class="title">아직 회원이 아니신가요?</h2>
		<p>
			<input class="signup-button" type="button" value="회원가입"
				onclick="location.href='index.jsp?inc=view/signup/signup.jsp'">
		</p>
	</div>
	<!-- login end -->
</body>
</html>