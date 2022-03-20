<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webcom</title>
<style type="text/css">
video {
	width: 400px;
	height: 400px;
	object-fit: cover;
}
@media (min-width: 1000px) {
	video {
		height: 480px;
	}
</style>
</head>
<body>

	<h1>video on canvas</h1>
	<video autoplay></video>
	
	<script type="text/javascript">
'use strict';

var constraints = {
  video: true
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