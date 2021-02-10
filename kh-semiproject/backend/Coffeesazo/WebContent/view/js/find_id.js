function find_id(){ 

	
	var nameRegExp = /^[가-힣]{2,5}$/;
	var getEmailCheck= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	//이름 공백 확인 
	if($("#name").val() == ""){ 
		alert("이름을 입력해 주세요"); $("#name").focus(); 
		return false; }
		

	else if(!nameRegExp.test( $("#name").val() ) ){ 
		alert("이름이 형식에 맞지 않습니다."); 
		$("#name").val(""); $("#name").focus(); 
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
		