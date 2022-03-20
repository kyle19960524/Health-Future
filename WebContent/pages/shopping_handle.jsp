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
<title>購物訂單管理</title>
<link rel="shortcut icon"
	href="<c:url value='/resources/icons/back2.ico'/>"
	rel="external nofollow" type="image/x-icon" />
<link href="${cp}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${cp}/resources/css/style.css" rel="stylesheet">

<script src="${cp}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${cp}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<%-- <script src="${cp}/resources/js/layer.js" type="text/javascript"></script> --%>
<!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
    
<script>
	
<%session.getAttribute("memberid");%>
	
</script>
    
    
</head>
<body>

				<div>
					<ul class="nav nav-tabs list-group-diy" role="tablist">
						<li role="presentation" class="active list-group-item-diy"><a
							href="#unHandle" aria-controls="unHandle" role="tab"
							data-toggle="tab">待出貨訂單&nbsp;<span class="badge"
								id="unHandleCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#transport" aria-controls="transport" role="tab"
							data-toggle="tab">運送中訂單&nbsp;<span class="badge"
								id="transportCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#receive" aria-controls="receive" role="tab"
							data-toggle="tab">已收貨訂單&nbsp;<span class="badge"
								id="receiveCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#all" aria-controls="all" role="tab" data-toggle="tab">全部訂單&nbsp;<span
								class="badge" id="allCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href='<c:url value ="/searchPayRecord.controller" />' >付款紀錄查詢&nbsp;<span
								class="badge" id="searchPay"></span></a></li>
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
			<div style="text-align:center">
			<a style="margin: 0 auto;" href="<c:url value="/turntoback.controller" />">上一頁</a>
			</div>
					


	<script type="text/javascript">
