<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
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
<title>修改密码</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){
			var adNewPwd=$("#adNewPwd").val();
			var adNewPwdOk=$("#adNewPwdOk").val();
			if($.trim(adNewPwd)==""){
				alert("请输入新密码");
				return false;
			}
			if($.trim(adNewPwdOk)==""){
				alert("请输入确认新密码");
				return false;
			}
			if($.trim(adNewPwd)!=$.trim(adNewPwdOk)){
				alert("两次输入密码不一致!");
				return false;
			}
			alert("修改成功");
			$("#form").submit();
		});
	});
</script>
</head>
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：个人信息管理<span class="divider">/</span></span>修改密码</ul>
	</div>
	<div class="title_right"><strong>修改密码</strong></div>
	<form action="<%=path %>/doctor/pwdOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">原密码：</td>
			<td width="50%">
				<input type="password" readonly="readonly" value="${requestScope.doctor.doc_pwd}" class="span1-1" />
				<input type="hidden" name="adId" value="${requestScope.doctor.id}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">新密码：</td>
			<td width="50%">
				<input type="password" name="adNewPwd" maxlength="20" id="adNewPwd" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">确认密码：</td>
			<td width="50%">
				<input type="password" maxlength="20" id="adNewPwdOk" class="span1-1" />
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="submit" id="submit" value="确定修改" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>