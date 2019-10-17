<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生留言回复</title>
</head>
<style>
.psize1,.psize2 {
	font-size: 18px;
	text-align: center;
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

.button {
	width: 110px;
	height: 100%;
	border: 1px solid #4fadeb;
	line-height: 30px;
	text-align: center;
	background: #4fadeb;
	font-size: 18px;
	color: #fff;
	cursor: pointer;
	margin: 0 50px;
}

.text {
	width: 100%;
	height: 25px;
	font-size: 16px;
	float: left;
	cursor: pointer;
}

.text1 {
	width: 100%;
	height: 25px;
	font-size: 15px;
	cursor: pointer;
}

.textarea {
	font-size: 18px;
	float: left;
	cursor: pointer;
}

.textarea1 {
	font-size: 18px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	color: red;
}
</style>
<script>
    function checkform(){
      var replace=document.form1.replace.value;
      if(replace==''){
      alert("您的回复内容不能为空");
       document.form1.replace.focus();
       return false;
      }
      else{
      	document.form1.action="admin_reply_ud.jsp";
        document.form1.submit();
        
      }
    }
  </script>
<body>
	<% 
 String id=request.getParameter("id");
 try{ 
 	Class.forName("com.hxtt.sql.access.AccessDriver");
 } 
 catch(ClassNotFoundException even){
 	out.print("驱动程序不存在");
 }

 try{
 String  path="jdbc:Access:///"+getServletContext().getRealPath("/").replaceAll("\\\\", "/")+"jiaoyu.mdb";
 Connection con = DriverManager.getConnection(path);
 Statement sql=con.createStatement();
 String condition="select * from words where id="+id;
 ResultSet rs=sql.executeQuery(condition);
 rs.next();
 %>
	<form action="" id="form1" name="form1" method="post" target="_self">
		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="35" align="center" bgcolor="#0099CC"><span
					class="psize1" name="select">------欢 迎 来 到 学 生 留 言 回 复 中
						心------</span></td>

			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="10%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">学号：</span></td>
				<td width="22%" height="25" bgcolor="#0099CC"><input
					type="text" class="text1" name="number"
					value="<%=rs.getString("number")%>" readonly /></td>
				<td width="10%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">姓名：</span></td>
				<td width="22%" height="25" bgcolor="#0099CC"><input
					type="text" class="text1" name="name"
					value="<%=rs.getString("name")%>" readonly /></td>
				<td width="14%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">专业班级：</span></td>
				<td width="22%" height="25" bgcolor="#0099CC"><input
					type="text" class="text1" name="schoolclass"
					value="<%=rs.getString("schoolclass")%>" readonly /></td>
			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="20%" height="25" bgcolor="#0099CC"><span
					class="psize1" name="select">留 言 主 题 ：</span></td>
				<td width="80%" height="25" bgcolor="#0099CC"><input
					type="text" class="text" name="word"
					value="<%=rs.getString("word")%>" readonly autocomplete="off" /></td>
			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="20%" height="auto" bgcolor="#0099CC"><span
					class="psize2" name="select">留 言 内 容 ：</span></td>
				<td width="80%" height="auto" bgcolor="#0099CC"><textarea
						name="textarea" class="textarea1" cols="64" rows="5" readonly><%=rs.getString("word1")%></textarea>
				</td>
			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="20%" height="auto" bgcolor="#0099CC"><span
					class="psize1" name="select">回 复 内 容 ：</span></td>
				<td width="80%" height="auto" bgcolor="#0099CC"><textarea
						name="replace" class="textarea" cols="64" rows="5"></textarea></td>
			</tr>
		</table>

		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td width="100%" height="auto" bgcolor="#0099CC">
					<button class="button" onclick="return checkform();">回复</button> <input
					type="button" class="button" value="问题解决" onclick="return solve();">
						<script>
         function solve(){
        	 	document.form1.action="admin_solve.jsp";
                document.form1.submit(); 
         }
       </script>
				</td>
			</tr>
		</table>


		<table width="70%" border="2" bordercolor="#99ccff" cellspacing="4"
			cellpadding="4" align="center">
			<tr>
				<td height="45" width="100%" bgcolor="#0099CC"><span
					class="psize2"> <marquee scrollAmount="6" width="100% "
							class="marquee"> 亲爱的管理员！欢迎来到学生留言回复中心！ </marquee>
				</span></td>
			</tr>
		</table>

	</form>
	<%
  con.close();
  }
catch(SQLException event){}
  %>
</body>
</html>
