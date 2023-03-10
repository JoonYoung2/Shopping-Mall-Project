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

<!-- admin_prdt list -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/admin_prdtList/css/styles.css" rel="stylesheet" />
<!-- admin_prdt list -->

<link href="resources/main_templates/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
</head>
<body>
	<%@ include file="../adminFixBar/navbar.jsp"%>
	<section class="page-section bg-light" id="services">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">ADMIN</h2>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					
					
					<p class="text-muted" style="font-size:20px;">Prodeuct List</p>
					<a href="/tablePrdt" class="btn btn-secondary btn-lg btn-block">상품목록</a>
				</div>
				<div class="col-md-4">
					
					
					<p class="text-muted" style="font-size:20px;">Q&A List</p>
					<a href="/tableQna" class="btn btn-secondary btn-lg btn-block">Q&A목록</a>
				</div>
				<div class="col-md-4">
					
					
					<p class="text-muted" style="font-size:20px;">Member List</p>
					<a href="/tableMember" class="btn btn-secondary btn-lg btn-block">회원목록</a>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../adminFixBar/footer.jsp"%>


	<!-- admin_prdt list -->
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="resources/admin_prdtList/js/datatables-simple-demo.js"></script>
	<!-- admin_prdt list -->
</body>
</html>