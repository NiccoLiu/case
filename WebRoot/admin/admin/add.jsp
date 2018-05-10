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
<title>添加科室</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){
			var admin_account=$("#admin_account").val();
			var admin_pwd=$("#admin_pwd").val();
			var admin_name=$("#admin_name").val();
			if($.trim(admin_account)==""){
				alert("请输入账号");
				return false;
			}
			if($.trim(admin_pwd)==""){
				alert("请输入密码");
				return false;
			}
			if($.trim(admin_name)==""){
				alert("请输入昵称");
				return false;
			}
			$("#form").submit();
		});
	});
</script>
</head>
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：人员管理<span class="divider">/</span>管理员管理<span class="divider">/</span>添加管理员</ul>
	</div>
	<div class="title_right"><strong>添加管理员</strong></div>
	<form action="<%=path%>/admin/adminAddOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">管理员账号：</td>
			<td width="50%">
				<input type="text" name="admin_account" maxlength="20" id="admin_account" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">管理员密码：</td>
			<td width="50%">
				<input type="text" name="admin_pwd" maxlength="20" id="admin_pwd" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">管理员昵称：</td>
			<td width="50%">
				<input type="text" name="admin_name" maxlength="20" id="admin_name" class="span1-1" />
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="submit" id="submit" value="确定" class="btn btn-info " style="width: 80px;" />
				<input type="button" onclick="history.back()" value="返回" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	<center>
		<font color="red">注意:账号相同，将不会进行添加!</font>
	</center>
	</form>
</body>
</html>