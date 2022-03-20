<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/icons/back2.ico'/>"
	rel="external nofollow" type="image/x-icon" />
<style >
 .bg {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: -999;
        }
        .bg img {
            min-height: 100%;
            width: 100%;
        }</style>
<style>
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	.font{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:18px;
		font-weight:800;
	
	}
	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	.font2{font-family: "cwTeXYen", sans-serif;
	font-size:18px;}
	
	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	h1{
		font-family: "cwTeXYen", sans-serif;
	
</style>

</head>
<body>
<div class="bg">
        <img src="<c:url value="/resources/images/back3.png"/>">
    </div>
<h1 style="color:red ; text-align:center;" >問題回覆歷史紀錄</h1>

<div align="center">




<table border="1" style="text-align:center; background: -webkit-linear-gradient(white,	#E0E0E0);">

<tr class="font" style="background: -webkit-linear-gradient(black,gray); ">
<td><font color="white">時間</font></td>
<td><font color="white">顧客姓名</font></td>
<td><font color="white">顧客email</font></td>
<td width="150"><font color="white">主要內容</font></td>
<td><font color="white">員工姓名</font></td>

</tr>


<c:forEach  items="${Qstatus1}"  var="aaa"> 

<tr class="font2">
<td><c:out value="${aaa.questionTime}"></c:out></td>
<td><c:out value="${aaa.customerName}"></c:out></td>
<td><c:out value="${aaa.customerEmail}"></c:out></td>
<td><c:out value="${aaa.questionContent}"></c:out></td>
<td><c:out value="${aaa.employeeName}"></c:out></td>

</tr></c:forEach>
</table>


        
<a style="margin: 0 auto;" href="<c:url value="/turntoback.controller" />">上一頁</a>
</div>
</body>
</html>