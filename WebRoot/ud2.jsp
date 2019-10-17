<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在验证用户信息中...</title>
</head>
<body>
	<% 
 String number=request.getParameter("number");
number=new String(number.getBytes("ISO-8859-1"));
 String password=request.getParameter("password");
 password=new String(password.getBytes("ISO-8859-1"));
 String idcard=request.getParameter("idcard");
 idcard=new String(idcard.getBytes("ISO-8859-1"));
 try{ 
	    Class.forName("com.hxtt.sql.access.AccessDriver");
	} 
	catch(ClassNotFoundException even){
		out.print("数据库加载失败");
	}
 
 
 try {
	   //连接数据库
	     Connection  con=DriverManager.getConnection("jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb");
	     Statement sql=con.createStatement();       
	     ResultSet rs=sql.executeQuery("select * from admin1 where number='"+number+"' and idcard='"+idcard+"'");
	     if(rs.next()){	    	   
	    	String condition="update admin1 set password='"+password+"' where number="+number;
		    sql.executeUpdate(condition);
		    out.print("<script LANGUAGE='javascript'>alert('修改成功！！');window.location.href='Entry1.jsp';</script>"); 
	     }
	     else{
	    	 ResultSet rs1=sql.executeQuery("select * from admin1 where number='"+number+"'");
	    	 if(rs1.next()){
	    		 out.print("<script LANGUAGE='javascript'>alert('对不起！您的身份证信息有误！修改失败！');window.location.href='Entry1.jsp';</script>"); 	 
	    	 }
	    	 else{
	    		 out.print("<script LANGUAGE='javascript'>alert('对不起，该管路员名账号不存在！！');window.location.href='Entry1.jsp';</script>"); 
	    	 }
	    	 
	     }
          con.close();
   }catch(SQLException e1){
		 out.print("数据连接失败");
		 out.print(e1.toString());
		 } 
 
 
 
 %>
</body>
</html>