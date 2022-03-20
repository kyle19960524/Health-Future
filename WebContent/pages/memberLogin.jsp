<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入表單</title>
<style>     
img{
width: 40px;
/* height: 40px; */
}
body{   
        background-image: url(resources/images/background/pexels-photo-347926.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;

}

/* h1 { */
/* -webkit-text-stroke: 1px #455A64;  */
/* }  */
</style>
</head>
<body style="background-color:#FFFCEC;">
	<div style="height:150px ;" ></div>
	
<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 800px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
<h1 align="center" style="margin: 30px auto; color:#83B1C9;">會員登入</h1>
		<div align="center" style="width: 700px; margin: 0 auto;">
		<form style="margin-top: 60px;" action="<c:url value="/checkLogin.controller" />" method="post">
			<div class="form-group row">
				<label for="inputAccount" class="col-sm-2 col-form-label" style="font-size: 20px;">帳號</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="inputAccount" name="m_useraccount">
				</div>
				<span style="color:red; font-size: 20px;">${errors.name}</span>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label" style="font-size: 20px;">密碼</label>
				<div class="col-sm-7">
					<input type="password" class="form-control" id="inputPassword" name="m_password"">
					</div>
 				<img id="demo_img" src="<c:url value="/resources/images/visible.png"/>" >
				<span style="color:red; font-size: 18px;">${errors.pwd}</span>
				<a style="margin: 0 auto; font-size: 20px;" href="<c:url value="/setForgot.controller" />">忘記密碼？</a>
			</div>

				<div style="color:red; font-size: 20px;">${errors.msg}</div><br/>
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>

		</form>
		
		
		<div style="margin: 30px auto; font-size: 20px;">
			還沒註冊？請點此
			<button type="button" class="btn btn-primary"  onclick="location.href='<c:url value="/setRegister.controller" />'">加入會員</button>
		<br>
		</div>
	</div>
</div>
<br/>


<script>

document.getElementById("demo_img").onclick = hideShowPsw;
//隱藏text block，顯示password block
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