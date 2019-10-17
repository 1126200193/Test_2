<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>正在注册中...</title>
</head>
<body>
	<%
request.setCharacterEncoding("utf-8");
String number=request.getParameter("number");
String name=request.getParameter("name");
String sex=request.getParameter("sex");
String age=request.getParameter("age");
String idcard=request.getParameter("idcard");
String schoolclass=request.getParameter("schoolclass");
String telephone=request.getParameter("telephone");
String admissiondate=request.getParameter("admissiondate");
String graduationtime=request.getParameter("graduationtime");
String education=request.getParameter("education");
String Department=request.getParameter("Department");
String major=request.getParameter("major");
String subject=request.getParameter("subject");
   try{
	   Class.forName("com.hxtt.spl.access.AccessDriver");
   }catch(ClassNotFoundException e){}
   try{
		Connection con=DriverManager.getConnection("jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb");
	 Statement sql=con.createStatement();
	 ResultSet rs=sql.executeQuery("select * from admin2 where number='"+number+"'");
	 if(rs.next()){
		 out.print("<script LANGUAGE='javascript'>alert('您输入学号已经存在！请重新输入！');window.location.href='Entry.jsp';</script>");
	 }
    else{
    	String condition="insert into admin2(number,name,sex,age,idcard,schoolclass,telephone,admissiondate,graduationtime,education,Department,major,subject) values('"+number+"','"+name+"','"+sex+"','"+age+"','"+idcard+"','"+schoolclass+"','"+telephone+"','"+admissiondate+"','"+graduationtime+"','"+education+"','"+Department+"','"+major+"','"+subject+"')";
    	sql.executeUpdate(condition);
    	out.print("<script LANGUAGE='javascript'>alert('新生信息录入成功！！');window.location.href='Entry.jsp';</script>");
    }
    rs.close();
    con.close(); 
    }catch(SQLException e1){
	   out.print("数据写入错误！");
   }
%>
</body>
</html>