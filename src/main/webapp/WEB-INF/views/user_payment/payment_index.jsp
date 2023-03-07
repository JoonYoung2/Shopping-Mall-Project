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


<!-- 카카오페이 api -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
	<%@ include file="../user_prdtFixBar/navbar.jsp"%>
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-9">
					<div class="container px-4 px-lg-5 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<div class="col-md-4" style="width: 100%;">
								<div class="fs-1 mb-0">결제하기</div>
								<hr class="mb-3" style="margin: 16px 0 8px;">
								<div class="fs-4 mb-1">주문자 정보</div>
								<div class="fs-6 mb-0">이름</div>
								<div class="fs-5 mb-1">${user.user_nm }</div>
								<div class="fs-6 mb-0">이메일</div>
								<div class="fs-5 mb-1">${user.user_email }</div>
								<div class="fs-6 mb-0">휴대폰번호</div>
								<div class="fs-5 mb-1">${user.user_phoneNum }</div>
								<hr class="mb-3" style="margin: 30px 0 8px;">
								<div class="fs-4 mb-1">배송지 정보</div>
								<div class="fs-6 mb-1">${user.user_nm }
									${user.user_phoneNum }</div>
								<div class="fs-6 mb-1">${user.address_info }
									${user.address_detail }</div>
								<hr class="mb-3" style="margin: 30px 0 8px;">
								<div class="fs-4 mb-1">배송시 요청사항</div>
								<textarea style="width: 650px; height: 300px" name="prdt_info"
									placeholder="배송시 요청사항을 입력해주세요."></textarea>

								<hr class="mb-3" style="margin: 16px 0 8px;">

								<c:forEach var="prdts" items="${prdt }">
									<div class="container px-4 px-lg-5 my-5">
										<div class="row gx-4 gx-lg-5 align-items-center">

											<div class="col-md-3">
												<img class="card-img-top mb-3 mb-md-0"
													src="resources/upload/${prdts.prdt_id }/${prdts.img_id}"
													alt="..." />
											</div>

											<div class="col-md-5">
												<a class="fs-6 fw-bolder" style="color: black;">${prdts.prdt_title }</a>
												<div class="fs-6 mb-1">
													<span class="text-decoration-line-through"> <!-- sale price -->
													</span> <span>${prdts.prdt_price }원</span>
												</div>
												<div class="fs-6 mb-1">
													<span>색상 : ${prdts.prdt_color }</span>
												</div>
											</div>

											<div class="col-md-2">
												<div class="fs-6 mb-0">
													<input type="text" value="${prdts.addCart_cnt }"
														readonly="readonly"
														style="width: 40%; text-align: center;" />
												</div>
											</div>

											<div class="col-md-2" style="padding: 0;">
												<div class="fs-6 mb-0" style="font-weight: bold;">${prdts.total_price }원</div>
											</div>


										</div>
									</div>
								</c:forEach>
								<hr class="mb-3" style="margin: 16px 0 8px;">

								<div class="col-md-4 mb-3" style="width: 100%;">
									<div class="fs-4 mb-3">결제 방법</div>
									<input type="radio" name="xxx" value="yyy" checked><span
										style="padding-left: 10px;">카카오페이</span>
								</div>

								<div
									style="padding: 30px; border: 1px solid rgba(0, 0, 0, 0.5);">
									<div class="fs-4 mb-0">
										<span style="font-weight: bold;">결제내용 요약</span>
									</div>
									<hr class="mb-3" style="margin: 16px 0 8px;">
									<div class="fs-6 mb-2"
										style="display: flex; justify-content: space-between;">
										<span style="font-weight: bold;">배송지 정보</span>
									</div>
									<div class="fs-8 mb-1"
										style="display: flex; justify-content: space-between;">${user.user_nm }
										${user.user_phoneNum }</div>
									<div class="fs-8 mb-0"
										style="display: flex; justify-content: space-between;">${user.address_info }
										${user.address_detail }</div>
									<hr class="mb-1" style="margin: 16px 0 8px;">
									<div class="fs-7 mb-0"
										style="display: flex; justify-content: space-between;">상품
										금액</div>
									<c:forEach var="prdts" items="${prdt }">
										<div class="fs-7 mb-0"
											style="display: flex; justify-content: space-between;">${prdts.prdt_nm }<div
												style="text-align: right;">${prdts.total_price }원</div>
										</div>
									</c:forEach>
									<hr class="mb-2" style="margin: 5px 0 8px;">
									<div class="fs-7 mb-3"
										style="display: flex; justify-content: space-between;">
										<span style="font-weight: bold;">결제 예정금액</span>
										<div style="text-align: right; font-weight: bold;">${sessionScope.result_price }원</div>
									</div>
								</div>
								<a id="final-support-submit"
									style="width: 100%; border-color: rgba(0, 0, 0, 1); color: black; font-family: nanum-barun-gothic"
									class="btn btn-outline-dark btn-lg btn-block"
									href="/kakaoPayment?price=${sessionScope.result_price }&jshop=jshop-상품&user_id=${sessionScope.user_id}"
									style="color:white;">${sessionScope.result_price }원 결제하기</a>
							</div>
						</div>
					</div>
				</div>


				<div class="col-md-3">
					<div class="side-fixbar" style="padding: 30px; border: 1px solid rgba(0, 0, 0, 0.5);">
						<div class="fs-4 mb-0">
							<span style="font-weight: bold;">결제내용 요약</span>
						</div>
						<hr class="mb-3" style="margin: 16px 0 8px;">
						<div class="fs-6 mb-2"
							style="display: flex; justify-content: space-between;">
							<span style="font-weight: bold;">배송지 정보</span>
						</div>
						<div class="fs-8 mb-1"
							style="display: flex; justify-content: space-between;">${user.user_nm }
							${user.user_phoneNum }</div>
						<div class="fs-8 mb-0"
							style="display: flex; justify-content: space-between;">${user.address_info }
							${user.address_detail }</div>
						<hr class="mb-1" style="margin: 16px 0 8px;">
						<div class="fs-7 mb-0"
							style="display: flex; justify-content: space-between;">상품
							금액</div>
						<c:forEach var="prdts" items="${prdt }">
							<div class="fs-7 mb-0"
								style="display: flex; justify-content: space-between;">${prdts.prdt_nm }<div
									style="text-align: right;">${prdts.total_price }원</div>
							</div>
						</c:forEach>
						<hr class="mb-2" style="margin: 5px 0 8px;">
						<div class="fs-7 mb-3"
							style="display: flex; justify-content: space-between;">
							<span style="font-weight: bold;">결제 예정금액</span>
							<div style="text-align: right; font-weight: bold;">${sessionScope.result_price }원</div>
						</div>
						<a id="final-support-submit"
							style="width: 100%; border-color: rgba(0, 0, 0, 1); color: black; font-family: nanum-barun-gothic"
							class="btn btn-outline-dark btn-lg btn-block"
							href="/kakaoPayment?price=${sessionScope.result_price }&jshop=jshop-상품&user_id=${sessionScope.user_id}"
							style="color:white;">${sessionScope.result_price }원 결제하기</a>
					</div>
				</div>
			</div>
		</div>

	</section>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>
</body>
</html>