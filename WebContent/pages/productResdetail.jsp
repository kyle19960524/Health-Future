<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<%-- <%@include file="myLoginCheck.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="${cp}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${cp}/resources/css/style.css" rel="stylesheet">
<%-- <link href="${cp}/resources/css/fonts.css" rel="stylesheet"> --%>

<%-- <script src="${cp}/resources/js/jquery.min.js" type="text/javascript"></script> --%>
<script src="${cp}/resources/js/jquery.3.4.1.js" type="text/javascript"></script>
<script src="${cp}/resources/js/bootstrap.min.js" type="text/javascript"></script>

<script>
	
<%session.getAttribute("memberid");%>
	
</script>


<title>產品資訊</title>
</head>
<body>

<jsp:include page="/pages/includeMainPage.jsp"/>
<div style="height:280px ;" ></div>
<div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-5 col-md-5">
<%--                 <img class="detail-img" src="${cp}/resources/images/${productDetail.p_id}.jpg"> --%>
                <img src="${cp}/resources/images/${productDetail.p_id}.jpg">
                <div class="col-sm-5 col-md-5"  style=font-size:35px;text-align:center;>
                ${productDetail.p_description}
                </div>
            </div>
            <div class="col-sm-5 col-md-5 detail-x">
                <table class="table table-striped">
                    <tr>
                        <th>商品名稱</th>
                        <td>${productDetail.p_name}</td>
                    </tr>
                    <tr>
                        <th>商品價格</th>
                        <td>${productDetail.p_price}</td>
                    </tr>
                    <tr>
                        <th>商品描述</th>
                        <td>${productDetail.p_keyWord}</td>
                    </tr>
                    <tr>
                        <th>商品類別</th>
                        <td>${productDetail.p_type}</td>
                    </tr>
                    <tr>
                        <th>商品庫存</th>
                        <td>${productDetail.p_counts}</td>
                    </tr>
                    <tr>
                        <th>購買數量</th>
                        <td>
                            <div class="btn-group" role="group">
<!--                                 <button type="button" class="btn btn-default" onclick="subCounts()">-</button> -->
                                <button id="productCounts" type="button" class="btn btn-default">1</button>
<!--                                 <button type="button" class="btn btn-default" onclick="addCounts(1)">+</button> -->
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <button class="btn btn-danger btn-lg col-sm-8 col-md-8 col-lg-8" onclick="addToShoppingCar(${productDetail.p_id})">加入購物車</button>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
<%--                     <button  class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="buyConfirm(${productDetail.p_id})">購買</button> --%>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-10 col-md-10 col-lg-10">
                <hr class="division"/>
                <table class="table evaluationTable" border="0" id="evaluation">
                </table>
                <hr/>
                <div id="inputArea"></div>
            </div>
        </div>
    </div>


<script type="text/javascript">


function addToShoppingCar(productId) {
    judgeIsLogin();
    var productCounts = document.getElementById("productCounts");
    console.log(productCounts);
    var counts = parseInt(productCounts.innerHTML);
    console.log(counts);
    var shoppingCar = {};

	shoppingCar.sc_userid = "${memberid}";
    shoppingCar.sc_productId = productId;
    shoppingCar.sc_counts = counts;
    var addResult = "";
    $.ajax({
        async : false,
        type : 'POST',
        url : '${cp}/addShoppingCar',
        data : shoppingCar,
        dataType : 'json',
        success : function(result) {
            addResult = result.result;
        }

    });
     if(addResult == "success") {
                    window.location.href = "${cp}/pages/shopping_bookcar.jsp";
    }
  }


// function subCounts() {
//     var productCounts = document.getElementById("productCounts");
//     var counts = parseInt(productCounts.innerHTML);
//     if(counts>=2)
//         counts--;
//     productCounts.innerHTML = counts;
// }

// function addCounts() {
//     var productCounts = document.getElementById("productCounts");
//     var counts = parseInt(productCounts.innerHTML);
//     if(counts<${productDetail.p_counts})
//         counts++;
//     productCounts.innerHTML = counts;
// }


function buyConfirm(productId) {

            
    window.location.href = "${cp}/shopping_bookrecord";
}


function judgeIsLogin() {
	if ("${memberid}" == null || "${memberid}" == undefined
			|| "${memberid}" == "") 
	{
		window.location.href = "${cp}/turntoMember.controller";
	}
	
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


function addToShoppingRecords(productId) {
    var productCounts = document.getElementById("productCounts");
    var counts = parseInt(productCounts.innerHTML);
    var shoppingRecord = {};
    shoppingRecord.pe_userid = "${memberid}";
    shoppingRecord.pe_productId = productId;
    shoppingRecord.pe_counts = counts;
    var buyResult = "";
    $.ajax({
        async : false,
        type : 'POST',
        url : '${cp}/addShoppingRecord',
        data : shoppingRecord,
        dataType : 'json',
        success : function(result) {
            buyResult = result.result;
        }
    });
    if(buyResult === "success") { 

                    window.location.href = "${cp}/shopping_record";

    }

}


</script>

</body>
</html>