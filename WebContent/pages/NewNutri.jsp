<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>營養師詳細資料</title>

<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-1458694.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
     
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);

div {
/* 	font-family: "微軟正黑體", sans-serif; */
	line-height: 1;
/* 	font-weight: 800; */
}
</style>
</head>
<body style="background-color: #FFFCEC;">
	<div style="height: 150px;"></div>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 90%; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<h1 style="color:#FFCCBC;">營養師詳細資料</h1><br><br>

		<c:set var="path" value="${img}"></c:set>
		<img
			src='<c:url value="${fn:substring(fn:substringAfter(path,'WebContent'),1,27)}"/>'
			height="350px" style="float: left; margin-left: 50px;"> <br><br/>
		<div style="font-size: 26px; text-align: left; margin-left: 200px; margin-bottom: 50px;">
			<div style="margin-left: 150px">營養師姓名： ${name}</div>
			<br>
			<div style="margin-left: 150px">經歷： ${exp}</div>
			<br>
			<div style="margin-left: 150px">學歷： ${edu}</div>
			<br>
			<div style="margin-left: 150px">地區： ${address}</div>
			<br>
			<div style="margin-left: 150px">營養師email： ${email}</div>
		</div>
		<br/>
	</div>

<!-- 	<script src="/js/jquery.3.4.1.js"></script> -->
<!-- 	<script src="/js/bootstrap.min.js"></script> -->
</body>
</html>