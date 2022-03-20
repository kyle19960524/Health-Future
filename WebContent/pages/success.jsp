<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Success</title>
<style >
body{    
        background-image: url(resources/images/background/pexels-photo-1458694.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
        
     }

	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	form{
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:18px;
/* 		font-weight:800; */
	
	}
	#demoFont {
		text-align:center;
		letter-spacing: 2px;
		word-spacing: 2px;
/* 		color: #7E6EFF; */
		text-decoration: none;
		font-style: normal;
		font-variant: normal;
		text-transform: none;
		margin:20px;
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:25px;
		font-weight:800;
		
	}
	
	center{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:18px;
		font-weight:800;
	}
	
	table{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:18px;
		font-weight:800;
	}




</style>
</head>
<body style="background-color:#FFFCEC;">
<div style="height: 150px;"></div>

<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 900px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<div id="demoFont">${membernickname}您好，您這次預約的營養師為：${nutriname}<br/>預約時間為以下結果：</div>
	
	<table border=1 align="center">
		
		<c:forEach items="${date_Time}" var="dateAndtime">
			<tr>
				<td><c:out value="${dateAndtime.key}" /></td>
				<td><c:out value="${dateAndtime.value}" /></td>
			</tr>
		</c:forEach>
		
	</table>
	<br/>
	<center><button type="button" class="btn btn-primary"  onclick="location.href='<c:url value="/turntoMainPage.controller" />'">回首頁</button></center>
</div>

</body>
</html>