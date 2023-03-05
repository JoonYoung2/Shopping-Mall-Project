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
	<%@ include file="../user_prdtFixBar/navbar.jsp"%>
	<c:if test="${sessionScope.totalCart_cnt > 0 }">
		<section class="py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center side-fixbar2">
					<div class="col-md-9">
						<c:forEach var="datas" items="${datas }">
							<div class="container px-4 px-lg-5 my-5">
								<div class="row gx-4 gx-lg-5 align-items-center">

									<div class="col-md-4">
										<img class="card-img-top mb-3 mb-md-0"
											src="resources/upload/${datas.prdt_id }/${datas.img_id}"
											alt="..." />
									</div>

									<div class="col-md-5">
										<a class="fs-5 fw-bolder" style="color: black;">${datas.prdt_title }</a>
										<div class="fs-5 mb-1">
											<span class="text-decoration-line-through"> <!-- sale price -->
											</span> <span>${datas.prdt_price }원</span>
										</div>
										<div class="fs-5 mb-1">
											<span>색상 : ${datas.prdt_color }</span>
										</div>
										<div class="fs-5 mb-7">
											<form action="/cartDelete" method="post">
												<input type="hidden" name="prdt_id"
													value="${datas.prdt_id }" /> <input type="hidden"
													name="user_id" value="${datas.user_id }" />
												<button class="btn btn-outline-dark btn-lg btn-block"
													type="submit" style="padding-left: 0;">삭제</button>
											</form>
										</div>
										<div style="height: 100px;"></div>
									</div>

									<div class="col-md-3">
										<div class="fs-5 mb-0"
											style="text-align: right; font-weight: bold;">${datas.total_price }원</div>
										<div class="fs-5 mb-0" style="text-align: right;">
											<input type="text" value="${datas.addCart_cnt }"
												readonly="readonly" style="width: 40%; text-align: center;" />
										</div>
										<div style="height: 220px;"></div>
									</div>


								</div>
							</div>
						</c:forEach>
					</div>

					<div class="col-md-3">
						<div class="side-fixbar" style="padding: 30px; border: 1px solid rgba(0, 0, 0, 0.5);">
						<div class="fs-7 mb-0">
							<span style="font-weight: bold;">장바구니 요약</span>
						</div>
						<hr class="mb-1" style="margin: 16px 0 8px;">
						<div class="fs-7 mb-0"
							style="display: flex; justify-content: space-between;">상품
							금액</div>
						<c:forEach var="datas" items="${datas }">
							<div class="fs-7 mb-0"
								style="display: flex; justify-content: space-between;">${datas.prdt_nm }<div
									style="text-align: right;">${datas.total_price }원</div>
							</div>
						</c:forEach>
						<hr class="mb-2" style="margin: 5px 0 8px;">
						<div class="fs-7 mb-3"
							style="display: flex; justify-content: space-between;">
							<span style="font-weight: bold;">합계</span>
							<div style="text-align: right; color: red; font-weight: bold;">${sessionScope.result_price }원</div>
						</div>
						<a class="btn btn-outline-dark btn-sm btn-block"
							href="/payment?user_id=${sessionScope.user_id }&customer_uid=${sessionScope.user_id }"
							style="width: 100%; border-color: rgba(0, 0, 0, 1); color: black; font-family: nanum-barun-gothic">결제진행</a>
					</div>
					</div>
				</div>
			</div>

		</section>
	</c:if>
	<c:if test="${sessionScope.totalCart_cnt < 1 }">
		<section class="py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<img class="card-img-top mb-3 mb-md-0" src="resources/empty.png"
							alt="..." />
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</section>
	</c:if>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>
</body>
</html>