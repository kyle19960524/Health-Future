<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title></title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon"
	href="<c:url value='/resources/icons/icon2.ico'/>"
	rel="external nofollow" type="image/x-icon" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>" />
<!-- 與 custom css檔案連結 -->
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" />
<link
	href="https://fonts.googleapis.com/css?family=Sriracha&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cedarville+Cursive&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap"
	rel="stylesheet">

<style>
/* 	html {  */
/*             height: 100%; */
/*     }  */
/*     期望這個元素能撐滿整個瀏覽器高度 */
body {
	background-image: url(resources/images/background/pexels-photo-2064366.jpeg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	/*         min-height: 100%; */
	/*         width: 100%; */
	font-family: "微軟正黑體" !important;
}

/*欄位名稱*/
.sidetitle {
	padding-top: 0px;
	border: 0px none #93AE4F;
	color: #000000;
	text-align: center;
	font-family: Comic Sans MS, arial, helvetica, sans-serif;
	font-weight: bold;
	font-size: 15px;
	margin: 0px;
	letter-spacing: 0.1em;
	height: 41px;
	list-style: none;
}

#exampleModalLongTitle {
	line-height: 2;
	font-weight: 800;
}
</style>

<script>
	
<%session.getAttribute("loginStatus");%>
	
<%session.getAttribute("loginStatusCertified");%>
	function submit() {
		var fileInput = $('#file0').get(0).files[0];
		console.info(fileInput);
		if (fileInput) {
			$("#form0").submit();
		} else {
			alert("請上傳發文圖片！");
		}
	}
</script>

