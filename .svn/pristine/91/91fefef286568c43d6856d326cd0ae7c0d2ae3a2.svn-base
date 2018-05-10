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
<title>科室列表</title>
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
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：科室管理<span class="divider">/</span></span>科室列表</ul>
	</div>
	<div class="title_right"><strong>科室列表</strong></div>
	
	<form action="<%=path %>/admin/departmentList.do" id="form" method="post">
	<table class="table table-bordered" style="width:400px" align="center">
		<tr>
			<td width="50%" align="right" bgcolor="#f1f1f1">科室名称：</td>
			<td width="50%">
				<input type="text" name="dep_name" value="${requestScope.dep_name }" maxlength="20" id="dep_name" class="span1-1" />
			</td>
			<td width="50%">
				<input type="submit" id="submit" value="确定" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
	
	<table width="90%" class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td width="15%" nowrap="nowrap"><strong>科室名称</strong></td>
         <td nowrap="nowrap"><strong>备注</strong></td>
         <td width="25%" nowrap="nowrap"><strong>操作</strong></td>
        </tr>
       <c:forEach items="${requestScope.list}" var="depart">
       <tr align="center">
         <td nowrap="nowrap">${depart.dep_name}</td>
         <td nowrap="nowrap">${depart.dep_remark} </td>
         <td nowrap="nowrap"><a href="<%=path%>/admin/departmentUpdate.do?id=${depart.id}">编辑</a> | <a href="javascript:void(0)" onclick="del('${depart.id}')">删除</a></td>
       </tr>
      </c:forEach>
     </tbody>
   </table>
</body>
</html>