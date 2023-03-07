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
<body>
	<%@ include file="../user_infoFixBar/navbar.jsp"%>
	<c:if
		test="${sessionScope.loginType eq 1 || sessionScope.loginType eq 3}">
		<section class="page-section bg-light" id="register">
			<div class="container">
				<div class="text-center">
					<h2 class="section-heading text-uppercase">개인정보</h2>
					<h3 class="section-subheading text-muted">Enter your
						information!</h3>
					<font color="red"> ${msg }</font>
					<div class="mb-3"></div>
				</div>
				<div class="container">
					<!-- register -->
					<div class="row">
						<div class="col-lg-4 col-sm-3 mb-4"></div>
						<div class="col-lg-4 col-sm-6 mb-4">
							<div class="input-form-backgroud row">
								<div class="input-form col-md-12 mx-auto">
									
									<form class="validation-form" novalidate action="/infoDelete"
										method="post">
										<div class="row">
											<input type="hidden" name="sessionId"
												value="${sessionScope.user_id }" />
											<div class="col-md-12 mb-3">
												<input type="text" class="form-control" name="user_id"
													placeholder="아이디" value="" oninput="test(this.value)">
											</div>
											<div class="col-md-12 mb-1">
												<input type="password" class="form-control" name="user_pw"
													placeholder="비밀번호" value="" required>
											</div>
										</div>
										<hr class="mb-4">
										<button class="btn btn-secondary btn-lg btn-block"
											style="width: 49%;" type="submit">탈퇴 하기</button>
										<a class="btn btn-secondary btn-lg btn-block"
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
	</c:if>
	<c:if test="${sessionScope.loginType eq 2}">
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
					<div class="row">
						<div class="col-lg-4 col-sm-3 mb-4"></div>
						<div class="col-lg-4 col-sm-6 mb-4">
							<div class="input-form-backgroud row">
								<div class="input-form col-md-12 mx-auto">
									<a class="btn btn-secondary btn-lg btn-block" style="width:49%;"
										href="https://kauth.kakao.com/oauth/logout?client_id=8558b06f798d38a90a338f54282456f2&logout_redirect_uri=http://127.0.0.1:8080/kakao_infoDelete">
										탈퇴하기 </a> <a class="btn btn-secondary btn-lg btn-block"
										onclick="window.history.back()" style="width:49%;">뒤로가기</a>
								</div>
								<footer class="my-3 text-center text-small"> </footer>
							</div>

						</div>
						<div class="col-lg-4 col-sm-3 mb-4"></div>
					</div>
				</div>
			</div>
		</section>
	</c:if>
	<%@ include file="../user_infoFixBar/footer.jsp"%>
</body>
</html>