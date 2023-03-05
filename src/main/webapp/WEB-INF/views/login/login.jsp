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
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- login-->
	<section class="page-section bg-light" id="login">

		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">login</h2>
				<h3 class="section-subheading text-muted">After login, you can
					use.</h3>
				<font color="red"> ${msg }</font>
			</div>
			<!-- login-form -->
			<div class="row">
				<div class="col-lg-4 col-sm-3 mb-4"></div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
						<div class="mb-4"></div>
<!-- 							<h4 class="mb-3">로그인</h4> -->
							<form class="validation-form" novalidate action="login_2"
								method="post">
								<div class="row">
									<div class="col-md-12 mb-1">
<!-- 										<label for="id">ID</label>  -->
										<input type="text"
											class="form-control" name="user_id" placeholder="아이디" value=""
											required>
										<div class="invalid-feedback">아이디를 입력해주세요.</div>
									</div>
									<div class="col-md-12 mb-1">
<!-- 										<label for="password">PASSWORD</label>  -->
										<input type="password"
											class="form-control" name="user_pw" placeholder="비밀번호" value=""
											required>
										<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
									</div>
								</div>
								
								<div class="mb-2"></div>
								
								<button class="btn btn-secondary btn-sm btn-block" type="submit">로그인</button>
								<a class="btn btn-primary btn-sm btn-block" 
									href="https://kauth.kakao.com/oauth/authorize?client_id=8558b06f798d38a90a338f54282456f2&redirect_uri=http://127.0.0.1:8080/kakao_login&response_type=code">카카오
									로그인</a>
									<div class="mb-2"></div>
								<div style="text-align:right;">
									<a href="register">회원가입</a>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-3 mb-4"></div>
			</div>
		</div>

	</section>
	<%@ include file="../userFixBar/footer.jsp"%>