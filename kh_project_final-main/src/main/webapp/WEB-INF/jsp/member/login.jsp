<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id='login'>
   
		<form name='frm_login' id='frm_login' method='post'>
			<label>아이디</label>
			<input type='text' name='empNo' value='1'/><br/>
			<label>사원명</label>
			<input type='text' name='empName' value='홍길동'/><p/>
			<div>
			<label></label>
				<input type='button' id='btnLogin' value=' 로그인 '/>
				<input type='button' id='btnApprov' value=' 상신 ' onclick='approv.approv()'/>
				<input type='button' id='btnAccept' value=' 결재 ' onclick='approv.accept()'/>
				<input type='button' id='btnClear'  value=' 정보 삭제 ' />
			</div>
			<div id='info'>인트라넷을 사용하시려면 본 회사의 사원이여야 하며 로그인해야 합니다. </div>
		</form>

<script src='js/approv.js'></script>    

