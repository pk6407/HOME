function auth_check(){ 

	if($("#auth_number").val() == ""){ 
		alert("인증번호를 입력해 주세요."); 
		$("#auth_number").focus(); 
		return false; 
	}

	else 	
	return true;
	
}