<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的預約</title>
</head>
<body style="background-color:#FFFCEC;">
		<div style="height:200px ;" ></div>
	<div align="center" style="margin-top:45px;">
	<form action="turntoChatroom.controller">
		<table >
			<tr>
				<td>用戶名:</td>
				<td><input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  name="name"></td>
			</tr>
			<tr>
				<td>聊天室編號:</td>
				<td><input type="text" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="chatNumber"></td>
			</tr>
			<tr >
				<td colspan="2" style="padding:5px; text-align:center;"><input  type="submit" value="進入聊天室" class="btn btn-outline-secondary"   ></td>			
			</tr>
		</table>
	</form>
	</div>

</body>
</html>