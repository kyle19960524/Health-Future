<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料查詢</title>
<style>
body{
/* 	font-family: "Microsoft YaHei", sans-serif; */
		background-image: url(resources/images/background/pexels-photo-219794.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
}

img{
width: 40px;
/* height: 35px; */
}

.st1 {
	width: 650px;
	border-bottom: 1px dashed #BCAAA4;
	margin: 20px;
 	padding-bottom: 10px;
	font-size: 20px;
	text-align: left;
}

.st2 {
	width: 450px;
	margin: 20px;
	text-align: center;
}

fieldset {
	width: 750px;
	margin: 10px;
	border: 2px solid #7B7B7B;
	border-radius: 10px;
}

    .scheduler-border {
   	   width: auto; 
   	   border-bottom: none; 
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--  <script type="text/javascript">
   function confirmUpdate(m_useraccount){
 	  var result = confirm("確定更新此筆資料(帳號:" + m_useraccount.trim() + ")?");
 	  if (result) {
 		  document.forms[0].put.value = "PUT";
 	      return true;
 	  }
 	  return false;
   }
 </script> -->
</head>
<body>
	<div style="height:100px ;" ></div>
				
	<div align="center" style="color:white; background-color: #263238; opacity:0.95; width: 900px; border-radius: 10px; margin: 0 auto; padding-top: 1rem; padding-bottom: 1rem;">
	<h1 align="center" style="margin: 30px auto; color: #BCAAA4;">
		<c:set var="path" value="${list.M}"></c:set>
		<img src='<c:url value="${fn:substring(fn:substringAfter(path,'WebContent'),1,-1)}"/>' style="width:auto;height:8rem;border-radius:90px;">
		&emsp;歡迎 ${membernickname}！
	</h1>

		<form id="form1" name="form1" action="<c:url value="/goshowMembers.controller" />" method="post" enctype="multipart/form-data">
		<input type="hidden" name="_method"  id='put'   value="" >
			<fieldset>
				<legend class="scheduler-border"><h2 style="color:#FFEB3B;">個人基本資料管理</h2></legend>
					
				<h4 align="center" style="margin: 30px auto; color: #CDDC39;">欲變更資料，請於欄位內修改後點選更新會員資料。</h4>
				<legend align="center"><h4 style="color:red">（＊必填）</h4></legend>
				<div class="st1">
					<label>帳號：</label>
					<span>${list.A}</span> 
				</div>
				<div class="st1">
					<label>＊密碼：</label> <input type="password" id="idPwd" name="m_password" value="${list.B}"
						maxlength="8">
					<img id="demo_img" src="<c:url value="/resources/images/visible.png"/>" >
					<span id="pwdCheck" style="color:red"></span>
					（長度必須6～8碼。）
				</div>
				<div class="st1">
					<label>＊姓名：</label> <input type="text" id="idName" name="m_fullname" value="${list.C}">
					<span id="nameCheck" style="color:red"></span>
					（至少兩個字且必須為中文字）
				</div>
				<div class="st1">
					<label>＊暱稱：</label> <input type="text" id="idNickname" name="m_nickname" value="${list.D}">
					<span id="nicknameCheck" style="color:red"></span>
				</div>
				<div class="st1">
					<label>身分證字號：</label>
					<span>${list.E}</span> 

				</div>
				<div class="st1">
					<label>＊性別：</label>
					<input type="text" id="idSex"
						name="m_sex" value="${list.F}">
						<span id="sexCheck" style="color:red"></span>
				</div>
				<div class="st1">
					<label>＊生日（西元年月日，如：20030718）：</label> <input type="text" id="idDate"
						name="m_birthday" value="${list.G}">
						<span id="dateCheck" style="color:red"></span>
				</div>
				<div class="st1">
					<label>身高：</label> <input type="text" id="idHeight"
						name="m_height" value="${list.H}">公分
				</div>
				<div class="st1">
					<label>體重：</label> <input type="text" id="idWeight"
						name="m_weight" value="${list.I}">公斤
				</div>
				<div class="st1">
					<label>居住地區：</label>
						<select name="m_location" style="width: 120px;">
						<option value="${list.J}">${list.J}</option>
						<option value="台北市">台北市</option>
						<option value="新北市">新北市</option>
						<option value="基隆市">基隆市</option>
						<option value="桃園市">桃園市</option>
						<option value="新竹縣">新竹縣</option>
						<option value="新竹市">新竹市</option>
						<option value="苗栗縣">苗栗縣</option>
						<option value="台中市">台中市</option>
						<option value="彰化縣">彰化縣</option>
						<option value="雲林縣">雲林縣</option>
						<option value="南投縣">南投縣</option>
						<option value="嘉義縣">嘉義縣</option>
						<option value="嘉義市">嘉義市</option>
						<option value="高雄市">高雄市</option>
						<option value="台南市">台南市</option>
						<option value="屏東縣">屏東縣</option>
						<option value="台東縣">台東縣</option>
						<option value="花蓮縣">花蓮縣</option>
						<option value="宜蘭縣">宜蘭縣</option>
						<option value="連江縣">連江縣</option>
						<option value="金門縣">金門縣</option>
						<option value="澎湖縣">澎湖縣</option>
					</select>
				</div>

				<div class="st1">
					<label>行動電話（請直接填寫數字，如：0900111222）：</label> <input type="text" id="idCellphone"
						name="m_cellphone" value="${list.K}">
				</div>
				<div class="st1">
					<label>電子信箱：</label> <input type="text" id="idemail" name="m_email" value="${list.L}">
				</div>
				<div class="st1">
				<label>個人頭像：</label>
					<label class="btn btn-info">
						<input id="upload_img" class="col-sm-9" style="display:inline;" type="file" name="file0">
						<i class="fa fa-photo"></i> 更改圖片
				</div>

			
			</fieldset>
			
			<div align="center" style="width: 600px; margin: 20px auto;"
				class="form-group form-check">
				<button type="submit" class="btn btn-primary" id="button" onclick="return false">更新會員資料</button>
<%-- 				<button type="submit" class="btn btn-primary" id="button" onclick="return confirmUpdate('${user}');">更新會員資料</button> --%>
			</div>
			                                                   
		</form>

	</div>
		<br/>
		
<script>
  
    //判斷使用者有無填寫資料，沒有則不傳送表單。
    $(document).ready(function(){
        $("#button").click(function(){
            if($("#idPwd").val()==""){
                alert("您尚未填寫密碼");
                eval("document.form1['m_password'].focus()");    
            }else if($("#idName").val()==""){
                alert("您尚未填寫姓名");
                eval("document.form1['m_fullname'].focus()");    
            }else if($("#idNickname").val()==""){
                alert("您尚未填寫暱稱");
                eval("document.form1['m_nickname'].focus()");    
            }else if($("#idSex").val()==""){
                alert("您尚未填寫性別");
                eval("document.form1['m_sex'].focus()");    
            }else if($("#idDate").val()==""){
                alert("您尚未填寫生日");
                eval("document.form1['m_birthday'].focus()");    
            }else {	 
            	document.form1.submit();
            }
            
        })
     })


  		document.getElementById("idPwd").onblur=PwdCheckf;
        document.getElementById("idName").onblur=NameCheckf;
        document.getElementById("idNickname").onblur=NicknameCheckf;
        document.getElementById("idSex").onblur=SexCheckf;
        document.getElementById("idDate").onblur=DateCheckf;

        
	document.getElementById("demo_img").onclick = hideShowPsw;
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
                	document.getElementById("nameCheck").innerHTML = " ";
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

            if (theDate == "") {
            	msgChk.innerHTML = "不能空白";
       		} else if (theDate.length == 8) {
            	document.getElementById("dateCheck").innerHTML = " ";
            } else{
            	msgChk.innerHTML = "生日輸入不完整或格式不正確";
            }
        }
    </script>
</body>
</html>