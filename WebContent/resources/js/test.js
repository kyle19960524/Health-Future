/**
 * 
 */
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
		var url = "ws://192.168.102.105:8080/HealthFuture/chat/"+loginName;
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