// 		var loading = layer.load(0);
		updateShoppingRecords();

		function updateShoppingRecords() {
			var orderArray = new Array;
			orderArray[0] = "未出貨";
			orderArray[1] = "運送中";
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

			var allShoppingRecords = getAllShoppingRecords();
			unHandleTable.innerHTML = "";
			transportTable.innerHTML = "";
			receiveTable.innerHTML = "";
			allTable.innerHTML = "";
			var unHandleHTML = '<tr>' + '<th>買家</th>' + '<th>商品名稱</th>'
					+ '<th>購買數量</th>' + '<th>應付金額</th>' + '<th>訂單狀態</th>'
					+ '<th>出貨</th>' + '</tr>';
			var transportHTML = '<tr>' + '<th>買家</th>' + '<th>商品名稱</th>'
					+ '<th>購買數量</th>' + '<th>應付金額</th>'
				    + '<th>訂單狀態</th>' + '</tr>';
			var receiveHTML = '<tr>' + '<th>買家</th>' + '<th>商品名稱</th>'
					+ '<th>購買數量</th>' + '<th>應付金額</th>' + '<th>訂單狀態</th>'
					+ '</tr>';
			var allHTML = '<tr>' + '<th>買家</th>' + '<th>商品名稱</th>'
					+ '<th>購買數量</th>' + '<th>應付金額</th>' + '<th>訂單狀態</th>'
					+ '</tr>';
			var unHandleHTMLTemp = "";
			var transportHTMLTemp = "";
			var receiveHTMLTemp = "";
			var allHTMLTemp = "";

			for (var i = 0; i < allShoppingRecords.length; i++) {
				var user = getMemberById(allShoppingRecords[i].pe_userid);
				var product = getProductById(allShoppingRecords[i].pe_productId);
				allHTMLTemp +=
						
						'<tr>' 
// 						+ '<td>' + user.pe_userid + '</td>' 
						+ '<td>' + allShoppingRecords[i].pe_userid + '</td>'
						+ '<td>'
						+ product.p_name + '</td>' + '<td>'
						+ allShoppingRecords[i].pe_counts + '</td>' + '<td>'
						+ allShoppingRecords[i].pe_productPrice + '</td>' + '<td>'
						+ orderArray[allShoppingRecords[i].pe_orderStatus]
						+ '</td>' + '</tr>'
						
						;
				allCounts++;
				if (allShoppingRecords[i].pe_orderStatus == 0) {
					unHandleHTMLTemp += '<tr>' 
							+ '<td>'
							+ allShoppingRecords[i].pe_userid
// 							+ user.pe_userid
							+ '</td>'
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
							+ '<button class="btn btn-primary btn-sm" onclick="sendProducts('
							+ allShoppingRecords[i].pe_userid + ','
							+ allShoppingRecords[i].pe_productId + ',\''
							+ allShoppingRecords[i].pe_time + '\')">出貨</button>'
							+ '</td>' + '</tr>';
					unHandleCounts++;
				} else if (allShoppingRecords[i].pe_orderStatus == 1) {

					transportHTMLTemp += '<tr>' 
							+ '<td>' + allShoppingRecords[i].pe_userid + '</td>'
							+ '<td>' + product.p_name + '</td>' + '<td>'
							+ allShoppingRecords[i].pe_counts + '</td>' + '<td>'
							+ allShoppingRecords[i].pe_productPrice + '</td>' 
							+ '<td>'
							+ orderArray[allShoppingRecords[i].pe_orderStatus]
							+ '</td>' + '</tr>';
					transportCounts++;
				} else if (allShoppingRecords[i].pe_orderStatus == 2) {
					receiveHTMLTemp += '<tr>' 
							+ '<td>' + allShoppingRecords[i].pe_userid + '</td>'
							+ '<td>' + product.p_name + '</td>' + '<td>'
							+ allShoppingRecords[i].pe_counts + '</td>' + '<td>'
							+ allShoppingRecords[i].pe_productPrice + '</td>'
							+ '<td>'
							+ orderArray[allShoppingRecords[i].pe_orderStatus]
							+ '</td>' + '</tr>';
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

		function getAllShoppingRecords() {
// 			judgeIsLogin();
			var shoppingRecordProducts = "";
			var nothing = {};
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getAllShoppingRecords',
				data : nothing,
				dataType : 'json',
				success : function(result) {
					shoppingRecordProducts = result.result;
				},
// 				error : function(result) {
// 					layer.alert('查询错误');
// 				}
			});
			shoppingRecordProducts = eval("(" + shoppingRecordProducts + ")");
			return shoppingRecordProducts;
		}

		function getProductById(p_id) {
			var productResult = "";
			var product = {};
			product.p_id = p_id;
			$.ajax({
				async : false, 
				type : 'POST',
				url : '${cp}/getProductById',
				data : product,
				dataType : 'json',
				success : function(result) {
					productResult = result.result;
				},
// 				error : function(result) {
// 					layer.alert('查询错误');
// 				}
			});
			productResult = JSON.parse(productResult);
			return productResult;
		}

		function getMemberById(m_id) {
			var userResult = "";
			var user = {};
			user.m_id = m_id;
			$.ajax({
				async : false, 
				type : 'POST',
				url : '${cp}/getMemberById',
				data : user,
				dataType : 'json',
				success : function(result) {
					userResult = result.result;
				},
// 				error : function(result) {
// 					layer.alert('查询错误');
// 				}
			});
			userResult = JSON.parse(userResult);
			return userResult;
		}



		function sendProducts(pe_userid, pe_productId, pe_time) {
			var sendResult = "";
			var shoppingRecord = {};
			shoppingRecord.pe_userid = pe_userid;
			shoppingRecord.pe_productId = pe_productId;
			shoppingRecord.pe_time = pe_time;
			shoppingRecord.pe_orderStatus = 1;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/changeShoppingRecord',
				data : shoppingRecord,
				dataType : 'json',
				success : function(result) {
					sendResult = result.result;
				},
// 				error : function(result) {
// 					layer.alert('发货错误');
// 				}
			});
			if (sendResult == "success")
				window.location.href = "${cp}/shopping_handle";
		}
	</script>
</body>
</html>