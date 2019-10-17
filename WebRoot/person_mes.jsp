<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>学生个人信息</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/school-msg.css">
<script>
	   var error = '<%=request.getParameter("error")%>';
	     if(error == "yes"){
	     alert("修改成功");
	      }
	</script>
<style>
input {
	cursor: pointer
}

.submit,.button {
	width: 80px;
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
</head>
<body>
	<div class="school-msg">
		<%
  request.setCharacterEncoding("utf-8");
  String number=(String)session.getAttribute("login_name");
  try{ 
	  Class.forName("com.mysql.jdbc.Driver");
	  } 
	  catch(ClassNotFoundException e){}
	  try { 
		 String Url="jdbc:mysql://localhost/jiaowu?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
		  Connection con = DriverManager.getConnection(Url);
		  Statement sql=con.createStatement();
			  String condition="select * from student where number="+number;
			  ResultSet rs=sql.executeQuery(condition);
			  rs.next();  
		
  %>
		<div class="pos-set wrap">
			<form action="" name="person">
				<span>当前位置>学生个人信息</span>
				<p>
					<input type="button" class="button" id="emit" value="编辑"> <input
						type="button" class="submit" onclick="return myfunction()"
						id="keep" style="margin-left: 20px" value="保存">
				</p>
				<script>
			 function myfunction(){
			        if(confirm("确认提交")){
			        document.person.action="ud_personServlet";
			        document.person.submit();
			        }
			        else {
			        return false;
			        }
			     }
			</script>
		</div>
		<div class="basics-msg">
			<p>基本信息</p>
		</div>
		<div class="basics-list">
			<ul class="clearfix">
				<li><label for="">学号:</label>
					<div class="inp-border">
						<input type="text" class="input" name="number"
							value="<%=rs.getString("number")%>" readonly>
					</div></li>
				<li><label for="">姓名:</label>
					<div class="inp-border">
						<input type="text" class="input1" name="name"
							value="<%=rs.getString("name")%>" onfocus="return txtFocus();"
							onblur="return txtBlur();" readonly>
					</div></li>
				<li><label for="">性别 :</label>
					<div class="inp-border">
						<input type="text" class="input1" name="sex"
							value="<%=rs.getString("sex")%>" onfocus="return txtFocus();"
							onblur="return txtBlur();" readonly>
					</div></li>
				<li><label for="">年龄:</label>
					<div class="inp-border">
						<input type="text" class="input1" name="age"
							value="<%=rs.getString("age")%>" onfocus="return txtFocus();"
							onblur="return txtBlur();" readonly>
					</div></li>
				<li><label for="">身份证:</label>
					<div class="inp-border">
						<input type="text" class="input1" name="idcard"
							value="<%=rs.getString("idcard")%>" onfocus="return txtFocus();"
							onblur="return txtBlur();" readonly>
					</div></li>
				<li><label for="">年级专业:</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("schoolclass")%>" readonly>
					</div></li>
				<li><label for="">手机号码:</label>
					<div class="inp-border">
						<input type="text" class="input1" name="telephone"
							value="<%=rs.getString("telephone")%>"
							onfocus="return txtFocus();" onblur="return txtBlur();" readonly>
					</div></li>
				<li><label for="">入学时间:</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("admissiondate")%>" readonly>
					</div></li>
				<li><label for="">毕业时间:</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("graduationtime")%>" readonly>
					</div></li>
				<li><label for="">学历层次:</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("education")%>" readonly>
					</div></li>

			</ul>


		</div>



		<div class="basics-msg">
			<p>专业信息</p>
		</div>
		<div class="basics-list">
			<ul class="clearfix">
				<li><label for="">学历 :</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("education")%>" readonly>
					</div></li>
				<li><label for="">学制 :</label>
					<div class="inp-border">
						<input type="text" class="input" value="三年" readonly>
					</div></li>
				<li><label for="">学科门类 :</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("subject")%>" readonly>
					</div></li>
				<li><label for="">专业名称 :</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("major")%>" readonly>
					</div></li>
				<li><label for="">所在院系 :</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("Department")%>" readonly>
					</div></li>
				<li><label for="">所在班级 :</label>
					<div class="inp-border">
						<input type="text" class="input"
							value="<%=rs.getString("schoolclass")%>" readonly>
					</div></li>
			</ul>
			</form>
		</div>
		<%
	  
  con.close();
  }
catch(SQLException event){}
  %>
	</div>
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	$('#emit').on('click',function(){
    	$('.input1').removeAttr('readonly ');
    });
    $('#keep').on('click',function(){
    	$('.input1').attr('readonly ','readonly ');
    });
    function txtFocus() {
    	var e = window.event;
    	var obj = e.srcElement; //当前对象
    	obj.style.background = "#ffff66";
    	}
    	function txtBlur() {
    	var e = window.event;
    	var obj = e.srcElement;
    	obj.style.background = "#ffffff";
    	}
	</script>
</body>
</html>