<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入</title>

<style>
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
	.font{
		font-family: "cwTeXYen", sans-serif;
		line-height:2;
		font-size:18px;
		font-weight:800;
	
	}

.st1 {
	width: 95%;
	border-bottom: 1px dashed gray;
	margin: 20px;
	padding-bottom: 10px;
}

input {
	width:100px;
	display: inline;
	width: 40%;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

fieldset {
/* 	width: 650px; */
	margin: 20px;
	background-color: #B2D1D6;
	
	border-radius: 15px;
	margin: 0 auto;
}

legend {
	font-size: 20px;
	color: rgb(102, 166, 177);
	text-shadow: 5px 5px 10px rgb(172, 226, 235);
	margin-bottom: 10px;
}

 
 .bg {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: -999;
        }
        .bg img {
            min-height: 100%;
            width: 100%;
        }
      
</style>
<script>
function showmember(){
 	var idAccount = document.getElementById("idAccount");
 	idAccount.value="andy123";
 	
 	var idPwd = document.getElementById("idPwd");
 	idPwd.value="test123";
 	
 	var idName = document.getElementById("idName");
 	idName.value="安迪";
 	
 	var school = document.getElementById("school");
 	school.value="台北醫學大學保健營養系碩士";
 	
 	var sphone = document.getElementById("sphone");
 	sphone.value="0987654321";
 	
	var cellphone = document.getElementById("cellphone");
	cellphone.value="0987654321";
	
	var semail = document.getElementById("semail");
	semail.value="team5testandy@gmail.com";
	
	var idNumber = document.getElementById("idNumber");
	idNumber.value="H123456789";
	
	var experience = document.getElementById("experience");
	experience.value="羅東醫院臨床營養師兼任組長";
	
	var btnBirthday = document.getElementById("btnBirthday");
	btnBirthday.value="1992-09-12";
	
	var genderMale = document.getElementById("genderMale");
	genderMale.checked ="ture";
	
	
 }
</script>

</head>
<body >

  <div class="bg">
        <img src="<c:url value="/resources/images/crossfit.jpg"/>">
    </div>

<div style="height:100px ;" ></div>
<div class="font">
	<div style="width: 550px; margin: 0 auto; background-color: #2D3948; opacity:0.75; color:white; border-radius:5px;">
		<h1 align="center">加入營養師請填寫詳細資料</h1>
	</div>

<div class="font" style="width: 650px; margin: 0 auto;"> 
		<form action="<c:url value="/register.controller" />" enctype="multipart/form-data" method="post">
			<fieldset style="text-align:center">
				<legend align="center">（個人資料一）</legend>
				<div class="st1">
					<label >帳號：</label> <input type="text"  id="idAccount" name="account"  >
					<span id="accountCheck" style="color:red"></span>
					
				</div>
				
				
				<div class="st1">
					<label >密碼：</label> <input type="password"  id="idPwd" name="pwd">
					<span id="pwdCheck" style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label >確認密碼：</label> <input type="password"  id="idPwd2" >
					<span id="pwdCheck2" style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label >姓名：</label> <input type="text"  id="idName" name="name" >
					<span id="nameCheck" style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label >學歷：</label> <input type="text"  name="education" id="school" >
					<span  style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label >電話：</label> <input type="text"  name="phone" id="sphone">
					<span  style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label >手機：</label> <input type="text"  name="cellphone"  id="cellphone">
					<span  style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label >e-mail：</label> <input type="text"  name="email" id="semail" >
					<span  style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label >身分證字號：</label> <input type="text"  name="identity" id="idNumber">
					<span  style="color:red"></span>
					
				</div>
				
				<div class="st1">
					<label>經歷：</label> 
					<textarea   name="experience"  style="height:100px;" id="experience"></textarea>
					<span  style="color:red"></span>
					
				</div>
				</fieldset>
				
				

	
			<fieldset style="text-align:center">
				<legend align="center">（個人資料二）</legend>
				<div class="st1">
				<label>頭像:</label> <input type="file" name="myFiles">
			</div>
				<div class="st1">
				<label>證照:</label> <input type="file" name="myFiles">
			</div>

			<div class="st1" >
				<label>生日</label> <input type="date" name="date1" id="btnBirthday">
			</div>
			<div class="st1">
				<label>性別:</label>  <input type="radio" name="gender" id="genderMale"
					value="male" >男
				  <input type="radio" name="gender" value="female">女
				
			</div>
			<div class="st1">
				<label>居住地區</label> <select name="livingin" style="width: 140px;">
					<option value="TPC">台北市</option>
					<option value="NTPC">新北市</option>
					<option value="KLC">基隆市</option>
					<option value="TYC">桃園市</option>
					<option value="HCH">新竹縣</option>
					<option value="HCT">新竹市</option>
					<option value="MLH">苗栗縣</option>
					<option value="TCC">台中市</option>
					<option value="CHH">彰化縣</option>
					<option value="YLH">雲林縣</option>
					<option value="NTC">南投縣</option>
					<option value="CIH">嘉義縣</option>
					<option value="CIC">嘉義市</option>
					<option value="KHC">高雄市</option>
					<option value="PTH">屏東縣</option>
					<option value="TTH">台東縣</option>
					<option value="HLH">花蓮縣</option>
					<option value="ILH">宜蘭縣</option>
					<option value="LCC">連江縣</option>
					<option value="KMC">金門縣</option>
					<option value="PHC">澎湖縣</option>
				</select>
			</div>
				</fieldset>
				
				<div align="center" style="width: 600px; margin: 20px auto;"
				class="form-group form-check">
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
				<button type="button" class="btn btn-primary" id="show" onclick="showmember()">一鍵展示</button>
			</div>
				</form>

</div>
</div>

	
 <script>
 	   

    	document.getElementById("idAccount").onblur=AccountCheckf;   //onblur="將觸發的 javascript function"
  		document.getElementById("idPwd").onblur=PwdCheckf;
        document.getElementById("idName").onblur=NameCheckf;
        document.getElementById("idPwd2").onblur=PwdCheckf2;
       
        document.getElementById("idDate").onblur=DateCheckf;

        
        function AccountCheckf() {
            let theAccount = document.getElementById("idAccount").value;
            let theAccountLen = theAccount.length;
            let flag1 = false, flag2 = false;
            
            if (theAccountLen == 0) {
                document.getElementById("accountCheck").innerHTML = "不能空白";
            } else if (theAccountLen >= 6) {
                	document.getElementById("accountCheck").innerHTML = " ";
              } else {
                document.getElementById("accountCheck").innerHTML = "帳號長度不能小於6碼";
           		}
        }
        

        
	document.getElementById("demo_img").onclick = hideShowPsw;
    //隱藏text block，顯示password block
	function hideShowPsw(){
		var demoImg = document.getElementById("demo_img");
		var demoInput = document.getElementById("idPwd");
		
		if (demoInput.type == "password") {
			demoInput.type = "text";
			demo_img.src = "<c:url value="/resources/images/invisible.png"/>";
		}else {
			demoInput.type = "password";
			demo_img.src = "<c:url value="/resources/images/visible.png"/>";
		}
	}
        
        function PwdCheckf() {
        	let thePwd = document.getElementById("idPwd").value;
            let thePwdLen = thePwd.length;
            
            if (thePwdLen == 0) {
                document.getElementById("pwdCheck").innerHTML = "不能空白";
            } else if (thePwdLen >= 6) {
                	document.getElementById("pwdCheck").innerHTML = " ";
              } else {
                document.getElementById("pwdCheck").innerHTML = "密碼長度不能小於6碼";
           		}
        }
        

        
        function NameCheckf() {
            let theName = document.getElementById("idName").value;
            let theNameLen = theName.length;
            let flag = false;

            if (theName == ""){
            	document.getElementById("nameCheck").innerHTML = "不能空白";
            } else if (theNameLen >= 2) {
                for (let i = 0; i < theNameLen; i++) {
                    let theNameChr = theName.charCodeAt(i);
                    if (theNameChr >= 0x4e00 && theNameChr <= 0x9fff){
                    	flag = true;
                    } else {
                        flag = false;
                        break;
                    }
                }
                if (flag){
                	document.getElementById("nameCheck").innerHTML = "格式正確";
                }
                else{
                	document.getElementById("nameCheck").innerHTML = "格式不正確";
                } 
            } else {
                document.getElementById("nameCheck").innerHTML = "姓名長度不能少於兩個字";
            }
        }

        function NicknameCheckf() {
            let theNick = document.getElementById("idNickname").value;

            if (theNick == ""){
            	document.getElementById("nicknameCheck").innerHTML = "不能空白";
            }else {
                document.getElementById("nicknameCheck").innerHTML = " ";
            }
        }
        
        function IdnumberCheckf() {
            let theIdnum = document.getElementById("idNumber").value;
            let theIdnumLen = theIdnum.length;

            if (theIdnum == ""){
            	document.getElementById("idnumberCheck").innerHTML = "不能空白";
       		}else if (theIdnumLen < 10) {
       			document.getElementById("idnumberCheck").innerHTML = "身分證字號不完整";
       		}else {
                document.getElementById("idnumberCheck").innerHTML = " ";
            }
        }
        
        function SexCheckf() {
            let theSex = document.getElementById("idSex").value;

            if (theSex == ""){
            	document.getElementById("sexCheck").innerHTML = "不能空白";
       		}else {
                document.getElementById("sexCheck").innerHTML = " ";
            }
        }
        
        function DateCheckf() {
            let theDate = document.getElementById("idDate").value;
//            let re = /^\d{4}\/\d{1,2}\/\d{1,2}$/;
            let msgChk = document.getElementById("dateCheck");

            if (theDate != "") {
            	msgChk.innerHTML = " ";
       		}
            else{
            	msgChk.innerHTML = "不能空白";
            }
        }
        
        
        function PwdCheckf2(){
        	let password1 = document.getElementById("idPwd").value;
        	let password2 =document.getElementById("idPwd2").value;
        	
        	if(password2 ==""){
        		document.getElementById("pwdCheck2").innerHTML="不可空白"}
        	
        	else if(password2!=password1){
        		document.getElementById("pwdCheck2").innerHTML="兩次輸入密碼不一致"
        		
        	}else{document.getElementById("pwdCheck2").innerHTML="密碼正確"}
        	
        }
        
    </script>

</body>
</html>