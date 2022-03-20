<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>歡迎</title>
<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-1660037.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;     
     }
     
</style> 
</head>
<body style="background-color:#FFFCEC;">
	<div style="height:280px ;" ></div>
	<br>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 500px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
		<h1>登入成功！</h1>
		<h1>歡迎，${membernickname}。</h1>
	</div>

</body>
</html>