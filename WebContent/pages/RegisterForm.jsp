<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includeMainPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員申請表單</title>
<style>
body{    
        background-image: url(resources/images/background/pexels-photo-414645.jpeg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
        
     }

.st1 {
	width: 660px;
	border-bottom: 1px dashed snow;
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
	width: 700px;
	margin: 20px;
	font-weight:800;
	background-color: #D7CCC8;
	/*border: 5px double rgb(172, 226, 235);*/
	border-radius: 10px;
	margin: 0 auto;
}

legend {
	color: snow;
 	-webkit-text-stroke: 2px #3E2723; 
	margin-bottom: 10px;
}

img{
width: 40px;
/* height: 35px; */
/* opacity: 0.9; */
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
	<div style="height:100px ;" ></div>
	
	<div style="width: 550px; margin: 0 auto; background-color: black; opacity:0.7; color:white; border-radius:5px;">
	<h1 align="center">申請加入HealthFuture會員</h1>
	</div>
	<div style="width: 700px; margin: 0 auto;"><h3 align="center" style="color:red; background-color: black; opacity:0.7; border-radius:5px;">${errors.inputmsg}</h3></div>

	<div style="width: 700px; margin: 0 auto;">
<form id="form1" name="form1" action="<c:url value="/newRegister.controller" />" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend align="center"><h3>（＊為必填）</h3></legend>
				<div class="st1">
					<label style="color:#c0392b">＊帳號：</label> <input type="text" id="idAccount" name="m_useraccount" maxlength="10" min="6">
					（長度必須6～10碼。）
					<br>
					<div id="accountCheck" style="color:red; text-indent:5em;"></div>
					
				</div>
				<div class="st1">
					<label style="color:#c0392b">＊密碼：</label> <input type="password" id="idPwd" name="m_password" maxlength="8" min="6">
					<img id="demo_img" src="<c:url value="/resources/images/visible.png"/>">
					（長度必須6～8碼。）
					<br>
					<div id="pwdCheck" style="color:red; text-indent:5em;"></div>
				</div>
				<div class="st1">
					<label style="color:#c0392b">＊再次確認密碼：</label> <input type="password" id="idPwd2" name="m_password2" maxlength="8" min="6">
					（長度必須6～8碼。）
					<br>
					<div id="pwdCheck2" style="color:red; text-indent:9em;"></div>
				</div>
				<div class="st1">
					<label style="color:#c0392b">＊姓名：</label> <input type="text" id="idName" name="m_fullname" maxlength="10" min="2">
					（至少兩個字且必須為中文字）
					<div id="nameCheck" style="color:red; text-indent:5em;"></div>
				</div>
				<div class="st1">
					<label style="color:#c0392b">＊暱稱：</label> <input type="text" id="idNickname" name="m_nickname" maxlength="10" min="1">
					<div id="nicknameCheck" style="color:red; text-indent:5em;"></div>
				</div>
				<div class="st1">
					<label style="color:#c0392b">＊身分證字號：</label> <input type="text" id="idNumber" name="m_idcard" maxlength="10" min="10">
					（包含英文大寫字母和數字）
					<div id="idnumberCheck" style="color:red; text-indent:8em;"></div>
				</div>
				<div class="st1">
					<!-- <label style="color:red">＊性別：</label>
					<input type="radio" id="idSex" name="m_sex" value="male" style="width: 40px;height: 40px;zoom:50%">男
					<input type="radio" id="idSex" name="m_sex" value="female" style="width: 40px;height: 40px;zoom:50%">女 -->
				<label style="color:#c0392b">＊性別：</label><input type="text" id="idSex" name="m_sex" maxlength="4" min="1">
					<div id="sexCheck" style="color:red; text-indent:5em;"></div>
				</div>
				<div class="st1">
					<label style="color:#c0392b">＊生日：</label> <input type="text" id="idDate" name="m_birthday" maxlength="8" min="8" placeholder="YYYYMMDD">
					（西元年月日）
					<div id="dateCheck" style="color:red; text-indent:5em;"></div>
				</div>
				</fieldset>
				<br>
				<fieldset>
				<div class="st1">
					<label>身高：</label> <input type="text" name="m_height" maxlength="3" id="idHeight">
					公分
				</div>
				<div class="st1">
					<label>體重：</label> <input type="text" name="m_weight" maxlength="3" id="idWeight">
					公斤
				</div>
				<div class="st1">
					<label>居住地區：</label> 
					<select name="m_location" style="width: 140px;" id="idLocation">
						<option value="" style="display: none">請選擇縣市</option>
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
					<label>行動電話：</label> <input type="text" name="m_cellphone" maxlength="10" id="idCellphone">
				</div>
				<div class="st1">
					<label>電子信箱：</label> <input type="text" class="col-sm-8" name="m_email" maxlength="40" id="idemail">
				</div>
				<div class="st1">
				<label>個人頭像：</label>
					<label class="btn btn-info">
						<input id="upload_img" class="col-sm-10" style="display:inline;" type="file" name="myFiles">
						<i class="fa fa-photo"></i> 上傳圖片
					</label>
				</div>
			</fieldset>
	
			<div align="center" style="width: 600px; margin: 20px auto;"class="form-group form-check">
				<button type="submit" class="btn btn-primary" id="button" onclick="return false">送出</button>
				<button type="reset" class="btn btn-primary">清除</button>
				<button type="button" class="btn btn-primary" onclick="showmember()">一鍵展示</button>
			</div>
			
		</form>
	</div>
	
		
    <script>
    
    function showmember(){
  	  var idAccount = document.getElementById("idAccount");
  	  idAccount.value="mike123";
  	  
  	  var idPwd = document.getElementById("idPwd");
  	  idPwd.value="test123";
  	  
  	  var idName = document.getElementById("idName");
  	  idName.value="麥可";
  	  
  	  var nickname = document.getElementById("idNickname");
  	  nickname.value="Mike";
  	  
  	  var id = document.getElementById("idNumber");
  	  id.value="J123456789";
  	  
  	  var gender = document.getElementById("idSex");
      gender.value="男";
  	 
  	  var date = document.getElementById("idDate");
  	  date.value="19950626";
  	 
  	  var height = document.getElementById("idHeight");
  	  height.value="180";
  	 
  	  var weight = document.getElementById("idWeight");
      weight.value="65";
  	 
  	  var cellphone = document.getElementById("idCellphone");
  	  cellphone.value="09765432123";
  	 
  	  var email = document.getElementById("idemail");
      email.value ="team5testandy@gmail.com";
  	 
      var email = document.getElementById("idLocation");
 	  email.value ="台北市";

  	 }
    
    
  
    //判斷使用者有無填寫資料，沒有則不傳送表單。
    $(document).ready(function(){
        $("#button").click(function(){
            if($("#idAccount").val()==""){
                alert("您尚未填寫帳號");
                eval("document.form1['m_useraccount'].focus()");       
            }else if($("#idPwd").val()==""){
                alert("您尚未填寫密碼");
                eval("document.form1['m_password'].focus()");    
            }else if($("#idPwd2").val()==""){
                alert("您必須填寫再次確認密碼");
                eval("document.form1['m_password2'].focus()");    
            }else if($("#idPwd2").val()!= $("#idPwd").val()){
                alert("您兩次密碼輸入不一致");
                eval("document.form1['m_password2'].focus()");    
            }else if($("#idName").val()==""){
                alert("您尚未填寫姓名");
                eval("document.form1['m_fullname'].focus()");    
            }else if($("#idName").val().length <=1){
                alert("您填寫的姓名格式不正確");
                eval("document.form1['m_fullname'].focus()");    
            }else if($("#idNickname").val()==""){
                alert("您尚未填寫暱稱");
                eval("document.form1['m_nickname'].focus()");    
            }else if($("#idNumber").val()==""){
                alert("您尚未填寫身分證字號");
                eval("document.form1['m_idcard'].focus()");    
            }else if($("#idSex").val()==""){
                alert("您尚未填寫性別");
                eval("document.form1['m_sex'].focus()");    
            }else if($("#idDate").val()==""){
                alert("您尚未填寫生日");
                eval("document.form1['m_birthday'].focus()");    
            }else{
                document.form1.submit();
            }
        })
     })
    
    
    	document.getElementById("idAccount").onblur=AccountCheckf;   //onblur="將觸發的 javascript function"
  		document.getElementById("idPwd").onblur=PwdCheckf;
  		document.getElementById("idPwd2").onblur=PwdCheck2f;
        document.getElementById("idName").onblur=NameCheckf;
        document.getElementById("idNickname").onblur=NicknameCheckf;
        document.getElementById("idNumber").onblur=IdnumberCheckf;
        document.getElementById("idSex").onblur=SexCheckf;
        document.getElementById("idDate").onblur=DateCheckf;

        
        function AccountCheckf() {
            let theAccount = document.getElementById("idAccount").value;
            let theAccountLen = theAccount.length;
            let flag1 = false, flag2 = false;
            
            if (theAccountLen == 0) {
                document.getElementById("accountCheck").innerHTML = "不能空白";
            } else if (theAccountLen >= 6) {
                	document.getElementById("accountCheck").innerHTML = " ";
                	
                	$.ajax({
                	    url: "checkNewAccount.controller",
                	    cache: false,
                	    async: false,
                	    contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                		dataType:"json",
                	    type:'POST',
                	    data:{
                	    	m_useraccount : $("#idAccount").val(),
                	    },
                	    success: function(result) {
                	    	
                	        if(result==true) {
                	        	document.getElementById("accountCheck").innerHTML = "此帳號可使用";
                	            //alert("此帳號可使用");
                	        } else {
                	        	document.getElementById("accountCheck").innerHTML = "此帳號已被註冊，請輸入其他帳號。";
                	            //alert("此帳號已被註冊，請重新輸入");
                	        }
                	    }
                	});
                	
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
        
            function PwdCheck2f() {
        	let thePwd = document.getElementById("idPwd2").value;
            let thePwdLen = thePwd.length;
            
            if (thePwdLen == 0) {
                document.getElementById("pwdCheck2").innerHTML = "不能空白";
            } else if (thePwdLen >= 6) {
                	document.getElementById("pwdCheck2").innerHTML = " ";
              } else {
                document.getElementById("pwdCheck2").innerHTML = "密碼長度不能小於6碼";
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