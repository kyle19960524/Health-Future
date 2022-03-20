<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includeMainPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Rokkitt"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{    
        background-image: url(resources/images/background/pexels-photo-1565982.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
        
     }
     
    

/*
*
* ===========================================================
*     HERO SECTION
* ===========================================================
*
*/
.hero {
	padding: 6.25rem 0px !important;
	margin: 0px !important;
}

.cardbox {
	border-radius: 3px;
	margin-bottom: 20px;
	padding: 0px !important;
}

/* ------------------------------- */
/* Cardbox Heading
---------------------------------- */
.cardbox .cardbox-heading {
	padding: 16px;
	margin: 0;
}

.cardbox .btn-flat.btn-flat-icon {
	border-radius: 50%;
	font-size: 24px;
	height: 32px;
	width: 32px;
	padding: 0;
	overflow: hidden;
	color: #fff !important;
	background: #b5b6b6;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.cardbox .float-right .dropdown-menu {
	position: relative;
	left: 13px !important;
}

.cardbox .float-right button:hover {
	background: #f4f4f4 !important;
}

.cardbox .float-right button.dropdown-item {
	display: block;
	width: 100%;
	padding: 4px 0px 4px 10px;
	clear: both;
	font-weight: 400;
	font-family: 'Abhaya Libre', serif;
	font-size: 14px !important;
	color: #848484;
	text-align: inherit;
	white-space: nowrap;
	background: 0 0;
	border: 0;
}

/* ------------------------------- */
/* Media Section
---------------------------------- */
.media {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: start;
	align-items: flex-start;
}

.d-flex {
	display: -ms-flexbox !important;
	display: flex !important;
}

.media .mr-3 {
	margin-right: 1rem !important;
}

.media img {
	width: 48px !important;
	height: 48px !important;
	padding: 2px;
	border: 2px solid #f4f4f4;
}

.media-body {
	-ms-flex: 1;
	flex: 1;
	padding: .4rem !important;
}

.media-body p {
	font-family: 'Rokkitt', serif;
	font-weight: 500 !important;
	font-size: 14px;
	color: #88898a;
}

.media-body small span {
	font-family: 'Rokkitt', serif;
	font-size: 12px;
	color: #aaa;
	margin-right: 10px;
}

/* ------------------------------- */
/* Cardbox Item
---------------------------------- */
.cardbox .cardbox-item {
	position: relative;
	display: block;
}

.cardbox .cardbox-item img {
	
}

.img-responsive {
	display: block;
	max-width: 100%;
	height: auto;
}

.fw {
	width: 100% !important;
	height: auto;
}

.cardbox .cardbox-item p {
	font-family: "微軟正黑體";
	font-size: 17px;
	color: #4F4F4F;
}

/* ------------------------------- */
/* Cardbox Base
---------------------------------- */
.cardbox-base {
	border-bottom: 2px solid #f4f4f4;
}

.cardbox-base ul {
	margin: 10px 0px 10px 15px ;
	padding: 10px ;
	font-size: 0px;
	display: inline-block;
}

.cardbox-base li {
	list-style: none;
	margin: 0px 0px 0px -8px !important;
	padding: 0px 0px 0px 0px !important;
	display: inline-block;
}

.cardbox-base li a {
	margin: 0px !important;
	padding: 0px !important;
}

.cardbox-base li a i {
	position: relative;
	top: 4px;
	font-size: 16px;
	color: #8d8d8d;
	margin-right: 15px;
}

.cardbox-base li a span {
	font-family: 'Rokkitt', serif;
	font-size: 14px;
	color: #8d8d8d;
	margin-left: 20px;
	position: relative;
	top: 5px;
}

.cardbox-base li a em {
	font-family: 'Rokkitt', serif;
	font-size: 14px;
	color: #8d8d8d;
	position: relative;
	top: 3px;
}

.cardbox-base li a img {
	width: 25px;
	height: 25px;
	margin: 0px !important;
	border: 2px solid #fff;
}

/* ------------------------------- */
/* Cardbox Comments
---------------------------------- */
.cardbox-comments {
	padding: 10px 40px 20px 40px !important;
	font-size: 0px;
	text-align: center;
	display: inline-block;
}

.cardbox-comments .comment-avatar img {
	margin-top: 1px;
	margin-right: 10px;
	position: relative;
	display: inline-block;
	text-align: center;
	width: 40px;
	height: 40px;
}

.cardbox-comments .comment-body {
	overflow: auto;
}

.search {
	position: relative;
	right: -60px;
	top: -40px;
	margin-bottom: -40px;
	border: 2px solid #f4f4f4;
	width: 100%;
	overflow: hidden;
}