</head>
<body>
	<div style="position: fixed; z-index: 9998; width: 100%;">
		<div class='topdiv'>
			<!--  <img style='height: 100px; width: 100%;'  src='<c:url value='/resources/images/background6.png'/>'>-->
		</div>
		<div style="width: 100%; display: inline-block !important;">
			<header class='header_area'>
				<div class='main-menu'>
					<nav class='navbar navbar-expand-lg navbar-dark bg-dark'>
						<button class='navbar-toggler' type='button'
							data-toggle='collapse' data-target='#navbarTogglerDemo01'
							aria-controls='navbarTogglerDemo01' aria-expanded='false'
							aria-label='Toggle navigation'>
							<span class='navbar-toggler-icon'></span>
						</button>
						<!-- 					<div class='collapse navbar-collapse' id='collapsibleNavbar'> -->
						<div class='collapse navbar-collapse' id='navbarTogglerDemo01'>
							<a class='navbar-brand'
								href="<c:url value="/turntoMainPage.controller" />"
								style="font-family: 'Dancing Script', cursive;font-size:22px;font-weight:800;">Health
								Future</a>
							<c:if test="${loginStatus}">
								<div class="dropdown">
									<a class="btn btn-secondary dropdown-toggle" href="#"
										role="button" id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"
										style="font-family: 'Microsoft JhengHei'; font-size: 22px;">
										專屬服務選單 </a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<a class="dropdown-item"
											href="<c:url value="/memberdata.controller" />">會員資料管理</a> <a
											class="dropdown-item"
											href="<c:url value="/timeTableForMem.controller" />">我的預約</a>
										<a class="dropdown-item"
											href="<c:url value="/turntoSearchNutri.controller" />">我要預約</a>
										<a class="dropdown-item"
											href="<c:url value="/turnToMyPost.controller" />">我的貼文</a>	
										<!-- 新增 訂單 -->
    <a class="dropdown-item" href="<c:url value="/turntoshopRecord.controller" />">我的訂單</a>
										<button type="button" class="dropdown-item"
											data-toggle="modal" data-target="#exampleModalCenter">我要發文</button>
									</div>
								</div>
							</c:if>
							<div class='mr-auto'></div>
							<ul class='navbar-nav'>
								<li class="nav-item active"><a class="nav-link"
									href="<c:url value="/turntoMainPage.controller" />">Home<span
										class="sr-only">(current)</span></a></li>
								<c:if test="${loginStatus}">
									<li class="nav-item"><a class="nav-link"
										href="<c:url value="/socialAll.controller" />">社群動態</a></li>
								</c:if>
								<c:if test="${!loginStatusCertified}">
									<c:if test="${!loginStatus}">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value="/turntoChooseLogin.controller" />">登入</a></li>
									</c:if>
								</c:if>
								<%-- 							<c:if test="${loginStatus}"> --%>
								<%-- 								<li class='nav-item'><a class="nav-link" href="<c:url value="/timeTableForMem.controller" />">我的預約</a></li> --%>
								<%-- 							</c:if> --%>
								<c:if test="${loginStatusCertified}">
									<li class='nav-item'><a class="nav-link"
										href="<c:url value="/timeTableForNutri.controller" />">我的預約</a></li>
								</c:if>
								<c:if test="${!loginStatusCertified}">
									<c:if test="${!loginStatus}">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value="/turntoRegister.controller" />">加入營養師</a></li>
									</c:if>
								</c:if>
								<li class='nav-item'><a class='nav-link'
									href="<c:url value="/turntoBmi.controller" />">身體數值分析</a></li>
								<%-- 							<c:if test="${loginStatus}"> --%>
								<%-- 								<li class='nav-item'><a class='nav-link' href="<c:url value="/turntoSearchNutri.controller" />">我要預約</a></li> --%>
								<%-- 							</c:if> --%>
								<c:if test="${loginStatusCertified}">
									<li class='nav-item'><a class='nav-link'
										href="<c:url value="/turntoNutriAvailableTime.controller" />">提供預約時間</a></li>
								</c:if>
								<c:if test="${loginStatusCertified}">
									<li class='nav-item'><a class='nav-link'
										href="<c:url value="/turntoSearchNutriAvailableTime.controller" />">查詢時間</a></li>
								</c:if>
								<li class="nav-item"><a class="nav-link"
									href="<c:url value="/turntoIntroduce.controller" />">營養師介紹</a></li>
								<li class='nav-item'><a class='nav-link'
									href="<c:url value="/turntoAbout.controller" />">關於我們</a></li>
								<li class='nav-item'><a class='nav-link'
									href="<c:url value="/turntoContactUs.controller" />">聯絡我們</a></li>
								<c:if test="${loginStatus}">
									<%-- 								<li class='nav-item'><a class='nav-link' href='${pageContext.servletContext.contextPath}/memberdata.controller'>會員資料管理</a></li> --%>
									<li class='nav-item'><a class='nav-link'
										href='${pageContext.servletContext.contextPath}/logout.controller'>登出</a></li>
								</c:if>
								<li class='nav-item'><a class='nav-link'
									href="<c:url value="/turntoshopMain.controller" />">購物商城</a></li>
								<c:if test="${loginStatusCertified}">
									<li class='nav-item'><a class='nav-link'
										href='${pageContext.servletContext.contextPath}/logout.controller'>登出</a></li>
								</c:if>
								<!--  myReservation.jsp-->
								<c:if test="${loginStatusCertified}">
									<li class="btn-group dropleft">

										<button type="button"
											class="btn btn-secondary dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">通知</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
											${noNotification.noNoti}${noNotification1.noNoti}
											<c:forEach items="${notification}" var="noti">
												<form
													action="<c:url value="/notificationForNutri.controller" />"
													method="post">
													<input type="hidden" name="notifi" value="${noti.id}">
													<button style="color: red;" class="dropdown-item"
														type="submit">${noti.date}的${noti.eachTime}有新狀態</button>
												</form>
											</c:forEach>
										</div>
									</li>
								</c:if>
								<c:if test="${loginStatus}">
									<li class="btn-group dropleft">

										<button type="button"
											class="btn btn-secondary dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">通知</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
											${noNotification.noNoti}${noNotification1.noNoti}
											<c:forEach items="${notification}" var="noti">
												<form
													action="<c:url value="/notificationForMem.controller" />"
													method="post">
													<input type="hidden" name="notifi" value="${noti.id}">
													<button style="color: red;" class="dropdown-item"
														type="submit">${noti.date}的${noti.eachTime}有新狀態</button>
												</form>
											</c:forEach>
										</div>
									</li>
								</c:if>
							</ul>
						</div>
					</nav>
				</div>
			</header>
		</div>
	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true" style="z-index: 9999;">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">
						發個文紀錄下吧<i style='font-size: 24px; color: red' class='fa'>&#xf004;
						</i>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="form0" id="form0"
						action="<c:url value="/posting.controller" />" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="btn btn-info"> <input type="file"
								name="file0" id="file0" style="display: none;" /> <i
								class="fa fa-photo"></i> 上傳圖片
							</label>
						</div>
						<div class="form-group">
							<img class="img0" id="img0" style="width: 20rem; height: 15rem;">
						</div>
						<div class="form-group">
							<textarea rows="4" cols="50" name="descrip" id="descrip"
								placeholder="說點什麼吧" class="message" required></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" onclick="submit()" class="btn btn-primary">發文</button>
				</div>
			</div>
		</div>
	</div>


	<%-- 						<a class='navbar-brand' href='<c:url value="/turntoMainPage.controller" />'style="font-family:'Dancing Script', cursive;">Health Future</a> --%>

	<script src="<c:url value='/resources/js/jquery.3.4.1.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/popper.min.js
'/>" /></script>
	<!-- Bootstrap js file -->
	<script type="text/javascript"
		src="<c:url value='/resources/js/bootstrap.min.js'></c:url>"></script>
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