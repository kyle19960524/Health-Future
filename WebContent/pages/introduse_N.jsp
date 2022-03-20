<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>營養師群</title>
<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-1458694.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
     
.pic {
	overflow: hidden;
}

.pic img {
	transform: scale(1, 1);
	transition: all 1s ease-out;
}

.pic img:hover {
	transform: scale(1.2, 1.2);
}
</style>
<script>
$(function(){
	$(".booking").click(function(){
		$(this).parent().parent().parent().nextAll().eq(0).submit();
		
	})
})

</script>
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value="/resources/css/bootstrap.min.css"/>" /> --%>
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" /> --%>
<!-- 與icon連接 -->
</head>
<body style="background-color: #FFFCEC;">
	<div style="height: 130px;"></div>
	<div class="container">
		<div class="row justify-content-center">

			<form action="<c:url value="/Adele.controller" />" method="post">
				<div class="card"
					style="width: 18rem; dispaly: block; float: left; margin: 10px;">
					<a href="<c:url value="/Adele.controller" />" class="pic"> <img
						src="<c:url value="/resources/images/dietitian/AAAAA.jpeg"/>"
						class="card-img-top" alt="..."></a>
					<div class="card-body">
						<h5 class="card-title">營養師 - Adele</h5>
						<p class="card-text">專長：</p>
						<p class="card-text">1.減重食譜規劃</p>
						<p class="card-text">2.健身飲食規劃</p>
						<!-- 						<button type="submit" class="btn btn-primary">詳細介紹</button> -->
					</div>
				</div>
			</form>

			<form action="<c:url value="/Drake.controller" />" method="post">
				<div class="card"
					style="width: 18rem; dispaly: block; float: left; margin: 10px;">
					<a href="<c:url value="/Drake.controller" />" class="pic"> <img
						src="<c:url value="/resources/images/dietitian/BBBBB.jpeg"/>"
						class="card-img-top" alt="..."></a>
					<div class="card-body">
						<h5 class="card-title">營養師 - Drake</h5>
						<p class="card-text">專長：</p>
						<p class="card-text">1.減重食譜規劃</p>
						<p class="card-text">2.術後病人飲食</p>
						<!-- 						<button type="submit" class="btn btn-primary">詳細介紹</button> -->
					</div>
				</div>
			</form>
			<form action="<c:url value="/Rihanna.controller" />" method="post">
				<div class="card"
					style="width: 18rem; dispaly: block; float: left; margin: 10px;">
					<a href="<c:url value="/Rihanna.controller" />" class="pic"> <img
						src="<c:url value="/resources/images/dietitian/CCCCC.jpeg"/>"
						class="card-img-top" alt="..."></a>
					<div class="card-body">
						<h5 class="card-title">營養師 - Rihanna</h5>
						<p class="card-text">專長：</p>
						<p class="card-text">1.團體膳食管理</p>
						<p class="card-text">2.兒童營養飲食</p>
						<!-- 					<a href="#" class="btn btn-primary stretched-link">詳細介紹</a> -->
					</div>
				</div>
			</form>
			<c:forEach items="${all}" var="nutri">

				<form action="<c:url value="/NewNutri.controller" />" method="post">
					<input type="hidden" name="id" value="${nutri.id}" />
					<div class="card"
						style="width: 18rem; dispaly: block; float: left; margin: 10px;">
						<button type="submit" class="pic">
							<img
								src="<c:url value="${fn:substring(fn:substringAfter(nutri.path1,'WebContent'),1,27)}"/>"
								class="card-img-top" alt="...">
						</button>
						<div class="card-body">
							<h5 class="card-title">營養師-${nutri.name}</h5>
							<p class="card-text">學歷: ${nutri.education}</p>
							<p class="card-text">經歷: ${nutri.experience}</p>
							<a  class="btn btn-primary booking">課表查看</a>
						</div>
					</div>
				</form>
				<form action="<c:url value="/clicknutri.controller" />" method="post">
						<input type="hidden" name="nutriName" value="${nutri.name}">
				</form>
			</c:forEach>

		</div>
	</div>
</html>