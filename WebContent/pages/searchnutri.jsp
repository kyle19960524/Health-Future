<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Search the nutritionist</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
body{    
        background-image: url(resources/images/background/pexels-photo-1458694.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
        
     }
</style>

<script>
	//設定中文語系
	$.datepicker.regional['zh-TW'] = {
		dayNames : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ],
		dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
		monthNames : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
				"十月", "十一月", "十二月" ],
		monthNamesShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
				"九月", "十月", "十一月", "十二月" ],
		prevText : "上月",
		nextText : "次月",
		weekHeader : "週"
	};
	//將預設語系設定為中文
	$.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
	//套用到表單
	$(function() {
		$("#from").datepicker({
			minDate : 1,
			maxDate : "+7D",
			onClose : function(selectedDate) {
				$("#to").datepicker("option", "minDate", selectedDate)
			}
		});

		$("#to").datepicker({
			minDate : 1,
			maxDate : "+7D",
			onClose : function(selectedDate) {
				$("#from").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
	
	$(function(){
		var keyinTime;
		$("#search").keyup(function(){
			$("#suggest").hide();
			console.log($(this).val().length);
			var leng = $(this).val().length;
			var valu = $(this).val()
			clearTimeout(keyinTime);
			keyinTime=setTimeout(function(){
				if(leng>0){
					$.ajax({
						type:"POST",
						url:"searchNutriAjax.controller",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						dataType : "JSON",
						data:{
							"nutriName":valu,
						},
						success:function(result){
							
							if(result.length!=0){
								$("#forAppend").html("");
								for(var i=0;i<result.length;i++){
									$("#forAppend").append("<span class='mouse' style='color:black;cursor:pointer'>"+result[i]+"</span><br>");
									$("#suggest").show();
								}
							}else{
								$("#suggest").hide();
							}
						}
					})
				}
			},800)
		})
	})
	$(document).on('mouseenter', '.mouse', function(){
    	$(this).css("background-color","#888888");
	});
	$(document).on('mouseleave', '.mouse', function(){
		$(this).css("background-color","#FFFFFF");
	});
	$(document).on('click', '.mouse', function(){
		$(search).val($(this).html());
		$("#suggest").hide();
	});
	
</script>

<style>
	.st1 {
	    width: 450px;
		border-bottom: 1px solid black;
		margin: 20px;
		padding-bottom: 10px;
	}

	fieldset {
		width: 500px;
		margin: 10px;
		border: 1px solid #7B7B7B;
		border-radius: 15px;
	}

	.label1 {
		width: 100px;
		text-align: right;
	}

	.st2 {
		width: 450px;
		margin: 20px;
		text-align: center;
	}

    .scheduler-border {
   	   width: auto; 
   	   border-bottom: none; 
	}
	
	#suggest{
/*        position:absolute; */
        background-color:#FFFFFF; 
        text-align: :left; 
        border: 1px solid #000000; 
       	display:none;
    }
</style>
</head>
<body>
<div style="height: 200px;"></div>
<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 600px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<div align="center">
		<form action="<c:url value="/searchnutri.controller" />" method="post">
			<fieldset>
				<legend class="scheduler-border">${membernickname}您好，查詢你想要預約的營養師：</legend>
				<div class="st1">
					<label class="label1">營養師名字：</label> 
					<input id="search" type="text" name="name" autocomplete="off">
					<label id="suggest" style="width:60px;margin:0px"><span id="forAppend"></span></label>
				</div>
				
				<div class="st1">
					<label class="label1">從：</label> 
					<input type="text" id="from" name="nutridate" autocomplete="off">
				</div>

				<div class="st1">
					<label class="label1">到：</label> 
					<input type="text" id="to" name="nutridate2" autocomplete="off">
				</div>

				<span style="color:red;">${errors.fromAndtoAndName}${errors.fromAndto}${errors.fromAndName}${errors.toAndName}${errors.name}${errors.from}${errors.to}${errors.foundNutri}${errors.foundNutriNoTime}</span>
			</fieldset>

			<div class="st2">
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
			</div>
		</form>
	</div>
</div>

</body>
</html>