<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{    
        background-image: url(resources/images/background/pexels-photo-878151.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
     }
</style>
     
<!-- <link rel="stylesheet" href="/resources/css/bootstrap.min.css"> -->
<script src="/resources/js/jquery.min.js"></script>
<script	src="/resources/js/popper.min.js"></script>
<script	src="/resources/js/bootstrap.min.js"></script>
<title>Health Future</title>
<style>

/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
 	height: 45rem;
}

carousel slide{
    height: 100px;
}

.carousel-caption{
	background-color: black;
	opacity:0.7;
	border-radius:5px;
}

.jumbotron{
	background-color: black;
 	color:white;
	opacity:0.9;
	border-radius:5px;
	width: 22rem;
	padding-top: 2rem;
	padding-bottom: 2rem;
}

.p1{
	font-size:22px;
	line-height:2;
}
</style>
</head>
<body style="background-color: #263238;">

<!-- 	<div id="demo" class="carousel slide" data-ride="carousel"> -->
	<div id="demo" class="carousel slide" data-ride="carousel" data-interval="6000">

		<!-- 指示符 -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
			<li data-target="#demo" data-slide-to="4"></li>
		</ul>

		<!-- 轮播图片 -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<c:url value="/resources/images/ads/pexels-photo-357737.jpeg"/>">
				<div class="carousel-caption">
					<h1>適合您的最新方案：高速燃脂計劃</h1>
					<p class="p1">工作忙、三餐老是在外，還是能夠享瘦！透過營養師的專業飲食指導，幫您健康快速燃脂！</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<c:url value="/resources/images/ads/pexels-photo-896058.jpeg"/>">
				<div class="carousel-caption">
					<h1>適合您的最新方案：精實增肌計劃</h1>
					<p class="p1">讓私人教練課增肌效果加強200%的秘密武器！</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="<c:url value="/resources/images/ads/pexels-photo-1676133.jpeg"/>">
				<div class="carousel-caption">
					<h1>適合您的最新方案：準新娘計劃</h1>
					<p class="p1">一生一次最重要的時刻，讓即將步入禮堂的您，用最動人曼妙的身材穿上您的夢幻婚紗！</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<c:url value="/resources/images/ads/pexels-photo-1882005.jpeg"/>">
				<div class="carousel-caption">
					<h1>適合您的最新方案：健康瘦身計劃</h1>
					<p class="p1">60天勻速減20斤！</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<c:url value="/resources/images/ads/pexels-photo-1153430.jpeg"/>">
				<div class="carousel-caption">
					<h1>適合您的最新方案：S型曲線計劃</h1>
					<p class="p1">S型曲線瘦出來！全方位打造S型曲線身材，哪裡肥胖瘦哪裡！</p>
				</div>
			</div>
		</div>

		<!-- 左右切换按钮 -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>

	</div>

	<div style="height: 55px;"></div>
	
	
<div class="container">
		<div class="row justify-content-center">

	<div class="jumbotron" style="margin: 5px auto;">
		<h3 style="font-family: 'Noto Sans TC', sans-serif; color:skyblue;">*防新冠肺炎吃什麼提高免疫力？營養師推3種食物!</h3>
		<img style="width: 18rem;" src="<c:url value="/resources/images/apple4.jpg"/>">
		<p class="lead" style="font-family: 'Noto Sans TC', sans-serif; color:#BCAAA4;">提升自身的抵抗力，保持膳食均衡營養，作息規律，才能真正地抵禦病毒感染</p>
		<hr class="my-4">
		<p style="font-family: 'Noto Sans TC', sans-serif;" >大家都在盼望著疫情早點結束，有的朋友在家裡天天用醋消毒，有的喝一些板藍根、雙黃連希望能預防病毒感染，其實，這些方法都是沒有效果的，提升自身的抵抗力，保持膳食均衡營養，作息規律，才能真正地抵禦病毒感染。.......</p>
		<a class="btn btn-primary btn-lg"
			href="https://health.udn.com/health/story/6037/4341882" role="button">繼續閱讀</a>
	</div>

	<div class="jumbotron" style="margin: 5px auto;">
		<h3 style="font-family: 'Noto Sans TC', sans-serif; color:skyblue;">*照護線上》對抗大腸直腸癌，營養支持不可少!</h3>
		<img style="width: 18rem;" src="<c:url value="/resources/images/b3.jpg"/>">
		<p class="lead" style="font-family: 'Noto Sans TC', sans-serif; color:#BCAAA4;">「營養不良，存活率較低！」癌友治療期間，體力及食慾都是相當重要的！糠榮誠醫師提醒道，「實驗證明，營養不良患者的存活率比營養充足患者的5年存活率低，所以營養充足很重要。」.</p>
		<hr class="my-4">
		<p style="font-family: 'Noto Sans TC', sans-serif;">大腸直腸癌是台灣發生率最高的癌症，目前的治療以手術為主，再搭配化學治療、標靶治療、放射治療等輔助治療。臺安醫院外科部糠榮誠醫師指出，手術治療可能出現一些併發症，例如傷口癒合不良、腹膜炎、敗血症等，不過隨著技術的發達、抗生素的進步，已可大幅降低死亡的風險。.......</p>
		<a class="btn btn-primary btn-lg"
			href="https://talk.ltn.com.tw/article/breakingnews/2961699"
			role="button">繼續閱讀</a>
	</div>
	<div class="jumbotron" style="margin: 5px auto;">
		<h3 style="font-family: 'Noto Sans TC', sans-serif; color:skyblue;">*真的有把「營養」吃進去嗎？</h3>
		<img style="width: 18rem;" src="<c:url value="/resources/images/b1.jpg"/>">
		<p class="lead" style="font-family: 'Noto Sans TC', sans-serif; color:#BCAAA4;">專家教你留住營養的料理法，在家也能做好料！</p>
		<hr class="my-4">
		<p style="font-family: 'Noto Sans TC', sans-serif;">每當進入冬季，抵抗力不足、身體缺乏營養的人就容易感冒生病，為補足營養、增加抵抗力，均衡飲食是關鍵。日常生活中到底怎麼吃、吃什麼才能獲取必要的營養呢？本集《醫起煮飯吧》主持人韋汝、江坤俊醫師與美食料理老師JJ5色廚（JJ老師）攜手考考你關於「吃」的3大常見問題，你知多少？並由JJ老師傳授留住「營養」的料理法。.......</p>
		<a class="btn btn-primary btn-lg"
			href="https://health.tvbs.com.tw/regimen/322475" role="button">繼續閱讀</a>
	</div>
	
		</div>
	</div>

<script>
$(function(){

    $('#carousel-example-generic').carousel({interval:6000});

});

// $('.carousel').carousel({
// 	  interval: 4000
// 	})
</script>
</body>
</html>