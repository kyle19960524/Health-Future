<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style >
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
.div1{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:30px;
		font-weight:800;
	
	}
</style>

</head>
<body>
<div></div>
	<div style="height:200px ;" ></div>
<div  class="div1" style="margin:auto; text-align:center; width:300px ; height:300px;float:left "  >
${d_name} 您已成功登入
<input style=" font-size:20pt;border:5px #FF8EFF double; background-color:pink;width:200px;height:150x;color:#0080FF" type="button" value="新增可預約時間"  onclick="javascript:location.href='http://localhost:8080/HealthFuture/turntoNutriAvailableTime.controller'">
<input style=" font-size:20pt;border:5px #FF8EFF double; background-color:pink;width:200px;height:150x;color:#0080FF" type="button" value="查詢預約時間"  onclick="javascript:location.href='http://localhost:8080/HealthFuture/turntoSearchNutriAvailableTime.controller'">
</div>
</body>
</html>