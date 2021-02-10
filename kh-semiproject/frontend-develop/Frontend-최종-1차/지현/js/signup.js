    // 아이디 유효성 검사
    $("#input-id").focusout(function () {
        var id = $("#input-id").val();
        var idCheckRegExp = /^[a-z0-9]{5,12}$/;
        console.log(id)
        if (id == "") {
            $("#id-required").html("아이디는 필수 정보입니다.");
            $("#id-required").css("display", "inline-block");
        } else if (!idCheckRegExp.test(id)) {
            $("#id-required").html("아이디가 형식에 맞지 않습니다.");
            $("#id-required").css("display", "inline-block");
            $("#id-required").css("color", "red");
        }
        // db에 있는 아이디는 사용 불가능한 것 구현 핋요
        else if (idCheckRegExp.test(id)) {
            $("#id-required").html("사용 가능한 아이디입니다.");
            $("#id-required").css("display", "inline-block");
            $("#id-required").css("color", "green");
        }
    })

    $("#input-password").focusout(function () {
        var password = $("#input-password").val();
        var numRegExp = password.search(/[0-9]/g);
        var engRegExp = password.search(/[a-z]/ig);
        var specialRegExp = password.search(/[~!?@#$%^&*();:_+=/-]/gi);

        if (password == "") {
            // 입력 여부 검사
            $("#password-required").html("비밀번호는 필수 정보입니다.");
            $("#password-required").css("display", "inline-block");

        } else if (password.length < 8) {
            // 길이 검사
            $("#password-required").html("8자리 이상 입력해주세요.");
            $("#password-required").css("display", "inline-block");
            $("#password-required").css("color", "red");
            return false;

        } else if (password.search(/\s/) != -1) {
            // 비밀번호 공백 검사
            $("#password-required").html("비밀번호에는 공백을 사용할 수 없습니다.");
            $("#password-required").css("display", "inline-block");
            $("#password-required").css("color", "red");
            return false;

        } else if (numRegExp < 0 || engRegExp < 0 || specialRegExp < 0) {
            // 형식 유효성 검사
            $("#password-required").html("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
            $("#password-required").css("display", "inline-block");
            $("#password-required").css("color", "red");
            return false;
        } else {
            console.log("true");
            $("#password-required").css("display", "none");
            return true;
        }
    })

    $("#check-input-password").focusout(function () {
        var password = $("#input-password").val();
        var checkPassword = $("#check-input-password").val();

        if (checkPassword == "") {
            // 입력 여부 검사
            $("#password-required").html("비밀번호 확인은 필수 정보입니다.");
            $("#password-required").css("display", "inline-block");
            $("#password-required").css("color", "red");
            return false;

        } else if (checkPassword != password) {
            // 비밀번호 일치 검사
            $("#password-required").html("비밀번호가 일치하지 않습니다.");
            $("#password-required").css("display", "inline-block");
            $("#password-required").css("color", "red");
            return false;

        } else {
            console.log("true");
            $("#password-required").css("display", "none");
            return true;
        }
    })

    $("#input-email").focusout(function () {
        var email = $("#input-email").val();
        var emailCheckRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (email == "") {
            // 입력 여부 검사
            $("#email-required").html("이메일은 필수 정보입니다.");
            $("#email-required").css("display", "inline-block");
        } else if (!emailCheckRegExp.test(email)) {
            // 형식 유효성 검사
            $("#email-required").html("이메일 형식에 맞지 않습니다.");
            $("#email-required").css("display", "inline-block");
            $("#email-required").css("color", "red");
        } else if (emailCheckRegExp.test(email)) {
            // 형식에 맞을 때
            // db에 있는 이메일 사용불가 구현 필요
            $("#email-required").html("사용 가능한 이메일입니다.");
            $("#email-required").css("display", "inline-block");
            $("#email-required").css("color", "green");
        }
    })

    $("#input-phonenumber").focusout(function () {
        var phonenumber = $("#input-phonenumber").val();
        var phonenumberCheckRegExp = /^\d{3}\d{3,4}\d{4}$/;

        if (phonenumber == "") {
            $("#phonenumber-required").html("전화번호는 필수 정보입니다.");
            $("#phonenumber-required").css("display", "inline-block");
        }
        else if (phonenumberCheckRegExp.test(phonenumber) == false) {
            $("#phonenumber-required").html("형식에 맞게 입력해주세요.");
            $("#phonenumber-required").css("display", "inline-block");

        } else {
            $("#phonenumber-required").html("");

        }
    })

    $("#input-name").focusout(function() {
        var name = $("#input-name").val();
        var nameRegExp = /^[가-힣]{2,5}$/;

        if(name == "") {
            $("#name-required").html("이름은 필수 정보입니다.");
            $("#name-required").css("display", "inline-block");
        } 

        else if(nameRegExp.test(name) == false) {
            $("#name-required").html("형식에 맞게 입력해주세요.");
            $("#name-required").css("display", "inline-block");    
        }

        else {
            $("#name-required").html("");
        }

    })

    // 우편번호찾기
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우에는 공백('')을 가지므로, 이를 참고하여 분기한다.
                var address = '';
                var extraAddress = '';

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') {
                    // 사용자가 도로명 주소를 선택했을 경우
                    address = data.roadAddress;
                } else {
                    // 지번 주소를 선택했을 경우
                    address = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일 때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다.(법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddress += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddress !== '') {
                        extraAddress = ' (' + extraAddress + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddress;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_postcode").value = data.zonecode;
                document.getElementById("sample6_address").value = address;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    // 약관동의 체크
    function isAllChecked() {
        const checkList = document.getElementsByName("admit");
        const len = checkList.length;
        for (var i = 0; i < len; i++) {
            if (!checkList[i].checked) {
                return false;
            }
        }

        return true;
    }

    var allAdmit = document.getElementById("all-admit");
    allAdmit.addEventListener("click", function () {
        var chks = document.getElementsByName("admit");
        for (var i = 0; i < chks.length; i++) {
            // false일 때: 모두 해제됨
            chks[i].checked = allAdmit.checked;
        }
    });


    const checkList = document.getElementsByName("admit")
    const len = checkList.length
    for (var i = 0; i < len; i++) {
        checkList[i].addEventListener('click', () => {
            // 하나라도 체크해제됐을 때 전체동의 체크해제
            if (!isAllChecked()) {
                allAdmit.checked = false;
            }
            // 전체체크됐을 때 전체동의도 체크
            if (isAllChecked()) {
                allAdmit.checked = true;
            }
        })
    }

    // 약관 비동의 시 회원가입 불가능
    function checkForm() {
        var form = document.getElementsByName("sign-up-form");
        if (!isAllChecked()) {
            alert("필수 동의 약관에 동의하셔야 회원가입이 가능합니다.");
            return false;
        }
        form.submit();
    }
