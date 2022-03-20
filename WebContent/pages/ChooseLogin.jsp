<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<html>
<head>
<style type="text/css">
body{    
        background-image: url(resources/images/background/pexels-photo-1458694.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
#btnMember{
	margin-top:10px;
	width:240px;
	height:240px;
	background-image:url(<c:url value='/resources/images/member2.jpg'/>);
	outline:none;
	border-radius:15px;
}
#btnNutritionst{
	margin-top:10px;
	width:240px;
	height:240px;
	background-image:url(<c:url value='/resources/images/Nutritionist3.jpg'/>);
	outline:none;
	border-radius:15px;
}

</style>
<meta charset="UTF-8">
<title>選擇身分</title>
</head>
<body style="background-color:#FFFCEC;">
	<div style="height:150px ;" ></div>
<div align="center" style="margin-top:45px;" >
<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 700px; border-radius: 10px; margin: 0 auto; padding-top: 2rem; padding-bottom: 2rem;">
	<h1>請選擇登入身分</h1>
	<br>
	<div style="width:300px; display: inline-block;"onclick="javascript:location.href='<c:url value="/turntoMember.controller" />'">
		<input type="button" id="btnMember" > 
	</div>
	<div style="width:300px; display: inline-block;"onclick="javascript:location.href='<c:url value="/turntoLogin.controller" />'">
		<input type="button" id="btnNutritionst" > 
	</div>
</div>
</div>
	
	


</body>
</html>