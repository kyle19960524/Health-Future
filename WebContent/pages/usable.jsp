<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:black">
<form action="<c:url value="/turntoMainPage.controller" />" method="post" style="text-align:center">
<button  type="submit">
<img  style="weight:100%;height:100%" src="<c:url value="/resources/images/back4.jpg"/>" >
</button>
</form>
</body>
</html>