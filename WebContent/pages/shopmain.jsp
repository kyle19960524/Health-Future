<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>購物</title>
<style>
body {
	font-family: "Arial", sans-serif;
}

</style>
<%-- <link href="${cp}/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${cp}/resources/css/style.css" rel="stylesheet"> --%>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<%-- 	  <script src="${cp}/resources/js/jquery.min.js" type="text/javascript"></script> --%>
<%-- 	  <script src="${cp}/resources/js/bootstrap.min.js" type="text/javascript"></script> --%>
<%-- 	  <script src="${cp}/js/layer.js" type="text/javascript"></script> --%>
<!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

	<jsp:include page="/pages/includeMainPage.jsp" />
	<div style="height: 100px;"></div>
	<div align="center">

		<c:if test="${loginStatus}">
			<legend>
				<h1 align="center" style="margin: 30px auto;">${membernickname} 您好，歡迎選購</h1>
			</legend>
		</c:if>
		<!-- 		<div> -->
		<!-- 	<div class="container-fluid"> -->
		<!-- 		<div class="row"> -->
		<!-- 			<div> -->
		<div class="container">
			<fieldset>

				<div class="row justify-content-center">
					<div class="main">
						<!-- 			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> -->


						<!-- 								<div name="productArea1" class="row pd-10" id="productArea1"> -->
						<div align="center" name="productArea1" id="productArea1"></div>
					</div>

					<!-- 								<div name="productArea2" class="row" id="productArea2"> -->
					<div name="productArea2" id="productArea2"></div>


					<!-- 								<div name="productArea3" class="row" id="productArea3"> -->
					<div name="productArea3" id="productArea3"></div>
				</div>
			</fieldset>
		</div>
	</div>




	<script type="text/javascript">
		var productType = new Array;
		productType[1] = "魚油";
		productType[2] = "高蛋白";
		productType[3] = "維他命";

		listProducts();

		function listProducts() {
			var allProduct = getAllProducts();

			var mark = new Array;
			mark[1] = 0;
			mark[2] = 0;
			mark[3] = 0;

			for (var i = 0; i < allProduct.length; i++) {
				var html = "";

				var imgURL = "${cp}/resources/images/" + allProduct[i].p_id
						+ ".jpg";

				console.log(imgURL);
				html +=
				// 					  '<div>'+
				'<div class="col-sm-12 col-md-12" >'
						+ '<div class="boxes pointer" onclick="productDetail('
						+ allProduct[i].p_id + ')">' +
						// 					  '<div onclick="productDetail('+allProduct[i].p_id+')">'+
						'<div class="big bigimg">' +
						// 					  '<div>'+
						'<img src="'+imgURL+'">' + '</div>'
						+ '<p class="product-name">' + allProduct[i].p_name
						+ '</p>' + '<p class="product-price">$'
						+ allProduct[i].p_price + '</p>' + '</div>' + '</div>';

				// 			  html += '<div>'
				// 				  	  '<img src="'+imgURL+'">' +
				// 			  		  '<p>'+allProduct[i].p_name+'</p>'+
				// 			  		  '<p>¥'+allProduct[i].p_price+'</p>'+
				// 			  		  '</div>';

				var id = "productArea" + allProduct[i].p_type;
				var productArea = document.getElementById(id);
				console.log(productArea);
				if (mark[allProduct[i].p_type] == 0) {
					html = '<hr/><h1>' + productType[allProduct[i].p_type]
							+ '</h1><hr/>' + html;
					mark[allProduct[i].p_type] = 1;
				}
				productArea.innerHTML += html;
			}
		}
		function getAllProducts() {
			var allProducts = null;
			var nothing = {};
			$.ajax({
				async : false, //設置同步
				type : 'POST',
				url : '${cp}/getAllProducts',
				data : nothing,
				dataType : 'json',
				success : function(result) {
					if (result != null) {
						allProducts = result.allProducts;
					}
				}
			});

			allProducts = eval("(" + allProducts + ")");
			return allProducts;
		}

		function productDetail(id) {
			var product = {};
			var jumpResult = '';
			product.p_id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/productDetail',
				data : product,
				dataType : 'json',
				success : function(result) {
					jumpResult = result.result;
				}
			});

			if (jumpResult == "success") {
				window.location.href = "${cp}/product_detail";
			}
		}
	</script>
</body>
</html>