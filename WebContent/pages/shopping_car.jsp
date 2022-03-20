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

<link href="${cp}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${cp}/resources/css/style.css" rel="stylesheet">

<script src="${cp}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${cp}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${cp}/resources/js/layer.js" type="text/javascript"></script>
<!-- <script> -->
	
<%session.getAttribute("memberid");%>
<%session.getAttribute("btid");%>
	
<!-- </script> -->

<title>購物去</title>
<%-- <link href="${cp}/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${cp}/css/style.css" rel="stylesheet"> --%>

<%-- <script src="${cp}/js/jquery.min.js" type="text/javascript"></script> --%>
<%-- <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script> --%>
<%-- 	  <script src="${cp}/js/layer.js" type="text/javascript"></script> --%>
<!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<jsp:include page="/pages/includeMainPage.jsp"/>
<div style="height:280px ;" ></div>
	<!-- 中间内容 -->
	<div class="container-fluid bigHead">
		<div class="row">
<!-- 			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1"> -->
<!-- 				<div class="jumbotron"> -->
<!-- 					<h1>歡迎來到購物車</h1> -->
<!-- 					<p>您的購物車清單</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
				<table class="table table-hover center" id="shoppingCarTable">
				</table>

				<hr />
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4"></div>
					<button type="button"
						class="btn btn-danger btn-lg col-lg-4 col-md-4 col-sm-4"
						onclick="confirmPre()">確認購買</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		updateShoppingCars();

		function updateShoppingCars() {
			var shoppingCarTable = document.getElementById("shoppingCarTable");
			var allShoppingCars = getShoppingCars();
			shoppingCarTable.innerHTML = "";
			var html = '<tr>' + '<th>是否購買</th>' + '<th>商品名稱</th>'
					+ '<th>商品單價</th>' + '<th>商品數量</th>' 
					+ '<th>移除商品</th>'
					+ '</tr>';
			for (var i = 0; i < allShoppingCars.length; i++) {
				var product = getProductById(allShoppingCars[i].sc_productId);
				html += '<tr>'
						+ '<td>'
						+ '<div class="checkbox">'
						+ '<label>'
						+ '<input type="checkbox" id="checkbox'+allShoppingCars[i].sc_productId+'" value="option1">'
						+ '</label>' + '</div>' + '</td>' + '<td>'
						+ product.p_name + '</td>' + '<td>' + product.p_price
						+ '</td>' + '<td>' + allShoppingCars[i].sc_counts
						+ '</td>'
						+ '<td>' 
						+ '<button type="button" onclick="deleteShoppingCarButton( '+allShoppingCars[i].sc_productId+')">'
						+ '刪除'
						+ '</button>'
						+ '</td>'
						+ '</tr>';
			}
			shoppingCarTable.innerHTML += html;

		}

		function mustLogin() {
            if("${memberid}" == null || "${memberid}" == undefined || "${memberid}" ==""){
                window.location.href = "${cp}/turntoMember.controller";
            }
        }

		function getShoppingCars() {
			mustLogin();
			var shoppingCarProducts = "";
			var user = {};
			// 			user.userId = ${currentUser.id};
			user.sc_userid = '${memberid}';
			$.ajax({
				async : false, 
				type : 'POST',
				url : '${cp}/getShoppingCars',
				data : user,
				dataType : 'json',
				success : function(result) {
					shoppingCarProducts = result.result;
				},
		
			});
			shoppingCarProducts = eval("(" + shoppingCarProducts + ")");
			return shoppingCarProducts;
		}

				function confirmPre() {
					var allShoppingCars = getShoppingCars();
					var buyProducts = new Array;
					var buyProductsCounts = new Array;
					var buyCounts = 0;
					for(var i=0;i<allShoppingCars.length;i++){
						var checkBox = document.getElementById("checkbox"+allShoppingCars[i].sc_productId);
						if(checkBox.checked){
							buyProducts[buyCounts] = allShoppingCars[i].sc_productId;
							buyProductsCounts[buyCounts] = allShoppingCars[i].sc_counts;
							buyCounts++;
						}
					}
					if(buyCounts == 0){
						alert("no choosed");
					}
					else{
						buyConfirm(buyProducts,buyProductsCounts);
					}
				}

		function getProductById(p_id) {
			var productResult = "";
			var product = {};
			product.p_id = p_id;
			$.ajax({
				async : false, //同步
				type : 'POST',
				url : '${cp}/getProductById',
				data : product,
				dataType : 'json',
				success : function(result) {
					productResult = result.result;
				},

			});
			productResult = JSON.parse(productResult);
			return productResult;
		}


				function buyConfirm(productsId,productsCounts) {

					var totalPrice = 0;

					var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
							'<div class="col-sm-10 col-md-10 col-lg-10">'+
							'<table class="table confirm-margin">';
					for(var i=0;i<productsId.length;i++){
						var product = getProductById(productsId[i]);
						html +=	'<tr>'+
							'<th>商品'+(i+1)+'名稱：</th>'+
							'<td>'+product.p_name+'</td>'+
							'</tr>'+
							'<tr>'+
							'<th>商品單價：</th>'+
							'<td>'+product.p_price+'</td>'+
							'</tr>'+
							'<tr>'+
							'<th>購買數量：</th>'+
							'<td>'+productsCounts[i]+'</td>'+
							'</tr>'+
							'<tr>';
						totalPrice+=product.p_price*productsCounts[i];
					}
					html +='<th>總金額：</th>'+
							'<td>'+totalPrice+'</td>'+
							'</tr>'+
							'<tr>'+

							'</tr>'+
							'<tr>'+

							'</tr>'+
							'</table>'+
							'<div class="row">'+
							'<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
							'<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingRecordsPre(['+productsId+'],['+productsCounts+'])">確認購買</button>'+
							'</div>'+
							'</div>';
					layer.open({
						type:1,
						title:'確認訂單：',
						content:html,
						area:['650px','350px'],
					});
					

				}


				function addToShoppingRecordsPre(productsId,productsCounts) {
					for(var i=0;i<productsId.length;i++){
						addToShoppingRecords(productsId[i],productsCounts[i]);
					}

					window.location.href = "${cp}/shopping_record";
				}

				function addToShoppingRecords(productId,productCounts) {
// 					judgeIsLogin();
					var shoppingRecord = {};
					shoppingRecord.pe_userid = "${memberid}";
					shoppingRecord.pe_productId = productId;
					shoppingRecord.pe_counts = productCounts;
					var buyResult = "";
					$.ajax({
						async : false,
						type : 'POST',
						url : '${cp}/addShoppingRecordOld',
						data : shoppingRecord,
						dataType : 'json',
						success : function(result) {
							buyResult = result.result;
						},

					});
					var product = getProductById(productId);
					if(buyResult == "success") {
		                deleteShoppingCar(productId);
		                layer.msg("商品 "+product.p_name+"購買成功");
					}
					else if(buyResult == "unEnough"){
						layer.msg("商品 "+product.p_name+"商品庫存不足")
					}

				}

				function deleteShoppingCar(productId) {
		            var shoppingCar = {};
		            shoppingCar.sc_userid = "${memberid}";
		            shoppingCar.sc_productId = productId;
		            var deleteResult = "";
		            $.ajax({
		                async : false,
		                type : 'POST',
		                url : '${cp}/deleteShoppingCar',
		                data : shoppingCar,
		                dataType : 'json',
		                success : function(result) {
		                    deleteResult = result.result;
		                },

		            });
		        }

				function deleteShoppingCarButton(productId) {
		            var shoppingCar = {};
		            shoppingCar.sc_userid = "${memberid}";
		            shoppingCar.sc_productId = productId;
		            var deleteResult = "";
		            $.ajax({
		                async : false,
		                type : 'POST',
		                url : '${cp}/deleteShoppingCar',
		                data : shoppingCar,
		                dataType : 'json',
		                success : function(result) {
		                    deleteResult = result.result;
		                }
		            
		            });
		            window.location.href = "${cp}/shopping_car";
		        }
	</script>
</body>
</html>