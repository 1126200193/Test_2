<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎光临学生信息中心</title>
</head>
<style>
.psize1,.psize2 {
	font-size: 18px;
	text-align: center;
}

select {
	width: 200px;
	height: 35px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin: auto 5px;
}

tr {
	text-align: center;
}

.button {
	width: 110px;
	height: 100%;
	border: 1px solid #4fadeb;
	line-height: 30px;
	text-align: center;
	background: #4fadeb;
	font-size: 18px;
	color: #fff;
	cursor: pointer;
	margin: 0 50px;
	cursor: pointer;
}

.text {
	width: 100%;
	height: 25px;
	font-size: 16px;
	float: left;
}

.text1 {
	width: 100%;
	height: 25px;
	font-size: 15px;
	cursor: pointer;
}

.textarea {
	font-size: 18px;
	float: left;
}
</style>
<script>
    function checkform(){
      var word=document.form1.word.value;
      var word1=document.form1.word1.value;
      if(word==''){
       alert("您的留言主题不能为空");
       document.form1.word.focus();
       return false;
      }
      if(word1==''){
      alert("您的留言内容不能为空");
       document.form1.word1.focus();
       return false;
      }
      else{
    	document.form1.action="words_add.jsp"; //form1为form表单的name
   	   document.form1.submit();
      }
    }
  </script>
<body>
	<%
  request.setCharacterEncoding("utf-8");
  String number=(String)session.getAttribute("login_name");
  try{ 
	  Class.forName("com.hxtt.sql.access.AccessDriver");
	  } 
	  catch(ClassNotFoundException e){}
	  try { 
		  String  path="jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb";
		  Connection con = DriverManager.getConnection(path);
		  Statement sql=con.createStatement();
			  String condition="select * from admin2 where number="+number;
			  ResultSet rs=sql.executeQuery(condition);
			  rs.next();  
		
  %>
	<form action="" id="form1" name="form1" method="post" target="_self">
		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="35" align="center" bgcolor="#0099CC"><span
					class="psize1" name="select">------欢 迎 来 到 学 生 留 言 系 统------</span>
				</td>

			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="10%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">学号：</span></td>
				<td width="22%" height="25" bgcolor="#0099CC"><input
					type="text" class="text1" name="number"
					value="<%=rs.getString("number")%>" readonly /></td>
				<td width="10%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">姓名：</span></td>
				<td width="22%" height="25" bgcolor="#0099CC"><input
					type="text" class="text1" name="name"
					value="<%=rs.getString("name")%>" readonly /></td>
				<td width="14%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">专业班级：</span></td>
				<td width="22%" height="25" bgcolor="#0099CC"><input
					type="text" class="text1" name="schoolclass"
					value="<%=rs.getString("schoolclass")%>" readonly /></td>
			</tr>
		</table>
		<%
	  
  con.close();
  }
catch(SQLException event){}
  %>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="20%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">留 言 主 题 ：</span></td>
				<td width="80%" height="25" bgcolor="#0099CC"><input
					type="text" class="text" name="word" autocomplete="off" /></td>
			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="20%" height="auto" bgcolor="#0099CC"><span
					class="psize1" name="select">留 言 内 容 ：</span></td>
				<td width="80%" height="auto" bgcolor="#0099CC"><textarea
						name="word1" class="textarea" cols="64" rows="10"></textarea></td>
			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="100%" height="auto" bgcolor="#0099CC">
					<button class="button" onclick="return checkform();">提交留言</button>
					<input type="button" class="button" value="查看留言"
					onclick="location.href='words1.jsp'">
				</td>
			</tr>
		</table>


		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="45" width="100%" bgcolor="#0099CC"><span
					class="psize2"> <marquee scrollAmount="6" width="100% "
							class="marquee">
						亲爱的同学！欢迎来到学生留言系统！请按照规定进行留言！若不能及时回复，请见谅！！ </marquee>
				</span></td>
			</tr>
		</table>

	</form>

</body>
</html>
