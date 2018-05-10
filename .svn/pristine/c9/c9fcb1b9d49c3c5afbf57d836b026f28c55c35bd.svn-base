<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电子病历系统</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css" />
<script type="text/javascript" src="<%=path%>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: #0066A8 url(<%=path %>/images/login_bg.png) no-repeat center 0px;
}

.tit {
	margin: auto;
	margin-top: 170px;
	text-align: center;
	width: 350px;
	padding-bottom: 20px;
}

.login-wrap {
	width: 220px;
	padding: 30px 50px 0 330px;
	height: 220px;
	background: #fff url(<%=path %>/images/20150212154319.jpg) no-repeat 30px 40px;
	background-size: 270px 190px;
	margin: auto;
	overflow: hidden;
}

.login_input {
	display: block;
	width: 210px;
}

.login_user {
	background: url(<%=path %>/images/input_icon_1.png) no-repeat 200px center;
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif
}

.login_password {
	background: url(<%=path %>/images/input_icon_2.png) no-repeat 200px center;
	font-family: "Courier New", Courier, monospace
}

.login_role {
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif
}

.btn-login {
	background: #40454B;
	box-shadow: none;
	text-shadow: none;
	color: #fff;
	border: none;
	height: 35px;
	line-height: 26px;
	font-size: 14px;
	font-family: "microsoft yahei";
}

.btn-login:hover {
	background: #333;
	color: #fff;
}

.copyright {
	margin: auto;
	margin-top: 10px;
	text-align: center;
	width: 370px;
	color: #CCC
}

@media ( max-height : 700px) {
	.tit {
		margin: auto;
		margin-top: 100px;
	}
}

@media ( max-height : 500px) {
	.tit {
		margin: auto;
		margin-top: 50px;
	}
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sub").click(function(){
			var account=$("#account").val();
			var pwd=$("#pwd").val();
			var userRole=$("#userRole").val();
			if($.trim(account)==""){
				alert("用户名不能为空!");
				return false;
			}
			if($.trim(pwd)==""){
				alert("密码不能为空!");
				return false;
			}
			if($.trim(userRole)==""){
				alert("角色不能为空!");
				return false;
			}
			$("#form").submit();
		});
	});
</script>
</head>
<body>
	<div class="tit">
		<img src="<%=path %>/images/tit.png" alt="" />
	</div>
	<div class="login-wrap">
		<form action="<%=path %>/admin/login.do" id="form" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="5" valign="bottom">登录账号：</td>
			</tr>
			<tr>
				<td><input type="text" id="account" name="userName" class="login_input login_user" /></td>
			</tr>
			<tr>
				<td height="27" valign="bottom">密 码：</td>
			</tr>
			<tr>
				<td><input type="password" id="pwd" name="userPwd"  class="login_input login_password" /></td>
			</tr>
			<tr>
				<td height="24" valign="bottom">角色：</td>
			</tr>
			<tr>
				<td>
					<select class="login_input login_role" name="userRole" id="userRole" style="width:218px;height:26px">
						<option value="">--请选择--</option>
						<option value="1">系统管理员</option>
						<option value="2">医生</option>
						<option value="3">病人</option>
					</select>
				</td>
			</tr>
			<tr>
				<td height="46" valign="bottom">
					<input type="submit" id="sub" class="btn btn-block btn-login" value="登录">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div class="copyright">本系统建议使用IE8以上版本或谷歌浏览器</div>
	<input type="hidden" id="msg" value="${requestScope.msg}" >
</body>
<script type="text/javascript">
	$(document).ready(function(){
		if($("#msg").val()!=''){
			alert($("#msg").val());
		}
	})
</script>
</html>