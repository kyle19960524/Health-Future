<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
</head>
<body>
	<div class="topdiv">
		<img style="height: 300px; width: 100%;" alt=""
			src="<c:url value="/resources/images/background.jpg"/>">
	</div>
	<header class="header_area">
		<div class="main-menu">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarTogglerDemo01"
					aria-controls="navbarTogglerDemo01" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
					<a class="navbar-brand" href="#">Health Future</a>
					<div class="mr-auto"></div>
					<ul class="navbar-nav ">
						<li class="nav-item active"><a class="nav-link"
							href="mainPage.jsp">Home<span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#">加入營養師</a></li>
							<li class="nav-item"><a class="nav-link" href="#">身體數值分析</a></li>
						<li class="nav-item"><a class="nav-link" href="#">我要預約</a></li>
						<li class="nav-item"><a class="nav-link"
							href="introduse_N.jsp">營養師介紹</a></li>
						<li class="nav-item"><a class="nav-link" href="#">聯絡我們</a></li>
					</ul>
				</div>
			</nav>
		</div>

	</header>
	<h1 align="center" style="margin: 30px auto;">請輸入帳號密碼</h1>
	<div align="center" style="width: 650px; margin: 0 auto;">
		<form style="margin-top: 60px;">
			<div class="form-group row">
				<label for="inputAccount" class="col-sm-2 col-form-label">帳號</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputAccount">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">密碼</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
			
			<div align="center" style="width: 600px; margin: 20px auto;"
				class="form-group form-check">
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
			</div>
		</form>
		<div style="width: 600px; margin: 30px auto;">
			<a style="margin: 0 auto;" href="FormRegister.jsp">加入會員</a> <a
				style="margin: 0 auto;" href="Forgetpwd.jsp">忘記密碼</a>
		</div>
	</div>



	<script src="/js/jquery.3.4.1.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>