<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在保存中...请稍等</title>
</head>
<body>
	<%
   request.setCharacterEncoding("utf-8");
   String number=request.getParameter("number");
   String name=request.getParameter("name");
   String sex=request.getParameter("sex");
   String age=request.getParameter("age");
   String idcard =request.getParameter("idcard");
   String telephone=request.getParameter("telephone");
   try{ 
	    Class.forName("com.hxtt.sql.access.AccessDriver");
	} 
	catch(ClassNotFoundException even){
		out.print("数据库加载失败");
	}
   try {
	   //连接数据库
	     Connection con=DriverManager.getConnection("jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb");
	     Statement sql=con.createStatement();	  	   
	     String condition="update admin2 set name='"+name+"',sex='"+sex+"',age='"+age+"',idcard='"+idcard+"',telephone='"+telephone+"' where number="+number;
		 sql.executeUpdate(condition);
		 out.print("<script LANGUAGE='javascript'>alert('修改成功！！');window.location.href='person_mes.jsp';</script>");  
         con.close();
   }catch(SQLException e1){
		 out.print("数据连接失败");
		 out.print(e1.toString());
		 } 
 
%>
</body>
</html>