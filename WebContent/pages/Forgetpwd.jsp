<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
<style>
body {
	background-image:
		url(resources/images/background/pexels-photo-1414651.jpeg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
</head>
<body style="background-color: #FFFCEC;">
	<div style="height: 150px;"></div>

	<div align="center"
		style="color: white; background-color: #263238; opacity: 0.95; width: 700px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">

		<h1 align="center" style="margin: 30px auto; color: #83B1C9;">請輸入基本資訊</h1>

		<div align="center" style="width: 650px; margin: 0 auto;">
			<form style="margin-top: 60px;"
				action="<c:url value="/forgetpwd.controller" />" method="post">
				<div class="form-group row">
					<label for="inputAccount" class="col-sm-2 col-form-label">帳號</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputAccount"
							name="account">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputAccount" class="col-sm-2 col-form-label">e-mail</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputAccount"
							name="email">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputAccount" class="col-sm-2 col-form-label">身分證字號</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputAccount"
							name="identity">
					</div>
				</div>

				<div style="margin: 40px auto;" class="form-group form-check">
					<button type="submit" class="btn btn-primary">送出</button>
					<button type="reset" class="btn btn-primary">清除</button>
				</div>

			</form>
		</div>
	</div>
</body>
</html>