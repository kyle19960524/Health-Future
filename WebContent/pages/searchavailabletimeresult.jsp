<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search available time result</title>
<script type="text/javascript">
	function DoubleCheck(){
		if(confirm("今天有事!確定取消嗎?")){  
    		return true;
    	}else{
    		return false;
    	}
	}
</script>
<style >
body{    
        background-image: url(resources/images/background/pexels-photo-1458694.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
        
     }

	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	.time{
		white-space: pre-line;
	
	}
	
	#demoFont {
		text-align:center;
		letter-spacing: 2px;
		word-spacing: 2px;
/* 		color: #7E6EFF; */
		text-decoration: none;
		font-style: normal;
		font-variant: normal;
		text-transform: none;
		margin:20px;
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:30px;
		font-weight:800;
	}
	
	table.darkTable {
/*   		font-family: "Arial Black", Gadget, sans-serif; */
  		border: 2px solid #000000;
  		background-color: #4A4A4A;
  		width: 80%;
  		margin:auto;
  		height: 200px;
  		text-align: center;
  		border-collapse: collapse;
	}
	
	table.darkTable td, table.darkTable th {
  		border: 1px solid #4A4A4A;
  		padding: 3px 2px;
	}
	
	table.darkTable tbody td {
  		font-size: 13px;
  		color: #E6E6E6;
	}
	
	table.darkTable tr:nth-child(even) {
  		background: #888888;
	}
	
	table.darkTable thead {
  		background: #000000;
  		border-bottom: 3px solid #000000;
	}
	
	table.darkTable thead th {
  		font-size: 15px;
  		font-weight: bold;
  		color: #E6E6E6;
  		text-align: center;
  		border-left: 2px solid #4A4A4A;
	}
	
	table.darkTable thead th:first-child {
  		border-left: none;
	}
	
	center{
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:18px;
		font-weight:800;
	}
	
	p{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:18px;
		font-weight:800;
		text-align:center;
		color:#FF0000;
	}

	.button{
/* 		font-family: "cwTeXYen", sans-serif; */
		border:0;
  		background-color:#003C9D;
  		color:#fff;
  		border-radius:10px;
  		cursor:pointer;
  		font-size:18px;
  	}

	.button:hover{
/* 		font-family: "cwTeXYen", sans-serif; */
  		color:#003C9D;
  		background-color:#fff;
	}
	
</style>
</head>
<body style="background-color:#FFFCEC;">
<div style="height: 150px;"></div>

<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 900px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<div id="demoFont">
	${d_name}您好，您這次提供的可預約時間：
	</div>
	
	<table class="darkTable">
		<thead>
			<tr>
			<c:forEach items="${dateAndtime}" var="dateAndtime">
				<th><c:out value="${dateAndtime.key}" /></th>
			</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr class="time">
			<c:forEach items="${dateAndtime}" var="dateAndtime">
				<td><c:out value="${dateAndtime.value}" /></td>
			</c:forEach>
			</tr>
			<tr>
			<c:forEach items="${dateAndtime}" var="dateAndtime">
				<td><form action="<c:url value="/canceldate.controller" />" method="post">
						<input type="hidden" name="date" value="${dateAndtime.key}">
						<input class="button" type="submit" value="取消" onclick="return DoubleCheck()">
					</form>
				</td>
			</c:forEach>
			</tr>
		</tbody>	
	</table>
	
	<br/>
	<p>${message.status_clash}</p>
	<center><button type="submit" class="btn btn-primary" onclick="location.href='<c:url value="/bookingAgain.controller" />'">修改可預約時間</button></center>

	</div>
</body>
</html>