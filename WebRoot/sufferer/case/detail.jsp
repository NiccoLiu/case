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
<title>病例详情</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
</head>
<body style="overflow: auto;">
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：病历管理<span class="divider">/</span></span>病历详情</ul>
	</div>
	<div class="title_right"><strong>病历详情</strong></div>
	<table class="table table-bordered" style="width:600px" align="center">
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">病历编号：</td>
			<td width="30%" colspan="3">
				${requestScope.case1.hos_no}
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">选择患者信息：</td>
			<td width="30%">
				${requestScope.case1.suf_name}
			</td>
			<td width="20%" align="right" bgcolor="#f1f1f1">处理医生：</td>
			<td width="30%">
				${requestScope.case1.doc_name}
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">挂号科室：</td>
			<td width="30%">
				${requestScope.case1.dep_name}
			</td>
			<td width="20%" align="right" bgcolor="#f1f1f1">疾病种类：</td>
			<td width="30%">
				${requestScope.case1.des_name}
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">诊断意见：</td>
			<td width="30%" colspan="3">
				<textarea rows="5" name="diagnose_sug" id="diagnose_sug" cols="30" style="width:390px;height:120px">${requestScope.case1.diagnose_sug}</textarea>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">治疗经过：</td>
			<td width="30%" colspan="3">
				<textarea rows="5" name="process" id="process" cols="30" style="width:390px;height:120px">${requestScope.case1.process}</textarea>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">处理意见：</td>
			<td width="30%" colspan="3">
				<textarea rows="5" name="deal_sug" id="deal_sug" cols="30" style="width:390px;height:120px">${requestScope.case1.deal_sug}</textarea>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">诊断结果：</td>
			<td width="30%" colspan="3">
				<textarea rows="5" name="diagnose_result" id="diagnose_result" cols="30" style="width:390px;height:120px">${requestScope.case1.diagnose_result}</textarea>
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">处理时间：</td>
			<td width="30%" colspan="3">
				${requestScope.case1.hos_data}
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="button"  value="返回" onclick="history.back()" class="btn btn-info " style="width: 80px;" />
				<a href="<%=path%>/sufferer/srecaseList.do?case_id=${case1.id}">病历修改记录</a>
			</td>
		</tr>
	</table>
</body>
</html>