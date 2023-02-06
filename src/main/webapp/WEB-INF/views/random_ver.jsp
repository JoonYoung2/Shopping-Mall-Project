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
        <title>Agency - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
		<c:url var="context" value="/" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index"><img src="resources/assets/img/navbar-logo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    <c:choose>
						<c:when test="${empty sessionScope.id }">
	                        <li class="nav-item"><a class="nav-link" href="register">signup</a></li>
                        	<li class="nav-item"><a class="nav-link" href="login">login</a></li>
	                     </c:when>
	                     <c:otherwise>
	                        <li class="nav-item"><a class="nav-link" href="index">Home</a></li>
	                        <li class="nav-item"><a class="nav-link" href="logout">logout</a></li>
	                     </c:otherwise>
	                </c:choose>
                    </ul>
                </div>
            </div>
        </nav>

		<header class="masthead">
            <div class="container">
				<a class="btn btn-primary btn-xl text-uppercase" href="random_single">혼자연습</a>
				<a class="btn btn-primary btn-xl text-uppercase" href="random_multi">같이연습</a>
				<a class="btn btn-primary btn-xl text-uppercase" href="sequence_all">전체보기</a>
			</div>
        </header>
        
        <%@ include file="footer.jsp" %>

        <!-- Services-->
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
        