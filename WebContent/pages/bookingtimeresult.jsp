<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking time result</title>
<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-1089842.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;     
     }

	button{
	    font-family: "微軟正黑體";
	}
	
	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	table.darkTable {
  		font-family: "Arial Black", Gadget, sans-serif;
  		border: 2px solid #000000;
  		background-color: #4A4A4A;
  		width:60%;;
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
  		font-size: 18px;
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
  		font-size: 18px;
  		font-weight: bold;
  		color: #E6E6E6;
  		text-align: center;
  		border-left: 2px solid #4A4A4A;
	}
	
	table.darkTable thead th:first-child {
  		border-left: none;
	}

	table.darkTable tfoot {
  		font-size: 14px;
  		font-weight: bold;
  		color: #E6E6E6;
  		background: #000000;
  		background: -moz-linear-gradient(top, #404040 0%, #191919 66%, #000000 100%);
  		background: -webkit-linear-gradient(top, #404040 0%, #191919 66%, #000000 100%);
  		background: linear-gradient(to bottom, #404040 0%, #191919 66%, #000000 100%);
  		border-top: 1px solid #4A4A4A;
	}
	
	table.darkTable tfoot td {
  		font-size: 14px;
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
 		font-size:32px;
		font-weight:800;
		
	}
	
	center{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:18px;
		font-weight:800;
	}
	
	
</style>
</head>
<body style="background-color:#FFFCEC;">
<div style="height: 200px;"></div>
	<div id="demoFont">
		${d_name}您好，您這次提供的可預約時間：
	</div>
	<table  class="darkTable">
		<thead>
			<tr><th>${thisTime.thisDate}</th></tr>
		</thead>
		<tbody>
		<c:forEach items="${timeAll}" var="time">   
        	<tr><td><c:out value="${time.value}" /></td></tr>
		</c:forEach> 
		</tbody>
		<tfoot>
			<tr><td>欲更改請直接預約同日期</td></tr>
		</tfoot>
	</table>
	<br/>
	<center><button type="submit" class="btn btn-primary" onclick="location.href='<c:url value ="/bookingAgain.controller" />'">修改可預約時間</button></center>
</body>
</html>