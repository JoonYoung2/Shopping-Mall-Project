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
<%
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	String number = request.getParameter("num");
	int num = Integer.parseInt(number);
	
%>
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
				<a class="btn btn-primary btn-xl text-uppercase" href="index">Home</a>
				<a class="btn btn-primary btn-xl text-uppercase" href="random_ver">연습하기</a>
			</div>
        </header>

		<section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">삭제하기</h2>
                    <h3 class="section-subheading text-muted">정말 삭제하실건가요?</h3>
                    <font color="red"> ${cnt }</font><br>
                    <font color="red"> ${msg1 }</font>
                </div>
                <div class="row">
                   	 <form action="question_delete" method="post">
                   	 	<div class="col-md" style="margin-bottom:20px;">
                            <div class="form-group form-group-textarea mb-md-0">
                                <!-- Message input-->
                                <textarea readonly="readonly" class="form-control" id="message" name="question" placeholder="Your Question?" data-sb-validations="required" style="text-align:center;"><%=question %></textarea><br><br>
                                <textarea readonly="readonly" class="form-control" id="message" name="answer" placeholder="Best answer" data-sb-validations="required" style="text-align:center;"><%=answer %></textarea>
                                <textarea class="form-control" id="message" name="num" placeholder="Best answer" data-sb-validations="required" style="text-align:center; visibility:hidden;"><%=num%></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                        </div>
                        <div class="text-center">
                        	<button class="btn btn-primary btn-xl text-uppercase" id="submitButton" type="submit">DELETE</button>
                        	<a class="btn btn-primary btn-xl text-uppercase" href="sequence_all">뒤로가기</a>
                        	
                        	
                        </div>
                   	 </form>
                </div>
            </div>
        </section>
        
        <%@ include file="footer.jsp" %>
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
		        