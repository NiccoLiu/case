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
<title>编辑患者</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){
			var suf_name=$("#suf_name").val();
			var suf_age=$("#suf_age").val();
			var suf_address=$("#suf_address").val();
			var suf_phone=$("#suf_phone").val();
			var suf_nation=$("#suf_nation").val();
			var suf_native=$("#suf_native").val();
			var suf_his=$("#suf_his").val();
			if($.trim(suf_name)==""){
				alert("请输入患者姓名");
				return false;
			}
			if($.trim(suf_age)==""){
				alert("请输入年龄");
				return false;
			}
			if($.trim(suf_address)==""){
				alert("请输入患者家庭地址");
				return false;
			}
			if($.trim(suf_phone)==""){
				alert("请输入联系电话");
				return false;
			}
			if($.trim(suf_nation)==""){
				alert("请输入名族");
				return false;
			}
			if($.trim(suf_native)==""){
				alert("请输入籍贯");
				return false;
			}
			if($.trim(suf_his)==""){
				alert("请输入患者病史");
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
		<ul class="breadcrumb">当前位置：人员管理<span class="divider">/</span></span>编辑患者</ul>
	</div>
	<div class="title_right"><strong>编辑患者</strong></div>
	<form action="<%=path %>/doctor/suffererUpdateOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">患者姓名：</td>
			<td width="50%">
				<input type="hidden" name="id" id="id" value="${requestScope.sufferer.id}"/>
				<input type="text" name="suf_name" maxlength="20" id="suf_name" value="${requestScope.sufferer.suf_name}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">性别：</td>
			<td width="50%">
				<input type="radio" value="1" ${requestScope.sufferer.suf_sex==1?'checked=checked':''}  name="suf_sex" />男&nbsp;&nbsp;
				<input type="radio" value="2" ${requestScope.sufferer.suf_sex==2?'checked=checked':''}  name="suf_sex" />女
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">年龄：</td>
			<td width="50%">
				<input type="text" name="suf_age" maxlength="20" id="suf_age" value="${requestScope.sufferer.suf_age}" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">身份证号：</td>
			<td width="50%">
				${requestScope.sufferer.suf_card}
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">家庭住址：</td>
			<td width="50%">
				
				<input type="text" name="suf_address" maxlength="20" value="${requestScope.sufferer.suf_address}" id="suf_address" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">联系电话：</td>
			<td width="50%">
				<input type="text" name="suf_phone" maxlength="20" value="${requestScope.sufferer.suf_phone}" id="suf_phone" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">民族：</td>
			<td width="50%">
				<input type="text" name="suf_nation" maxlength="20" value="${requestScope.sufferer.suf_nation}" id="suf_nation" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">籍贯：</td>
			<td width="50%">
				<input type="text" name="suf_native" maxlength="20" value="${requestScope.sufferer.suf_native}" id="suf_native" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">病史：</td>
			<td width="50%">
				<textarea rows="5" cols="40" name="suf_his" id="suf_his">${requestScope.sufferer.suf_his}</textarea>
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