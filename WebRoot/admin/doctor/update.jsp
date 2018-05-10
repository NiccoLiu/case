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
<title>编辑医生</title>
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
			var dep_id=$("#dep_id option:selected").val();
			var doc_pwd=$("#doc_pwd").val();
			var doc_age=$("#doc_age").val();
			var doc_title=$("#doc_title").val();
			if($.trim(doc_name)==""){
				alert("请输入医生姓名");
				return false;
			}
			if($.trim(dep_id)==""){
				alert("请选择所属科室");
				return false;
			}
			if($.trim(doc_pwd)==""){
				alert("请输入密码");
				return false;
			}
			if($.trim(doc_age)==""){
				alert("请输入医生年龄");
				return false;
			}
			if(isNaN(doc_age)){
				alert("年龄必须为整数");
				return false;
			}
			if($.trim(doc_title)==""){
				alert("请输入职称");
				return false;
			}
			alert("编辑成功");
			$("#form").submit();
		});
	});
</script>
</head>
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：人员管理<span class="divider">/</span></span>编辑医生</ul>
	</div>
	<div class="title_right"><strong>编辑医生</strong></div>
	<form action="<%=path %>/admin/doctorUpdateOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">医生姓名：</td>
			<td width="50%">
				<input type="hidden" name="id" id="id" value="${requestScope.doctor.id}"/>
				<input type="text" name="doc_name" maxlength="20" id="doc_name" value="${requestScope.doctor.doc_name}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">所属科室：</td>
			<td width="50%">
				<select name="dep_id" id="dep_id" class="span1-1">
					<option value="">--请选择--</option>
					<c:forEach items="${requestScope.list}" var="dep">
					<option ${requestScope.doctor.depart_id==dep.id?'selected=selected':''} value="${dep.id}">${dep.dep_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">登录账号：</td>
			<td width="50%">
				${requestScope.doctor.doc_account}
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">登录密码：</td>
			<td width="50%">
				<input type="password" name="doc_pwd" maxlength="20" id="doc_pwd" value="${requestScope.doctor.doc_pwd}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">年龄：</td>
			<td width="50%">
				<input type="text" name="doc_age" value="${requestScope.doctor.doc_age}" maxlength="20" id="doc_age" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">性别：</td>
			<td width="50%">
				<input type="radio" value="1" ${requestScope.doctor.doc_sex==1?'checked=checked':''}  name="doc_sex" />男&nbsp;&nbsp;
				<input type="radio" value="2" ${requestScope.doctor.doc_sex==2?'checked=checked':''}  name="doc_sex" />女
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">职称：</td>
			<td width="50%">
				<input type="text" name="doc_title" maxlength="20" value="${requestScope.doctor.doc_title}" id="doc_title" class="span1-1" />
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="submit" id="submit" value="确定" class="btn btn-info " style="width: 80px;" />
				<input type="button" value="返回" class="btn btn-info " onclick="history.back()" style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>