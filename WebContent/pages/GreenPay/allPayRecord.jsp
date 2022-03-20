<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Pay Record</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Rokkitt"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap.min.js'></c:url>"></script>
<style>
table.blueTable {
	border: 1px solid #1C6EA4;
	background-color: #EEEEEE;
	width: 100%;
	text-align: left;
	border-collapse: collapse;
}

table.blueTable td, table.blueTable th {
	border: 1px solid #AAAAAA;
	padding: 3px 2px;
}

table.blueTable tbody td {
	font-size: 13px;
}

table.blueTable tr:nth-child(even) {
	background: #D0E4F5;
}

table.blueTable thead {
	background: #1C6EA4;
	background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
	background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
	background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
	border-bottom: 2px solid #444444;
}

table.blueTable thead th {
	font-size: 15px;
	font-weight: bold;
	color: #FFFFFF;
	border-left: 2px solid #D0E4F5;
}

table.blueTable thead th:first-child {
	border-left: none;
}

table.blueTable tfoot {
	font-size: 14px;
	font-weight: bold;
	color: #FFFFFF;
	background: #D0E4F5;
	background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
	background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
	background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
	border-top: 2px solid #444444;
}

table.blueTable tfoot td {
	font-size: 14px;
}

table.blueTable tfoot .links {
	text-align: right;
}

table.blueTable tfoot .links a {
	display: inline-block;
	background: #1C6EA4;
	color: #FFFFFF;
	padding: 2px 8px;
	border-radius: 5px;
}

table.minimalistBlack {
	border: 3px solid #000000;
	width: 100%;
	text-align: left;
	border-collapse: collapse;
}

table.minimalistBlack td, table.minimalistBlack th {
	border: 1px solid #000000;
	padding: 5px 4px;
}

table.minimalistBlack tbody td {
	font-size: 13px;
}

table.minimalistBlack thead {
	background: #CFCFCF;
	background: -moz-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
	background: -webkit-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
	background: linear-gradient(to bottom, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
	border-bottom: 3px solid #000000;
}

table.minimalistBlack thead th {
	font-size: 15px;
	font-weight: bold;
	color: #000000;
	text-align: left;
}

table.minimalistBlack tfoot {
	font-size: 14px;
	font-weight: bold;
	color: #000000;
	border-top: 3px solid #000000;
}

table.minimalistBlack tfoot td {
	font-size: 14px;
}

body {
	font-family: "微軟正黑體" !important;
}
</style>
</head>
<script>
	$(function() {
		$(".showButton")
				.click(
						function() {
							console.log($(this).next().val());
							$
									.ajax({
										url : "showDetailWhoPay.controller",
										type : "POST",
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										dataType : "JSON",
										data : {
											"merchantTradeNo" : $(this).next()
													.val(),
										},
										success : function(result) {
											$("#showDetail").html(
													result.memFullName);
											$("#showDetail").next().html(
													result.memPhone);
											$("#showDetail").next().next()
													.html(result.memAddress);
											$("#showDetail").next().next()
													.next().html(
															result.memEmail);
											$("#showDetail").next().next()
													.next().next().html(
															result.productName);
											$("#showDetail").next().next()
													.next().next().next()
													.html(result.productAmount);
										}
									})
						})
	})
</script>
<body>
	<table class="blueTable">
		<thead>
			<tr>
				<th>訂單編號:</th>
				<th>訂單狀態:</th>
				<th>綠界交易編號:</th>
				<th>交易金額:</th>
				<th>付款時間:</th>
				<th>付款方式:</th>
				<th>訂單成立時間:</th>
				<th>購買詳細資料:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allPayRecord}" var="allPay">
				<tr>
					<td><font size="4"><c:out
								value="${allPay.merchantTradeNo}" /></font></td>
					<td><font size="4"><c:out value="${allPay.rtnMsg}" /></font></td>
					<td><font size="4"><c:out value="${allPay.tradeNo}" /></font></td>
					<td><font size="4"><c:out value="${allPay.tradeAmt}" /></font></td>
					<td><font size="4"><c:out value="${allPay.paymentDate}" /></font></td>
					<td><font size="4"><c:out value="${allPay.paymentType}" /></font></td>
					<td><font size="4"><c:out value="${allPay.tradeDate}" /></font></td>
					<td>
						<button type="button" class="btn btn-primary showButton"
							data-toggle="modal" data-target="#exampleModalCenter">詳細資料</button>
						<input type="hidden" value="${allPay.merchantTradeNo}">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin: 15px;">
		<c:if test="${orderStatus==1}">
		<a type="button" href="<c:url value="/poiRecordOrderByMerchantTradeNo.controller" />"
			class="btn btn-primary">下載</a>
		</c:if>
		<c:if test="${orderStatus==2}">
		<a type="button" href="<c:url value="/poiAllRecordOrderByRtnMsg.controller" />"
			class="btn btn-primary">下載</a>
		</c:if>
		<c:if test="${orderStatus==3}">
		<a type="button" href="<c:url value="/poiRecordOrderByTradeAmt.controller" />"
			class="btn btn-primary">下載</a>
		</c:if>
		<c:if test="${orderStatus==4}">
		<a type="button" href="<c:url value="/poiRecordOrderByPaymentType.controller" />"
			class="btn btn-primary">下載</a>
		</c:if>
		<c:if test="${orderStatus==5}">
		<a type="button" href="<c:url value="/poiRecordOrderByPaymentDate.controller" />"
			class="btn btn-primary">下載</a>
		</c:if>
	</div>
	<div style="margin: 15px;">
		<form action="<c:url value="/orderGreenPayRecord.controller" />" method="post">
			<select name="arrayRecord">
				<option value="MerchantTradeNo">訂單編號</option>
				<option value="RtnMsg">訂單狀態</option>
				<option value="TradeAmt">交易金額</option>
				<option value="PayType">付款方式</option>
				<option value="PayTime">付款時間</option>
			</select>
			<input type="submit" value="排序">
		</form>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">詳細資料</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="minimalistBlack">
						<thead>
							<tr>
								<th>姓名</th>
								<th>電話</th>
								<th>住址</th>
								<th>信箱</th>
								<th>購買名稱</th>
								<th>購買數量</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="showDetail">cell1_1</td>
								<td>cell2_1</td>
								<td>cell3_1</td>
								<td>cell4_1</td>
								<td>cell5_1</td>
								<td>cell6_1</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div style="margin: 15px;">
		<a class="btn btn-primary"
			href="<c:url value="/turntoshopping.controller" />">上一頁</a>
	</div>
</body>
</html>