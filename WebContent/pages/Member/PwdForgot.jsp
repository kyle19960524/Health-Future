<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includeMainPage.jsp"%>
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
lable{
	font-size: 32px;
}

</style>
</head>
<body style="background-color: #FFFCEC;">
	<div style="height: 150px;"></div>
	<div align="center"
		style="color: white; background-color: #263238; opacity: 0.95; width: 750px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
		<h1 align="center" style="margin: 30px auto; color: #BCAAA4;">忘記密碼</h1>
		<form style="margin-top: 60px;"
			action="<c:url value="/pwdforgot.controller" />" method="post">
			<div class="form-group row">
				<label class="col-sm-3 col-form-label" style="font-size: 20px;">帳號</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_useraccount">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-3 col-form-label" style="font-size: 20px;">email</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_email">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-3 col-form-label" style="font-size: 20px;">身分證字號</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_idcard">
				</div>
			</div>

			<div style="margin: 30px auto;" class="form-group form-check">
				<div style="color:red; font-size: 20px;">${errors.inputdata}</div><br/>
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
			</div>
		</form>
	</div>
</body>
</html>