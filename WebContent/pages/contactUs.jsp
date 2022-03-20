<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-3683098.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
     
</style> 
<script type="text/javascript">

	var ca="${x1}"+"${x2}"+"${x3}"+"${x4}"
	var can = ca.charAt(0)+ca.charAt(3)+ca.charAt(6)+ca.charAt(9);
	
	console.log(ca);
	console.log(can);
	
	function checkNum(){
		var txtCheck = document.getElementById("txtCheck");
		if(txtCheck.value !=can ){
			
			var spanCheck = document.getElementById("spanCheck");
			spanCheck.innerHTML="驗證碼錯誤，請輸入正確的驗證碼。"
			
			var btnCheck = document.getElementById("btnCheck");
			btnCheck.type="hidden";
			
			console.log("wrong");
		}else{
			var spanCheck = document.getElementById("spanCheck");
			spanCheck.innerHTML=" "
			var btnCheck = document.getElementById("btnCheck");
			btnCheck.type="button";
		}
	}
	
	function checkSubmit(){
		if(content.name.value==""){
			 alert("未輸入姓名");
		}else if(content.email.value==""){
			alert("未輸入電子信箱");
		}else if(content.questionContent.value==""){
			alert("請輸入您的問題");
		}else{
			content.submit();
		}
	}
	
</script>


<title>聯絡我們</title>
</head>
<body style="background-color:#FFFCEC;">
	<div style="height:130px ;" ></div>
	<div align="center" style="width: 700px; margin: 15px auto;">
		<h2>請留下您的問題，我們會盡快與您聯絡</h2>
		<form action="sendQuestion.controller" method="post" name="content">
			<div class="input-group mb-3" style="margin-top: 15px;">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1" >您的大名：</span>
				</div>
				<input type="text" class="form-control" placeholder="您的大名"
					aria-label="Username" aria-describedby="basic-addon1" name="name" >
			</div>

			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="請留下您的電子信箱"
					aria-label="Recipient's username" aria-describedby="basic-addon2" name="email">
				<div class="input-group-append">
					<select class="custom-select" name="selectEmail"
						id="inputGroupSelect01">
						
						<option value="1">@gmail.com</option>
						<option value="2">@yahoo.com.tw</option>
						<option value="3">@hotmail.com</option>
						<option value="4">其他：請自行輸入</option>
					</select>
				</div>
			</div>

			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">請留下您的問題</span>
				</div>
				<textarea rows="8" class="form-control" aria-label="With textarea"
					name="questionContent"></textarea>
			</div>

			<div style="text-align: center; margin-top: 10px; ">

				<div style="width: 200px; height: 50px; display:inline-block; ">
					<input type="text" class="form-control" placeholder="請輸入驗證碼" id="txtCheck" onblur="checkNum()"> 
				</div>
				
				<div style="width: 200px; height: 50px; display:inline-block; ">
					
					
					<img style="height: 40px; width: 47; float:left;margin-top: 20px;" alt=""
						src="<c:url value="/resources/images/cNumber/c${x1}.png"/>">
					<img style="height: 40px; width: 47; float: left;margin-top: 20px;" alt=""
						src="<c:url value="/resources/images/cNumber/c${x2}.png"/>">
					<img style="height: 40px; width: 47; float: left;margin-top: 20px;" alt=""
						src="<c:url value="/resources/images/cNumber/c${x3}.png"/>">
					<img style="height: 40px; width: 47; float: left;margin-top: 20px;" alt=""
						src="<c:url value="/resources/images/cNumber/c${x4}.png"/>">
				</div>
			</div>
			<span id="spanCheck" style="dispaly:block; color:red;"></span>
	
			<input style="margin-top: 10px;dispaly:block;" type="hidden" value="送出"
				class="btn btn-outline-secondary" id="btnCheck" onclick="checkSubmit()">
		</form>
	</div>

</body>
</html>