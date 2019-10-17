<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息修改</title>
<style>
body {
	background: #eeeeee;
}

.submit {
	background-color: #CAE1FF;
	border-radius: 5px;
}
</style>
</head>
<body>
	<% 
 String id=request.getParameter("id");
 try{ 
 	Class.forName("com.mysql.jdbc.Driver");
 } 
 catch(ClassNotFoundException even){
 	out.print("驱动程序不存在");
 }

 try{
  String Url="jdbc:mysql://localhost/jiaowu?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8"; 
  Class.forName("com.mysql.jdbc.Driver").newInstance(); 
  Connection con = DriverManager.getConnection(Url);      
 Statement sql=con.createStatement();
 String condition="select * from student where id="+id;
 ResultSet rs=sql.executeQuery(condition);
 rs.next();
 %>

	<form action="" method="post" name="update" target="_self" id="update"
		onsubmit="return CheckForm();">

		<table width="852" height="735" border="7" align="center"
			bgcolor="#B0E0E6"
			style="border-top-color: #CCC; border-bottom-color: #CCC; border-left-color: #FFFFFF; border-right-color: #FFFFFF; font-size: 12px; color: #999;">

			<tr>
				<td colspan="2" align="center" bgcolor="#CAE1FF"
					style="font-size: 30px;"><strong>学 生 信 息 修 改 </strong></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;"><label for="password2">&nbsp;学号：</label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"
					style="font-size: 20px;"><input name="number" type="text"
					id="number" value="<%=rs.getString("number")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;"><label for="password">姓名：</label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="name" type="text" id="name" value="<%=rs.getString("name")%>"
					size="16" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">性别： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="sex" type="text" id="sex" value="<%=rs.getString("sex")%>"
					size="16" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">年龄： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="age" type="text" id="age" value="<%=rs.getString("age")%>"
					size="16" style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">身份证： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="idcard" type="text" id="idcard"
					value="<%=rs.getString("idcard")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">班级： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="schoolclass" type="text" id="schoolclass"
					value="<%=rs.getString("schoolclass")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">联系方式： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="telephone" type="text" id="telephone"
					value="<%=rs.getString("telephone")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">入学时间： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="admissiondate" type="text" id="admissiondate"
					value="<%=rs.getString("admissiondate")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">毕业时间： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="graduationtime" type="text" id="graduationtime"
					value="<%=rs.getString("graduationtime")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>
			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">教育背景： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="education" type="text" id="education"
					value="<%=rs.getString("education")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>

			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">所属院部： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="Department" type="text" id="education"
					value="<%=rs.getString("Department")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>

			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">专业名称： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="major" type="text" id="education"
					value="<%=rs.getString("major")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>

			<tr>
				<td width="149" align="right" bgcolor="#B0E0E6"
					style="font-size: 20px;">专业科目： <label for="textfield2"></label></td>
				<td width="205" align="left" bgcolor="#B0E0E6"><input
					name="subject" type="text" id="education"
					value="<%=rs.getString("subject")%>" size="16"
					style="width: 230px; height: 25px; font-size: 14px"
					autocomplete="off"></td>
			</tr>

			<tr>
				<td colspan="2" align="center" bgcolor="#B0E0E6"
					style="border-bottom: 4px #FFFFFF"><input type="submit"
					class="submit" name="button" id="button" value="保存"
					onclick="return myfunction()"
					style="width: 80px; height: 35px; font-size: 14px"> <script> 
  function myfunction(){
    if(confirm("确定提交？")){
    	 document.update.action="ud_revise2?id=<%=rs.getInt("id")%>";
    	 document.update.submit();
    }
    else{
       return false;
    }
  }
</script>
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
					</div> <%
  con.close();
  }
catch(SQLException event){}
  %>
					</div>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>