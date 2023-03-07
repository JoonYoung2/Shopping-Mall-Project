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
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/main_templates/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

</head>
<body>
	<%@ include file="../user_prdtFixBar/navbar.jsp"%>
	<section class="page-section" id="about">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Q&A</h2>
				<h3 class="section-subheading text-muted">Q&A는 작성자와 관리자만 확인할 수
					있습니다.</h3>
				<font color="red"> ${msg }</font>
			</div>
			<div class="container">
				<div class="card mb-4">
					<center>
						<form action="qna_write" method="post" enctype="multipart/form-data">
							<input type='hidden' name='user_id'
								value='${sessionScope.user_id }' />
							<table style="width: 650px;">
								<tr>
									<td colspan="2" style="width: 80px; height: 40px;" align="left">제
										목</td>
									<td style="width: 570px; height: 40px;">
										<select name="qna_title">
											<option value="상품 문의">상품 문의</option>
											<option value="주문/결제 문의">주문/결제 문의</option>
											<option value="배송 문의">배송 문의</option>
											<option value="반품/환불 문의">반품/환불 문의</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width: 80px; height: 40px;" align="left">본문</td>
									<td colspan="2">
										<textarea style="width: 550px; height: 300px" name="qna_content"></textarea>
									</td>
								</tr>
								<tr>
									<td style="text-align: right; padding-right: 60px;" height=40 colspan=3>
									<input type=file style="width: 300px;" name="file" />
									</td>
								</tr>
								<tr>
									<td colspan="3" align='center' height=40>
										<input type=submit value='등록' style="width: 120px;" /> 
										<input type=reset value='취소' style="width: 120px;" /> 
										<input type=button value='뒤로가기' style="width: 120px;" onclick="history.back()" />
									</td>
								</tr>
							</table>
						</form>
					</center>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>
</body>
</html>