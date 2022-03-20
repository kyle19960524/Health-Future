<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>chat room NUTRI</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var webSocket=null;
	var year =new Date().getFullYear();
	var month = new Date().getMonth()+1;
	var day = new Date().getDate();
	var Hours = new Date().getHours();
	var min = new Date().getMinutes();
	var time=year+"-"+month+"-"+day+"-"+Hours+":"+min;
	console.log(time);

	var selfName = 'N'+'<%=request.getParameter("nutriId")%>';
	var targetName='M'+'<%=request.getParameter("memId")%>';
	var loginName = '<%=request.getParameter("name")%>';
	var chatroomid='<%=request.getParameter("nutrichatroomid")%>';

	$(function() {
		if (!window.WebSocket) {
			alert('你的瀏覽器不支援WebSocket');
		} else {
			startConnect();
		}
	});
	function startConnect() {
		var url = "ws://127.0.0.1:8080/HealthFuture/chat/" + selfName + "/"
				+ targetName + "/" + loginName;
		webSocket = new WebSocket(url);//建立一個websocket

		webSocket.onerror = function(event) {
			onError(event)
		};

		webSocket.onopen = function(event) {
			onOpen(event)
		};

		webSocket.onmessage = function(event) {
			onMessage(event)
		};
	}

	function colseConnect() {
		webSocket.close();
		window.location.href = "http://localhost:8080/HealthFuture/pages/contactUs.jsp";
	}

	function onMessage(event) {
		$("#allMsg").append("<p>" + event.data+"&nbsp;&nbsp;&nbsp;&nbsp"+time+ "</p>");
	}
	function onOpen(event) {
		$("#allMsg").append(loginName + "成功進入聊天室 "+time);
	}
	function onError(event) {
		$("#allMsg").append("<p> 伺服器連接錯誤</p>");
	}
	function sendMessage() {
		if (webSocket.readyState != 1) {
			startConnect();//斷了再從新連接
		}
		webSocket.send(loginName + ":" + $("#msg").val());//向伺服器發送訊息
		$("#msg").val("");//清空輸入框

	}

	
</script>
	<script>

function checkuser(){
	/*
	var breakfast1 = document.getElementById("breakfast1").value;
	var breakfast2 = document.getElementById("breakfast2").value;
	var breakfast3 = document.getElementById("breakfast3").value;
	
	var lunch1 = document.getElementById("lunch1").value;
	var lunch2 = document.getElementById("lunch2").value;
	var lunch3 = document.getElementById("lunch3").value;
	
	var dinner1 = document.getElementById("dinner1").value;
	var dinner2 = document.getElementById("dinner2").value;
	var dinner3 = document.getElementById("dinner3").value;
	
	var specail1 = document.getElementById("specail1").value;
	var specail2 = document.getElementById("specail2").value;
	var specail3 = document.getElementById("specail3").value;
	
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}else{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("GET","chatroomN.jsp?breakfast1="escape(breakfast1),true);
	xmlhttp.send();//請求伺服器
	*/
	
	
	$.ajax({
		url:"insertRecipe",
		type:"POST",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		dataType:"JSON",
		data: {
			"extra1":$('#extra1').val(),
			"extra2":$('#extra2').val(),
			"extra3":$('#extra3').val(),
			
			"breakfast1":$('#breakfast1').val(),
			"breakfast2":$('#breakfast2').val(),
			"breakfast3":$('#breakfast3').val(),
			
			"lunch1":$('#lunch1').val(),
			"lunch2":$('#lunch2').val(),
			"lunch3":$('#lunch3').val(),
			
			"dinner1":$('#dinner1').val(),
			"dinner2":$('#dinner2').val(),
			"dinner3":$('#dinner3').val(),
			"chatroomid":$('#nutrichatroomid').val(),

			},
			success : function(data){
				alert(data);
				
				}
		}
	);
	
	}

</script>
<style type="text/css">
body {    
      background-image: url(resources/images/background/pexels-photo-1166644.jpeg);
      background-repeat: no-repeat; 
      background-attachment: fixed;
      background-size:cover;    
     }
     
