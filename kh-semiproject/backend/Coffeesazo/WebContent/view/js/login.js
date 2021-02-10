function login(){ 

	var getIdCheck= /^[a-z0-9]{5,12}$/;

	//아이디 공백 확인 
	if($("#id").val() == ""){ 
		alert("아이디를 입력해 주세요"); $("#id").focus(); 
		return false; 
	}

	//아이디 유효성 검사 
	else if(!getIdCheck.test( $("#id").val() ) ){ 
		alert("아이디를 형식에 맞게 입력해주세요"); 
		$("#id").val(""); $("#id").focus(); 
		return false; 
	}
	
	//비밀번호 공백 확인 
	else if($("#pwd").val() == ""){ 
		alert("비밀번호를 입력해 주세요"); 
		$("#pwd").focus(); 
		return false; 
	}

	else {	
	return true;
	}
}
	
