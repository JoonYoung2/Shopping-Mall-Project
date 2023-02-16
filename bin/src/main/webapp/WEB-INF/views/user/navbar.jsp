<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<a href="${context }index"></a>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="resources/assets/img/navbar-logo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    <c:choose>
						<c:when test="${empty sessionScope.user_id }">
	                        <li class="nav-item"><a class="nav-link" href="register">signup</a></li>
                        	<li class="nav-item"><a class="nav-link" href="login">login</a></li>
	                     </c:when>
	                     <c:otherwise>
	                     <c:if test="${sessionScope.loginType eq 3}">
	                     	<li class="nav-item"><a class="nav-link" href="admin">Admin</a></li>
	                     </c:if>
	                     	<li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
<!-- 	                        <li class="nav-item"><a class="nav-link" href="#portfolio">Portfolio</a></li> -->
	                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#team">Team</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
	                        <li class="nav-item"><a class="nav-link" href="logout">logout</a></li>
	                     </c:otherwise>
	                </c:choose>
                    </ul>
                </div>
            </div>
        </nav> 