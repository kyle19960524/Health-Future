<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="${cp}/resources/js/jquery.3.4.1.js" type="text/javascript"></script>


<title>Time Table For Member</title>
<style>
body{    
        background-image: url(resources/images/background/pexels-photo-1656666.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);

table.darkTable {
	font-family: "Arial Black", Gadget, sans-serif;
	border: 2px solid #000000;
	background-color: #4A4A4A;
	width: 85%;;
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
/* 	line-height: 2; */
	font-size: 32px;
	font-weight: 800;
}
</style>
</head>
<body style="background-color:#FFFCEC;">

	<div style="height: 150px;"></div>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 90%; border-radius: 10px; margin: 0 auto; padding-top: 0.5rem; padding-bottom: 0.5rem;">
		<div id="demoFont">${membernickname}????????????????????????????????????????????????</div>
		
	<table class="darkTable">
		<thead>
			<tr>
				<th>????????????</th>
				<th>???????????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>?????????id</th>
				<th>????????????</th>
				<th>???????????????</th>
				<th>?????????</th>
				<th>????????????</th>
				<!-- ?????? ??????????????? -->
				<th>?????????</th>
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


			<c:forEach items="${memTable}" var="mem" varStatus="status">
				<tr>
					<td><c:out value="${mem.memName}" /></td>
					<td><c:out value="${mem.nutriName}" /></td>
					<td><c:out value="${mem.date}"  /></td>
					<td><c:out value="${mem.eachTime}" /></td>
					<td><c:out value="${mem.chatroomid}" /></td>
					<td><c:out value="${mem.status}" /></td>
					<td>
					<c:if test="${mem.date == date}">
						<c:if test="${fn:substring(mem.eachTime,0,2)==stime}">
						
							
							<form action="<c:url value ="/turntomyReservationM.controller"/>">
									<input type="hidden" name="memId" value="${mem.memId}">
									<input type="hidden" name="nutriId" value="${mem.nutriId}">
									<input type="hidden" name="memchatroomid" value="${mem.chatroomid}">
									<input type="submit" value="???????????????">
								</form>

						</c:if>
					</c:if>
					</td>
					<td>
					<c:if test="${mem.status==1}">
					<form action="<c:url value="/cancelBookingForMem.controller" />" method="post">
						<input type="hidden" name="bookingtbleid" value="${mem.id}">
						<input type="hidden" name="note" id="noteToNutri">
						<input type="hidden" name="status" value="${mem.status}">
						<input class="button" type="submit" value="??????" onclick="return DoubleCheckAndGiveNote()">
					</form>
					</c:if>
					<c:if test="${mem.status==2}">
						?????????????????????~
					</c:if> 
					<c:if test="${mem.status==3}">
						?????????????????????~
					</c:if>  
					</td>
					<td>
					<c:if test="${(mem.status==1)||(mem.status==2)}">
					<form action="<c:url value="/bookingDetailForMem.controller" />" method="post">
					<input type="hidden" name="bookingTableId" value="${mem.id}">
					<input type="submit" value="??????">
					</form>
					</c:if>
					</td>
					<!-- ?????? -->
					<td>
					<c:if test="${mem.status==1}">
					<form action="<c:url value="/turntoshopToReserv.controller" />" method = "post">
<!-- 					<input type="hidden" name="productId" value="100"> -->
					<input type="hidden" name="btid" value="${mem.id}">
					<input type="submit" value="????????????" onclick="redirectToShopMain()">
					</form>
					</c:if>
					</td>


<!-- 					<td> -->
<%-- 					<c:if test="${mem.status==1}"> --%>
<%-- 					<form action="<c:url value="/turntoshopCar.controller" />" method = "post"> --%>
<%-- 					<input type="hidden" name="productId" value="${productDetail.p_id }"> --%>
<!-- 					<input type="submit" value="????????????" onclick="addToShoppingCar(100)"> -->
<!-- 					</form> -->
<%-- 					</c:if> --%>
<!-- 					</td> -->
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
<!-- 		?????????		<td colspan="9">??????(1:????????????/2:???????????????/3:????????????)</td> -->
				<td colspan="10">??????(1:????????????/2:???????????????/3:????????????)</td>
			</tr>
		</tfoot>
	</table>
	
		<br/>
</div>
	
	<script>


	function DoubleCheckAndGiveNote(){
		var text = prompt("????????????,?????????????????????????????????!!","?????????");
		 if(text!=null){
// 			 console.log(text);
			 document.getElementById("noteToNutri").value=text;
			 return true;
		 }else{
			 return false;
		 }
	}


	function redirectToShopMain(){
		window.location.href = "${cp}/shopToReserv";
		}


	


	
	
	</script>
</body>

</html>