<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${clickNotiData.memName}
${clickNotiData.date}
${clickNotiData.eachTime}
${clickNotiData.chatroomid}

<button type="button" class="btn btn-primary"  onclick="location.href='<c:url value="/turntoMainPage.controller" />'">回首頁</button>
</body>
</html>