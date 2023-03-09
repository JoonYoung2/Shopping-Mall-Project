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
</head>
<body>
	<%@ include file="../user_infoFixBar/navbar.jsp"%>
	<section class="page-section bg-light" id="services">
		<div class="container">
			<div class="text-center">
				<h3 class="section-subheading text-muted">INFOMATION</h3>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">My Order</h4>
					<p class="text-muted">주문 내역을 확인할 수 있습니다.</p>
					<form action='/orders' method='post'>
						<input type='hidden' name='user_id'
							value='${sessionScope.user_id }' />
						<button class="btn btn-primary btn-lg btn-block" type="submit">나의
							주문</button>
					</form>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-lock fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">My Privacy</h4>
					<p class="text-muted">이름, 주소, 비밀번호 등을 수정할 수 있습니다.</p>
					<form action='/info' method='post'>
						<input type='hidden' name='user_id'
							value='${sessionScope.user_id }' />
						<button class="btn btn-primary btn-lg btn-block" type="submit">나의
							정보</button>
					</form>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-laptop fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">Delete</h4>
					<p class="text-muted">계정을 삭제할 수 있습니다.</p>
					<a class="btn btn-primary btn-lg btn-block" href="/infoDelete">회원탈퇴</a>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../user_infoFixBar/footer.jsp"%>
</body>
</html>