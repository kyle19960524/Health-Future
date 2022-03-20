<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>  
<html>  
<head>  
<title>HTML5上传图片预览</title>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>  
</head>  
<body>  
<h3>请选择图片文件：JPG/GIF</h3>  
<form name="form0" id="form0">  
<input type="file" name="file0" id="file0" multiple="multiple" /><br>  
		<img src="" id="img0" style="width: 20rem;height: 15rem;">
</form>  
<script>   
$("#file0").change(function(){  
		 var objUrl = getObjectURL(this.files[0]) ;//获取文件信息  
		 console.log("objUrl = "+objUrl);  
		  if (objUrl) {  
		  $("#img0").attr("src", objUrl);  
		 }   
}) ;  
function getObjectURL(file) {  
		 var url = null;   
		 if (window.createObjectURL!=undefined) {  
		  url = window.createObjectURL(file) ;  
		 } else if (window.URL!=undefined) { // mozilla(firefox)  
		  url = window.URL.createObjectURL(file) ;  
		 } else if (window.webkitURL!=undefined) { // webkit or chrome  
		  url = window.webkitURL.createObjectURL(file) ;  
		 }  
		 return url ;  
		}  
		</script>  
</body>

</html>   