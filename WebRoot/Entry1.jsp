<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息录入</title>
<style>
</style>
<script>
 function  checkform(){
  var number=document.update.number.value;
  var password=document.update.password.value;
  var password1=document.update.password1.value;
  var idcard=document.update.idcard.value;
  var inputCode = document.getElementById("checkNum").value.toUpperCase();
  if(number==''){
    alert("请输入您的学号！");
    document.update.number.focus();
    return false;
  }
   if(number.length!=15){
   alert("学号由15位有效数字组成");
   document.update.number.focus();
    return false;
  }
   if(password==''){
    alert("请输入您要修改的密码！");
    document.update.password.focus();
    return false;
  }
  if(password1==''){
    alert("请输入您的确认密码！");
    document.update.password1.focus();
    return false;
  }
  if(password!=password1){
    alert("对不起！您两次密码不一致！");
    document.update.password1.focus();
    return false;
  }
   if(idcard==''){
    alert("身份证信息不能空!");
    document.update.idcard.focus();
    return false;
  }
  if(idcard.length!=18){
   alert("身份证由18个有效数字或者英文字母组成");
   document.update.idcard.focus();
    return false;
  }
  if(inputCode.length <=0) {
        alert("请输入验证码!");
        return false;
     }
     if(inputCode != code ){
        alert("验证码输入错误!");
        createCode();
        return false;
     }
 }
 var code="" ; //在全局 定义验证码
function createCode(){ 
code = "";
var codeLength = 6;//验证码的长度
var checkCode = document.getElementById("checkCode");
checkCode.value = "";
var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*32);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
document.getElementById("checkCode").innerHTML = code;
}

</script>
<style type="text/css">
#checkCode {
	width: 112px;
	height: 35px;
	position: absolute;
	left: 65%;
	top: 295px;
	color: red;
	font-size: 26px;
	font-family: Arial;
	font-style: italic;
	line-height: 35px;
	color: red;
	cursor: pointer;
	font-weight: bolder;
}

.refresh {
	font-size: 14px;
	color: red;
}

.submit {
	background-color: #CAE1FF;
	border-radius: 5px;
}
</style>
</head>
<body onload="createCode();">
	<form action="ud1.jsp" method="post" name="update" target="_self"
		id="update" onsubmit="return CheckForm();">

		<table width="652" height="435" border="7" align="center"
			bgcolor="#B0E0E6"
			style="border-top-color: #CCC; border-bottom-color: #CCC; border-left-color: #FFFFFF; border-right-color: #FFFFFF; font-size: 12px; color: #999;">

			<tr>
				<td colspan="2" align="center" bgcolor="#CAE1FF"
					style="font-size: 30px;"><strong>用 户 登 录 密 码 修 改</strong></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;"><label for="password2">&nbsp;学号：</label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"
					style="font-size: 20px;"><input name="number" type="text"
					id="number" value="" size="16" maxlength="15"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;"><label for="password">修改密码：</label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="password" type="password" id="password" value="" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">确认密码： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="password1" type="password" id="password1" value="" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">身份证： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="idcard" type="text" id="idcard" value="" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">验证码： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					type="text" value="" id="checkNum"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"> <a href="javascript:void(0);"></a>
					<div id="checkCode" onclick="createCode()";></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#B0E0E6"
					style="border-bottom: 4px #FFFFFF"><input type="submit"
					value="提交" class="submit" id="gotoCheck"
					style="width: 80px; height: 35px; font-size: 14px"
					onclick="return checkform();">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="submit" id="button2" value="重置"
					style="width: 80px; height: 35px; font-size: 14px"></td>
			</tr>

			<tr>

				<td colspan="2" align="center" bgcolor="#B0E0E6"
					style="border: none">
					<div>
						<div id="time" style="font-size: 16px;">
							<script>
				document.getElementById('time').innerHTML='当前时间：&nbsp;'+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
				setInterval("document.getElementById('time').innerHTML='当前时间：&nbsp;'+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
				</script>
						</div>
					</div>
					</div>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>