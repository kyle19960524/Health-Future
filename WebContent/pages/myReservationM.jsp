<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的預約</title>
<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-1660037.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;     
     }
     
     td {
     	font-size:28px;
     }
     
</style> 
</head>
<body style="background-color: #FFFCEC;">

	<div style="height: 280px;"></div>
	
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 500px; border-radius: 10px; margin: 0 auto; padding-top: 2rem; padding-bottom: 1rem;">
		<form action="turntoChatroomM.controller" method="post">
			<table>
				<tr>
					<td>用戶名：</td>
					<td><input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="name"></td>
				</tr>
				
				<tr>
					<td colspan="2" style="padding: 20px; text-align: center;"><input
						type="submit" value="進入聊天室" class="btn btn-outline-secondary"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="memId" value="<%= session.getAttribute("mem.memberId")%>"></td>
					<td><input type="hidden" name="nutriId" value="<%= session.getAttribute("mem.nutriId")%>"></td>
					<td><input type="hidden" name="nutriId" value="<%= session.getAttribute("mem.chatroomid")%>"></td>
					
				</tr>
				
			</table>
		</form>
	</div>

</body>
</html>