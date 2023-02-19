<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Joon - shop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/main_templates/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
		<c:url var="context" value="/" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/main_templates/css/styles.css" rel="stylesheet" />
</head>
<body>
<%@ include file="../adminFixBar/navbar.jsp"%>
<section class="page-section" id="new">
		<div class="container">
		<center>
	<input type='hidden' name='admin_id' value='${sessionScope.user_id }'/> 
		<table style="width: 650px; ">
			<tr> 
				<td style="width: 80px; height:40px;" align="right">제 목</td>
				<td style="width: 570px; height:40px;">
					<input type=text name='prdt_title' value="${datas.prdt_title }" readonly="readonly"/> 
				</td>
			</tr>
			<tr>
				<td style="width: 80px; height:40px;" align="right">상품명</td>
				<td style="width: 570px; height:40px;">
					<input type=text name='prdt_nm' value="${datas.prdt_nm }" readonly="readonly"/> 
				</td>
			</tr>
			<tr>
				<td style="width: 80px; height:40px;" align="right">상품 가격</td>
				<td style="width: 570px; height:40px;">
					<input type=text name='prdt_price' value="${datas.prdt_price }" readonly="readonly"/> 
				</td>
			</tr>
			<tr> 
				<td style="width: 80px; height:40px;" align="right">색 상</td>
				<td style="width: 570px; height:40px;">
					<input type=text name='prdt_color' value="${datas.prdt_color }" readonly="readonly"/> 
				</td>
			</tr>
			<tr>
				<td style="width: 80px; height:40px;" align="right">상품 정보</td>
				<td style="width: 570px; height:40px;">
				<input type=text name='prdt_color' value="${datas.prdt_info }" readonly="readonly"/>
			</tr>
			<tr>
				<td style="width: 80px; height:40px;" align="right">상품 분류</td>
				<td style="width: 570px; height:40px;">
				<input type=text name='prdt_color' value="${datas.prdt_list }" readonly="readonly"/>
			</tr>
			<tr>
				<td align='center' height=40 colspan=2>
					<button style="width: 120px;" class="text_black"><a href="/prdtUpdate?prdt_id=${datas.prdt_id }">수정하기</a></button>
					<button style="width: 120px;" class="text_black"><a href="/prdtDelete?prdt_id=${datas.prdt_id }">삭제하기</a></button>
					<input type=button value='뒤로가기' style="width: 120px; " onclick="history.back()"/>	 
				</td>
			</tr>
		</table>
		</center>
</div>
</section>
	<%@ include file="../adminFixBar/footer.jsp" %>
</body>
</html>