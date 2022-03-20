<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/icons/back2.ico'/>"
	rel="external nofollow" type="image/x-icon" />

<style>
.pic{width:750px; height:500px;overflow:hidden;}
.pic img{transform:scale(1,1);transition: all 1s ease-out;}
.pic img:hover{transform:scale(1.2,1.2);}

</style>

</head>
<body>
<div align="center" style="background-color:">
<table>
<tr>
<td>
<form action="<c:url value="/newNutri.controller" />" method="post">
<button style="width:500px ;height:333px;" class="pic" type="submit"><img  src="<c:url value="/resources/images/newNutri.jpg"/>" style="width:500px;height:333px;"></button>
</form>
</td>
<td>
<form action="<c:url value="/turntoBackQuestion.controller" />" method="post">
<button style="width:500px ;height:333px;" class="pic" type="submit"><img  src="<c:url value="/resources/images/contactus.jpg"/>" style="width:500px;height:333px;"></button>
</form>
</td>
</tr>
</table>

<table>
<tr>
<td>
<form action="<c:url value="/turntoshopping.controller" />" method="post">
<button style="width:500px ;height:333px;" class="pic" type="submit"><img  src="<c:url value="/resources/images/pay.jpg"/>" style="width:500px;height:333px; float:top"></button>
</form>
</td>
<td>
<form action="<c:url value="/turntoquestion1.controller" />" method="post">
<button style="width:500px ;height:333px;" class="pic" type="submit"><img  src="<c:url value="/resources/images/contactus2.jpg"/>" style="width:500px;height:333px; float:top"></button>
</form>
</td>
</tr>
</table>

</div>
<div >



</div>
</body>
</html>