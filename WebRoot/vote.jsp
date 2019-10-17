<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在投票中，请耐心等待...</title>
</head>
<body>
	<%
  try{ 
	  Class.forName("com.hxtt.sql.access.AccessDriver");
	  } 
	  catch(ClassNotFoundException e){}
	  try { 
		  String  path="jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb";
		  Connection con = DriverManager.getConnection(path);
		  Statement sql=con.createStatement();
		  ResultSet rs;
		  String rb=request.getParameter("type");
		  if(rb!=null&&rb!=""){
			  String condition="Update vote set numb=numb+1 where id="+rb;
			  sql.executeUpdate(condition);
		  }
		  out.print("<script LANGUAGE='javascript'>alert('投票成功！感谢您的参与！');window.location.href='survey.jsp';</script>"); 
	  con.close();
	  }
	catch(SQLException event){}
  %>
</body>
</html>
