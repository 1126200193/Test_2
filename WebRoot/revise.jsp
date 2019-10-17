<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>用户信息修改</title>
<link rel="stylesheet" type="text/css" href="css/revise.css">
<script> 
      var error = '<%=request.getParameter("error")%>';
       if(error=='yes'){
         alert("密码修改成功！");
         }
         else{
         alert("您的账号或者身份证信息有误！请重新输入！");
         }
    </script>
<script>
    function checkform(){
       var number=document.revise.number.value;
       var password=document.revise.password.value;
       var password2=document.revise.password2.value;
       var idcard=document.revise.idcard.value;
       if(number==''){
         alert("请输入您要修改密码的用户账号！！！");
         document.revise.username.focus();
         return false;
       }
       if(password==''){
         alert("请输入您要修改的密码！！！");
         document.revise.password.focus();
         return false;
       }
       if(password2==''){
         alert("请您再一次确认密码！！！");
         document.revise.password2.focus();
         return false;
       }
       if(password!=password2){
         alert("对不起！您两次密码不一致");
         document.revise.password2.focus();
         return false;
       }
       if(idcard==''){
         alert("对不起！您的身份证不能为空！");
         document.revise.idcard.focus();
         return false;
       }
       if(idcard.length!=18){
         alert("您的身份证信息有误！！！");
         document.revise.idcard.focus();
         return false; 
       }
       else{
    	   document.revise.action="updateServlet"; //form为form表单的name
    	   document.revise.submit();

       }
    }
    </script>
</head>
<body>
	<div>
		<form action="" method="get" name="revise" target="_parent">
			<div class="login-box">
				<div class="left-box1">
					<div class="imgbox">
						<img src="image/logo.jpg" alt="" width="100%" height="100%">
					</div>
					<h2 class="h2">教务管理系统</h2>
				</div>

				<div class="center-shu"></div>

				<div class="right-box1">
					<div class="right-inbox1">
						<h2 class="right-h2">用户密码修改</h2>
						<div class="right-text">
							<span>用 户 账 号:</span> <input type="text" autocomplete="off"
								placeholder="请输入您的学号/账号" id="user" name="number" />
						</div>

						<div class="right-text1">
							<span>用 户 密 码:</span> <input type="password" autocomplete="off"
								placeholder="请输入您的修改密码" id="pass" name="password" />
						</div>

						<div class="right-text1">
							<span>确 认 密 码:</span> <input type="password" autocomplete="off"
								placeholder="请输入您的确认密码" id="pass" name="password2" />
						</div>

						<div class="right-text1">
							<span>身 份 证:</span> <input type="password" autocomplete="off"
								placeholder="请输入您的身份证" id="pass" name="idcard" />
						</div>

						<div class="right-onbox1">
							<div>
								<div class="onbox1">
									<input type="button" value="修改" class="submit" id="login"
										onclick="return checkform();">
								</div>
								<div class="onbox2">
									<input type="reset" value="返回登录" class="submit"
										onclick="return myfunction();">
									<script>
                             function myfunction(){
                                window.open("login.jsp");
                                window.close("revise.jsp");
                             }
      	                 </script>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>