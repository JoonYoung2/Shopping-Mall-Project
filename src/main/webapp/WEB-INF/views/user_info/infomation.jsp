<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Joon - shop</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/main_templates/assets/favicon.ico" />
<!-- Font Awesome icons (free version) -->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<c:url var="context" value="/" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="resources/main_templates/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>
</head>
</head>
<body>
	<%@ include file="../user_infoFixBar/navbar.jsp"%>
	<c:if test="${member.loginType eq 1 || member.loginType eq 3 }">
	<section class="page-section bg-light" id="register">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">개인정보</h2>
				<h3 class="section-subheading text-muted">Enter your
					information!</h3>
				<font color="red"> ${msg }</font>
			</div>
			<div class="container">
				<!-- register -->
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto">
						<h4 class="mb-3">수정하기</h4>
						<form class="validation-form" novalidate action="infoUpdate"
							method="post">
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="id">아이디</label> <input type="text"
										class="form-control" name="user_id" placeholder=""
										value="${member.user_id }" readonly="readonly" oninput="test(this.value)">
									<p id="check_id"></p>
								</div>
								<div class="col-md-6 mb-3">
									<label for="name">핸드폰</label> <input type="text"
										class="form-control" name="user_phoneNum"
										placeholder="(-제외 ex.01012345678)"
										value="${member.user_phoneNum }" required>
									<div class="invalid-feedback">핸드폰 번호를 입력해주세요(-제외)</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="name">이름</label> <input type="text"
										class="form-control" name="user_nm" placeholder=""
										value="${member.user_nm }" required>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="email">이메일</label> <input type="email"
										class="form-control" name="user_email"
										value="${member.user_email }" placeholder="you@example.com"
										required>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_postcode" placeholder="우편번호"
										value="${member.zip_cd }" name="zip_cd" readonly="readonly">
								</div>
								<div class="col-md-7 mb-3">
									<input type="button" onclick="sample6_execDaumPostcode()"
										value="우편번호 찾기"><br>
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_address" placeholder="주소"
										name="address_info" value="${member.address_info }"
										readonly="readonly"><br>
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_detailAddress"
										placeholder="상세주소" name="address_detail"
										value="${member.address_detail }">
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_extraAddress" placeholder="참고항목"
										readonly="readonly">
								</div>
							</div>
							<hr class="mb-4">
							<div class="mb-4"></div>
							<button class="btn btn-primary btn-lg btn-block" type="submit">수정
								하기</button>
						</form>
					</div>
					<footer class="my-3 text-center text-small"> </footer>
				</div>
			</div>
		</div>
	</section>
	</c:if>
	<c:if test="${member.loginType eq 2 }">
	<section class="page-section bg-light" id="register">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">개인정보</h2>
				<h3 class="section-subheading text-muted">Enter your
					information!</h3>
				<font color="red"> ${msg }</font>
			</div>
			<div class="container">
				<!-- register -->
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto">
						<h4 class="mb-3">수정하기</h4>
						<form class="validation-form" novalidate action="kakao_infoUpdate"
							method="post">
							<div class="row">
								<input type="hidden"
										class="form-control" name="user_id" placeholder=""
										value="${member.user_id }" oninput="test(this.value)">
									
								<div class="col-md-6 mb-3">
									<label for="name">핸드폰</label> <input type="text"
										class="form-control" name="user_phoneNum"
										placeholder="(-제외 ex.01012345678)"
										value="${member.user_phoneNum }" required>
									<div class="invalid-feedback">핸드폰 번호를 입력해주세요(-제외)</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="name">이름</label> <input type="text"
										class="form-control" name="user_nm" placeholder=""
										value="${member.user_nm }" required>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="email">이메일</label> <input type="email"
										class="form-control" name="user_email"
										value="${member.user_email }" placeholder="you@example.com"
										required>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_postcode" placeholder="우편번호"
										value="${member.zip_cd }" name="zip_cd" readonly="readonly">
								</div>
								<div class="col-md-7 mb-3">
									<input type="button" onclick="sample6_execDaumPostcode()"
										value="우편번호 찾기"><br>
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_address" placeholder="주소"
										name="address_info" value="${member.address_info }"
										readonly="readonly"><br>
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_detailAddress"
										placeholder="상세주소" name="address_detail"
										value="${member.address_detail }">
								</div>
								<div class="col-md-7 mb-3">
									<input type="text" id="sample6_extraAddress" placeholder="참고항목"
										readonly="readonly">
								</div>
							</div>
							<hr class="mb-4">
							<div class="mb-4"></div>
							<button class="btn btn-primary btn-lg btn-block" type="submit">수정
								하기</button>
						</form>
					</div>
					<footer class="my-3 text-center text-small"> </footer>
				</div>
			</div>
		</div>
	</section>
	</c:if>
	<%@ include file="../user_infoFixBar/footer.jsp"%>
</body>
</html>