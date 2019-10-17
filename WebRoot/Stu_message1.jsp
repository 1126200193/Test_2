<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎光临学生信息中心</title>
</head>
<script> 
       var error = '<%=request.getParameter("error")%>';
       if(error=='yes'){
         alert("修改成功！");
         }
         else if(error=='del'){
          alert("删除成功！");
         }
    </script>
<style>
span {
	font-size: 20px;
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

.submit1 {
	width: 90px;
	height: 50%;
	border: 1px solid #4fadeb;
	line-height: 30px;
	text-align: center;
	background: #4fadeb;
	font-size: 18px color:#fff;
	cursor: pointer;
}

.a {
	width: 50px;
	height: 50px;
	color: black;
	text-decoration: none;
	font-size: 20px;
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
		   odbcQuery="select * from student where number like'"+query_content+"%'";	
	   }
	   else if(query_type.equals("nianling")) {
		   odbcQuery="select * from student where age like'"+query_content+"%'";		   
	   }
	   else if(query_type.equals("xingming")){
		   odbcQuery="select * from student where name like'"+query_content+"%'"; 
	   }
	   else if(query_type.equals("xingbie")){
		   odbcQuery="select * from student where sex like'"+query_content+"%'";		   
	   }
	   else if(query_type.equals("shenfen")){
		   odbcQuery="select * from student where idcard like'"+query_content+"%'";		
	   }
	   else{
		   odbcQuery="select * from student where schoolclass like '"+query_content+"%'";
	   }
   }
	else
		odbcQuery="select * from student";
ResultSet rs; //建立ResultSet(结果集)对象
try { 
       String driverName="com.mysql.jdbc.Driver"; 
        //数据库信息      
       String Url="jdbc:mysql://localhost/jiaowu?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8"; //必须加
       Class.forName("com.mysql.jdbc.Driver").newInstance(); 
       Connection con = DriverManager.getConnection(Url);      
       Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
       ResultSet rs1;
       rs1 = sql.executeQuery(odbcQuery); //执行SQL语句
       rs1.last();
       int lastRow=rs1.getRow();
       pageCount=(lastRow%pageSize==0)?(lastRow/pageSize):(lastRow/pageSize+1);//计算分页后的总页数
       int showPage=1; 
%>
	<form action="Stu_message1.jsp" id="form1" name="form1" method="post"
		target="_self">
		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1" name="select">请选择查询的类型：</span> <select name="select"
					id="select">
						<option value="xuehao" selected>学号</option>
						<option value="xingming">姓名</option>
						<option value="xingbie">性别</option>
						<option value="nianling">年龄</option>
						<option value="shenfen">身份证号码</option>
						<option value="banji">班级</option>
				</select></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">请输入查找的关键字：</span> <input name="query" type="text"
					class="input1" maxlength="18" /></td>
				<td height="45" align="center" bgcolor="#0099CC"><input
					type="submit" name="Submit" value="查询" class="submit"></td>
			</tr>
		</table>

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

		<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">序号</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">学号</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">姓名</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">性别</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">年龄</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">身份证号码</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">班级</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">学生信息修改</span></td>
				<td height="45" align="center" bgcolor="#0099CC"><span
					class="psize1">学生信息删除</span></td>
			</tr>
			<%
   int position=(showPage-1)*pageSize+1;
   rs1.absolute(position);
   for(int i=1;i<=pageSize;i++)
    {
    int id=rs1.getInt(1);		
							%>
			<tr>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><%=rs1.getInt("id")%></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><%=rs1.getString("number")%></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><%=rs1.getString("name")%></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><%=rs1.getString("sex")%></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><%=rs1.getString("age")%></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><%=rs1.getString("idcard")%></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><%=rs1.getString("schoolclass")%></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><a
						href="revise2.jsp?id=<%=id%>"><img src="image/bianji.png"
							style="" 110px" height="40px" align="center""></a></span></td>
				<td height="65" bgcolor="#FFFFFF"><span class="psize2"><a
						href="delete_messServlet?id=<%=id%>"><img src="image/del.jpg"
							style="" 110px" height="40px" align="center""></a></span></span></td>
				<%-- <script>
    function test(element){
    var a =element.id;
    var id=parseInt(a);  
    if(confirm("确认删除该学生信息？")){
       var a =element.id;
       var id=parseInt(a);  
        document.form1.action="delete_messServlet?id=<%=rs1.getInt("id")%>";
        document.form1.submit();
        }
        else{
        return false;
        } 
}//获取对应button中id的数值并传递给Servlet
    </script> --%>
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
						class="a" href="?showPage=3">3</a> <a class="a" href="?showPage=4">4</a>
						<a class="a" href="?showPage=<%=showPage+1%>">下一页</a> <a class="a"
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
