<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Joon - shop</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/main_templates/assets/j-letter-37763.png" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<c:url var="context" value="/" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="resources/main_templates/css/styles.css" rel="stylesheet" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- sign up-->
	<section class="page-section bg-light" id="register">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">sign-up</h2>
				<h3 class="section-subheading text-muted">Enter your
					information!</h3>
				<font color="red" id="msg"> ${msg }</font>
			</div>
			<div class="container">
				<!-- register -->
				<div class="row">
					<div class="col-lg-4 col-sm-3 mb-4"></div>
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="input-form-backgroud row">
							<div class="input-form col-md-12 mx-auto">
							<div class="mb-3"></div>
<!-- 								<h4 class="mb-3">회원가입</h4> -->
								<form class="validation-form" novalidate action="kakao_register" id="f"
									method="post">

									<div class="row">

										<input type="hidden" class="form-control" name="user_id"
											placeholder="" value="${msg1 }" required> <input
											type="hidden" class="form-control" name="user_nm"
											placeholder="" value="${msg2 }" required>

										<div class="col-md-12 mb-3">
											<input type="email" class="form-control" name="user_email" onkeydown="email_click();" onblur="email_blur();" id="email"
												placeholder="이메일" required>
											<span id="user_email"
												style="color: red"></span>
										</div>
										<div class="col-md-12 mb-3">
											<input type="text" class="form-control" name="user_phoneNum" onkeydown="phone_click();" onblur="phone_blur();" id="phone"
												placeholder="휴대폰번호(-없이 입력)" value="" required>
											<span id="user_phone"
												style="color: red"></span>
										</div>
										<div class="col-md-6 mb-3">
											<input type="text" id="sample6_postcode" placeholder="우편번호"
												name="zip_cd" readonly="readonly">
										</div>
										<div class="col-md-6 mb-3">
											<input type="button" onclick="sample6_execDaumPostcode()"
												value="우편번호 찾기"><br>
										</div>
										<div class="col-md-7 mb-3">
											<input type="text" id="sample6_address" placeholder="주소"
												name="address_info" readonly="readonly"><br>
										</div>
										<div class="col-md-7 mb-3">
											<input type="text" id="sample6_detailAddress"
												placeholder="상세주소" name="address_detail">
										</div>
										<div class="col-md-7 mb-1">
											<input type="hidden" id="sample6_extraAddress"
												placeholder="참고항목" readonly="readonly">
										</div>
									</div>
									<hr class="mb-4">
									<input class="btn btn-secondary btn-lg btn-block" type="button"
										value="가입 하기" onclick="check();">
									<!--           <p>이미 가입하셨다면? <a href="login" style="text-decoration: none;">로그인하러 가기</a></p> -->
								</form>
							</div>
						</div>


					</div>
					<div class="col-lg-4 col-sm-3 mb-4"></div>
				</div>
			</div>
		</div>
		<script src="resources/register/kakaoRegex.js"></script>
		<!-- <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script> -->
	</section>
	<%@ include file="../userFixBar/footer.jsp"%>