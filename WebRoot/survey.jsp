<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>欢迎来到问卷调查</title>
</head>
<style>
span {
	font-size: 20px;
}

.radio {
	font-size: 20px;
}

.submit {
	width: 110px;
	height: 100%;
	border: 1px solid #4fadeb;
	line-height: 30px;
	text-align: center;
	background: #4fadeb;
	font-size: 18px;
	color: #fff;
	cursor: pointer;
}
</style>
<body>
	<%
  request.setCharacterEncoding("utf-8");
  try{ 
	  Class.forName("com.hxtt.sql.access.AccessDriver");
	  } 
	  catch(ClassNotFoundException e){}
	  try { 
		  String  path="jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb";
		  Connection con = DriverManager.getConnection(path);
		  Statement sql=con.createStatement();
		  ResultSet rs=sql.executeQuery("select * from vote");
		
  %>
	<table width="40%" border="2" bordercolor="#99ccff" cellspacing="4"
		cellpadding="4" align="center">
		<td height="45" align="center" bgcolor="#0099CC"><label
			for="select"><span>欢迎来到大学生毕业工作城市选择调查问卷</span></label></td>
	</table>
	<table width="40%" border="2" bordercolor="#99ccff" cellspacing="4"
		cellpadding="4" align="center">
		<tr>
			<td height="25" align="left"><label for="select"><span>您认为那个城市是您毕业后期望的工作地方:</span></label>
			</td>
		</tr>
	</table>
	<form action="vote.jsp">
		<% 
  while(rs.next()){ 
  %>
		<table width="40%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="25" align="center"><input type="radio" name="type"
					class="radio" value="<%=rs.getString("id")%>"> <%=rs.getString("content") %>
				</td>
			</tr>
		</table>

		<%
  }
  rs.close();
  con.close();
  }
catch(SQLException e1){}
  %>
		<table width="40%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="25" align="center"><input type="submit" name="type"
					value="投票" class="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>