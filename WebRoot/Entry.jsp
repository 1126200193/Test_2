<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息录入</title>
<style>
.submit {
	background-color: #CAE1FF;
	border-radius: 5px;
}
</style>
<script>
 function  checkform(){
  var number=document.update.number.value;
  var name=document.update.name.value;
  var idcard=document.update.idcard.value;
  var schoolclass=document.update.schoolclass.value;
  if(number==''){
    alert("新生学号、姓名、身份证、班级信息不能空!");
    document.update.number.focus();
    return false;
  }
   if(number.length!=15){
   alert("学号由15位有效数字组成");
   document.update.number.focus();
    return false;
  }
   if(name==''){
    alert("新生学号、姓名、身份证、班级信息不能空!");
    document.update.name.focus();
    return false;
  }
   if(idcard==''){
    alert("新生学号、姓名、身份证、班级信息不能空!");
    document.update.idcard.focus();
    return false;
  }
  if(idcard.length!=18){
   alert("身份证由18个有效数字或者英文字母组成");
   document.update.idcard.focus();
    return false;
  }
   if(schoolclass==''){
    alert("新生学号、姓名、身份证、班级信息不能空!");
    document.update.schoolclass.focus();
    return false;
  }
 }

</script>
</head>
<body>
	<form action="addstu.jsp" method="post" name="update" target="_self"
		id="update" onsubmit="return CheckForm();">

		<table width="852" height="735" border="7" align="center"
			bgcolor="#B0E0E6"
			style="border-top-color: #CCC; border-bottom-color: #CCC; border-left-color: #FFFFFF; border-right-color: #FFFFFF; font-size: 12px; color: #999;">

			<tr>
				<td colspan="2" align="center" bgcolor="#CAE1FF"
					style="font-size: 30px;"><strong>新 生 信 息 录 入 系 统 </strong></td>
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
					style="font-size: 20px;"><label for="password">姓名：</label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="name" type="text" id="name" value="" size="16" maxlength="10"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">性别： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="sex" type="text" id="sex" value="" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">年龄： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="age" type="text" id="age" value="" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">身份证： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="idcard" type="text" id="idcard" value="" size="16"
					maxlength="18" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">班级： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="schoolclass" type="text" id="schoolclass" value="" size="16"
					maxlength="15" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">联系方式： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="telephone" type="text" id="telephone" value="" size="16"
					maxlength="13" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">入学时间： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="admissiondate" type="text" id="admissiondate" value=""
					size="16" maxlength="15"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">毕业时间： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="graduationtime" type="text" id="graduationtime" value=""
					size="16" maxlength="15"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">教育背景： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="education" type="text" id="education" value="" size="16"
					maxlength="15" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">所属院部： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="Department" type="text" id="Department" value="" size="16"
					maxlength="15" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>

			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">专业名称： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="major" type="text" id="major" value="" size="16"
					maxlength="15" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>

			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">专业科目： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="subject" type="text" id="subject" value="" size="16"
					maxlength="15" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#B0E0E6"
					style="border-bottom: 4px #FFFFFF"><input type="submit"
					class="submit" id="button" value="录入" onclick="return checkform();"
					style="width: 80px; height: 35px; font-size: 14px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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