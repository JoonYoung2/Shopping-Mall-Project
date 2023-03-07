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

<!-- Q&A list -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<!-- Q&A list -->

<!-- maincss -->
<link href="resources/main_templates/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- maincss -->


</head>
<body>
	<%@ include file="../user_prdtFixBar/navbar.jsp"%>

	<div class="row">
		<div class="col-lg-3 col-sm-3 mb-4"></div>
		<div class="col-lg-6 col-sm-6 mb-4">
			<section class="page-section" id="about">
				<div class="container">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Q&A Info
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th><div style="text-align: center;">번호</div></th>
										<th><div style="text-align: center;">아이디</div></th>
										<th><div style="text-align: center;">타이틀</div></th>
										<th><div style="text-align: center;">작성일</div></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="data" items="${datas }">

										<tr>
											<th>
										<a href="/qna_info?qna_num=${data.qna_num }">
													<div class="text_black" style="text-align: center;">
														${data.qna_sequence }</div>
											</a>
											</th>
											<td>
											<a href="/qna_info?qna_num=${data.qna_num }">
												<div class="text_black" style="text-align: center;">
													${data.user_id }</div>
													</a>
											</td>
											<td>
											<a href="/qna_info?qna_num=${data.qna_num }">
											
												<div class="text_black" style="text-align: center;">
													${data.qna_title }</div>
													</a>
											</td>
											<td>
											<a href="/qna_info?qna_num=${data.qna_num }">
												<div class="text_black" style="text-align: center;">
													${data.write_time }</div>
													</a>
											</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
							<div style="text-align: right;">
								<a href="/qna_write" class="btn btn-secondary btn-sm btn-block">글쓰기</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<div class="col-lg-3 col-sm-3 mb-4"></div>
	</div>
	<%@ include file="../user_prdtFixBar/footer.jsp"%>

	<!-- Q&A list -->
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="resources/admin_prdtList/js/datatables-simple-demo.js"></script>
	<!-- Q&A list -->
</body>
</html>