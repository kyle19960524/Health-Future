<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
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
<body onload="Birthday()" style="background-color:#FFFCEC;">
<script>
		function Birthday(){
			console.log('${memberData.birthday}');
		var birth='${memberData.birthday}';
		birth = Date.parse(birth.replace('/-/g', "/"));
		if (birth) {
			var year = 1000 * 60 * 60 * 24 * 365;
			var now = new Date();
			var birthday = new Date(birth);
			var age = parseInt((now - birthday) / year);
		}
		console.log(age);
		document.getElementById("old").innerHTML=age+'歲';}
</script>
<div align="center">
	<div style="height:100px ;" ></div>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 700px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
		<form >

			<fieldset>
				<legend><h1>${clickNotiData.nutriName}，您的客戶預約詳細如下：</h1></legend>
				<div class="st1">
					<img style="height:20%;width:20%;margin-bottom:8px" src='<c:url value="/resources/images/${memberData.memberFile}"/>' class="rounded">
				</div>
				<div class="st1">
					<label>預約客戶：</label>
					<span>${clickNotiData.memName}</span> 
					
				</div>
				<div class="st1">
					<label>暱稱：</label>
					<span>${memberData.nickname}</span>
					 
				</div>

				<div class="st1">
					<label>性別：</label>
					<span>${memberData.sex}</span>
					 
				</div>
				<div class="st1">
					<label>生日：</label>
					 <span>${memberData.birthday}</span>
					
				</div>
				<div class="st1">
					<label>身高:</label>
					 <span>${memberData.height}公分</span>
					
				</div>
				<div class="st1">
					<label>體重：</label>
					<span>${memberData.weight}公斤</span>
					 
				</div>
				<div class="st1">
					<label>歲數：</label>
					<span id="old"></span>
				
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
					<label>客戶目標：</label>
					<span>${clickNotiData.note}</span>
					
				</div>
				</c:if>
				<c:if test="${clickNotiData.status==3}">
				<div class="st1">
					<label>狀態：</label>
					<span style="color:red;">預約取消</span>
					
				</div>
				<div class="st1">
					<label>客戶留言：</label>
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