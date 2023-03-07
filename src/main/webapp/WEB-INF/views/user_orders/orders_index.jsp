<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");
%>
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
	<section class="page-section" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-sm-3 mb-4"></div>
				<div class="col-lg-8 col-sm-6 mb-4">
					<table border='1' style="width: 100%;">
						<thead>
							<tr>
								<th colspan="2" style="border-bottom: solid 1px;"><div
										style="text-align: center;">상품</div></th>
								<th style="border-bottom: solid 1px;"><div
										style="text-align: center;">수량</div></th>
								<th style="border-bottom: solid 1px;"><div
										style="text-align: center;">금액</div></th>
								<th style="border-bottom: solid 1px;"><div
										style="text-align: center;">주문일</div></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${datas }">

								<tr>

									<td colspan="2">
										<div class="order_table">
											<div class="text_black" style="text-align: center;">
												<a href="/prdt_index?prdt_id=${data.prdt_id }"><img
													style="width: 170px; height: 200px;"
													src="resources/upload/${data.prdt_id }/${data.img_id}"
													alt="..." /> </a>
											</div>
											<div style="padding-left: 20px; padding-top: 60px;"
												class="text_black" style="text-align: left;">
												${data.prdt_title }<br> 가격 : ${data.prdt_price }<br>
												색상 : ${data.prdt_color }
											</div>
										</div>
									</td>
									<td>
										<div class="text_black" style="text-align: center;">
											${data.addCart_cnt }</div>
									</td>
									<td>
										<div class="text_black" style="text-align: center;">
											${data.total_price }원</div>
									</td>
									<td>
										<div class="text_black" style="text-align: center;">
											${data.payment_time }</div>
									</td>
								</tr>

							</c:forEach>
						<thead>
							<tr>
								<td colspan="2" style="border-top: solid 1px"></td>
								<td class="text_black"
									style="text-align: center; border-top: solid 1px;">총 수</td>
								<td class="text_black"
									style="text-align: center; border-top: solid 1px;">총 금액</td>
								<td style="border-top: solid 1px"></td>
							</tr>
						</thead>
						<tr>
							<td colspan="2"
								style="border-bottom: solid 1px; border-top: solid 1px;"></td>
							<td class="text_black"
								style="text-align: center; border-bottom: solid 1px; border-top: solid 1px;">${total_mount }</td>
							<td class="text_black"
								style="text-align: center; border-bottom: solid 1px; border-top: solid 1px;">${total_price }원</td>
							<td style="border-bottom: solid 1px; border-top: solid 1px;"></td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="col-lg-2 col-sm-3 mb-4"></div>
			</div>
		</div>
	</section>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>
</body>
</html>