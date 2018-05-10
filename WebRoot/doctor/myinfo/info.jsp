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
			var doc_name=$("#doc_name").val();
			var doc_age=$("#doc_age").val();
			var doc_title=$("#doc_title").val();
			if($.trim(doc_name)==""){
				alert("请输入姓名");
				return false;
			}
			if($.trim(doc_age)==""){
				alert("请输入年龄");
				return false;
			}
			if($.trim(doc_sex)==""){
				alert("请输入职位");
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
		<ul class="breadcrumb">当前位置：个人信息管理<span class="divider">/</span></span>修改个人信息</ul>
	</div>
	<div class="title_right"><strong>修改个人信息</strong></div>
	<form action="<%=path %>/doctor/infoOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">账号：</td>
			<td width="50%">
				${requestScope.doctor.doc_account}
				<input type="hidden" name="id" value="${requestScope.doctor.id }" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">姓名：</td>
			<td width="50%">
				<input type="text" name="doc_name" id="doc_name" value="${requestScope.doctor.doc_name}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">所属科室：</td>
			<td width="50%">
				${requestScope.doctor.dep_name}
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">年龄：</td>
			<td width="50%">
				<input type="text" name="doc_age" id="doc_age" value="${requestScope.doctor.doc_age}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">性别：</td>
			<td width="50%">
				<input type="radio" value="1" name="doc_sex" ${requestScope.doctor.doc_sex==1?'checked=checked':''}/>男&nbsp;&nbsp;
				<input type="radio" value="2" name="doc_sex" ${requestScope.doctor.doc_sex==2?'checked=checked':''}/>女
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">职称：</td>
			<td width="50%">
				<input type="text" name="doc_title" id="doc_title" value="${requestScope.doctor.doc_title}" class="span1-1" />
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