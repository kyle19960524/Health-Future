<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        }
        
         
        
        
        </style>
        
       
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
	font-size:18px;
	}
	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	h1{
		font-family: "cwTeXYen", sans-serif;
	
	}
</style>
</head>
<body>
 <div class="bg" >
        <img src="<c:url value="/resources/images/back1.png"/>">
    </div>
<h1 style="color:red ; text-align:center;" >新註冊營養師資料</h1>
<div align="center">



<form action="<c:url value="/status1.controller" />" method="post">
<table border="1"  style="text-align:center; background: -webkit-linear-gradient(white,	#E0E0E0);">

<tr class="font" style="background: -webkit-linear-gradient(black,gray); ">
<td ><font color="white">頭像</font></td>
<td><font color="white">證照</font></td>
<td ><font color="white">姓名</font></td>
<td><font color="white">性別</font></td>
<td><font color="white">學歷</font></td>
<td><font color="white">身分證</font></td>
<td><font color="white">電子郵件</font></td>
<td><font color="white">手機</font></td>
<td><font color="white">認證</font></td>
</tr>


<c:forEach  items="${A}"  var="aaa"> 

<tr class="font2">
<td><img width="100px" height="100px" src='<c:url value="${fn:substring(fn:substringAfter(aaa.path1,'WebContent'),1,-1)}"/>'/> </td>
<td><img width="100px" height="100px" src='<c:url value="${fn:substring(fn:substringAfter(aaa.path2,'WebContent'),1,-1)}"/>'/> </td>
<td><c:out value="${aaa.name}"></c:out></td> 
<td><c:out value="${aaa.gender}"></c:out></td>
<td><c:out value="${aaa.education}"></c:out></td>
<td><c:out value="${aaa.iden}"></c:out></td>
<td><c:out value="${aaa.email}"></c:out></td>
<td><c:out value="${aaa.cellphone}"></c:out></td>

<td><input type="checkbox" name="newNutri" value="${aaa.id}"></td>
</tr></c:forEach>
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