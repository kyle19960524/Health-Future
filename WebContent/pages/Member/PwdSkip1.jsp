<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>密碼驗證</title>
<style>
body{    
        background-image: url(resources/images/background/pexels-photo-1414651.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
</style>

<script type='text/javascript'>
setTimeout('countdown()', 1000);

function countdown() {
var s = document.getElementById('timer');
s.innerHTML = s.innerHTML - 1;
if (s.innerHTML == 0)
window.location = '<c:url value="/turntoForgot.controller" />';
else
setTimeout('countdown()', 1000);
}
</script>
</head>
<body  style="background-color:#FFFCEC;">
	<div style="height:280px ;" ></div>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 950px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
		<h1>您的新密碼已寄送到您的信箱，請用新密碼登入。</h1>
		<h1>系統將於 <span id='timer' style="color:#ff5252;">5</span> 秒後，為您自動跳轉。</h1>
	</div>

</body>
</html>