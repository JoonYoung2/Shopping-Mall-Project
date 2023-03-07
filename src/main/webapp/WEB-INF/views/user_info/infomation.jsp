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
	href="resources/main_templates/assets/j-letter-37763.png" />
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
					<font color="red" id="msg"> ${msg }</font>
					<div class ="mb-3"></div>
				</div>
				<div class="container">
					<!-- register -->
					<div class="row">
						<div class="col-lg-4 col-sm-3 mb-4"></div>
						<div class="col-lg-4 col-sm-6 mb-4">
							<div class="input-form-backgroud row">
								<div class="input-form col-md-12 mx-auto">
									<!-- 									<h4 class="mb-3">수정하기</h4> -->
									<form class="validation-form" novalidate action="infoUpdate"
										id="f" method="post">
										<div class="row">
											<div class="col-md-12 mb-3">
												<input type="text" class="form-control" name="user_id"
													onkeydown="id_click();" onblur="id_blur();" id="id"
													placeholder="" value="${member.user_id }"
													readonly="readonly" oninput="test(this.value)"> <span
													id="user_id" style="color: red"></span>

											</div>
											<div class="col-md-12 mb-3">
												<input type="text" class="form-control" name="user_phoneNum"
													onkeydown="phone_click();" onblur="phone_blur();"
													id="phone" placeholder="휴대폰번호(-없이 입력)"
													value="${member.user_phoneNum }" required> <span
													id="user_phone" style="color: red"></span>
											</div>
											<div class="col-md-12 mb-3">
												<input type="text" class="form-control" name="user_nm"
													id="nm" placeholder="이름" value="${member.user_nm }"
													required>
											</div>
											<div class="col-md-12 mb-3">
												<input type="email" class="form-control" name="user_email"
													onkeydown="email_click();" onblur="email_blur();"
													id="email" value="${member.user_email }" placeholder="이메일"
													required> <span id="user_email" style="color: red"></span>
											</div>
											<div class="col-md-6 mb-3">
												<input type="text" id="sample6_postcode" placeholder="우편번호"
													value="${member.zip_cd }" name="zip_cd" readonly="readonly">
											</div>
											<div class="col-md-6 mb-3">
												<input type="button" onclick="sample6_execDaumPostcode()"
													value="우편번호 찾기"><br>
											</div>
											<div class="col-md-7 mb-3">
												<input type="text" id="sample6_address" placeholder="주소"
													name="address_info" value="${member.address_info }"
													readonly="readonly"><br>
											</div>
											<div class="col-md-7 mb-1">
												<input type="text" id="sample6_detailAddress"
													placeholder="상세주소" name="address_detail"
													value="${member.address_detail }">
											</div>
											<div class="col-md-7 mb-1">
												<input type="hidden" id="sample6_extraAddress"
													placeholder="참고항목" readonly="readonly">
											</div>
										</div>
										<hr class="mb-4">

										<input class="btn btn-secondary btn-lg btn-block"
											style="width: 49%;" type="button" value="수정 하기"
											onclick="check();"> <a
											class="btn btn-secondary btn-lg btn-block"
											style="width: 49%;" onclick="window.history.back()">뒤로가기</a>
									</form>
								</div>
							</div>



						</div>
						<div class="col-lg-4 col-sm-3 mb-4"></div>

					</div>
				</div>
			</div>
		</section>
		<script src="resources/infoUpdate/regex.js"></script>
	</c:if>
	<c:if test="${member.loginType eq 2 }">
		<section class="page-section bg-light" id="register">
			<div class="container">
				<div class="text-center">
					<h2 class="section-heading text-uppercase">개인정보</h2>
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
									<!-- 									<h4 class="mb-3">수정하기</h4> -->
									<form class="validation-form" id="f" action="kakao_infoUpdate"
										method="post">
										<div class="row">
											<input type="hidden" class="form-control" name="user_id"
												placeholder="" value="${member.user_id }"
												oninput="test(this.value)">

											<div class="col-md-12 mb-3">
												<input type="text" class="form-control" name="user_phoneNum"
													onkeydown="phone_click();" onblur="phone_blur();"
													id="phone" placeholder="휴대폰번호(-없이 입력)"
													value="${member.user_phoneNum }" required> <span
													id="user_phone" style="color: red"></span>
											</div>
											<div class="col-md-12 mb-3">
												<input type="text" class="form-control" name="user_nm"
													id="nm" placeholder="이름" value="${member.user_nm }"
													required>
											</div>
											<div class="col-md-12 mb-3">
												<input type="email" class="form-control" name="user_email"
													onkeydown="email_click();" onblur="email_blur();"
													id="email" value="${member.user_email }" placeholder="이메일"
													required> <span id="user_email" style="color: red"></span>
											</div>
											<div class="col-md-6 mb-3">
												<input type="text" id="sample6_postcode" placeholder="우편번호"
													value="${member.zip_cd }" name="zip_cd" readonly="readonly">
											</div>
											<div class="col-md-6 mb-3">
												<input type="button" onclick="sample6_execDaumPostcode()"
													value="우편번호 찾기"><br>
											</div>
											<div class="col-md-7 mb-3">
												<input type="text" id="sample6_address" placeholder="주소"
													name="address_info" value="${member.address_info }"
													readonly="readonly"><br>
											</div>
											<div class="col-md-7 mb-1">
												<input type="text" id="sample6_detailAddress"
													placeholder="상세주소" name="address_detail"
													value="${member.address_detail }">
											</div>
											<div class="col-md-7 mb-1">
												<input type="hidden" id="sample6_extraAddress"
													placeholder="참고항목" readonly="readonly">
											</div>
										</div>
										<hr class="mb-4">
										<input class="btn btn-secondary btn-lg btn-block"
											style="width: 49%;" type="button" onclick="check();"
											value="수정 하기"> <a
											class="btn btn-secondary btn-lg btn-block"
											style="width: 49%;" onclick="window.history.back()">뒤로가기</a>
									</form>
								</div>
								<footer class="my-3 text-center text-small"> </footer>
							</div>

						</div>
						<div class="col-lg-4 col-sm-3 mb-4"></div>
					</div>

				</div>
			</div>
		</section>
		<script src="resources/infoUpdate/kakaoRegex.js"></script>
	</c:if>
	<%@ include file="../user_infoFixBar/footer.jsp"%>
</body>
</html>