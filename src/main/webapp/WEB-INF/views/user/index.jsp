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
<link href="resources/main_templates/css/styles.css" rel="stylesheet" />
 
<!-- prdt_slide -->
<!-- <link href="resources/prdt_slide/vendor/bootstrap/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet"> -->

<link rel="stylesheet"
	href="resources/prdt_slide/asset/css/fontawesome.css">
<link rel="stylesheet"
	href="resources/prdt_slide/asset/css/templatemo-tale-seo-agency.css">
<link rel="stylesheet" href="resources/prdt_slide/asset/css/owl.css">
<link rel="stylesheet" href="resources/prdt_slide/asset/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- prdt_slide -->


<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
</head>
<body id="page-top">

	<%@ include file="../userFixBar/navbar.jsp"%>

	<section class="page-section" id="top">
		<div class="projects section" id="projects">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="owl-features owl-carousel">
							<c:forEach var="prdt" items="${prdts }">
								<c:if test="${prdt.prdt_list == 1}">
									<div class="item">
										<img src="resources/upload/${prdt.prdt_id}/${prdt.img_id}" 
											alt="">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- new -->
	<section class="page-section bg-light" id="new">
		<div class="container">
			<div class="text-center">
				<h3 class="section-subheading text-muted">NEW ARRIVALS</h3>
			</div>
			<div class="row">
				<c:forEach var="prdt" items="${prdts }">
					<c:if test="${prdt.prdt_list == 2}">
						<div class="col-lg-3 col-sm-6 mb-4">
							<!-- prdt item 1-->
							<div class="portfolio-item">
								<a class="portfolio-link"
									href="/prdt_index?prdt_id=${prdt.prdt_id }"> <img
									class="img-fluid"
									src="resources/upload/${prdt.prdt_id }/${prdt.img_id}"
									alt="..." />
								</a>
								<div class="portfolio-caption">
									<div class="portfolio-caption-heading"
										style="text-align: center;">${prdt.prdt_title }</div>
									<div class="portfolio-caption-subheading text-muted"
										style="text-align: center;">
										<span class="text-muted text-decoration-line-through">
											<!-- sale price -->
										</span> ${prdt.prdt_price }윈
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- best-->
	<section class="page-section" id="best">
		<div class="container">
			<div class="text-center">
				<h3 class="section-subheading text-muted">BEST ARRIVALS</h3>
			</div>
			<div class="row">
				<c:forEach var="prdt" items="${prdts }">
					<c:if test="${prdt.prdt_list == 3}">
						<div class="col-lg-3 col-sm-6 mb-4">
							<!-- prdt item 1-->
							<div class="portfolio-item">
								<a class="portfolio-link"
									href="/prdt_index?prdt_id=${prdt.prdt_id }"> <img
									class="img-fluid"
									src="resources/upload/${prdt.prdt_id }/${prdt.img_id}"
									alt="..." />
								</a>
								<div class="portfolio-caption">
									<div class="portfolio-caption-heading"
										style="text-align: center;">${prdt.prdt_title }</div>
									<div class="portfolio-caption-subheading text-muted"
										style="text-align: center;">
										<span class="text-muted text-decoration-line-through">
											<!-- sale price -->
										</span> ${prdt.prdt_price }윈
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- all -->
	<section class="page-section bg-light" id="all">
		<div class="container">
			<div class="text-center">
				<h3 class="section-subheading text-muted">ALL ARRIVALS</h3>
			</div>
			<div class="row">
				<c:forEach var="prdt" items="${prdts }">
					<div class="col-lg-3 col-sm-6 mb-4">
						<!-- Portfolio item 1-->
						<div class="portfolio-item">
							<a class="portfolio-link"
								href="/prdt_index?prdt_id=${prdt.prdt_id }"> <img
								class="img-fluid"
								src="resources/upload/${prdt.prdt_id }/${prdt.img_id}" alt="..." />
							</a>
							<div class="portfolio-caption">
								<div class="portfolio-caption-heading"
									style="text-align: center;">${prdt.prdt_title }</div>
								<div class="portfolio-caption-subheading text-muted"
									style="text-align: center;">
									<span class="text-muted text-decoration-line-through"> 
										<!-- sale price -->
									</span> ${prdt.prdt_price }윈
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@ include file="../userFixBar/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!--         <script src="resources/js/scripts.js"></script> -->
<!-- 	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->





	<!-- 222222222222222222 -->
	<script src="resources/prdt_slide/vendor/jquery/jquery.min.js"></script>
	

	<!--   <script src="resources/asset/js/isotope.min.js"></script> -->
	<script src="resources/prdt_slide/asset/js/owl-carousel.js"></script>
<!-- 	<script src="resources/prdt_slide/asset/js/tabs.js"></script> -->
<!-- 	<script src="resources/prdt_slide/asset/js/popup.js"></script> -->
	<script src="resources/prdt_slide/asset/js/custom.js"></script>
</body>
</html>
