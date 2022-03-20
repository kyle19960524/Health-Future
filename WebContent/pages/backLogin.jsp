<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後臺管理系統</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/icons/back2.ico'/>"
	rel="external nofollow" type="image/x-icon" />
<style>
.bg {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: -999;
        }
        .bg img {
            min-height: 40%;
            width: 100%;
        }

@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	div{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:18px;
		font-weight:800;
	
	}
	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	h1{
		font-family: "cwTeXYen", sans-serif;
		font-size:50px
		}
	
</style>
</head>
<body>
<div class="bg">
        <img src="<c:url value="/resources/images/background.jpg"/>">
    </div>
    <div style="height:150px"></div>
	<h1 align="center" style="margin: 30px auto;">Health Future後臺登入系統</h1>
	<div align="center" style="width: 650px; margin: 0 auto;">
		<form style="margin-top: 60px;"
			action="<c:url value="/backq.controller" />" method="post">
			<div >
				<label for="inputAccount" class="col-sm-2 col-form-label">帳號</label>
				<div >
					<input type="text" class="form-control" id="inputAccount"
						name="baccount">
				</div>
			</div>
			<div >
				<label for="inputPassword" class="col-sm-2 col-form-label">密碼</label>
				<div >
					<input type="password" class="form-control" id="inputPassword"
						name="bpwd">
				</div>
			</div>

			<div align="center" style="width: 600px; margin: 20px auto;"
				class="form-group form-check">
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
			</div>
		</form>
		</div>
</body>
</html>