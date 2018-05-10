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
<title>病历管理</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	function del(id){
		if(confirm("是否删除该记录?")){
			alert("删除成功!");
			location="<%=path%>/admin/departmentDel.do?dep_id="+id;
		}
	}
</script>
</head>
<body style="overflow: auto;">
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：病历管理<span class="divider">/</span></span>病历管理</ul>
	</div>
	<div class="title_right"><strong>病历管理</strong></div>
	
	<form action="<%=path %>/doctor/caseList.do" id="form" method="post">
	<table class="table table-bordered" style="width:1000px" align="center">
		<tr>
			<td width="13%" align="right" bgcolor="#f1f1f1">患者名称：</td>
			<td width="15%">
				<input type="text" name="suf_name" value="${requestScope.suf_name }" maxlength="20" id="suf_name" class="span1-1" />
			</td>
			<td width="15%" align="right" bgcolor="#f1f1f1">就诊医生名称：</td>
			<td width="15%">
				<input type="text" name="doc_name" value="${requestScope.doc_name }" maxlength="20" id="doc_name" class="span1-1" />
			</td>
			<td width="15%" align="right" bgcolor="#f1f1f1">患者身份证：</td>
			<td width="15%">
				<input type="text" name="suf_card" value="${requestScope.suf_card }" maxlength="20" id="suf_card" class="span1-1" />
			</td>
			<td width="15%" align="right" bgcolor="#f1f1f1">就诊科室：</td>
			<td width="15%">
				<input type="text" name="dep_name" value="${requestScope.dep_name }" maxlength="20" id="dep_name" class="span1-1" />
			</td>
			<td width="50%">
				<input type="submit" id="submit" value="查询" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
	
	<table width="90%" class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td width="10%" nowrap="nowrap"><strong>患者名称</strong></td>
         <td width="7%" nowrap="nowrap"><strong>性别</strong></td>
         <td width="7%" nowrap="nowrap"><strong>年龄</strong></td>
         <td width="15%" nowrap="nowrap"><strong>身份证</strong></td>
         <td width="7%" nowrap="nowrap"><strong>就诊医生</strong></td>
         <td width="7%" nowrap="nowrap"><strong>就诊科室</strong></td>
         <td width="7%" nowrap="nowrap"><strong>病历类别</strong></td>
         <td width="15%" nowrap="nowrap"><strong>病历创建时间</strong></td>
         <td width="25%" nowrap="nowrap"><strong>操作</strong></td>
        </tr>
       <c:forEach items="${requestScope.list}" var="case1">
       <tr align="center">
         <td nowrap="nowrap">${case1.suf_name}</td>
         <td nowrap="nowrap">
         	<c:if test="${case1.suf_sex==1}">男</c:if>
         	<c:if test="${case1.suf_sex==2}">女</c:if>
         </td>
         <td nowrap="nowrap">${case1.suf_age}岁</td>
         <td nowrap="nowrap">${case1.suf_card} </td>
         <td nowrap="nowrap">${case1.doc_name}</td>
         <td nowrap="nowrap">${case1.dep_name}</td>
         <td nowrap="nowrap">${case1.des_name} </td>
         <td nowrap="nowrap">${case1.create_time}</td>
         <td nowrap="nowrap">
         <a href="<%=path%>/doctor/caseUpdate.do?id=${case1.id}">修改病历</a>|
         <a href="<%=path%>/doctor/recaseList.do?case_id=${case1.id}">病历修改记录</a>|
         <a href="<%=path%>/doctor/caseDetail.do?id=${case1.id}">病历详情</a>
         </td>
       </tr>
      </c:forEach>
     </tbody>
   </table>
</body>
</html>