.search input[type="text"] {
	background-color: #fff;
	line-height: 10px;
	padding: 15px 60px 20px 10px;
	border: none;
	border-radius: 4px;
	width: 350px;
	font-family: 'Rokkitt', serif;
	font-size: 14px;
	color: #8d8d8d;
	height: inherit;
	font-weight: 700;
}

.search button {
	position: absolute;
	right: 0;
	top: 0px;
	border: none;
	background-color: transparent;
	color: #bbbbbb;
	padding: 15px 25px;
	cursor: pointer;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.search button i {
	font-size: 20px;
	line-height: 30px;
	display: block;
}

/* ------------------------------- */
/* Author
---------------------------------- */
.author a {
	font-family: 'Rokkitt', serif;
	font-size: 16px;
	color: #00C4CF;
}

.author p {
	font-family: 'Rokkitt', serif;
	font-size: 16px;
	color: #8d8d8d;
}
</style>
</head>

<body onload="randomImg();">
	<script src="<c:url value='/resources/js/popper.min.js'/>" /></script>
	<script>
// 		$(function() {
// 			$(".dropdown-item").click(
// 					function() {
// 						$(this).parent().parent().parent().parent().css(
// 								"display", "none");
// 					})
// 		})

		$(function() {
			$(".likeButton")
					.click(
							function() {
								console.log($(this).children().eq(0).val());
								$
										.ajax({
											url : "like.controller",
											type : "POST",
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											dataType : "JSON",
											data : {
												"status" : $(this).children()
														.eq(0).val(),
												"postId" : $(this).children()
														.eq(1).val(),
											},
											success : function(result) {
												var likeButtonId = '#likeButton'
														+ result.postId;
												if (result.status == 1) {
													$(likeButtonId)
															.find('a')
															.html(
																	'<i class="fa fa-thumbs-up" style="color:blue"></i>');
													$(likeButtonId).children()
															.eq(0).val('1');
													$(likeButtonId)
															.siblings()
															.eq(4)
															.html(
																	'<a><span>'
																			+ result.changeLikeAmount
																			+ ' Likes</span></a>');
												} else {
													$(likeButtonId)
															.find('a')
															.html(
																	'<i class="fa fa-thumbs-up"></i>');
													$(likeButtonId).children()
															.eq(0).val('0');
													$(likeButtonId)
															.siblings()
															.eq(4)
															.html(
																	'<a><span>'
																			+ result.changeLikeAmount
																			+ ' Likes</span></a>');
												}
											}
										})
							})
		})

		$(function() {
			$(".commentButton")
					.click(
							function() {
								if ($(this).prev().val().trim() == "") {
									alert('請留言唷!!');
								} else {
									$
											.ajax({
												url : "comment.controller",
												type : "POST",
												contentType : "application/x-www-form-urlencoded; charset=UTF-8",
												dataType : "JSON",
												data : {
													"id" : $(this).next().val(),
													"content" : $(this).prev()
															.val().trim(),
												},
												success : function(result) {
													alert("留言成功了唷!!");
													var changeMessageAmountId = "#messageAmount"
															+ result.postId;
													var idString = '#cardMessage'
															+ result.postId;
													var placeHoderBackId = '#commentText'
															+ result.postId
													console.log($(
															placeHoderBackId)
															.val());
													if (result.messageAmount == 1) {
														$(placeHoderBackId)
																.val("");
														$(changeMessageAmountId)
																.html(
																		result.messageAmount);
														$(idString)
																.html(
																		'<p style="font-size: 12px; margin: 0px">'
																				+ result.memName
																				+ ':'
																				+ result.comment
																				+ '<span style="float:right">'
																				+ result.tempTime
																				+ '</span></p>');
													} else {
														$(placeHoderBackId)
																.val("");
														$(changeMessageAmountId)
																.html(
																		result.messageAmount);
														$(idString)
																.prepend(
																		'<p style="font-size: 12px; margin: 0px">'
																				+ result.memName
																				+ ':'
																				+ result.comment
																				+ '<span style="float:right">'
																				+ result.tempTime
																				+ '</span>'
																				+ '</p>');
													}

												}
											})
								}

							})
		})

		$(function() {
			$(".float-right")
					.click(
							function() {
								console.log($(this).prev().val());
								var postId = $(this).prev().val();
								var idString1 = '#cardMessage' + postId;
								$
										.ajax({
											url : "messageAll.controller",
											type : "POST",
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											dataType : "JSON",
											data : {
												"id" : $(this).prev().val(),
											},
											success : function(result) {
												if (result.length == 0) {
													$(idString1).html("");
													$(idString1)
															.append(
																	'<p style="font-size: 12px; margin: 0px;color:red">暫時沒有留言喔</p>');
												} else {
													var idString = '#cardMessage'
															+ result[0].postId;
													$(idString).html("");
													for (var i = 0; i < result.length; i++) {
														var postId = result[i].postId;
														var name = result[i].memName;
														var content = result[i].messageContent;
														var time = result[i].tempTime;
														var idString = '#cardMessage'
																+ postId;

														$(idString)
																.append(
																		'<p style="font-size: 12px; margin: 0px">'
																				+ name
																				+ ':'
																				+ content
																				+ '<span style="float:right">'
																				+ time
																				+ '</span>'
																				+ '</p>');

													}
												}

											}
										})
							})
		})
		$(function() {
			$(".toMemProfile").click(function() {
				$(this).prev().submit();
			})
		})
		
		

		$(function() {
			$(".seeWhoLike")
					.click(
							function() {
								console.log($(this).parent().next().val());
								var postId = $(this).parent().next().val();
								var idString1 = '#cardLike' + postId;
								$.ajax({
											url : "likeAll.controller",
											type : "POST",
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											dataType : "JSON",
											data : {
												"postId" : $(this).parent()
														.next().val(),
											},
											success : function(result) {
												if (result.length == 0) {
													$(idString1).html("");
													$(idString1)
															.append(
																	'<p style="font-size: 12px; margin: 0px;color:red">暫時沒有人說讚唷</p>');
												} else {
													$(idString1).html("");
													for(var i =0;i<result.length;i++){
														var whoLike = result[i].memName;
														var memId= result[i].memId;
														var memFileName= result[i].memFileName;
														$(idString1).append('<ul style="margin:0px;padding-bottom:0px;padding-top:5px"><li style="display:inline">'+'<a style="cursor:pointer" class="memProfile"><img src='+'<c:url value="/resources/images/'+memFileName+'"/>'+' class="img-fluid rounded-circle" alt="User" alt="User"></a></li>'+'<li style="display:inline"><a><span style="font-size:12px">'+whoLike+'說讚</span></a></li></ul>'+'<form action="<c:url value="/memAllPost.controller"/>" method="post"><input type="hidden" name="memId" value='+memId+'><input type="hidden" name="memName" value='+whoLike+'></form>')
													}
												}
											}
										})
							})
		})
		
		$(document).on('click', '.memProfile', function(event){
    		$(this).parent().parent().next().submit();
		});
	</script>
	
		<section class="hero">
			<div class="container">
				<c:forEach items="${allPost}" var="allPost" varStatus="toTimeCount">
				<div class="row">

					<div class="col-lg-6 offset-lg-3">

						<div class="cardbox shadow-lg bg-white">

							<div class="cardbox-heading">
								<!-- START dropdown-->
								<div class="dropdown float-right">
									<button class="btn btn-flat btn-flat-icon " type="button"
										data-toggle="dropdown" aria-expanded="false">
										<em class="fa fa-ellipsis-h"></em>
									</button>
									<div class="dropdown-menu"
										style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
										<button class="dropdown-item">Hide post</button>
										<!-- 				<a class="dropdown-item" href="#">Stop following</a> -->
										<!-- 				<a class="dropdown-item" href="#">Report</a> -->
									</div>
								</div>
								<!--/ dropdown -->
								<div class="media m-0">
									<div class="d-flex mr-3">
										<form action="<c:url value="/memAllPost.controller" />"
											method="post">
											<input type="hidden" name="memId" value="${allPost.memId}" />
											<input type="hidden" name="memName"
												value="${allPost.memName}" />
										</form>
										<a style="cursor: pointer" class="toMemProfile"><img
											class="img-fluid rounded-circle"
											src='<c:url value="/resources/images/${memHeadPicture[toTimeCount.index]}"/>'
											alt="User"></a>
									</div>
									<div class="media-body">
										<p class="m-0">${allPost.memName}</p>
										<small><span><i class="icon ion-md-pin"></i>
												${allPost.memArea}</span></small> <small><span><i
												class="icon ion-md-time"></i>${timeCount[toTimeCount.index]}</span></small>
									</div>
								</div>
								<!--/ media -->
							</div>
							<!--/ cardbox-heading -->
							<div class="cardbox-item">
								<p class="m-0 pl-2 pb-2">${allPost.description}</p>
								<img class="img-fluid"
									src='<c:url value="/resources/images/posting/${allPost.fileName}"/>'
									alt="Image">

							</div>
							<!--/ cardbox-item -->
							<div class="cardbox-base" style="cursor: pointer">
								<input type="hidden" value="${allPost.postId}">
								<ul class="float-right" data-toggle="collapse"
									href="#message${allPost.postId}" aria-expanded="false"
									aria-controls="collapseExample">
									<li><a><i class="fa fa-comments"></i></a></li>
									<li><a><em class="mr-5"
											id="messageAmount${allPost.postId}">${allPost.messageAmount}</em>
									</a></li>
									<!-- 			   <li><a><i class="fa fa-share-alt"></i></a></li> -->
									<!-- 			   <li><a><em class="mr-3">03</em></a></li> -->
								</ul>
								<div class="collapse" id="message${allPost.postId}">
									<div class="card card-body" id="cardMessage${allPost.postId}">

										<!-- 										<p style="font-size: 12px; margin: 0px">張君雅:可以問這是什麼嗎</p> -->

									</div>
								</div>
								<ul>
									<li class="likeButton" id="likeButton${allPost.postId}"><input
										type="hidden" value="${allPost.likeStatus}"> <input
										type="hidden" value="${allPost.postId}"> <a> <c:if
												test="${allPost.likeStatus==0}">
												<i class="fa fa-thumbs-up"></i>
											</c:if> <c:if test="${allPost.likeStatus==1}">
												<i class="fa fa-thumbs-up" style="color: blue"></i>
											</c:if>
									</a></li>
									<li><a href="#"><img
											src='<c:url value="/resources/images/andy.jpg"/>'
											class="img-fluid rounded-circle" alt="User"></a></li>
									<li><a href="#"><img
											src='<c:url value="/resources/images/GGGGG.png"/>'
											class="img-fluid rounded-circle" alt="User"></a></li>
									<li><a href="#"><img
											src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/5.jpg"
											class="img-fluid rounded-circle" alt="User"></a></li>
									<li><a href="#"><img
											src="http://www.themashabrand.com/templates/bootsnipp/post/assets/img/users/2.jpg"
											class="img-fluid rounded-circle" alt="User"></a></li>
									<li data-toggle="collapse" class="seeWhoLike"
										href="#like${allPost.postId}" aria-expanded="false"
										aria-controls="collapseExample"><a><span>${allPost.likeAmount}
												Likes</span></a></li>
								</ul>
								<input type="hidden" name="postId" value="${allPost.postId}" />
								<div class="collapse" id="like${allPost.postId}">
									<div class="card card-body likeBind" style="padding:0" id="cardLike${allPost.postId}">

										<!-- 										<p style="font-size: 12px; margin: 0px">張君雅:可以問這是什麼嗎</p> -->

									</div>
								</div>
							</div>
							<!--/ cardbox-base -->
							<div class="cardbox-comments">
								<span class="comment-avatar float-left"> <a ><img
										class="rounded-circle"
										src='<c:url value="/resources/images/${memFileName}"/>'
										alt="..."></a>
								</span>
								<div class="search">
									<input placeholder="Write a comment" type="text"
										id="commentText${allPost.postId}">
									<button class="commentButton">
										<i class="fa fa-commenting-o"></i>
									</button>
									<input type="hidden" value="${allPost.postId}">
								</div>
								<!--/. Search -->
							</div>
							<!--/ cardbox-like -->

						</div>
						<!--/ cardbox -->

					</div>
					<!--/ col-lg-6 -->
					<div class="col-lg-3">
						<div class="shadow-lg p-4 mb-2 bg-white author">
  							 <a href="${pageContext.request.contextPath}/pages/shopmain.jsp">
   							 <div class="my_div" style="width:210px;"></div> 
<%--    							 <img src="<c:url value="/resources/images/ads/pexels-photo-357737.jpeg"/>" border="0" width="210px;"> --%>
   							 </a>
  							 <p style="text-align:center">適合您的健康提案</p>
						</div>
					</div>
					
					<!--/ col-lg-3 -->

				</div>
				<!--/ row -->
				</c:forEach>
			</div>
			<!--/ container -->
		</section>
	
	
<script type="text/javascript">

    var jsImg = new Array("001.jpeg","002.jpg","003.jpg","004.jpg","005.jpg","006.jpg","007.jpg");

    setInterval("randomImg()",10000);
        
    function randomImg(){
        var imgIndex = Math.floor(Math.random()*jsImg.length);
        var x = document.getElementsByClassName("my_div");
        for(var i=0 ;i<x.length;i++){
        x[i].innerHTML  = "<img src='<c:url value='/resources/images/random_ad/"+jsImg[imgIndex]+"'/> ' width='210px;' height='160px;'>";
    	}      
    }
</script>	
</body>

</html>

