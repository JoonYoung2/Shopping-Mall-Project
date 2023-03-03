<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a href="${context }index"></a>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-shrink"
	id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="/"><img
			src="resources/main_templates/assets/img/navbar-logo.svg" alt="..." /></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			Menu <i class="fas fa-bars ms-1"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
				<c:choose>
					<c:when test="${empty sessionScope.user_id }">
						<li class="nav-item"><a class="nav-link" href="register">signup</a></li>
						<li class="nav-item"><a class="nav-link" href="login">login</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<a href="cartInfo?user_id=${sessionScope.user_id }">
								<button class="btn btn-outline-dark">
									<i class="bi-cart-fill me-1"></i> 
									<span class="badge bg-dark text-white ms-1 rounded-pill">
										${sessionScope.totalCart_cnt }
									</span>
								</button>
							</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/info">My</a></li>
						<c:if test="${sessionScope.loginType eq 3}">
							<li class="nav-item"><a class="nav-link" href="admin">Admin</a></li>
						</c:if>
						<c:if
							test="${sessionScope.loginType eq 1 || sessionScope.loginType eq 3}">
							<li class="nav-item"><a class="nav-link" href="logout">logout</a></li>
						</c:if>
						<c:if test="${sessionScope.loginType eq 2}">
							<li class="nav-item"><a class="nav-link"
								href="https://kauth.kakao.com/oauth/logout?client_id=8558b06f798d38a90a338f54282456f2&logout_redirect_uri=http://127.0.0.1:8080/kakao_logout">logout</a></li>
						</c:if>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
