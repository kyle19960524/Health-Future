<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>謝謝光臨</title>
<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-533343.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;     
     }
     
</style> 
</head>
<body style="background-color:#FFFCEC;">
	<div style="height:280px ;" ></div>
	<div align="center">
		<br>
		<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 600px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
		<h1>登出成功，期待您再次光臨！</h1>
		</div>
		<br>
		<img src="https://www.animatedimages.org/data/media/1645/animated-waving-image-0020.gif" border="0" alt="animated-waving-image-0020" />
		<br>
		<button type="button" class="btn btn-primary"  onclick="location.href='<c:url value ="/turntoChooseLogin.controller"/>'">重新登入</button>
	</div>

</body>
</html>