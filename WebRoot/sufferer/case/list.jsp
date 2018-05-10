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
		<ul class="breadcrumb">当前位置：就诊管理<span class="divider">/</span></span>就诊病历查询</ul>
	</div>
	<div class="title_right"><strong>就诊病历查询</strong></div>
	
	<form action="<%=path %>/sufferer/scaseList.do" id="form" method="post">
	<table class="table table-bordered" style="width:700px" align="center">
		<tr>
			<td width="15%" align="right" bgcolor="#f1f1f1">就诊医生名称：</td>
			<td width="15%">
				<input type="text" name="doc_name" value="${requestScope.doc_name }" maxlength="20" id="doc_name" class="span1-1" />
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
         <td width="7%" nowrap="nowrap"><strong>病历编号</strong></td>
         <td width="7%" nowrap="nowrap"><strong>就诊医生</strong></td>
         <td width="10%" nowrap="nowrap"><strong>就诊科室</strong></td>
         <td width="7%" nowrap="nowrap"><strong>疾病类型</strong></td>
         <td width="7%" nowrap="nowrap"><strong>诊断意见</strong></td>
         <td width="7%" nowrap="nowrap"><strong>治疗经过</strong></td>
         <td width="7%" nowrap="nowrap"><strong>处理意见</strong></td>
         <td width="7%" nowrap="nowrap"><strong>诊断结果</strong></td>
         <td width="15%" nowrap="nowrap"><strong>处理时间</strong></td>
         <td width="15%" nowrap="nowrap"><strong>创建时间</strong></td>
         <td width="25%" nowrap="nowrap"><strong>操作</strong></td>
        </tr>
       <c:forEach items="${requestScope.list}" var="case1">
       <tr align="center">
         <td nowrap="nowrap">${case1.hos_no}</td>
         <td nowrap="nowrap">${case1.doc_name}</td>
         <td nowrap="nowrap">${case1.dep_name}</td>
         <td nowrap="nowrap">${case1.des_name}</td>
         <td nowrap="nowrap">${case1.diagnose_sug}</td>
         <td nowrap="nowrap">${case1.process}</td>
         <td nowrap="nowrap">${case1.deal_sug}</td>
         <td nowrap="nowrap">${case1.diagnose_result}</td>
         <td nowrap="nowrap">${case1.des_name} </td>
         <td nowrap="nowrap">${case1.create_time}</td>
         <td nowrap="nowrap">
         <a href="<%=path%>/sufferer/srecaseList.do?case_id=${case1.id}">病历修改记录</a>|
         <a href="<%=path%>/sufferer/scaseDetail.do?case_id=${case1.id}">病历详情</a>
         </td>
       </tr>
      </c:forEach>
     </tbody>
   </table>
</body>
</html>