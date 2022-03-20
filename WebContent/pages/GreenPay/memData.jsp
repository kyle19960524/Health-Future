<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includeMainPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memData</title>
<style>
body{
/* 	font-family: "Microsoft YaHei", sans-serif; */
		background-image: url(resources/images/background/pexels-photo-219794.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
}

.st1 {
	width: 650px;
	border-bottom: 1px dashed #BCAAA4;
	margin: 20px;
 	padding-bottom: 10px;
	font-size: 20px;
	text-align: left;
}

.st2 {
	width: 450px;
	margin: 20px;
	text-align: center;
}

fieldset {
	width: 750px;
	margin: 10px;
	border: 2px solid #7B7B7B;
	border-radius: 10px;
}

    .scheduler-border {
   	   width: auto; 
   	   border-bottom: none; 
	}
</style>
<script>
  function confirmUpdate(){
	  var result = confirm("付款資料確定無誤?");
	  if (result) {
	      return true;
	  }else{
	  	  return false;
	  }
  }
</script>
</head>
<body  style="background-color:#FFFCEC;">
<div align="center">
	<div style="height:100px ;" ></div>
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 900px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	
			<form action="<c:url value="/greenPay.controller" />" method="POST">
			<fieldset>
				<legend class="scheduler-border"><h2 style="color:#FFEB3B;">付款個人基本資料</h2></legend>
				<h3 align="center" style="margin: 30px auto; color:#FF9E80;">親愛的 ${membernickname} 您好！</h3>
				
				<br>
				<div class="st1">
					<label>姓名：</label>
					<span><input type="text" name="name" value="${memberData.fullName}"></span>	
				</div>
				<div class="st1">
					<label>電話：</label>
					<span><input type="text" name="phone" value="${memberData.cellphone}"></span> 
				</div>
				<div class="st1">
					<label>地址：</label>
					<span><input type="text" name="address" value="${memberData.location}"></span> 
				</div>
				<div class="st1">
					<label>信箱：</label>
					<span><input type="text" name="email" value="${memberData.email}"></span> 
				</div>
				<input type="hidden" name="productTime" value="${orderDetail.productTime}"/>
				<input type="hidden" name="useId" value="${orderDetail.useId}"/>
				<input type="hidden" name="productId" value="${orderDetail.productId}"/>
				<input type="hidden" name="productName" value="${orderDetail.productName}"/>
				<input type="hidden" name="productPrice" value="${orderDetail.productPrice}"/>
				<input type="hidden" name="productCount" value="${orderDetail.productCount}"/>
			</fieldset>
			<div align="center" style="width: 600px; margin: 20px auto;"
				class="form-group form-check">
				<button type="submit" class="btn btn-primary" onclick="return confirmUpdate();">資料無誤付款去</button>
			</div>
		</form>
		</div>
		
	</div>
	<br/>
	
</body>
</html>