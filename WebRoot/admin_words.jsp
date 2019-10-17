<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生留言系统汇总</title>
</head>
<style>
.psize1 {
	font-size: 20px;
}

.psize2 {
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
	font-size: 18px;
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
int pageSize=6;
int pageCount=0;
%>
	<%
request.setCharacterEncoding("utf-8");
String query_type=request.getParameter("select");
String query_content=request.getParameter("query");
if(query_content==null) query_content="";
   if(query_content!=null&&query_type!=null){
	 
	   if(query_type.equals("xuehao")){
		   odbcQuery="select * from words where number like'"+query_content+"%'";	
	   }
	   else if(query_type.equals("xingming")) {
		   odbcQuery="select * from words where name like'"+query_content+"%'";		   
	   }
	   else{
		   odbcQuery="select * from words where schoolclass like '"+query_content+"%'";
	   }
   }
	else
		odbcQuery="select * from words";
try{ 
Class.forName("com.hxtt.sql.access.AccessDriver");
} 
catch(ClassNotFoundException e){}
ResultSet rs; //建立ResultSet(结果集)对象
try { 
       String  path="jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb";
       Connection con = DriverManager.getConnection(path);      
       Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
       ResultSet rs1;
       rs1 = sql.executeQuery(odbcQuery); //执行SQL语句
       rs1.last();
       int lastRow=rs1.getRow();
       pageCount=(lastRow%pageSize==0)?(lastRow/pageSize):(lastRow/pageSize+1);//计算分页后的总页数
       int showPage=1; 
%>
	<form action="" id="form1" name="form1" method="post" target="_self">
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<% 
    String integer = request.getParameter("showPage");//获取要显示的页码
			if (integer == null) {
				integer = "1";
			}
			try {
				showPage = Integer.parseInt(integer);
			} catch (NumberFormatException e) {
				showPage = 1;
			}if (showPage<=1) {
				showPage = 1;
			}
			if (showPage>=pageCount) {
				showPage = pageCount;
			}		
			%>

			<tr>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1" name="select">请选择查询的类型：</span> <select name="select"
					id="select">
						<option value="xuehao" selected>学号</option>
						<option value="xingming">姓名</option>
						<option value="banji">专业班级</option>
				</select></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">请输入查找的关键字：</span> <input name="query" type="text"
					class="input1" maxlength="18" /></td>
				<td height="45" align="center" bgcolor="#0099CC"><input
					type="submit" name="Submit" value="查询" class="submit"></td>
			</tr>
		</table>
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="10%" height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">学号</span></td>
				<td width="10%" height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">姓名</span></td>
				<td width="15%" height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">专业班级</span></td>
				<td width="20%" height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">留言主题</span></td>
				<td width="35%" height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">留言内容</span></td>
				<td width="5%" height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">留言<br>回复
				</span></td>
				<td width="5%" height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">留言<br>删除
				</span></td>
			</tr>

			<%
   int position=(showPage-1)*pageSize+1;
   rs1.absolute(position);
   for(int i=1;i<=pageSize;i++)
    {
    int id=rs1.getInt(1);		
							%>

			<tr>
				<td width="10%" height="auto" bgcolor="#FFFFFF"><%=rs1.getString("number")%></td>
				<td width="10%" height="auto" bgcolor="#FFFFFF"><%=rs1.getString("name")%></td>
				<td width="15%" height="auto" bgcolor="#FFFFFF"><%=rs1.getString("schoolclass")%></td>
				<td width="20%" height="auto" bgcolor="#FFFFFF"><%=rs1.getString("word")%></td>
				<td width="35%" height="auto" bgcolor="#FFFFFF"><span
					class="psize2"><%=rs1.getString("word1")%></span></td>
				<td width="5%" height="auto" bgcolor="#FFFFFF"><a
					href="admin_reply.jsp?id=<%=id%>"><img src="image/bianji.png"
						style="" 40px" height="30px" align="center""></a></td>
				<td width="5%" height="auto" bgcolor="#FFFFFF"><a
					href="del_words.jsp?id=<%=id%>"><img src="image/del.jpg"
						style="" 40px" height="30px" align="center""></a></td>
			</tr>
			<%
	  boolean b1=rs1.isLast();//判断游标是否指向记录集的最后一行
	  if(b1){//如果是最后一行，跳出循环
		break;
	        }
	  rs1.next();		
	  }
	%>
			<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
				cellpadding="4" align="center">
				<tr>
					<td height="45" bgcolor="#FFFFFF"><a class="a"
						href="?showPage=<%=showPage-1%>">上一页</a> <a class="a"
						href="?showPage=1">1</a> <a class="a" href="?showPage=2">2</a> <a
						class="a" href="?showPage=<%=showPage+1%>">下一页</a> <a class="a"
						href="?showPage=<%=pageCount%>">末页</a> <span class="a"> 共 <%=pageCount%>
							页
					</span> <span class="a">目前第 <%=showPage%> 页
					</span></td>
				</tr>
			</table>
			<%
        
   rs1.close();
   con.close();
   }
 catch(SQLException e1){}
        %>
		</table>
	</form>
</body>
</html>
