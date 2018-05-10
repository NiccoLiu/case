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
<title>医生管理</title>
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
			location="<%=path%>/admin/doctorDel.do?doc_id="+id;
		}
	}
</script>
</head>
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：人员管理<span class="divider">/</span></span>医生管理</ul>
	</div>
	<div class="title_right"><strong>医生管理</strong></div>
	
	<form action="<%=path %>/admin/doctorList.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="20%" align="right" bgcolor="#f1f1f1">医生名称：</td>
			<td width="30%">
				<input type="text" name="doc_name" value="${requestScope.doc_name }" maxlength="20" id="doc_name" class="span1-1" />
			</td>
			<td width="50%">
				<input type="submit" id="submit" value="确定" class="btn btn-info " style="width: 80px;" />
				<input type="button" id="button" value="添加医生" onclick="location='<%=path %>/admin/doctorAdd.do'"  class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
	
	<table width="90%" class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td width="15%" nowrap="nowrap"><strong>医生姓名</strong></td>
         <td width="10%" nowrap="nowrap"><strong>所属科室</strong></td>
         <td width="15%" nowrap="nowrap"><strong>账号</strong></td>
         <td width="15%" nowrap="nowrap"><strong>密码</strong></td>
         <td width="15%" nowrap="nowrap"><strong>年龄</strong></td>
         <td width="15%" nowrap="nowrap"><strong>性别</strong></td>
         <td width="15%" nowrap="nowrap"><strong>职称</strong></td>
         <td width="25%" nowrap="nowrap"><strong>操作</strong></td>
        </tr>
       <c:forEach items="${requestScope.list}" var="doctor">
       <tr align="center">
         <td nowrap="nowrap">${doctor.doc_name}</td>
         <td nowrap="nowrap">${doctor.dep_name}</td>
         <td nowrap="nowrap">${doctor.doc_account}</td>
         <td nowrap="nowrap">******</td>
         <td nowrap="nowrap">${doctor.doc_age}</td>
         <td nowrap="nowrap">
         	<c:if test="${doctor.doc_sex==1}">男</c:if>
         	<c:if test="${doctor.doc_sex==2}">女</c:if>
         </td>
          <td nowrap="nowrap">${doctor.doc_title}</td>
         <td nowrap="nowrap"><a href="<%=path%>/admin/doctorUpdate.do?id=${doctor.id}">编辑</a> | <a href="javascript:void(0)" onclick="del('${doctor.id}')">删除</a></td>
       </tr>
      </c:forEach>
     </tbody>
   </table>
</body>
</html>