h3, .divrecipe{
	font-weight: 800;
}

video {
	width: 300px;
	height: 300px;
	object-fit: cover;
	background-color: black;
}

@media ( min-width : 1000px) {
	video {
		height: 300px;
	}
	textarea {
		border: 0;
		border-radius: 5px;
		background-color: rgba(241, 241, 241, .98);
		padding: 10px;
		resize: none;
		/*outline: none*/
	}
}
</style>
</head>
<body style="background-color: #FFFCEC;">
	<div style="height: 100px;"></div>
	<!--  <div style="float: left;">
		<h2>NutrientMainpage's video</h2>
		<video autoplay id="videoN"></video>
	</div>

	<div style="float: left; margin-left: 40px;">
		<h2>client's video</h2>
		<video autoplay id="videoC"></video>
	</div>-->

	<div>
		<div class="divrecipe" 
			style="float: left; margin-top: 20px; margin-left: 40px; width: 500px; height: 500px; border: 2px solid black; border-radius: 15px; position: fixed;">
			<div id="allMsg"
				style="margin-top: 10px auto; width: 480px; height: 360px; overflow: auto; padding: 10px;"></div>
			<div style="margin-left:20px;">
				<textarea style="width: 400px;" id="msg"></textarea>
				<input style="border-radius: 5px; outline: none;" type="button" value="發送"	 onclick="sendMessage()" />
				&nbsp; 
				<!--  <input style="border-radius: 5px; outline: none;" type="button" value="關閉socket" onclick="closeConnect()" />-->
			</div>
		</div>
	</div>
	<div class="divrecipe" 
		style="margin-top: 20px; padding: 10px; margin-left: 580px; width: 750px; height: 550px; border: 2px solid black; border-radius: 15px; position: fixed; text-align: center; align: center">
		<h3>推薦食譜</h3>
		<hr style="border: 1px dashed black; width: 95%;">
		<form style="margin: 0px auto" method='post'>
			<table style="text-align: center; margin: 0px auto">
				<tr style="text-align: center; margin: 5px auto">
					<td>早餐1 <textarea rows="3" id="breakfast1"></textarea></td>
					<td>早餐2 <textarea rows="3" id="breakfast2"></textarea></td>
					<td>早餐3 <textarea rows="3" id="breakfast3"></textarea></td>

				</tr>
								
				<tr>
					<td>午餐1 <textarea rows="3" id="lunch1"></textarea></td>
					<td>午餐2 <textarea rows="3" id="lunch2"></textarea></td>
					<td>午餐3 <textarea rows="3" id="lunch3"></textarea></td>
				</tr>
				<tr>
					<td>晚餐1 <textarea rows="3" id="dinner1"></textarea></td>
					<td>晚餐2 <textarea rows="3" id="dinner2"></textarea></td>
					<td>晚餐3 <textarea rows="3" id="dinner3"></textarea></td>
				</tr>
				<tr>
					<td>補充1 <textarea rows="3" id="extra1"></textarea></td>
					<td>補充2 <textarea rows="3" id="extra2"></textarea></td>
					<td>補充3 <textarea rows="3" id="extra3"></textarea></td>
					
				</tr>
				
				  <!--<tr >
					<td ></td></tr>
					<td ><input style="margin-top:10px" type="hidden" value=""></td>
					<td ><input style="margin-top:10px" type="reset" value="清除"></td>
				</tr>-->
			</table>
			<button style="margin-top:10px" type="button" class="btn btn-outline-success" onclick="checkuser()">送出</button>
			
			<input type="hidden" value="${nutri_chatroomid}" id="nutrichatroomid">
		</form>

	</div>




	<!--  <script type="text/javascript">
		'use strict';

		var constraints = {
 			video: true,
 			audio: true
		};

		var video = document.querySelector('video');

		function handleSuccess(stream) {
 			window.stream = stream; // only to make stream available to console
  			video.srcObject = stream;
		}

		function handleError(error) {
  			console.log('getUserMedia error: ', error);
		}

		navigator.mediaDevices.getUserMedia(constraints).
  		then(handleSuccess).catch(handleError);
	</script>-->


</body>
</html>