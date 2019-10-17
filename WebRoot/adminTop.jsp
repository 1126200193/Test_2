<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.bx {
	height: 60px;
	width: 100%;
	background: #177ec1;
}

.bx .container {
	margin: 0 60px;
	overflow: hidden;
}

.bx .container .left {
	width: 401px;
	height: 43px;
	padding-top: 10px;
	color: #FFFFFF;
	font-size: 36px;
	float: left;
}

.bx .container .right {
	overflow: hidden;
	width: 500px;
	padding-top: 19px;
	float: right;
}

.bx .container .right .l {
	float: left;
}

.bx .container .right .r {
	float: right;
}

.marquee {
	font-size: 20px;
	color: #fff;
}
</style>
</head>
<body>
	<div class="bx">
		<div class="container">
			<h2 class="left">后台管理系统(管理员)</h2>
			<div class="right">
				<marquee scrollAmount=6 width=100% class="marquee">亲爱的管理员！欢迎登陆学生管理系统！请按规定进行操做！</marquee>
			</div>
		</div>
	</div>
</body>
</html>
