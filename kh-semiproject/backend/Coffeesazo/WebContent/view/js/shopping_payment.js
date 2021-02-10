/**
 * 
 */
var requiredCheck = false;

function isAllChecked() {
		const checkList = document.getElementsByName("admit");
		const len = checkList.length;
		
		for(var i=0; i<len; i++) {
			if (!checkList[i].checked) {
				return false;
			}
		}
		
		return true;
	}
	
	function checkpayment(){
	var checkpayment = $("input:radio[name='gener']").is(":checked");
        if (checkpayment == false){
		
        return false;
		}
		return true;
		
	}
	
function checkForm() {
		
		var form = document.getElementsByName("form_buy");
		if (!isAllChecked()) {
			alert("약관에 동의하셔야 구매가 가능합니다.");
			return false;
		}else if (requiredCheck == false){
        alert("필수 항목을 입력하셔야 구매가 가능합니다.");
        return false;
		}else if(checkpayment() == false){
		alert("결제방법을 선택하셔야 구매가 가능합니다.");
        return false;
		}
		else{
		form.submit();
		}
		
	}


$("#sample6_detailAddress").focusout(function() {
	var address = $("#sample6_address").val();
	
	if (address == "") {
		$("#address-required").html("주소는 필수 정보입니다.");
		$("#address-required").css("color", "red");
		$("#address-required").css("display", "inline-block");
		requiredCheck = false;
	} else {
		$("#address-required").html("");
		requiredCheck = true;
	}
	
})

$("#recipient-rq").focusout(function() {
	var receiverName = $(this).val();
	
	if (receiverName == "") {
		$("#name-required").html("수령인 이름은 필수 정보입니다.");
		$("#name-required").css("color", "red");
		$("#name-required").css("display", "inline-block");
		requiredCheck = false;
	} else {
		$("#name-required").html("");
		requiredCheck = true;
	}
})

$("#number-rq").focusout(function() {
	var receiverPhone = $(this).val();
	var phonenumberCheckRegExp = /^\d{3}\d{3,4}\d{4}$/;
	
	
	if (receiverPhone == "") {
		$("#phonenumber-required").html("수령인 전화번호는 필수 정보입니다.");
		$("#phonenumber-required").css("color", "red");
		$("#phonenumber-required").css("display", "inline-block");
		requiredCheck = false;
	} else if (phonenumberCheckRegExp.test(receiverPhone) == false ) {
		$("#phonenumber-required").html("형식에 맞게 입력해주세요.");
		$("#phonenumber-required").css("color", "red");
		$("#phonenumber-required").css("display", "inline-block");
		requiredCheck = false;
	} else {
		$("#phonenumber-required").html("");
		requiredCheck = true;
	}
})

function checkFrom(){
	var form = document.getElementsByName("form_buy");
	if (requiredCheck == false){
		alert("필수 항목을 입력하셔야 회원가입이 가능합니다.");
		return false;
	}else{
		form.submit();
	}

}

function getPayment(event) {
		document.getElementById('payment-result').innerText = 
			event.target.value;
	}

