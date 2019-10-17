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
String name=request.getParameter("name");
String schoolclass=request.getParameter("schoolclass");
String word=request.getParameter("word");
String word1=request.getParameter("word1");
   try{
	   Class.forName("com.hxtt.spl.access.AccessDriver");
   }catch(ClassNotFoundException e){}
   try{
		Connection con=DriverManager.getConnection("jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb");
	    Statement sql=con.createStatement();
	    ResultSet rs=sql.executeQuery("select * from words where number='"+number+"'");
	   	   if(rs.next()){
	   		 out.print("<script LANGUAGE='javascript'>alert('您之前的留言尚未点击问题解决！不能进行再一次留言！您可以进入查看留言点击问题解决');window.location.href='words.jsp';</script>");
           }else{
           	String condition="insert into words(number,name,schoolclass,word,word1) values('"+number+"','"+name+"','"+schoolclass+"','"+word+"','"+word1+"')";
           	sql.executeUpdate(condition);
           	out.print("<script LANGUAGE='javascript'>alert('留言成功！！请耐心等待回复！');window.location.href='words.jsp';</script>");
               con.close(); 
           }	    
    }catch(SQLException e1){
	   out.print("数据写入错误！");
   }
%>
</body>
</html>