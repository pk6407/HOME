function change_pwd(){ 
	
	var pwd = document.getElementById("pwd").value;
    var pwd2 = document.getElementById("pwd2").value; 
	var pattern1 = /[0-9]/;
    var pattern2 = /[a-zA-Z]/;
    var pattern3 = /[~!@\#$%<>^&*]/;

	
	
	//비밀번호 공백 확인 
	if(pwd == ""){ 
		alert("비밀번호를 입력해 주세요"); 
		$("#pwd").focus(); 
		return false; 
	}
	
	else if(pwd2 == ""){ 
		alert("비밀번호를 입력해 주세요"); 
		$("#pwd2").focus(); 
		return false; 
	}
	
	else if($("#pwd").val().length < 8){ 
		alert("비밀번호는 8자리 이상 설정 가능합니다."); 
		$("#pwd").focus(); 
		return false; 
	}
	
	else if(pwd != pwd2) {
    	alert("비밀번호가 일치하지 않습니다. 입력하신 비빌번호를 다시 한 번 확인해 주세요."); 
		$("#pwd2").focus(); 
		return false; 
	}
	
	else if
		(!pattern1.test(pwd)||!pattern2.test(pwd)||!pattern3.test(pwd)||pw.length<8||pw.length>50){
            alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
            $("#pwd").focus(); 
            return false; 
    }
    

	else {	
		return true;}
	}
	
