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
</head>
<body>
	<%@ include file="../user_prdtFixBar/navbar.jsp"%>
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-9">
					<c:forEach var="datas" items="${datas }">
						<div class="container px-4 px-lg-5 my-5">
							<div class="row gx-4 gx-lg-5 align-items-center">
								<div class="col-md-4">
									<img class="card-img-top mb-5 mb-md-0"
										src="resources/upload/${datas.prdt_id }/${datas.img_id}"
										alt="..." />
								</div>
								<div class="col-md-4">
									<h1 class="display-5 fw-bolder">${datas.prdt_title }</h1>
									<div class="fs-5 mb-5">
										<span class="text-decoration-line-through"> <!-- sale price -->
										</span> <span>가격 : ${datas.prdt_price }원</span>
									</div>
									<div class="fs-5 mb-5">
										<span class="text-decoration-line-through"> <!-- sale price -->
										</span> <span>색상 : ${datas.prdt_color }</span>
									</div>

								</div>
								<div class="col-md-4">
									<div class="fs-5 mb-5">${datas.total_price }원</div>
									<div class="fs-5 mb-5">
										<span class="text-decoration-line-through"> 
											<!-- sale price -->
										</span> 
										<span>수량 <input type="text" value="${datas.addCart_cnt }" readonly="readonly" style="width:15%; text-align:center;"/></span>
									</div>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>
		
				<div class="col-md-3">
				<div class="fs-5 mb-5">장바구니 요약</div>
					<div class="fs-5 mb-5">상품 금액 ${sessionScope.result_price }</div>
					<div class="fs-5 mb-5">합계 ${sessionScope.result_price }</div>
					<button class="btn btn-primary btn-lg btn-block"><a href="/payment?user_id=${sessionScope.user_id }&customer_uid=${sessionScope.user_id }" style="color:white;">결제진행</a></button>
				</div>
				</div>
				</div>

	</section>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>
</body>
</html>