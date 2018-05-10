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
<title>编辑科室</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){
			var dep_name=$("#dep_name").val();
			var dep_remark=$("#dep_remark").val();
			if($.trim(dep_name)==""){
				alert("请输入科室名称");
				return false;
			}
			if($.trim(dep_remark)==""){
				alert("请输入备注");
				return false;
			}
			
			alert("编辑成功!");
			$("#form").submit();
		});
	});
</script>
</head>
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：科室管理<span class="divider">/</span></span>编辑科室</ul>
	</div>
	<div class="title_right"><strong>编辑科室</strong></div>
	<form action="<%=path %>/admin/departmentUpdateOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">添加科室：</td>
			<td width="50%">
				<input type="hidden" name="id" value="${requestScope.department.id}">
				<input type="text" name="dep_name" maxlength="20" id="dep_name" value="${requestScope.department.dep_name}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">备注：</td>
			<td width="50%">
				<textarea rows="3" name="dep_remark" id="dep_remark" cols="30">${requestScope.department.dep_remark}</textarea>
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="submit" id="submit" value="确定修改" class="btn btn-info " style="width: 80px;" />
				<input type="button"  value="返回" onclick="history.back()" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>