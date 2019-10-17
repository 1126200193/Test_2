<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
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
	<table width="100%" border="2" bordercolor="#99ccff" cellspacing="4"
		cellpadding="4" align="center">
		<tr>
			<% 
String odbcQuery;
%>
			<%
request.setCharacterEncoding("utf-8");
String query_type=request.getParameter("select1");//通过request.getParameter分别获取select1、2、3的数值
String query_type1=request.getParameter("select2");
String query_type2=request.getParameter("select3");
if(query_type1!=null&&query_type!=null){	//通过if..else if..else进行判断 
	   if(query_type.equals("DZ")){
		   if(query_type1.equals("j1")){
			   if(query_type2.equals("di1")){
				   odbcQuery="select top 6 * from schedule1 where id>12  order by id asc";
			   }
			   else{
				   odbcQuery="select top 6 * from schedule1 where id>18  order by id asc";	   
			   }		  
		   }
		   else{
			   if(query_type2.equals("di1")){
				   odbcQuery="select top 6 * from schedule1";
			   }
			   else{
				  odbcQuery="select top 6 * from schedule1 where id>6  order by id asc";	   
			   }
		   }		
	   }
	   else{
		   odbcQuery="select top 6 * from schedule1";
	   }
   }
	else
		odbcQuery="select top 6 * from schedule1 where id>12  order by id asc";
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
			<td height="45" align="center" bgcolor="#0099CC">
				<form action="schedule1.jsp" id="form1" name="form1" method="post">
					<label for="select"><span>所属院/系部：</span></label> <select
						name="select1" id="s1" onChange="move()" value="select">
						<!-- 根据id获取value，onchange（）触发函数move（）修改二级select的text值实现联动 -->
						<!--默认选中-->
						<option value="DZ" selected>电子信息学院</option>
						<option value="JD">机电工程学院</option>
						<option value="CJ">财经管理学院</option>
						<option value="GS">工商管理学院</option>
					</select>
			</td>

			<td height="45" align="center" bgcolor="#0099CC"><span>专业班级：</span>
				<select name="select2" id="s2" value="s2">
					<!--默认选中，动态生成option -->
					<option value="j1" selected>16计算机1班</option>
					<option value="j2">16计算机2班</option>
			</select></td>
			<script>
     function move()
     {
         var s1=document.getElementById("s1");
         var s2=document.getElementById("s2");
           /*   <!-- 获取一级和二级的属性--> */
         var add;
         if(s1.value=="DZ")
         {
             add=new Array("16计算机1班","16计算机2班");
            /* <!--比对value值，实现对应二级text值的动态生成-->*/
         }else if(s1.value=="JD")
         {
         add=new Array("16机器设计与制造1班","16机器设计与制造2班","16电气自动化技术1班","16电气自动化技术2班","16模具设计1班","16模具设计2班");
            /* <!--比对value值，实现对应二级text值的动态生成-->*/
         }else if(s1.value=="CJ")
         {
         add=new Array("16财务管理1班","16财务管理2班","16金融服务1班","16金融服务2班","16酒店管理1班","16酒店管理2班");
            /* <!--比对value值，实现对应二级text值的动态生成-->*/
         }else if(s1.value=="GS")
         {
             add=new Array("16物流管理1班","16物流管理2班","16国际贸易1班","16国际贸易2班");
             /*<!--比对value值，实现对应二级text值的动态生成-->*/
           }else if(s1.value=="s1")
          {
              add=new Array("16计算机1班","16计算机2班");
            }
          else
          {
         add=null;
             /*<!--若没有就为空，当然不可能出现的-->*/
          }

          s2.length=0;
          for(var i=0;i<add.length;i++)
          {
              var ss=new Option();
              ss.text=add[i].split()[0];

              s2.add(ss);
           /*    <!--把text值添加到二级select中，显示出来--> */
          }

     }
</script>
			<td height="45" align="center" bgcolor="#0099CC"><span>学期：</span>
				<select name="select3" id="select3">
					<option value="di1">2017-2018第一学期</option>
					<option value="di2">2017-2018第二学期</option>
			</select></td>
			<td height="45" align="center" bgcolor="#0099CC"><input
				type="submit" value="查询" class="submit"></td>
		</tr>
	</table>
	<table width="100%" border="2" bordercolor="#0099CC" cellspacing="3"
		cellpadding="4" align="center">
		<tr width="7%">
			<td><table width="100%" border="2" bordercolor="#0099CC"
					cellspacing="3" cellpadding="3" align="center">
					<tr>
						<td height="45" bgcolor="#CCCCCC"><span>时间</span></td>
					</tr>
					<tr>
						<td height="160"><span>上午</span></td>
					</tr>
					<tr>
						<td height="160"><span>下午</span></td>
					</tr>
					<tr>
						<td height="160"><span>晚上</span></td>
					</tr>
				</table></td>
			<td><table width="100%" border="2" bordercolor="#0099CC"
					cellspacing="3" cellpadding="3" align="center">
					<tr>
						<td width="13%" height="45" bgcolor="#CCCCCC"><span>星期一</span></td>
						<td width="13%" height="45" bgcolor="#CCCCCC"><span>星期二</span></td>
						<td width="13%" height="45" bgcolor="#CCCCCC"><span>星期三</span></td>
						<td width="13%" height="45" bgcolor="#CCCCCC"><span>星期四</span></td>
						<td width="13%" height="45" bgcolor="#CCCCCC"><span>星期五</span></td>
						<td width="13%" height="45" bgcolor="#CCCCCC"><span>星期六</span></td>
						<td width="13%" height="45" bgcolor="#CCCCCC"><span>星期日</span></td>
					</tr>
					<%
								   while(rs.next()){
									  
								 
							%>
					<tr>
						<td height="75" bgcolor="#FFFFFF"><%=(rs.getString("Monday")==null?"":rs.getString("Monday"))%></td>
						<td height="75" bgcolor="#FFFFFF"><%=(rs.getString("Tueday")==null?"":rs.getString("Tueday"))%></td>
						<td height="75" bgcolor="#FFFFFF"><%=(rs.getString("Wennesday")==null?"":rs.getString("Wennesday"))%></td>
						<td height="75" bgcolor="#FFFFFF"><%=(rs.getString("Thursday")==null?"":rs.getString("Thursday"))%></td>
						<td height="75" bgcolor="#FFFFFF"><%=(rs.getString("Friday")==null?"":rs.getString("Friday"))%></td>
						<td height="75" bgcolor="#FFFFFF"><%=(rs.getString("Saturday")==null?"":rs.getString("Saturday"))%></td>
						<td height="75" bgcolor="#FFFFFF"><%=(rs.getString("Sunday")==null?"":rs.getString("Sunday"))%></td>
					</tr>
					<%
        
          }
         con.close();
         }
       catch(SQLException e1){}
        %>
				</table></td>
		</tr>
		</form>
	</table>
</body>
</html>
