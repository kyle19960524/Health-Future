<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <meta charset="utf-8" />
    <title>WebSocket Test</title>
    <script type="text/javascript  src=/resources/js/jquery.3.4.1.js"></script>
    <script language="javascript" type="text/javascript">
        var wsUri = "ws://echo.websocket.org/";
        var output;
            function init() {
                output = document.getElementById("output");
                testWebSocket();
            }
            function testWebSocket() {
                websocket = new WebSocket(wsUri);
                websocket.onopen = function(evt) { 
                    onOpen(evt)
                    };
                websocket.onclose = function(evt) {
                    onClose(evt)
                };
                websocket.onmessage = function(evt) {
                    onMessage(evt)
                };
                websocket.onerror = function(evt) {
                    onError(evt)
                };
            }
            function onOpen(evt) {
                writeToScreen("CONNECTED"); 
                doSend("WebSocket rocks"); 
            }  
            function onClose(evt) { 
                writeToScreen("DISCONNECTED"); 
            }  
            function onMessage(evt) { 
                writeToScreen('RESPONSE: ' + evt.data+''); 
                websocket.close(); 
            }  
            function onError(evt) { 
                writeToScreen('ERROR: ' + evt.data); 
            }  
            function doSend(message) { 
                writeToScreen("SENT: " + message);
                websocket.send(message); 
            }  
            function writeToScreen(message) { 
                var pre = document.createElement("p"); pre.style.wordWrap = "break-word"; pre.innerHTML = message; output.appendChild(pre); 
            }  
            window.addEventListener("load", init, false);  
        </script>  
        <h2>WebSocket Test</h2>  
        <div id="output"></div>  