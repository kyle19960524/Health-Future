<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function submit(){
	var fileInput = $('#file0').get(0).files[0];
	console.info(fileInput);
	if(fileInput){
		$("#form0").submit();
	}else{
		alert("請上傳發文圖片！");
	}
}
/*function posting() {
	$.ajax({
		url : "http://localhost:8080/HealthFuture/posting",
		type : "POST",
		dataType : "JSON",
		data : {
			"name":$("#descrip").val(), 
			"password":$("#img0").attr("src"),
		},
		success : function (data) {
		console.log(data)
		}
		})
}*/
</script>
	<div style="height: 100px;"></div>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModalCenter">Launch demo modal</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h3>發文圖片：JPG</h3>
					<form name="form0" id="form0" action="<c:url value="/posting.controller" />" method="post" enctype="multipart/form-data">
						<input type="file" name="file0" id="file0" multiple="multiple" /><br>
						<img src="" id="img0" style="width: 20rem; height: 15rem;">
						<textarea rows="4" cols="50" name="descrip" id="descrip"
							placeholder="說點什麼吧" class="message" required></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" onclick="submit()" class="btn btn-primary" >發文</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#file0").change(function() {
			var objUrl = getObjectURL(this.files[0]);//獲取文件信息  
			console.log("objUrl = " + objUrl);
			if (objUrl) {
				$("#img0").attr("src", objUrl);
			}
		});
		function getObjectURL(file) {
			var url = null;
			if (window.createObjectURL != undefined) {
				url = window.createObjectURL(file);
			} else if (window.URL != undefined) { // mozilla(firefox)  
				url = window.URL.createObjectURL(file);
			} else if (window.webkitURL != undefined) { // webkit or chrome  
				url = window.webkitURL.createObjectURL(file);
			}
			return url;
		}

		
	</script>
</body>
</html>