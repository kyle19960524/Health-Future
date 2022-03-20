<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Future 首頁</title>

<!-- Bootstrap css file -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>" />

<!-- 與 custom css檔案連結 -->
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />

<!-- 與icon連接 -->
<script type='text/javascript'>
setTimeout('countdown()', 1000);

function countdown() {
var s = document.getElementById('timer');
s.innerHTML = s.innerHTML - 1;
if (s.innerHTML == 0)
window.location = '<c:url value="/turntoLogin.controller" />';
else
setTimeout('countdown()', 1000);
}
</script>
</head>
<body style="background-color:#FFFCEC;">
	<div style="height:200px ;" ></div>
	<div class="topdiv" >
		<img style="height:300px; width:100%;" alt="" src="<c:url value="/resources/images/background.jpg"/>">
	</div>
<div>
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
						<li class="nav-item"><a class="nav-link" href="<c:url value="/turntoLogin.controller" />">會員登入</a></li>
						<li class="nav-item"><a class="nav-link" href="#">加入營養師</a></li>
						<li class="nav-item"><a class="nav-link" href="#">身體數值分析</a></li>
						<li class="nav-item"><a class="nav-link" href="#">我要預約</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/turntoIntroduce.controller" />">營養師介紹</a></li>
						<li class="nav-item"><a class="nav-link" href="#">關於我們</a></li>
						<li class="nav-item"><a class="nav-link" href="#">聯絡我們</a></li>
					</ul>
				</div>
			</nav>
		</div>

	</header>
</div>

	<h2>您的密碼已成功更新</h2>

系統將於 <span id='timer'>3</span> 秒後，為您自動轉跳。
	<!-- jQuery js file -->
	<script src="/js/jquery.3.4.1.js"></script>

	<!-- Bootstrap js file -->
	<script src="/js/bootstrap.min.js"></script>


 

</body>
</html>