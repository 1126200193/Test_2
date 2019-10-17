<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/StudentLeft.css">
<script src="js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div class="nav">
		<div class="nav-list">
			<div class="nav-tit" id="personal">
				<a href="Stu_message1.jsp" target="main"> <img
					src="image/personal-msg.png" style="height: 30px" alt=""> <span>学生信息管理</span>
				</a>
			</div>
			<div class="personal-list" id="personal-child">
				<ul>
					<li><a href="Stu_message1.jsp" target="main">学生信息修改</a></li>
					<li><a href="schedule1.jsp" target="main">学生课程查询</a></li>
					<li><a href="Entry.jsp" target="main">新生信息录入</a></li>
				</ul>
			</div>
			<div class="nav-tit">
				<a href="1.jsp" target="main"> <img src="image/archives-msg.png"
					alt=""> <span>学生档案信息</span>
				</a>
			</div>
			<div class="nav-tit">
				<a href="view.jsp" target="main"> <img src="image/job-msg.png"
					alt=""> <span>问卷调查汇总</span>
				</a>
			</div>
			<div class="nav-tit">
				<a href="1.jsp" target="main"> <img src="image/job-change.png"
					alt=""> <span>学生就业调查</span>
				</a>
			</div>
			<div class="nav-tit">
				<a href="admin_words.jsp" target="main"> <img
					src="image/PubMed-msg.png" alt=""> <span>学生留言回复</span>
				</a>
			</div>
			<div class="nav-tit">
				<a href="Entry2.jsp" target="main"> <img
					src="image/modify-password.png" alt=""> <span>用户密码修改</span>
				</a>
			</div>
			<div class="nav-tit">
				<a href="login.jsp" target="_parent"> <img
					src="image/modify-password.png" alt=""> <span>用户系统退出</span>
				</a>
			</div>
		</div>
	</div>

	<script>
			$(document).ready(function(){
				$('#personal').on('click',function(){
					$('#personal-child').fadeToggle(300);
				});
				let aLi = $('#personal-child li');
				aLi.on('click',function(){
					$(this).addClass('active').siblings('li').removeClass('active');
				})
			});
		</script>
</body>
</html>
