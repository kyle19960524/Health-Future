<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time Table For Nutrition</title>

<style>
body{    
        background-image: url(resources/images/background/pexels-photo-414645.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
        
     }

@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);

table.darkTable {
	font-family: "Arial Black", Gadget, sans-serif;
	border: 2px solid #000000;
	background-color: #4A4A4A;
	width: 60%;;
	margin: auto;
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

table.darkTable tfoot {
	font-size: 12px;
	font-weight: bold;
	color: #E6E6E6;
	background: #000000;
	background: -moz-linear-gradient(top, #404040 0%, #191919 66%, #000000 100%);
	background: -webkit-linear-gradient(top, #404040 0%, #191919 66%, #000000 100%);
	background: linear-gradient(to bottom, #404040 0%, #191919 66%, #000000 100%);
	border-top: 1px solid #4A4A4A;
}

table.darkTable tfoot td {
	font-size: 12px;
}

#demoFont {
	text-align: center;
	letter-spacing: 2px;
	word-spacing: 2px;
/* 	color: #7E6EFF; */
	text-decoration: none;
	font-style: normal;
	font-variant: normal;
	text-transform: none;
	margin: 20px;
/* 	font-family: "cwTeXYen", sans-serif; */
	line-height: 2;
	font-size: 32px;
	font-weight: 800;
}
</style>
</head>
<body style="background-color:#FFFCEC;">
	<div style="height: 150px;"></div>
	<div style="width: 700px; margin: 0 auto; background-color: black; opacity:0.7; color:white; border-radius:5px;">
	<div id="demoFont">${d_name}????????????????????????????????????????????????</div>
	</div>
	<table class="darkTable">
		<thead>
			<tr>
				<th>???????????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>?????????id</th>
				<th>????????????</th>
				<th>???????????????</th>
				<th>?????????</th>
				<th>????????????</th>
			</tr>
		</thead>
		<tbody>
			<%
				Date date = new Date();
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
				String sDate = sd.format(date);

				SimpleDateFormat st = new SimpleDateFormat("kk");
				String stDate = st.format(date);
				session.setAttribute("date", sDate);
				session.setAttribute("stime", stDate);
			%>

			<c:forEach items="${nutriTable}" var="nutri" varStatus="status">
				<tr class="selected">
					<td><c:out value="${nutri.nutriName}" /></td>
					<td><c:out value="${nutri.memName}" /></td>
					<td><c:out value="${nutri.date}" /></td>
					<td><c:out value="${nutri.eachTime}" /></td>
					<td><c:out value="${nutri.chatroomid}" /></td>
					<td><c:out value="${nutri.status}" /></td>
					<td><c:if test="${nutri.date == date}">
							<c:if
								test="${fn:substring(nutri.eachTime,0,2)==stime && nutri.status==1}">
								<form
									action="<c:url value ="/turntomyReservationN.controller"/>">
									<input type="hidden" name="memId" value="${nutri.memId}">
									<input type="hidden" name="nutriId" value="${nutri.nutriId}">
									<input type="hidden" name="nutrichatroomid" value="${nutri.chatroomid}">
									<input type="submit" value="???????????????">
								</form>

							</c:if>
						</c:if>
					</td>
					<td>
					<c:if test="${nutri.status==3}">
						?????????????????????!!
					</c:if>
					<c:if test="${nutri.status==2}">
						??????????????????!!
					</c:if>
					<c:if test="${nutri.status==1}">
					<form action="<c:url value="/cancelBookingForNutri.controller" />" method="post">
						<input type="hidden" name="time" value="${nutri.eachTime}">
						<input type="hidden" name="date" value="${nutri.date}">
						<input type="hidden" name="bookingtbleid" value="${nutri.id}">
						<input type="hidden" name="note" id="noteTomem">
						<input type="hidden" name="status" value="${nutri.status}">
						<input class="button" type="submit" value="??????" onclick="return DoubleCheckAndGiveNote()">
					</form>
					</c:if>
					<c:if test="${nutri.status==0}">
					<form action="<c:url value="/cancelBookingForNutri.controller" />" method="post">
						<input type="hidden" name="time" value="${nutri.eachTime}">
						<input type="hidden" name="date" value="${nutri.date}">
						<input type="hidden" name="bookingtbleid" value="${nutri.id}">
						<input type="hidden" name="status" value="${nutri.status}">
						<input class="button" type="submit" value="??????" onclick="return DoubleCheck()">
					</form>				
					</c:if>
					</td>
					<td>
					<c:if test="${(nutri.status==1)||(nutri.status==3)}">
					<form action="<c:url value="/bookingDetailForNutri.controller" />" method="post">
					<input type="hidden" name="bookingTableId" value="${nutri.id}">
					<input type="submit" value="??????">
					</form>
					</c:if>
					</td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="9">??????(0:?????????/1:????????????/2:????????????/3:????????????)</td>
			</tr>
		</tfoot>
	</table>
	<script>
		function jump() {
			window.location.href("/pages/myReservation");
		}

		function DoubleCheckAndGiveNote(){
			var text = prompt("????????????,??????????????????????????????!!","?????????");
			 if(text!=null){
// 				 console.log(text);
				 document.getElementById("noteTomem").value=text;
				 return true;
			 }else{
				 return false;
			 }
		}
		
		function DoubleCheck(){
			if(confirm("????????????!????????????????")){  
	    		return true;
	    	}else{
	    		return false;
	    	}	
		}
	
	</script>

</body>
</html>