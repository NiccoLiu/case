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
<title>患者信息管理</title>
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
		<ul class="breadcrumb">当前位置：个人信息管理<span class="divider">/</span></span>查看个人信息</ul>
	</div>
	<div class="title_right"><strong>查看个人信息</strong></div>
	<table class="table table-bordered" style="width:700px" align="center">
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">患者姓名：</td>
			<td width="70%">
				${requestScope.sufferer.suf_name}
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">性别：</td>
			<td width="70%">
				
				<c:if test="${requestScope.sufferer.suf_sex==1}">男</c:if>
				<c:if test="${requestScope.sufferer.suf_sex==2}">女</c:if>
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">年龄：</td>
			<td width="70%">
				${requestScope.sufferer.suf_age}
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">身份证号：</td>
			<td width="70%">
				${requestScope.sufferer.suf_card}
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">家庭住址：</td>
			<td width="70%">
				${requestScope.sufferer.suf_address}
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">联系电话：</td>
			<td width="70%">
				${requestScope.sufferer.suf_phone}
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">民族：</td>
			<td width="70%">
				${requestScope.sufferer.suf_nation}
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">籍贯：</td>
			<td width="70%">
				${requestScope.sufferer.suf_native}
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">病史：</td>
			<td width="70%">
				<textarea rows="5" cols="40" style="width: 400px;height:150px" name="suf_his" id="suf_his">${requestScope.sufferer.suf_his}</textarea>
			</td>
		</tr>
	</table>
</body>
</html>