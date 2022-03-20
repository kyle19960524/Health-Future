<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入</title>
<style>
body{   
        background-image: url(resources/images/background/pexels-photo-672101.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;

}

@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	#sform{
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:18px;	
	}
	
	#sdiv{
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:18px;	
	}
	
	
	
</style>
</head>
<body style="background-color:#FFFCEC;">
<div style="height: 150px;"></div>
<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 800px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<h1 align="center" style="margin: 30px auto; color:#83B1C9;">營養師登入</h1>
	<div id="sdiv" align="center" style="width: 650px; margin: 0 auto;">
		<form id="sform" style="margin-top: 60px;"
			action="<c:url value="/login.controller" />" method="post">
			<div class="form-group row">
				<label for="inputAccount" class="col-sm-2 col-form-label">帳號</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="inputAccount"
						name="account">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">密碼</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="inputPassword"
						name="pwd">
				</div>
				<img id="demo_img" src="<c:url value="/resources/images/visible.png"/>" style="width:40px;">
			</div>

			<div  id="sdiv" align="center" style="width: 600px; margin: 20px auto;"
				class="form-group form-check">
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
			</div>
		</form>
		<div id="sdiv" style="margin: 15px auto; color:red">
		${errors.inputdata}
		<div id="sdiv" style="color:red">${notvalid} <br></div>
			<a style="margin: 0 auto; font-size: 18px;" href="<c:url value="/turntoForget.controller" />">忘記密碼</a>
			<span>&emsp;</span>
			<a style="margin: 0 auto; font-size: 18px;" href="<c:url value="/turntoChange.controller" />">更改密碼</a>
			<span>&emsp;</span>	
			<a style="margin: 0 auto; font-size: 18px;" href="<c:url value="/turntoRegister.controller" />">加入營養師</a>
		</div>
	</div>
</div>


<script>

document.getElementById("demo_img").onclick = hideShowPsw;

function hideShowPsw(){
	var demoImg = document.getElementById("demo_img");
	var demoInput = document.getElementById("inputPassword");
	
	if (demoInput.type == "password") {
		demoInput.type = "text";
		demo_img.src = "<c:url value="/resources/images/invisible.png"/>";
	}else {
		demoInput.type = "password";
		demo_img.src = "<c:url value="/resources/images/visible.png"/>";
	}
}

</script>
</body>
</html>