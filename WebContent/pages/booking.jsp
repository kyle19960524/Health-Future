<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Booking Time </title>
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
		$( "#datepicker" ).datepicker({ minDate: 1, maxDate: "+7D" });
	});
</script>

<style>
	body{    
        background-image: url(resources/images/background/pexels-photo-1089842.jpeg);
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
    
    .st2 {
       width: 450px;
       margin: 20px;
       text-align: center;
    }
    
    .scheduler-border {
   	   width: auto; 
       border-bottom: none; 
	}
	
	.buttontype input[type="checkbox"] {
		display: none;
	}
	.buttontype input[type="checkbox"] + label {
		display: inline-block;
		background-color: #ccc;
		cursor: pointer;
		padding: 5px 10px;
	}
	.buttontype input[type="checkbox"]:checked + label {
		background-color: #f3d42e;
	}
    
</style>
</head>
<body style="background-color:#FFFCEC;">
<div style="height: 150px;"></div>
<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 600px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<div align="center" class="form">
		<form action="<c:url value="/bookingtime.controller" />" method="post">
			<fieldset>
				<legend class="scheduler-border">${d_name}您好，請選擇您可供預約的時段：</legend>
				<div class="st1">
					<label>日期：</label> 
					<input type="text" id="datepicker"name="nutridate" autocomplete="off">
				</div>
				<div class="st1">
					<label >時段：</label>
					<div  class="buttontype">
					<input type="hidden" name="nutritime" value="0">
					<input type="checkbox" id="1" name="nutritime" value="10">
					<label for="1"> 10:00-11:00</label>
					<input type="checkbox" id="2" name="nutritime" value="11">
					<label for="2"> 11:00-12:00</label>
					<input type="checkbox" id="3" name="nutritime" value="12">
					<label for="3"> 12:00-13:00</label>
					<input type="checkbox" id="4" name="nutritime" value="13">
					<label for="4"> 13:00-14:00</label>
					<input type="checkbox" id="5" name="nutritime" value="14">
					<label for="5"> 14:00-15:00</label>
					<input type="checkbox" id="6" name="nutritime" value="15">
					<label for="6"> 15:00-16:00</label>  
					<input type="checkbox" id="7" name="nutritime" value="16">
					<label for="7"> 16:00-17:00</label>
					<input type="checkbox" id="8" name="nutritime" value="17">
					<label for="8"> 17:00-18:00</label>				
					<input type="checkbox" id="9" name="nutritime" value="18">
					<label for="9"> 18:00-19:00</label>
					<input type="checkbox" id="10" name="nutritime" value="19">
					<label for="10"> 19:00-20:00</label> 
					<input type="checkbox" id="11" name="nutritime" value="20">
					<label for="11"> 20:00-21:00</label>
					<input type="checkbox" id="12" name="nutritime" value="21">
					<label for="12"> 21:00-22:00</label>
					</div>
				</div>
				<span style="color:red">${errors.both}${errors.time}${errors.date}${errors.status}</span>
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