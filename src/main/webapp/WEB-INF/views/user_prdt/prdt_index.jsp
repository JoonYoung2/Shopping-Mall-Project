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
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="resources/upload/${datas.prdt_id }/${datas.img_id}" alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">Product : ${datas.prdt_nm }</div>
					<h5 class="display-8 fw-bolder">${datas.prdt_title }</h5>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through"> <!-- sale price -->
						</span> <span>${datas.prdt_price }원</span>
					</div>
					<p class="lead mb-5" style="font-size: 15px;">${datas.prdt_info }</p>
					<c:if test="${sessionScope.loginType eq '' || sessionScope.loginType eq null }">
							<div class="fs-8">상품 구매는 로그인 후 이용가능합니다.</div>
							<div>로그인 후 이용하려면? <a href="login" style="text-decoration: none;">로그인하러 가기</a></div>
						</c:if>
					<div class="d-flex">
						<c:if
							test="${sessionScope.loginType eq 1 || sessionScope.loginType eq 2 || sessionScope.loginType eq 3}">
							<form action="addCart" method="post">
								<input type="hidden" name="prdt_id" value="${datas.prdt_id }" />
								<div class="number-input">
									<div
										onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></div>
									<sqan style="padding-left:100px;"></sqan>
									<input type="hidden" name="prdt_price"
										value="${datas.prdt_price }" /> <input type="hidden"
										name="user_id" value="${sessionScope.user_id}" /> <input
										class="quantity" id="inputQuantity" name="addCart_cnt"
										type="number" value="1" min="1" max="99" step="1"
										style="max-width: 20rem" />
									<sqan style="padding-left:100px;"></sqan>
									<div
										onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
										class="plus"></div>
								</div>
								<br>
								<!-- 								<button class="btn btn-outline-dark flex-shrink-0" type="submit"> -->
								<button class="btn btn-primary btn-lg btn-block" style="width:100%" type="submit">
									<i class="bi-cart-fill me-1"></i> 장바구니 담기
								</button><br>
								<a class="btn btn-outline-dark btn-lg btn-block" style="width:100%; border-color:rgba(255, 200, 0, 1);" href="cartInfo?user_id=${sessionScope.user_id }"><i class="bi-cart-fill me-1"></i>장바구니 보기</a>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section bg-light" id="services">
		<div class="container">
			<div class="text-left">
				<h4 class="section-heading text-uppercase">배송안내</h4>
			</div>
			<div class="row text-left">
				<div class="col-md-12">
					<h5 class="my-3">
						※ <span style="color: red;">필독</span> ※ 주문 전 아래 공지사항을 확인후 주문
						부탁드립니다.
					</h5>
					<p class="text-muted">
						<b>국내 일반 배송</b><br> <span style="padding-left: 10px">배송비용
							: 무료</span><br> <span style="padding-left: 10px">배송기간 : 3일 ~
							7일</span><br> <b>주문시 유의사항</b><br> - 이벤트 (세일) 기간 내 주문의 경우에는 기본
						배송일 이상 소요되며, 이벤트 종료 이후 순차 배송됩니다.<br> - 공급처 사정으로 인하여 지연 및 품절이
						발생될 수 있습니다.<br> - '주문폭주', '인기상품'의 경우 기본 배송기간 이상 소요됩니다.<br>
						- 기본 배송기간 이상 소요되는 상품이거나, 품절된 상품은 개별 연락 드리겠습니다.
					</p>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section" id="services">
		<div class="container">
			<div class="text-left">
				<h4 class="section-heading text-uppercase">교환 / 반품 안내</h4>
			</div>
			<div class="row text-left">
				<div class="col-md-12">
					<p class="text-muted">
						* 주문 이후 배송전/후 상품 추가 및 타상품 교환은 불가합니다.<br> * 상품 추가,변경(교환)을
						원하신다면 취소 / 반품 후 신규 주문 부탁드립니다.<br> <br> <b>교환∙반품시
							유의사항</b><br> <br> 단순 변심의 경우 수령일로부터 7일 이내까지 교환∙반품이 가능합니다
						(교환∙반품비 고객님 부담)<br> 상품 하자, 오배송의 경우 수령일로부터 3개월 이내, 그 사실을 알 수
						있었던 날로부터 30일 이내까지 교환∙반품이 가능합니다<br> (교환∙반품비 무료(판매자 부담)<br>
						네이버페이 결제주문은 동일상품/동일옵션 교환만 가능합니다.<br> <br> <b>단, 다음의
							경우에는 교환∙반품 가능기간에도 불구하고 거절될 수 있습니다.</b><br> <br> - 고객님의 책임
						있는 사유로 제품이 멸실 또는 훼손된 경우<br> - 고객님의 사용 또는 일부 소비에 의하여 제품의 가치가
						현저히 감소한 경우<br> - 시간의 경과에 의하여 재판매가 곤란할 정도로 제품의 가치가 현저히 감소한 경우<br>
						- 고객님의 주문에 따라 개별적으로 생산되는 제품의 경우<br> <br> <b>교환∙반품 방법</b><br>
						<br> 교환∙반품 가능기간 이내에 아래 문의처로 접수 부탁드립니다.<br> (미접수 시 별도의 확인
						시간이 소요될 수 있습니다.)<br> 보내주실 때 받아보신 그대로 포장하시면 방문하여 회수합니다.<br>

						교환∙반품 배송비는 단순 변심의 경우 고객님 부담, 상품 하자 및 오배송의 경우 저희가 부담합니다.<br>

						배송비를 입금하시는 경우 꼭 주문자 성함으로 입금해 주시기 바랍니다.<br>
					</p>
				</div>
			</div>
		</div>
	</section>
	<span style="padding-left: 10px"></span>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>
</body>
</html>