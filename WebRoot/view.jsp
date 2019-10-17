<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%!
   int tot_num=0;
   int tmp_num=0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>欢迎查看调查情况</title>
<style>
span {
	font-size: 20px;
}
</style>
</head>
<body>
	<table width="40%" border="2" bordercolor="#99ccff" cellspacing="4"
		cellpadding="4" align="center">
		<td height="45" align="center" bgcolor="#0099CC"><label
			for="select"><span>大学生毕业工作城市选择调查问卷情况汇总</span></label></td>
	</table>
	<table width="40%" border="2" bordercolor="#99ccff" cellspacing="4"
		cellpadding="4" align="center">
		<%
  try{ 
	  Class.forName("com.hxtt.sql.access.AccessDriver");
	  } 
	  catch(ClassNotFoundException e){}
	  try { 
		  String  path="jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb";
		  Connection con = DriverManager.getConnection(path);
		  Statement sql=con.createStatement();
		  ResultSet tmpRs=sql.executeQuery("select sum(numb) As totalnum from vote");
		  tmpRs.next();
		  tot_num=tmpRs.getInt("totalnum");
		  tmpRs.close();
		  ResultSet rs=sql.executeQuery("select *from vote");
		  int i=1;
		  while(rs.next()){
		  
  %>
		<tr>
			<td height="10" align="left" bgcolor="#0099CC">选项<%=i%>:<%=rs.getString("content")%></td>
		</tr>
		<tr>
			<%tmp_num=rs.getInt("numb");%>
			<td height="30" align="left">投票率：<img src="image/1.gif"
				width="<%=Math.floor(tmp_num*200/tot_num)%>" height="12"> <%=Math.floor(tmp_num*100/tot_num)%>%&nbsp&nbsp&nbsp
				[得<%=tmp_num%>票 共 <%=tot_num%>票]
			</td>
		</tr>
		<%
     i++;
		  }
     %>
	</table>
	<%
    con.close();
	  }
	catch(SQLException e1){}
  %>
</body>
</html>