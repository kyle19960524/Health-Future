<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>booking</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
//設定中文語系
	$.datepicker.regional['zh-TW']={
   		dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
   		dayNamesMin:["日","一","二","三","四","五","六"],
   		monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
   		monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
   		prevText:"上月",
   		nextText:"次月",
   		weekHeader:"週"
	};
	//將預設語系設定為中文
	$.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
	//套用到表單
	$(function() {
		$( "#from" ).datepicker({ minDate: 1, maxDate: "+7D" ,
			onClose: function( selectedDate ) {
	        $( "#to" ).datepicker( "option", "minDate", selectedDate )}});
	
	    $( "#to" ).datepicker({	minDate: 1, maxDate: "+7D" ,
		      onClose: function( selectedDate ) {
		        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
		      }
		    });
	});
</script>

<style>
body{    
        background-image: url(resources/images/background/pexels-photo-1458694.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
        
     }

	@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	form{
/* 		font-family: "cwTeXYen", sans-serif; */
		line-height:2;
		font-size:18px;
		font-weight:800;
	
	}
	
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
       width: 149px;
       float: left;
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
   
</style>
</head>
<body style="background-color:#FFFCEC;">
<div style="height: 150px;"></div>

<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 600px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<div align="center" class="form">
		<form action="<c:url value="/searchdate.controller" />" method="post">
			<fieldset>
				<legend class="scheduler-border">${d_name}您好，查詢您可供預約的時段：</legend>
				<div class="st1">
					<label>從：</label> 
					<input type="text" id="from"name="nutridate" autocomplete="off">
				</div>
				
				<div class="st1">
					<label>到：</label> 
					<input type="text" id="to"name="nutridate2" autocomplete="off">
				</div>
				
				${errors.fromAndto}${errors.from}${errors.to}${message.success}
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