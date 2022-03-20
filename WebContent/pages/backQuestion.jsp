<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客問題</title>
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
	
	}
</style>

</head>
<body>
<div class="bg">
        <img src="<c:url value="/resources/images/back2.png"/>">
    </div>

<h1 style="color:red ; text-align:center;" >會員問題</h1>
<div align="center">
<form action="<c:url value="/questionstatus.controller" />" method="post">
<table border="1" style="text-align:center; background: -webkit-linear-gradient(white,	#E0E0E0);">
<tr class="font" style="background: -webkit-linear-gradient(black,gray); ">
<td><font color="white">會員姓名</font></td>
<td><font color="white">日期</font></td>
<td width="150"><font color="white">主要問題</font></td>
<td><font color="white">回信</font></td>
<td><font color="white">完成回覆</font></td>
</tr>

<c:forEach  items="${B}"  var="bbb"> 
<tr class="font2">
<td><c:out value="${bbb.customerName}"></c:out></td>
<td><c:out value="${bbb.questionTime}"></c:out></td>
<td><c:out value="${bbb.questionContent}"></c:out></td>
<td><a href="mailto:<c:out value="${bbb.customerEmail}"></c:out>"><img style="width:20px;height:15px" src="<c:url value="/resources/images/mail1.png"/>"></a></td>
<td><input type="checkbox" name="questionstatus" value="${bbb.questionId}"></td>
</tr>
</c:forEach>
</table>
 <div >
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
			</div>
</form>
<a style="margin: 0 auto;" href="<c:url value="/turntoback.controller" />">上一頁</a>
</div>
</body>
</html>