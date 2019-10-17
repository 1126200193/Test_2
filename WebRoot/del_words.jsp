<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正在删除中...请稍等！！</title>
</head>

<body>
	<%
String id=request.getParameter("id");
try{ 
    Class.forName("com.hxtt.sql.access.AccessDriver");
} 
catch(ClassNotFoundException even){
	out.print("数据库加载失败");
}
try{
	 Connection  con=DriverManager.getConnection("jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb");
     Statement sql=con.createStatement();
     String condition="delete from words where id="+id;
     sql.executeUpdate(condition);
     out.print("<script LANGUAGE='javascript'>alert('留言删除成功！！！');window.location.href='admin_words.jsp';</script>");
     con.close();
}
catch(SQLException event){}
%>
</body>
</html>