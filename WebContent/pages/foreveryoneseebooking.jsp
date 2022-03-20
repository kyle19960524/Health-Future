<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking time result</title>
<style>
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

	.st1{
		margin:10px;
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
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:18px;
/* 		font-weight:800; */
	}


</style>
</head>
<body style="background-color:#FFFCEC;">
<div style="height: 200px;"></div>
<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 600px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
<c:if test="${loginStatus}">
	<div id="demoFont">${membernickname}您好，您這次查詢的營養師為：${nutriname}<br/>可預約時間如下：</div>
	<div style="color:red;margin-bottom:20px">${emptyTable.nullBookingTime}</div>
<c:if test="${nothing.有沒有==1}">
	<form action="<c:url value="/memberbooking.controller" />" method="post">
		<table border=1 align="center">
			<c:forEach items="${all}" var="all" >
				
				<tr>
					<td><input type="checkbox" name="dateAndtime" value="${all.key}/${all.value}"></td>
					<td><c:out value="${all.key}" /></td>
					<td><c:out value="${all.value}" /></td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name=targetToNutri id=targetToNutri>
		<input type="hidden" name="dateAndtime" value="0">
		
		<br/>
		<center>
			<button type="submit" class="btn btn-primary" onclick="return GiveNutriTarget()">預約</button>
			<button type="reset" class="btn btn-primary">清除</button>
		</center>
		<br/>	
	</form>
</c:if>
	<center><span style="color:red;">${errors.nochoose}${errors.nodoublebooking}${errors.nodoublebookingcancel}${errors.bookingtoomuchinoneday}${errors.bookingtoomuch1}${errors.bookingtoomuch2}</span></center>
	<center><button type="submit" class="btn btn-primary" onclick="location.href='<c:url value="/turntoIntroduce.controller" />'">回營養師介紹</button></center>
</c:if>
<c:if test="${!loginStatus}">
	<div id="demoFont">您好，您這次查詢的營養師為：${nutriname}<br/>下禮拜可預約時間如下：</div>
	<div style="color:red;margin-bottom:20px">${emptyTable.nullBookingTime}</div>
<c:if test="${nothing.有沒有==1}">
	<form>
		<table border=1 align="center">
			<c:forEach items="${all}" var="all" >
				
				<tr>
					<td><c:out value="${all.key}" /></td>
					<td><c:out value="${all.value}" /></td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name=targetToNutri id=targetToNutri>
		<input type="hidden" name="dateAndtime" value="0">
		
		<br/>
	</form>
</c:if>
	<center><button type="submit" class="btn btn-primary" onclick="location.href='<c:url value="/turntoIntroduce.controller" />'">回營養師介紹</button></center>
</c:if>
</div>

<script>
	function GiveNutriTarget(){
		var text = prompt("給個目標方向讓營養師知道吧!!","減重");
		 if(text!=null){
			 document.getElementById("targetToNutri").value=text;
			 return true;
		 }else{
			 return false;
		 }
	}
</script>

</body>

</html>