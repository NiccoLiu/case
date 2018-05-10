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
<title>添加疾病类别</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){
			var des_name=$("#des_name").val();
			var des_remark=$("#des_remark").val();
			if($.trim(des_name)==""){
				alert("请输入类型名称");
				return false;
			}
			if($.trim(des_remark)==""){
				alert("请输入主要临床症状");
				return false;
			}
			
			alert("添加成功");
			$("#form").submit();
		});
	});
</script>
</head>
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：疾病类别管理<span class="divider">/</span></span>添加疾病类别</ul>
	</div>
	<div class="title_right"><strong>添加疾病类别</strong></div>
	<form action="<%=path %>/admin/diseaseAddOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">类别名称：</td>
			<td width="50%">
				<input type="text" name="des_name" maxlength="20" id="des_name" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">主要临床症状：</td>
			<td width="50%">
				<textarea rows="3" name="des_remark" id="des_remark" cols="30"></textarea>
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="submit" id="submit" value="确定" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>