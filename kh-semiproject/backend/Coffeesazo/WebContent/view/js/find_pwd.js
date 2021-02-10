function find_pwd(){ 

	
	var getIdCheck= /^[a-z0-9]{5,12}$/;
	var getEmailCheck= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	//아이디 공백 확인 
	if($("#id").val() == ""){ 
		alert("아이디를 입력해 주세요"); $("#id").focus(); 
		return false; }

	//아이디 유효성 검사 
	else if(!getIdCheck.test( $("#id").val() ) ){ 
		alert("아이디를 형식에 맞게 입력해주세요"); 
		$("#id").val(""); $("#id").focus(); 
		return false; }
		
	//이메일 공백 확인 
	else if ($("#email").val() == ""){ 
		alert("이메일을 입력해 주세요"); $("#email").focus(); 
		return false; 
		}
	
	else if(!getEmailCheck.test( $("#email").val() ) ){ 
		alert("올바른 이메일 형식이 아닙니다."); 
		$("#email").val(""); $("#email").focus(); 
		return false; }
	
	
	else {
	return true;
	}
	
}
		
		