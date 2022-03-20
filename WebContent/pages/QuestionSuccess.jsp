<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成功提問</title>
<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-3683098.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
     
</style> 
</head>
<body style="background-color:#FFFCEC;">
	<div style="height: 280px;"></div>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 750px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
		<h1 style="margin:15px auto">感謝您的提問，我們會盡快與您聯絡。</h1>
		<a href="<c:url value="/turntoMainPage.controller" />">回首頁</a>
	</div>
	
</body>
</html>