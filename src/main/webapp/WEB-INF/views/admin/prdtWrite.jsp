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
	href="resources/main_templates/assets/favicon.ico" />
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
</head>
<body>
	<%@ include file="../adminFixBar/navbar.jsp"%>
	<section class="page-section" id="about">
		<div class="container">
			<div class="card mb-4">
				<center>
					<form action="write" method="post" enctype="multipart/form-data">
						<input type='hidden' name='admin_id'
							value='${sessionScope.user_id }' />
						<table style="width: 650px;">
							<tr>
								<td style="width: 80px; height: 40px;" align="right">제 목</td>
								<td style="width: 570px; height: 40px;"><input type=text
									name='prdt_title' /></td>
							</tr>
							<tr>
								<td style="width: 80px; height: 40px;" align="right">상품명</td>
								<td style="width: 570px; height: 40px;"><input type=text
									name='prdt_nm' /></td>
							</tr>
							<tr>
								<td style="width: 80px; height: 40px;" align="right">상품 가격</td>
								<td style="width: 570px; height: 40px;"><input type=text
									name='prdt_price' /></td>
							</tr>
							<tr>
								<td style="width: 80px; height: 40px;" align="right">색 상</td>
								<td style="width: 570px; height: 40px;"><input type=text
									name='prdt_color' /></td>
							</tr>
							<tr>
								<td style="width: 80px; height: 40px;" align="right">상품 분류</td>
								<td style="width: 570px; height: 40px;">
									<select name="prdt_list">
									    <option value="0">all</option>
									    <option value="1">Main</option>
									    <option value="2">New</option>
									    <option value="3">Best</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan=2 align="right"><textarea
										style="width: 650px; height: 300px" name="prdt_info"></textarea></td>
							</tr>
							<tr>
								<td align='right' height=40 colspan=2><input type=file
									style="width: 300px;" name="file" /></td>
							</tr>
							<tr>
								<td align='center' height=40 colspan=2><input type=submit
									value='등록' style="width: 120px;" /> <input type=reset
									value='취소' style="width: 120px;" /> <input type=button
									value='뒤로가기' style="width: 120px;" onclick="history.back()" />
								</td>
							</tr>
						</table>
					</form>
				</center>
			</div>
		</div>
	</section>
	<%@ include file="../adminFixBar/footer.jsp"%>
</body>
</html>