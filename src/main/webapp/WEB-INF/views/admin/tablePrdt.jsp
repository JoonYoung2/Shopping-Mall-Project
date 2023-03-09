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



<!-- admin_prdt list -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/admin_prdtList/css/styles.css" rel="stylesheet" />
<!-- admin_prdt list -->
</head>
<body>
	<%@ include file="../adminFixBar/navbar.jsp"%>

	<section class="page-section" id="about">
		<div class="container">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Product Info DataTable
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th><div style="text-align: center;">번호</div></th>
								<th><div>타이틀</div></th>
								<th><div style="text-align: center;">상품명</div></th>
								<th><div style="text-align: center;">가 격</div></th>
								<th><div style="text-align: center;">분류</div></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${datas }">

								<tr>
									<th>
										<div class="text_black" style="text-align: center;">
											<a href="/prdtView?prdt_id=${data.prdt_id }">${data.prdt_id }</a>
										</div>
									</th>
									<td>
										<div class="text_black">
											<a href="/prdtView?prdt_id=${data.prdt_id }">${data.prdt_title }</a>
										</div>
									</td>
									<td>
										<div class="text_black" style="text-align: center;">
											<a href="/prdtView?prdt_id=${data.prdt_id }">${data.prdt_nm }</a>
										</div>
									</td>
									<td>
										<div class="text_black" style="text-align: center;">
											<a href="/prdtView?prdt_id=${data.prdt_id }">${data.prdt_price }원</a>
										</div>
									</td>
									<td>
										<div class="text_black" style="text-align: center;">
											<a href="/prdtView?prdt_id=${data.prdt_id }">${data.prdt_list }</a>
										</div>
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
					<div style="text-align: right;">
						<a href="/prdtWrite" class="btn btn-secondary btn-sm btn-block">상품등록</a>
					</div>
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