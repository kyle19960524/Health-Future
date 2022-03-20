<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NutriBookingDetail</title>
<style>
body{    
        background-image: url(resources/images/background/pexels-photo-1656666.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }

.st1{
	    font-size:22px;
}
</style>
</head>
<body style="background-color:#FFFCEC;">
<div align="center">
	<div style="height:150px ;" ></div>
	
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 650px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
		<form >

			<fieldset>
				<legend><h1>${clickNotiData.memName}，您的預約詳細如下：</h1></legend>
				<div class="st1">
					<img style="height:20%;width:20%;margin-bottom:8px" src="<c:url value="${fn:substring(fn:substringAfter(dietitian.path1,'WebContent'),1,27)}"/>" class="rounded">
				</div>
				<div class="st1">
					<label>預約營養師：</label>
					<span>${clickNotiData.nutriName}</span> 
					
				</div>
				
				<div class="st1">
					<label>營養師學歷：</label>
					<span>${dietitian.education}</span> 
					
				</div>
				
				<div class="st1">
					<label>營養師經歷：</label>
					<span>${dietitian.experience}</span> 
					
				</div>

				<div class="st1">
					<label>預約日期：</label>
					<span style="color:red;">${clickNotiData.date}</span>
					
				</div>

				<div class="st1">
					<label>時段：</label>
					<span style="color:red;">${clickNotiData.eachTime}</span>
					 
				</div>
				<c:if test="${clickNotiData.status==1}">
				<div class="st1">
					<label>狀態：</label>
					<span style="color:red;">預約成功</span>
					
				</div>
				<div class="st1">
					<label>您的目標：</label>
					<span>${clickNotiData.note}</span>
					
				</div>
				</c:if>
				<c:if test="${clickNotiData.status==2}">
				<div class="st1">
					<label>狀態：</label>
					<span style="color:red;">預約取消</span>
					
				</div>
				<div class="st1">
					<label>營養師留言：</label>
					<span>${clickNotiData.note}</span>
					
				</div>
				</c:if>

			</fieldset>
		</form>
		
		<br/>
		<div>
		<button type="button" class="btn btn-primary"  onclick="location.href='<c:url value="/turntoMainPage.controller" />'">回首頁</button>
		</div>
	</div>
</div>

</body>
</html>