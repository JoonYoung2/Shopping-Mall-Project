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
        <script type="text/javascript"> 
	        function doDisplay(){ 	
	            var con = document.getElementById("myDIV"); 
	            var change = document.getElementById("changes");
	            if(con.style.display=='none'){ 		
	                con.style.display = 'block'; 	
	            }else{ 		
	                con.style.display = 'none'; 	
	            } 
	            if(change.innerText == '> 답변숨기기'){
	            	change.innerText = '> 답변보기'
	            }else{
	            	change.innerText = '> 답변숨기기'
	            }
	        } 
	    </script> 
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
				<a class="btn btn-primary btn-xl text-uppercase" href="question">등록하기</a>
				<a class="btn btn-primary btn-xl text-uppercase" href="random_single">혼자연습</a>
				<a class="btn btn-primary btn-xl text-uppercase" href="sequence_all">전체보기</a>
			</div>
        </header>

		<section class="page-section" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">질문 시작</h2>
                    <h3 class="section-subheading text-muted">등록한 질문이 랜덤으로 나옵니다.</h3>
                </div>
            </div>
            	
				<%-- <% for(LoginDTO member : members) %> --%>
				
				
				<c:choose>
						<c:when test="${empty question }">
	                        <h4 style="text-align:center;">등록된 질문이 없습니다.<br><a href="question" style="text-decoration: none;">등록하기</a></h4>
	                     </c:when>
	                     <c:otherwise>
	                     	<h2 style="text-align:center;"><a href="javascript:doDisplay();" id="changes">> 답변숨기기</a></h2><br/><br/>
	                        <h2 style="text-align:center;">질문 : ${question }</h2><br><br>
	                        <h2 id="myDIV" style="text-align:center;">대답 : ${answer }</h2><br>
	                        <h2 style="text-align:center;"><a class="btn btn-primary btn-xl text-uppercase" onclick="location.reload();">NEXT</a></h2>
	                     </c:otherwise>
	                </c:choose>
					
        </section>
        
        <%@ include file="footer.jsp" %>
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>