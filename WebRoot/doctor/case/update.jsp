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
<title>修改病历</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){
			var dep_id=$("#dep_id").val();
			var des_id=$("#des_id").val();
			var diagnose_sug=$("#diagnose_sug").val();
			var process=$("#process").val();
			var deal_sug=$("#deal_sug").val();
			var diagnose_result=$("#diagnose_result").val();
			var hos_data=$("#hos_data").val();
			if($.trim(dep_id)==""){
				alert("请选择挂号科室");
				return false;
			}
			if($.trim(des_id)==""){
				alert("请选择疾病种类");
				return false;
			}
			if($.trim(diagnose_sug)==""){
				alert("请输入诊断意见");
				return false;
			}
			if($.trim(process)==""){
				alert("请输入治疗经过");
				return false;
			}
			if($.trim(deal_sug)==""){
				alert("请输入处理意见");
				return false;
			}
			if($.trim(diagnose_result)==""){
				alert("请输入诊断结果");
				return false;
			}
			if($.trim(hos_data)==""){
				alert("请输入处理时间");
				return false;
			}
			alert("操作成功");
			$("#form").submit();
		});
	});
</script>
</head>
<body style="overflow: auto;">
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：病历管理<span class="divider">/</span></span>修改病历</ul>
	</div>
	<div class="title_right"><strong>修改病历</strong></div>
	<form action="<%=path %>/doctor/caseUpdateOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:600px" align="center">
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">病历编号：</td>
			<td width="30%" colspan="3">
				<input type="text" readonly="readonly" value="${requestScope.case1.hos_no}" name="hos_no" maxlength="50" id="hos_no" style="width: 140px" class="span1-1" />
				<input type="hidden" readonly="readonly" value="${requestScope.case1.id}" name="id" maxlength="50" id="id" style="width: 140px" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">选择患者信息：</td>
			<td width="30%" colspan="3">
				${requestScope.case1.suf_name}
			</td>
		</tr>
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">挂号科室：</td>
			<td width="30%">
				<select name="dep_id" id="dep_id" style="width: 150px;">
					<option value="">--请选择--</option>
					<c:forEach items="${requestScope.plist}" var="p">
					<option ${requestScope.case1.dep_id==p.id?'selected=selected':''} value="${p.id}">${p.dep_name}</option>
					</c:forEach>
				</select>
			</td>
			<td width="20%" align="right" bgcolor="#f1f1f1">疾病种类：</td>
			<td width="30%">
				<select name="des_id" id="des_id" style="width: 150px;">
					<option value="">--请选择--</option>
					<c:forEach items="${requestScope.dlist}" var="d">
					<option ${requestScope.case1.des_id==d.id?'selected=selected':''} value="${d.id}">${d.des_name}</option>
					</c:forEach>
				</select>
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
				<input type="text" readonly="readonly"  onfocus="WdatePicker()" name="hos_data" maxlength="40" style="width: 140px" id="hos_data" value="${requestScope.case1.hos_data}" class="span1-1" />
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="submit" id="submit" value="修改病历" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
</body>
<script type="text/javascript">
var timestamp=new Date().getTime();
$("#hos_no").val("NO"+timestamp);
</script>
</html>