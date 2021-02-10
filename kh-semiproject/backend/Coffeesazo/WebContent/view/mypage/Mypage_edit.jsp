<%@page import="com.coffeesazo.member.model.vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang = "en">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="view/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="view/css/addressApi.css" type="text/css">
  <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
  <link rel="stylesheet" href="view/css/Mypage.css" type="text/css">
  <link rel="stylesheet" href="./view/css/Mypage_edit.css" type="text/css">
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>
    <style>
   #btn-change {
		margin: 0 auto;
   }
    
    </style>
</head>
<body>
<%

	List<MemberVo> memberInfoList = (List<MemberVo>)request.getAttribute("memberInfoList");
	String mainAddress = (String)request.getAttribute("mainAddress");
	String detailAddress = (String)request.getAttribute("detailAddress");
	String extraAddress = (String)request.getAttribute("extraAddress");
	String memberZipcode = (String)request.getAttribute("memberZipcode");
%>
 <!--------------------- 메인시작 --------------------->
  <main id="main_container">
    <div class="size-controll">

      <div class="user_info">
          <div class="mypage_title">
			
              <h1>마이페이지</h1>
          </div>
          <div class="user_info_form"><img
                  src="https://raw.githubusercontent.com/St4rFi5h/ETC/main/sourcce/article-user-blank.jpg"
                  alt="blank_user">
              <%=memberInfoList.get(0).getMemberName() %>(<%= memberInfoList.get(0).getMemberId()%>) 님
          </div>
      </div>

       <!--------------전체 버튼묶음-------------->
       <div class="button">
        <ul>
            <a class="card_small" href="OrderListSelect">
                <h3 class="softblack">주문내역</h3>
                <p class="card_text">최근 주문내역을 </br>확인하실 수 있습니다.</p>

            </a>
        </ul>
        
       <!--   <form method="POST" name="form_edit">--> 
                <ul>
                    <a class="card_small" id="mypage-edit" href="mypage_edit">
                        <h3>회원정보수정</h3>
                        <p class="card_text">나의 정보를 </br>변경하실 수 있습니다.</p>

                    </a>
                </ul>
       <!--  	</form>--> 
        
            <ul>
                    <a class="card_small" href="MyQnaList"">
                        <h3 class="softblack">나의문의</h3>
                        <p class="card_text">나의1:1문의를 </br>확인하실 수 있습니다.</p>
        
                    </a>
                </ul>

    </div>
    
  </div>
    <div class="form_move">
      <div class="edit_title">
        <h1>회원정보수정</h1>
      </div>

	<form name="form_mypage_edit" method="POST">
      <div class="form-group" id="input-container">

        <p>
          <!--------------------- 회원정보 변경 --------------------->
        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10">
            <div class="user_name" id=div-user-name><%=memberInfoList.get(0).getMemberName() %></div>
          </div>
        </div>

        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label" id="label-original-pwd">기존 비밀번호 입력</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="input-original-password" required name="originalMemberPwd" placeholder="기존 비밀번호">
          	<span class="warn-info" id="original-password-check"></span>
          </div>
        </div>


        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label">변경할 비밀번호</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="input-new-password" name="newMemberPwd" placeholder="영문, 숫자, 특수문자 포함 최소 8자">
          	<span class="warn-info" id="new-password-required">형식에 맞게 입력해주세요.</span>
          	
          </div>
        </div>
        
        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label">변경할 비밀번호 확인</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="input-new-password-check" placeholder="비밀번호 확인">
          	<span class="warn-info" id="new-password-check-required">형식에 맞게 입력해주세요.</span>
          </div>
        </div>

        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
          <div class="col-sm-10">	
            <input type="text" class="form-control" name="originalMemberPhone" id="input-phonenumber" readonly value="<%= memberInfoList.get(0).getMemberPhone()%>" placeholder="전화번호 입력">
	        <button type="button" class="btn btn-outline-secondary" id="button-edit-phonenumber">변경하기</button>
	        <button type="button" class="btn btn-outline-secondary" id="button-edit-phonenumber-cancel">취소하기</button>
          	
          </div>
        </div>
        
        <div class="row mb-3" id="div-edit-phonenumber">
          <label for="colFormLabel" class="col-sm-2 col-form-label" id="label-edit-phonenumber">변경할 전화번호</label>
          <div class="col-sm-10">	
            <input type="text" class="form-control" name="newMemberPhone" id="input-new-phonenumber" placeholder="전화번호 입력">
            
          	<span class="warn-info" id="phonenumber-required"></span>
          </div>
        </div>

        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label" >이메일</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" name="originalMemberEmail" id="input-email" readonly value="<%=memberInfoList.get(0).getMemberEmail()%>" placeholder="이메일 형식에 맞게 입력">
	        <button type="button" class="btn btn-outline-secondary" id="button-edit-email">변경하기</button>
	        <button type="button" class="btn btn-outline-secondary" id="button-edit-email-cancel">취소하기</button>
            
          </div>
        </div>
        <div class="row mb-3" id="div-edit-email">
          <label for="colFormLabel" class="col-sm-2 col-form-label" id="label-edit-email">변경할 이메일</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" name="newMemberEmail" id="input-new-email" placeholder="이메일 형식에 맞게 입력">
            <span class="warn-info" id="email-required"></span>
            </br></br>
          </div>
        </div>
        <p>
        <!--------------------- 주소시작 --------------------->
        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label">주소</label>
          <div class="col-sm-10">

            <input type="text" class="form-control" id="sample6_postcode" name="memberZipcode" value="<%=memberZipcode %>"readonly placeholder="우편번호">
                    <!--------------------- 우편번호 시작 --------------------->
        
          <button type="button" class="btn btn-outline-secondary" id="sample6_postcode_search"
            onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
        
        
        
          </div>

        </div>

        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label"></label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="sample6_address" name="memberAddress" value="<%=mainAddress %>" readonly placeholder="주소">
          </div>
        </div>


        <div class="row mb-3">
          <label for="colFormLabel" class="col-sm-2 col-form-label"></label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="sample6_detailAddress" name="memberAddress" value="<%=detailAddress %>" placeholder="상세주소">
          	<input type="text" class="form-control" id="sample6_extraAddress" name="memberAddress" value="<%=extraAddress %>" readonly placeholder="참고항목">
          </div>
        </div>



          
          <!-- 확인창 나오는버튼 -->
          <button type="button" id="btn-change" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" >
            변경하기
          </button>

          <!-- 확인창 내부 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">변경확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                정말로 변경하시겠습니까?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소하기</button>
                <input type="submit" class="btn btn-outline-success" value="변경하기" id="button-update" onclick="editConfirm()"/>
              </div>
            </div>
          </div>
        
        </div>
        </p>

		</form>
      </div>
    </div>



  </main>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="view/js/addressApi.js"></script>
	<script src="view/js/jquery.min.js"></script>
	<script src="view/js/mypage_edit.js"></script>
	<script src="view/js/bootstrap.min.js"></script>
	<script src="view/js/popper.js"></script>


</body>
</html>