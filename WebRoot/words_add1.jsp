<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>正在留言中...</title>
</head>
<body>
	<%
request.setCharacterEncoding("utf-8");
String number=request.getParameter("number");
String word1=request.getParameter("word1");
   try{
	   Class.forName("com.hxtt.spl.access.AccessDriver");
   }catch(ClassNotFoundException e){}
   try{
		Connection con=DriverManager.getConnection("jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb");
	    Statement sql=con.createStatement();
	    ResultSet rs;	
	    String condition="update words set word1='"+word1+"' where number="+number;
	    sql.executeUpdate(condition);
	    out.print("<script LANGUAGE='javascript'>alert('新留言提交成功！请耐心等待回复');window.location.href='words1.jsp';</script>"); 
    }catch(SQLException e1){
	   out.print("数据写入错误！");
   }
%>
</body>
</html>