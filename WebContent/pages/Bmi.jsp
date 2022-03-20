<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>BMI</title>
<style>
form {
	font-size: 20px;
	font-weight: 800;
}

body {
	background-image:
		url(resources/images/background/pexels-photo-1172019.jpeg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
<script>
var BMI={};
BMI.getBMI=function(a,b){
var bmi = b/((a/100)*(a/100));
return bmi;
};
BMI.idealweight=function(a){
var x=(a-100)*0.9;
return x;
};
function Cal(form){
var a=eval(form.height.value);
var b=eval(form.weight.value);
var bmi=eval(form.BMI.value);
var bmiValue =BMI.getBMI(a,b);
BMI.disp_alert(bmiValue );
form.IW.value=BMI.idealweight(a);
form.BMI.value= bmiValue ;
}
BMI.disp_alert = function(bmi){
if (bmi < 18.5)
{
alert("您的體重太輕！");
}
else if (bmi >= 18.5 && bmi < 25)
{
alert("您的體重正常！");
}
else if (bmi >= 25 && bmi< 30)
{
alert("您的體重過重！");
}
else
{
alert("您確實要減肥了！");
}
}
</script>
</head>

<body style="background-color: #FFFCEC;">
	<div style="height: 100px;"></div>
	<div class="container">
		<div class="row justify-content-center">
			<div style="float: left; color: white; background-color: #263238; opacity: 0.95; width: 500px; border-radius: 10px; margin: 20px; padding-top: 1rem; padding-bottom: 1rem;">
				<div style="margin: 15px auto; width: 350px;">
					<h2 style="color: #FFCCBC;">BMI身體質量指數計算機</h2>
					<hr style="border: 1px dashed #B2DFDB; width: 100%;">
					<br>
					<form style="margin: 15px auto;" method=post>
						您的身高(cm)：<input type="number" name="height" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default" min="120" max="240" value="170">
						<br>
						您的體重(kg)：<input type="number" name="weight" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default" min="30" max="200" value="60">
						<br>
						<center>
							<input type="button" value="開始計算" onclick="Cal(this.form)" class="btn btn-secondary">
						</center>
						<br><br>
						您的理想體重：<input
							type="text" name="IW" readonly="readonly" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
						<br>
						您的BMI：<input type="text" name="BMI" readonly="readonly"
							class="form-control" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
						<br>
					</form>
				</div>
			</div>

			<div align="center"
				style="color: white; background-color: #263238; opacity: 0.95; width: 500px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
				<div style="margin: 15px auto; text-align: center; width: 400px;">
					<h2 style="color: #FFCCBC;">
						TDEE每日總消耗熱量計算機<br>與<br>BMR​基礎代謝率計算機
					</h2>
					<hr style="border: 1px dashed #B2DFDB; width: 100%;">
					<br>
					<form name="form" id="form" style="text-align: left;">
						請選擇性別：
						<select id="gender" class="form-control">
							<option value="1">男性</option>
							<option value="2">女性</option>
						</select> 
						<br>
						年齡：
						<input type="number" class="form-control" id="age" min="10" max="99" value="35" required="required">
						<br>
						身高(cm)：
						<input type="number" class="form-control" id="height" min="120" max="240" value="170" required="required">
						<br>
						體重(kg)：
						<input type="number" class="form-control" id="weight" min="30" max="200"  value="60" required="required">
						<br>
						每周運動天數：
						<select id="days" class="form-control">
							<option value="1">1天</option>
							<option value="2.5">2~3天</option>
							<option value="4.5">4~5天</option>
							<option value="7">天天</option>
							<option value="0.1">沒在運動</option>
						</select>
						<br>
						每次運動強度：
						<select id="strength" class="form-control">
							<option value="2">有氧運動</option>
							<option value="3">高強度有氧</option>
							<option value="3">有氧+重訓</option>
							<option value="3.5">高強度重訓</option>
							<option value="5">高強度有氧+高強度重訓</option>
							<option value="1">走路散步或沒有</option>
						</select>
						<br>
						工作型態： <select id="work" class="form-control">
							<option value="1">坐著居多</option>
							<option value="6">站著居多</option>
							<option value="3">坐跟站時間接近</option>
							<option value="14">勞力密集工作</option>
						</select>
						<br> <br>
						<center>
							<button class="btn btn-primary" type="submit" id="submit"
								onclick="check();">計算</button>
						</center>
					</form>

					<br>
					<p id="demo" style="font-size: 20px; color: #B2DFDB;">---</p>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>


	<script>

form.onsubmit = submit;

var bmr =0,tedd=0,tedd_index=0,bmi=0;
var bmi_result;

function submit(event) {
  
 var  gender= document.getElementById('gender').value;
 var  age= document.getElementById('age').value;
 var  height= document.getElementById('height').value;
 var  weight= document.getElementById('weight').value;
 var  days= document.getElementById('days').value;
 var  strength= document.getElementById('strength').value;
 var  work= document.getElementById('work').value;

if(gender==1)
bmr = 10*weight + 6.25*height -5*age+5 ;
else
bmr = 10*weight + 6.25*height -5*age -161;


bmi = weight/((height/100)*(height/100))

tedd_index =  days * strength + parseInt(work);


if(tedd_index <6)
tedd = 1.2*bmr;
else if(tedd_index <10)
tedd = 1.4*bmr;
else if(tedd_index <14)
tedd = 1.6*bmr;
else if(tedd_index <18)
tedd = 1.8*bmr;
else if(tedd_index <22)
tedd = 2.0*bmr;
else if(tedd_index >=26)
tedd = 2.2*bmr;

if(bmi<15)
bmi_result = "體重極度不足";
else if(bmi<16)
bmi_result = "體重嚴重不足";
else if(bmi<18.5)
bmi_result = "體重過輕";
else if(bmi<25)
bmi_result = "體重正常";
else if(bmi<30)
bmi_result = "體重過重";
else if(bmi<35)
bmi_result = "中度肥胖";
else if(bmi<40)
bmi_result = "重度肥胖";
else if(bmi>=40)
bmi_result = "非常嚴重的肥胖";


//   document.getElementById("demo").innerHTML = "BMR："+bmr.toFixed(1) +"大卡<br> BMI：" +bmi.toFixed(0)+" <br>體態："+ bmi_result + "<br>TEDD：" + tedd.toFixed(0) +"大卡<br><br>(---建議TEDD---)<br><br>減脂、減重："+(tedd*0.85).toFixed(0)+" 大卡 <br>維持住體重："+tedd.toFixed(0)+ " 大卡 <br>增肌、增重："+(tedd*1.15).toFixed(0)+" 大卡";
// 	event.preventDefault();
// }

document.getElementById("demo").innerHTML = "BMR："+bmr.toFixed(1) +"大卡" + " <br>體態："+ bmi_result + "<br>TDEE：" + tedd.toFixed(0) +"大卡<br><br>(---建議TDEE---)<br><br>減脂、減重："+(tedd*0.85).toFixed(0)+" 大卡 <br>維持住體重："+tedd.toFixed(0)+ " 大卡 <br>增肌、增重："+(tedd*1.15).toFixed(0)+" 大卡";
event.preventDefault();
}

</script>


</body>
</html>