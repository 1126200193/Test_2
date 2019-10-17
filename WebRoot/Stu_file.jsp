<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生档案信息查询</title>
</head>
<style>
.psize1,.psize2 {
	font-size: 18px;
}

.psize3 {
	font-size: 24px;
}

.psize4 {
	font-size: 24px;
	color: red;
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

.input1 {
	width: 200px;
	height: 35px;
	line-height: 35px;
	font-size: 16px;
	border-radius: 5px;
	border: none;
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
String odbcQuery;
%>
	<%
request.setCharacterEncoding("utf-8");
String query_type=request.getParameter("select");
String query_content=request.getParameter("query");
    if(query_content!=null&&query_type!=null){	 
	   if(query_type.equals("xuehao")){
		   odbcQuery="select * from admin2 where number like'"+query_content+"%'";	
	   }
	   else if(query_type.equals("xingming")){
		   odbcQuery="select * from admin2 where name like'"+query_content+"%'"; 
	   }
	   else if(query_type.equals("banji")){
		   odbcQuery="select * from admin2 where schoolclass like'"+query_content+"%'";		
	   }
	   else{
		   odbcQuery="select * from admin2 where idcard like '"+query_content+"%'";
	   }
   }
	else
		odbcQuery="select * from admin2 where id="+1;
try{ 
Class.forName("com.hxtt.sql.access.AccessDriver");
} 
catch(ClassNotFoundException e){}
ResultSet rs; //建立ResultSet(结果集)对象
try { 
       String  path="jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb";
       Connection con = DriverManager.getConnection(path);      
       Statement sql=con.createStatement();
       rs = sql.executeQuery(odbcQuery); //执行SQL语句
%>
	<form action="Stu_file.jsp" id="form1" name="form1" method="post"
		target="_self">
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1" name="select">请选择查询的类型：</span> <select name="select"
					id="select">
						<option value="xuehao" selected>学号</option>
						<option value="xingming">姓名</option>
						<option value="banji">班级</option>
						<option value="shenfen">身份证号码</option>
				</select></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">请输入查找的关键字：</span> <input name="query" type="text"
					class="input1" maxlength="18" /></td>
				<td height="45" align="center" bgcolor="#0099CC"><input
					type="submit" name="Submit" value="查询" class="submit"></td>
			</tr>
			<%
								   while(rs.next()){
					
							%>
		</table>
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">学号</span></td>
				<td height="65" width="20%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("number")%></span></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">姓名</span></td>
				<td height="65" width="20%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("name")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">身份证号码</span></td>
				<td height="65" width="30%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("idcard")%></span></td>
			</tr>
		</table>
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">性别</span></td>
				<td height="65" width="15%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("sex")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">年龄</span></td>
				<td height="65" width="15%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("age")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">班级</span></td>
				<td height="65" width="15%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("schoolclass")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">联系方式</span></td>
				<td height="65" width="15%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("telephone")%></span></td>
			</tr>
		</table>
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">入学时间</span></td>
				<td height="65" width="20%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("admissiondate")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">毕业时间</span></td>
				<td height="65" width="20%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("graduationtime")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">学历层次</span></td>
				<td height="65" width="30%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("education")%></span></td>
			</tr>
		</table>
		</table>
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">所属院/系部</span></td>
				<td height="65" width="20%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("Department")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">录取专业</span></td>
				<td height="65" width="20%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("major")%></span></td>
				<td height="65" width="10%" align="center" bgcolor="#0099CC"><span
					class="psize1">学科性质</span></td>
				<td height="65" width="30%" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs.getString("subject")%></span></td>
			</tr>
		</table>
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="45" width="100%" bgcolor="#0099CC"><span
					class="psize3">------> <span class="psize4"><%=rs.getString("name")%></span>
						同 学 档 案 信 息 至 此 <------
				</span></td>
			</tr>
		</table>

	</form>
	<%
        
          }
         con.close();
         }
       catch(SQLException e1){}
        %>
</body>
</html>
