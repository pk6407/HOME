<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 작성 | COFFEESAZO</title>
<!-- 부트스트랩 불러오기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="index copy.css" type="text/css">
<!--favicon-->
<link rel="shortcut icon"
	href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link href="./view/css/qna_write.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<main>
		<div id="container">
			<div id="contents">
				<a href="notice"><h1>고객센터</h1></a>
				<div class="boardnavi">
					<a href="notice" class="navi01"> <span>공지사항</span>
					</a> <a href="qna" class="navi02"> <span>1:1 문의</span>
					</a>
				</div>
				<div class="layout-box">
					<h2>1:1 문의 작성하기</h2>
					<form name="board" method="post" class="board" action="qnawrite" onsubmit="return requiredCheck();" enctype="multipart/form-data">
						<label for="title">제목</label> <input type="text" id="title"
							name="title" placeholder="제목을 입력해 주세요."  /> <br /> <br />
						<label for="content">내용</label> 
						<textarea class="content" rows="13" cols="85" name="content" id="content" placeholder="내용을 입력해 주세요."  /></textarea> <br /> <br />
						<label for="file">첨부파일</label>
						<div class="file-upload">
							<input type="file" id="imgInput" name="file" multiple /> <br /> <br />
							<img id="image_section" src="http://placehold.it/140x100" width='140px' height='100px' />
						</div>
						<div class="bottom-button">
							<input class="btn-save" type="submit" value="등록하기">
							<input class="btn-cancle" type="button" onclick="cancle()" value="취소하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	  <!-- 부트스트랩 자바스크립트 추가 -->
    <script src="./js/bootstrap.min.js"></script>
	<script>

    function requiredCheck(){ 
       
       var title = $("#title").val();
       var content = $("#content").val();
       var writeRegistration = null;
       var imgInput = $("#imgInput").val();
       
       if(title == "") {
          alert('제목을 입력해 주세요.');
          $("#title").focus(); 
          return false;
          }
       
       else if(content ==""){
          alert('내용을 입력해 주세요.');
          $("#content").focus(); 
          return false;
       }

       else if(imgInput ==""){
           alert('사진을 반드시 첨부해 주세요.');
           $("#content").focus(); 
           return false;
        }
       
       else if (title != null || content !=null) {
          writeRegistration =confirm("등록하시겠습니까?");
          if(writeRegistration==true) {
          alert('등록이 완료되었습니다.');   
          }
          if( writeRegistration==false){
             return false;
          }
      
       }
       
   
}      
    
function cancle() {
     var writeCancle = confirm("취소하시겠습니까?");
      if( writeCancle == true ) {
         alert("작성이 취소되었습니다.");
         location.href = "qna";
     }
      if( writeRegistration==false){
          return false;
       }
 }
 
function readURL(input) {
  if (input.files && input.files[0]) {
   var reader = new FileReader();
   
   reader.onload = function (e) {
    $('#image_section').attr('src', e.target.result);  
   }
   
   reader.readAsDataURL(input.files[0]);
   }
 }
  
 $("#imgInput").change(function(){
    readURL(this);
 });
 
function getID(id){ return document.getElementById(id)}
var photo = function(){
var btnPhoto = getID('btnPhoto');
  if(btnPhoto != null) {
       btnPhoto.onchange = function(ev) {
          var tag = ev.srcElement; // 이벤트 발생한 태그
          var url = tag.files[0]; // 선택된 파일명
          var reader = new FileReader();
          reader.readAsDataURL(url);
          reader.onload = function(e) {
             var img = new Image();
             img.src = e.target.result;
             var file = getID('file');
             file.src = img.src;
          }
       }
    }
}
	</script>

</body>
</html>