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
<title>訂單資訊</title>
<link href="${cp}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${cp}/resources/css/style.css" rel="stylesheet">

<script src="${cp}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${cp}/resources/js/bootstrap.min.js" type="text/javascript"></script>

<script>
	
<%session.getAttribute("memberid");%>
	
</script>

</head>
<body>

<jsp:include page="/pages/includeMainPage.jsp"/>
<div style="height:280px ;" ></div>

	<div class="container-fluid bigHead">
<!-- 		<div class="row"> -->
		<div>
			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
<!-- 				<div class="row"> -->
				<div>
					<ul class="nav nav-tabs list-group-diy" role="tablist">
						<li role="presentation" class="active list-group-item-diy"><a
							href="#unHandle" aria-controls="unHandle" role="tab"
							data-toggle="tab">待出貨訂單&nbsp;<span class="badge"
								id="unHandleCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#transport" aria-controls="transport" role="tab"
							data-toggle="tab">運輸中訂單&nbsp;<span class="badge"
								id="transportCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#receive" aria-controls="receive" role="tab"
							data-toggle="tab">已收貨訂單&nbsp;<span class="badge"
								id="receiveCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#all" aria-controls="all" role="tab" data-toggle="tab">全部訂單&nbsp;<span
								class="badge" id="allCount">0</span></a></li>
					</ul>

					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="unHandle">
							<table class="table table-hover center" id="unHandleTable">
							</table>
						</div>
						<div role="tabpanel" class="tab-pane" id="transport">
							<table class="table table-hover center" id="transportTable">
							</table>
						</div>
						<div role="tabpanel" class="tab-pane" id="receive">
							<table class="table table-hover center" id="receiveTable">
							</table>
						</div>
						<div role="tabpanel" class="tab-pane" id="all">
							<table class="table table-hover center" id="allTable">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		updateShoppingRecords();

		function updateShoppingRecords() {
			var orderArray = new Array;
			orderArray[0] = "未出貨";
			orderArray[1] = "出貨中";
			orderArray[2] = "已收貨";
			var unHandleTable = document.getElementById("unHandleTable");
			var transportTable = document.getElementById("transportTable");
			var receiveTable = document.getElementById("receiveTable");
			var allTable = document.getElementById("allTable");

			var unHandleCount = document.getElementById("unHandleCount");
			var transportCount = document.getElementById("transportCount");
			var receiveCount = document.getElementById("receiveCount");
			var allCount = document.getElementById("allCount");

			var unHandleCounts = parseInt(unHandleCount.innerHTML);
			var transportCounts = parseInt(transportCount.innerHTML);
			var receiveCounts = parseInt(receiveCount.innerHTML);
			var allCounts = parseInt(allCount.innerHTML);

			var allShoppingRecords = getShoppingRecords();
			unHandleTable.innerHTML = "";
			transportTable.innerHTML = "";
			receiveTable.innerHTML = "";
			allTable.innerHTML = "";
			var unHandleHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>應付金額</th>' + '<th>訂單狀態</th>' 
					+ '<th>付款</th>'
					+ '</tr>';
			var transportHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>應付金额</th>' 
					+ '<th>訂單狀態</th>' + '<th>確認收貨</th>' + '</tr>';
			var receiveHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>應付金额</th>' + '<th>訂單狀態</th>' + '<th>評價</th>'
					+ '</tr>';
			var allHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>應付金额</th>' 
					+ '<th>預約日期</th>'
					+ '<th>預約時間</th>'
					+ '<th>訂單狀態</th>' + '</tr>';
			var unHandleHTMLTemp = "";
			var transportHTMLTemp = "";
			var receiveHTMLTemp = "";
			var allHTMLTemp = "";

			for (var i = 0; i < allShoppingRecords.length; i++) {
				var product = getProductById(allShoppingRecords[i].pe_productId);
				if(product.p_id != 101)
				{
				allHTMLTemp += '<tr>' + '<td>' + product.p_name + '</td>'
						+ '<td>' + allShoppingRecords[i].pe_counts + '</td>'
						+ '<td>' + allShoppingRecords[i].pe_productPrice + '</td>'
// 						+ '<td>' + allShoppingRecords[i].pe_restime + '</td>'
						+ '<td>' + '非預約'  +'</td>'
						+ '<td>' + '非預約'  +'</td>'
						+ '<td>'
						+ orderArray[allShoppingRecords[i].pe_orderStatus]
						+ '</td>' + '</tr>';
				allCounts++;
				}else if(product.p_name=="預約"){
					allHTMLTemp += '<tr>' + '<td>' + product.p_name + '</td>'
					+ '<td>' + allShoppingRecords[i].pe_counts + '</td>'
					+ '<td>' + allShoppingRecords[i].pe_productPrice + '</td>'
					+ '<td>' + allShoppingRecords[i].pe_resdate + '</td>'
					+ '<td>' + allShoppingRecords[i].pe_restime + '</td>'
					+ '<td>'
					+ orderArray[allShoppingRecords[i].pe_orderStatus]
					+ '</td>' + '</tr>';
				allCounts++;

				}
				if (allShoppingRecords[i].pe_orderStatus == 0) {
					unHandleHTMLTemp += '<tr>' + '<td>' + product.p_name
							+ '</td>' + '<td>' + allShoppingRecords[i].pe_counts
							+ '</td>' + '<td>'
							+ allShoppingRecords[i].pe_productPrice + '</td>'
							+ '<td>'
							+ orderArray[allShoppingRecords[i].pe_orderStatus]
							+ '</td>' 
							+ '<td>'
							+ '<form action="/HealthFuture/greenPayForMemKeyData.controller" method="post">'
							+ '<input type="hidden" name="petime" value=' + allShoppingRecords[i].pe_time+'>'
							+ '<input type="hidden" name="peusedid" value=' + allShoppingRecords[i].pe_userid + '>'
							+'<input type="hidden" name="pecounts" value=' + allShoppingRecords[i].pe_counts + '>'
							+ '<input type="hidden" name="peproductid" value=' + product.p_id +'>'
							+ '<input type="submit" value="點選付款">'
							+ '</form>'
							+ '</td>'

							+ '</tr>';
					unHandleCounts++;
				} else if (allShoppingRecords[i].pe_orderStatus == 1) {

					transportHTMLTemp += '<tr>' + '<td>'
							+ product.p_name
							+ '</td>'
							+ '<td>'
							+ allShoppingRecords[i].pe_counts
							+ '</td>'
							+ '<td>'
							+ allShoppingRecords[i].pe_productPrice
							+ '</td>'
							+ '<td>'
							+ orderArray[allShoppingRecords[i].pe_orderStatus]
							+ '</td>'
							+ '<td>'
							+ '<button class="btn btn-primary btn-sm" onclick="receiveProducts('
							+ allShoppingRecords[i].pe_userid + ','
							+ allShoppingRecords[i].pe_productId + ',\''
							+ allShoppingRecords[i].pe_time + '\')">確認收貨</button>'
							+ '</td>' + '</tr>';
					transportCounts++;
				} else if (allShoppingRecords[i].pe_orderStatus == 2) {
					receiveHTMLTemp += '<tr>'
							+ '<td>'
							+ product.p_name
							+ '</td>'
							+ '<td>'
							+ allShoppingRecords[i].pe_counts
							+ '</td>'
							+ '<td>'
							+ allShoppingRecords[i].pe_productPrice
							+ '</td>'
							+ '<td>'
							+ orderArray[allShoppingRecords[i].pe_orderStatus]
							+ '</td>'
							+ '<td>'
							+ '<button class="btn btn-primary btn-sm" onclick="productDetail('
							+ allShoppingRecords[i].pe_productId
							+ ')">評價</button>' + '</td>' + '</tr>';
					receiveCounts++;
				}
			}
			if (unHandleHTMLTemp == "") {
				unHandleHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有訂單</h2>' + '</div>' + '</div>';
			} else
				unHandleHTML += unHandleHTMLTemp;
			if (transportHTMLTemp == "") {
				transportHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有訂單</h2>' + '</div>' + '</div>';
			} else
				transportHTML += transportHTMLTemp;
			if (receiveHTMLTemp == "") {
				receiveHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有訂單</h2>' + '</div>' + '</div>';
			} else
				receiveHTML += receiveHTMLTemp;
			if (allHTMLTemp == "") {
				allHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有訂單</h2>' + '</div>' + '</div>';
			} else
				allHTML += allHTMLTemp;

			unHandleCount.innerHTML = unHandleCounts;
			transportCount.innerHTML = transportCounts;
			receiveCount.innerHTML = receiveCounts;
			allCount.innerHTML = allCounts;

			unHandleTable.innerHTML += unHandleHTML;
			transportTable.innerHTML += transportHTML;
			receiveTable.innerHTML += receiveHTML;
			allTable.innerHTML += allHTML;
// 			layer.close(loading);
		}

		function getShoppingRecords() {
			//         judgeIsLogin();
			var shoppingRecordProducts = "";
			var user = {};
			user.pe_userid = '${memberid}';
			$.ajax({
				async : false, 
				type : 'POST',
				url : '${cp}/getShoppingRecords',
				data : user,
				dataType : 'json',
				success : function(result) {
					shoppingRecordProducts = result.result;
				}

			});
			shoppingRecordProducts = eval("(" + shoppingRecordProducts + ")");
			return shoppingRecordProducts;
		}

		function getProductById(id) {
			var productResult = "";
			var product = {};
			product.p_id = id;
			$.ajax({
				async : false, 
				type : 'POST',
				url : '${cp}/getProductById',
				data : product,
				dataType : 'json',
				success : function(result) {
					productResult = result.result;
				}
			});
			productResult = JSON.parse(productResult);
			return productResult;
		}



		function receiveProducts(pe_userid, pe_productId, pe_time) {
			var receiveResult = "";
			var shoppingRecord = {};
			shoppingRecord.pe_userid = pe_userid;
			shoppingRecord.pe_productId = pe_productId;
			shoppingRecord.pe_time = pe_time;
			shoppingRecord.pe_orderStatus = 2;
			$.ajax({
				async : false, 
				type : 'POST',
				url : '${cp}/changeShoppingRecord',
				data : shoppingRecord,
				dataType : 'json',
				success : function(result) {
					receiveResult = result.result;
				}
			});
			if (receiveResult = "success")
				window.location.href = "${cp}/turntoshopRecord.controller";
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