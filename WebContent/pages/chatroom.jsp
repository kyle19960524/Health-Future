<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
<title>cheatroom</title>
<script type="text/javascript  src=/resources/js/jquery.3.4.1.js"></script>
<script type="text/javascript">
var webSocket=null;
	var loginName = '<%=request.getParameter("name")%>';
	var chatNumber = '<%=request.getParameter("chatNumber")%>';
	$(function(){
		if(!window.WebSocket){
			alert('你的瀏覽器不支援WebSocket');
		}else{
			startConnect();
		}
	});
	function startConnect(){
		var url = "ws://192.168.10.178:8080/HealthFuture/chat/"+loginName;
		webSocket = new WebSocket(url);//建立一個websocket
		
		webSocket.onerror = function(event){
			onError(event)
		};
		
		webSocket.onopen = function(event){
			onOpen(event)
		};
		
		webSocket.onmessage = function(event){
			onMessage(event)
		};
	}
	
	function colseConnect(){
		webSocket.close();
		window.location.href='./myReservation.jsp';
	}
	
	function onMessage(event){ $("#allMsg").append("<p>"+event.data+"</p>"); }
	function onOpen(event){$("#allMsg").append("<p> 成功連接伺服器 </p>");}
	function onError(event){$("#allMsg").append("<p> 伺服器連接錯誤</p>");}
	function sendMessage(){
		if(webSocket.readyState != 1){
			startConnect();//斷了再從新連接
		}
			webSocket.send(loginName+":"+$("#msg").val());//向伺服器發送訊息
			$("#msg").val("");//清空輸入框
		
	}
	console.log(chatNumber);
</script>
<style type="text/css">
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
}
</style>
</head>
<body style="background-color:#FFFCEC;">
	<div style="height:200px ;" ></div>
	<div style="float: left;">
		<h2>NutrientMainpage's video</h2>
		<video autoplay id="videoN"></video>
	</div>

	<div style="float: left; margin-left: 40px;">
		<h2>client's video</h2>
		<video autoplay id="videoC"></video>
	</div>

	<div>
		<div
			style="float: left; margin-top:20px;margin-left:40px;width: 600px; height: 480px;border: 2px solid black;border-radius:15px;">
			<div id="allMsg" style="margin: 10px auto; width: 400px; height: 400px; overflow:auto;padding:10px; "></div>
			<div>
				<input style="margin-left:20px;" type="text" id="msg" /> 
				<input type="button" value="發送" onclick="sendMessage()" />&nbsp; 
				<input type="button" value="關閉socket" onclick="closeConnect()" />
			</div>
		</div>
	</div>




	<script type="text/javascript">
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
	</script>


</body>
</html>