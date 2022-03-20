<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includeMainPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/popper.min.js'/>" /></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	/* 	border: 1px solid black; */
	
}
/* Important part */
.modal-dialog{
    overflow-y: initial !important
}
#likeList{
    height: 200px;
    overflow-y: auto;
}

body {
	background-image:
		url(resources/images/background/pexels-photo-1101249.jpeg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

.fb-profile img.fb-image-lg {
	z-index: 0;
	width: 100%;
	margin-bottom: 10px;
}

.fb-image-profile {
	margin: -90px 10px 0px 50px;
	z-index: 9;
	width: 20%;
}

@media ( max-width :768px) {
	.fb-profile-text>h1 {
		font-weight: 700;
		font-size: 16px;
	}
	.fb-image-profile {
		margin: -45px 10px 0px 25px;
		z-index: 9;
		width: 20%;
	}
}
</style>
</head>
<body>
	<script >
		$(function() {
			$(".deletePost").click(function() {
				if (confirm("確定刪除此則貼文?這些都是回憶唷!!請三思!!")) {
					$(this).parent().siblings().eq(0).submit();
					return true;
				} else {
					return false;
				}
			})
		})
		
		$(function(){
			$("#followButton").click(function(){
				
			})
		})
		

	</script>
	<div style="height: 100px;"></div>
	<div class="container">
		<div class="profile-user"
			style="color: white; background-color: #263238; opacity: 0.75; border-radius: 10px; padding-top: 1rem; padding-bottom: 1rem;">
			<div class="row">
				<div class="col-sm-6" style="height: 100px">
					<div style="margin: 25px; display: inline">
						<img class="img-fluid rounded-circle"
							style="height: 100px; weight: 80px;"
							src='<c:url value="/resources/images/${dataMap.memFileName}"/>'
							alt="Image">

					</div>
					<div style="display: inline;position: absolute; top:70%;left:45%">
						<span style="font-size: 20px; ">${dataMap.memName}</span>
					</div>
					<input type="hidden" name="memId" value="${dataMap.memId}">
<!-- 					<div style="display: inline;position:absolute;top:70%;left:80%"> -->
<!-- 						<button type="button" class="btn btn-primary" style="width:100px" id="followButton">追蹤</button> -->
<!-- 					</div> -->
				</div>
				<div class="col-sm-6" style="text-align: center">
					<ul class="inline user-counts-list" style="margin-top: 30px;list-style-type:none">
						<li style="position: absolute; top:70%;left:60%">Photos <span class="count">${dataMap.photoNum}</span>
						</li>
<!-- 						<li>Followers <span class="count">50</span> -->
<!-- 						</li> -->
<!-- 						<li>Following <span class="count">130</span> -->
<!-- 						</li> -->
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${memPost}" var="memPost" varStatus="toTimeCount">
				<aside class="col-sm-4">
					<p></p>

					<div class="card">
						<img class="card-img-top"
							src='<c:url value="/resources/images/posting/${memPost.fileName}"/>'
							alt="Card image cap">
						<div class="card-body">
							<form action="<c:url value="/deletePost.controller" />"
								method="post">
								<input type="hidden" name="postId" value="${memPost.postId}">
							</form>
							<h5 class="card-title"></h5>
							<p class="card-text">${memPost.description}<span
									style="float: right">${timeCount[toTimeCount.index]}</span>
							</p>
							<p class="card-text">
								<a style="cursor: pointer; z-index: 900" data-toggle="modal"
							data-target="#whoLikePost"> <i
									class="fa fa-thumbs-up">${memPost.likeAmount}</i>
								</a> <a style="float: right; cursor: pointer; z-index: 900"> <i
									class="fa fa-comments">${memPost.messageAmount}</i>
								</a>
							</p>
							<p class="card-text">
								<c:if test="${memPost.memId==memberid}">
									<a style="cursor: pointer; z-index: 900"> <i
										class="fa fa-pencil" data-toggle="modal"
										data-target="#update${memPost.postId}">修改貼文</i>

									</a>
									<a style="cursor: pointer; z-index: 900; float: right"
										class="deletePost"><i class="fa fa-remove">刪除貼文</i> </a>
								</c:if>
							</p>

						</div>
						<!-- 更新貼文 -->
						<div class="modal fade" id="update${memPost.postId}"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
							style="z-index: 9999;">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitleUpdatePost">
											想要修改貼文嗎<i style='font-size: 24px; color: red' class='fa'>&#xf004;
											</i>
										</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="<c:url value="/updateMyPost.controller" />"
											method="post" enctype="multipart/form-data">
											<input type="hidden" name="updatePostId" value="${memPost.postId}">
											<div class="form-group">
												<label class="btn btn-info"> <input type="file" name="file1"
													class="file1" style="display: none;" /> <i
													class="fa fa-photo"></i> 更新圖片
												</label>
											</div>
											<div class="form-group">
												<img class="img1" style="width: 20rem; height: 15rem;">
											</div>
											<div class="form-group">
												<textarea rows="4" cols="50" name="descrip1"
													placeholder="說點什麼吧" class="message" required></textarea>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">取消</button>
										<button type="button" 
											class="btn btn-primary updateButton">更新發文</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- card.// -->
					<div style="height: 10px"></div>
				</aside>
				<!-- col.// -->
			</c:forEach>
			<!-- 按讚人 -->
			<!-- Modal -->
	<div class="modal fade" id="whoLikePost" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">說讚的用戶</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="likeList">
					<div>
					<div style="display:inline"><img class="img-fluid rounded-circle"
							style="height: 40px; weight: 40px"
							src='<c:url value="/resources/images/andy.jpg"/>'
							alt="Image"></div><span>張君雅</span>
					</div>
					<div>
					<div style="display:inline"><img class="img-fluid rounded-circle"
							style="height: 40px; weight: 40px"
							src='<c:url value="/resources/images/andy.jpg"/>'
							alt="Image"></div><span>張君雅</span>
					</div>
					<div>
					<div style="display:inline"><img class="img-fluid rounded-circle"
							style="height: 40px; weight: 40px"
							src='<c:url value="/resources/images/andy.jpg"/>'
							alt="Image"></div><span>張君雅</span><button style="display:inline;float:right">追蹤</button>
					</div>
					<div>
					<div style="display:inline"><img class="img-fluid rounded-circle"
							style="height: 40px; weight: 40px"
							src='<c:url value="/resources/images/andy.jpg"/>'
							alt="Image"></div><span>張君雅</span>
					</div>
					<div>
					<div style="display:inline"><img class="img-fluid rounded-circle"
							style="height: 40px; weight: 40px"
							src='<c:url value="/resources/images/andy.jpg"/>'
							alt="Image"></div><span>張君雅</span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
			<script>
				$(".file1").change(
						function() {
							var objUrl = getObjectURL(this.files[0]);//獲取文件信息  
							console.log("objUrl = " + objUrl);
							if (objUrl) {
								$(this).parent().parent().next().children()
										.attr("src", objUrl);
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

				$(".updateButton").click(function(){
					console.log($(this).parent().prev().children().children().eq(1).children().children().eq(0).val());
					if($(this).parent().prev().children().children().eq(1).children().children().eq(0).val()=='')
						alert("請上傳更新圖片！");
					else{
						$(this).parent().prev().children().submit();
					}
				})

			</script>

		</div>
		<!--container end.//-->
	</div>
</body>
</html>