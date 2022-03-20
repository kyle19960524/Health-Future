<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
<style>
.st1 {
	width: 450px;
	border-bottom: 1px solid black;
	margin: 20px;
	padding-bottom: 10px;
}

.st2 {
	width: 450px;
	margin: 20px;
	text-align: center;
}

fieldset {
	width: 500px;
	margin: 10px;
	border: 1px solid #7B7B7B;
	border-radius: 15px;
}
</style>
	</head>
	<body  style="background-color:#FFFCEC;">
		<div style="height:280px ;" ></div>
	<div align="center">
<%-- 	<form action="<c:url value="/memberdata.controller" />" method="post"> --%>
	<fieldset>
				<legend>歡迎 ${user}<br/>個人資料</legend>
				<c:forEach var="list" items="show">
				<div class="st1">
					<label>帳號:</label>
					<span>${lm.A}</span> 
				</div>
				<div class="st1">
					<label>密碼:</label>
					<span>${list.B}</span> 
				</div>
				<div class="st1">
					<label>姓名:</label>
					<span>${list.C}</span> 
				</div>
				<div class="st1">
					<label>暱稱:</label>
					<span>${list.D}</span>
				</div>
				<div class="st1">
					<label>身分證字號:</label>
					<span>${list.E}</span>
				</div>
				<div class="st1">
					<label>性別:</label>
					<span>${list.F}</span>
				</div>
				<div class="st1">
					<label>生日:</label>
					<span>${list.G}</span>
				</div>
				<div class="st1">
					<label>身高:</label>
					<span>${list.H}</span>
				</div>
				<div class="st1">
					<label>體重:</label>
					<span>${list.I}</span>
				</div>
				<div class="st1">
					<label>居住地區:</label>
					<span>${list.J}</span>
				</div>

				<div class="st1">
					<label>行動電話:</label>
					<span>${list.K}</span>
				</div>
				<div class="st1">
					<label>電子信箱:</label>
					<span>${list.L}</span>
				</div>
            </c:forEach>
			</fieldset>
   
   <div class="st2">
				<input type="submit" value="修改"> <input type="reset"
					value="清除">
			</div>
<!-- 			</form> -->
</div>
	<div><a href="${pageContext.servletContext.contextPath}/memberdata.controller">會員資料管理</a></div>
	
	<div><a href="${pageContext.servletContext.contextPath}/checkLogout.controller">登出</a></div>

	
<!-- 		<sf:form modelAttribute="Member" method="post"> -->
<!-- 			<table width="700" align="center" border="1"> -->
<!-- 				<tr> -->
<!-- 					<td>會員名稱:</td><td>${user.m_useraccount }<sf:hidden path="m_useraccount"/></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>會員密碼:</td><td><sf:password path="m_password"/><sf:errors path="m_password"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>會員暱稱:</td><td><sf:input path="m_nickname"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>身高:</td><td><sf:input path="m_height"/><sf:errors path="m_height"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>體重:</td><td><sf:input path="m_weight"/><sf:errors path="m_weight"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>行動電話:</td><td><sf:input path="m_cellphone"/><sf:errors path="m_cellphone"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>電子信箱:</td><td><sf:input path="email"/><sf:errors path="email"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="2"> -->
<!-- 						<input type="submit" value="資料更新"/> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</sf:form> -->
</body>

</html>
