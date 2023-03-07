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
				<h3 class="section-subheading text-muted"
					style="margin-bottom: 20px;">Q&A는 작성자와 관리자만 확인할 수 있습니다.</h3>
				<font color="red"><div id="msg">${msg }</div></font>
			</div>
			<div class="container">
				<div class="card mb-4">
					<center>
							<input type='hidden' name='user_id'
								value='${sessionScope.user_id }' />
							<table style="width: 650px;">
								<tr>
									<td colspan="2" style="width: 80px; height: 40px;" align="left">제
										목</td>
									<td style="width: 570px; height: 40px;">
										<input type="text" value="${data.qna_title }" readonly="readonly"/>
										<span style="padding-left:190px;">파일명 : ${data.qna_file }</span>
									</td>
								</tr>
								<tr>
									<td style="width: 80px; height: 40px;" align="left">본문</td>
									<td colspan="2"><textarea
											style="width: 550px; height: 300px" name="qna_content" readonly="readonly">${data.qna_content }</textarea></td>
								</tr>
								<tr>
									<td colspan="3" align='center' height=40>
									<a class="btn btn-secondary btn-sm btn-block">수정하기</a> 
									<a class="btn btn-secondary btn-sm btn-block">삭제하기</a>
									<a
									type=button style="width: 120px;"
										onclick="history.back()" class="btn btn-secondary btn-sm btn-block">뒤로가기</a>
								</tr>
							</table>
					</center>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>
</body>
</html>