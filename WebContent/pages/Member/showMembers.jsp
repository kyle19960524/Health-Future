<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
<style>
body{
/* 	font-family: "Microsoft YaHei", sans-serif; */
		background-image: url(resources/images/background/pexels-photo-219794.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
}

.st1 {
	width: 650px;
	border-bottom: 1px dashed #BCAAA4;
	margin: 20px;
 	padding-bottom: 10px;
	font-size: 20px;
	text-align: left;
}

.st2 {
	width: 450px;
	margin: 20px;
	text-align: center;
}

fieldset {
	width: 750px;
	margin: 10px;
	border: 2px solid #7B7B7B;
	border-radius: 10px;
}

    .scheduler-border {
   	   width: auto; 
   	   border-bottom: none; 
	}
</style>
</head>
<body  style="background-color:#FFFCEC;">
<div align="center">
	<div style="height:100px ;" ></div>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 900px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	
<!-- 		<form action="/goshowMembers.controller" method="POST" modelAttribute="user" > -->
			<form>
			<fieldset>
				<legend class="scheduler-border"><h2 style="color:#FFEB3B;">個人基本資料管理</h2></legend>
				<h3 align="center" style="margin: 30px auto; color:#FF9E80;">親愛的 ${membernickname} 您好！</h3>
				<h4 align="center" style="margin: 30px auto; color: #CDDC39;">更新成功，您的會員基本資料如下：</h4>
				
				<br>
				<div class="st1">
				<label>個人頭像：</label>
					<c:set var="path" value="${list.m}"></c:set>
					<img src='<c:url value="${fn:substring(fn:substringAfter(path,'WebContent'),1,-1)}"/>' style="width:auto;height:8rem;border-radius:90px;">
				</div>
				<div class="st1">
					<label>帳號：</label>
					<span>${list.a}</span> 
					
				</div>
				<div class="st1">
					<label>密碼：</label>
					<span>${list.b}</span> 
					
				</div>
				<div class="st1">
					<label>姓名：</label>
					<span>${list.c}</span> 
					
				</div>
				<div class="st1">
					<label>暱稱：</label>
					<span>${list.d}</span>
					 
				</div>
				<div class="st1">
					<label>身分證字號：</label>
					<span>${list.e}</span> 
					
				</div>
				<div class="st1">
					<label>性別：</label>
					<span>${list.f}</span>
					 
				</div>
				<div class="st1">
					<label>生日：</label>
					 <span>${list.g}</span>
					
				</div>
				<div class="st1">
					<label>身高：</label>
					 <span>${list.h}</span>公分
					
				</div>
				<div class="st1">
					<label>體重：</label>
					<span>${list.i}</span>公斤
					 
				</div>
				<div class="st1">
					<label>居住地區：</label>
					<span>${list.j}</span>
					
				</div>

				<div class="st1">
					<label>行動電話：</label>
					<span>${list.k}</span>
					 
				</div>
				<div class="st1">
					<label>電子信箱：</label>
					<span>${list.l}</span>
					
				</div>

			</fieldset>
		</form>
		</div>
		
	</div>
	<br/>
	
</body>
</html>