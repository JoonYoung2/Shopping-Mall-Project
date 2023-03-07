function id_click(){
		document.getElementById("user_id").innerText="영문자 또는 숫자 6~20";
	}
	function id_blur(){
		document.getElementById("user_id").innerText="";
	}
	
	function pw_click(){
		document.getElementById("user_pw").innerText="8~20자 영문, 숫자, 특수문자 필수";
	}
	function pw_blur(){
		document.getElementById("user_pw").innerText="";
	}
	
	function email_click(){
		document.getElementById("user_email").innerText="example@naver.com";
	}
	function email_blur(){
		document.getElementById("user_email").innerText="";
	}
	
	function phone_click(){
		document.getElementById("user_phone").innerText="휴대폰번호(-없이 입력)";
	}
	function phone_blur(){
		document.getElementById("user_phone").innerText="";
	}
	
	function check(){
		var id = document.getElementById('id').value;
		var pw = document.getElementById('pw').value;
		var pwCheck = document.getElementById('pwCheck').value;
		var nm = document.getElementById('nm').value;
		var email = document.getElementById('email').value;
		var phone = document.getElementById('phone').value;
		var zip = document.getElementById('sample6_postcode').value;
		var detail = document.getElementById('sample6_detailAddress').value;
		if(id == ""){
			document.getElementById("msg").innerText="아이디 입력은 필수입니다.";
			return;
		}
		if(pw == ""){
			document.getElementById("msg").innerText="비밀번호 입력은 필수입니다.";
			return;
		}
		if(nm == ""){
			document.getElementById("msg").innerText="이름 입력은 필수입니다.";
			return;
		}
		if(email == ""){
			document.getElementById("msg").innerText="이메일 입력은 필수입니다.";
			return;
		}
		if(phone == ""){
			document.getElementById("msg").innerText="핸드폰 입력은 필수입니다.";
			return;
		}
		if(zip == ""){
			document.getElementById("msg").innerText="우편번호 입력은 필수입니다.";
			return;
		}
		if(detail == ""){
			document.getElementById("msg").innerText="상세주소 입력은 필수입니다.";
			return;
		}
		if(pw != pwCheck){
			document.getElementById("msg").innerText="비밀번호가 일치하지 않습니다.";
			return;
		}
		
		var idRegex = /^[A-Za-z]{1}[A-Za-z0-9_-]{5,19}$/;
		var pwRegex = /(?=.*\d)(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,19}/;
		var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var phoneRegex = /^[0-9]{11,11}$/;
		
		var idr = idRegex.test(id);
		var pwr = pwRegex.test(pw);
		var emailr = emailRegex.test(email);
		var phoner = phoneRegex.test(phone);
		
		if(idr === false){
			document.getElementById("msg").innerText="아이디가 형식에 맞지 않습니다.";
			return;
		}
		if(pwr === false){
			document.getElementById("msg").innerText="비밀번호가 형식에 맞지 않습니다.";
			return;
		}
		if(emailr === false){
			document.getElementById("msg").innerText="이메일이 형식에 맞지 않습니다.";
			return;
		}
		if(phoner === false){
			document.getElementById("msg").innerText="핸드폰번호가 형식에 맞지 않습니다.";
			return;
		}

		document.getElementById('f').submit();
	}
	
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}