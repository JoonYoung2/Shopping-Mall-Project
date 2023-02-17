<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
        <!-- Masthead-->
        
        <header class="masthead">
            <div class="container">

		             	<div class="masthead-subheading">Welcome To Our Studio!</div> 
				        <div class="masthead-heading text-uppercase">It's Nice To Meet You.</div>
				        <div class="masthead-heading text-uppercase">${sessionScope.name }!</div>
				        <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>

            </div>
        </header> 