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
			location="<%=path%>/admin/adminDel.do?dep_id="+id;
		}
	}
</script>
</head>
<body>
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：人员管理<span class="divider">/</span></span>管理员管理</ul>
	</div>
	<div class="title_right"><strong>管理员管理</strong></div>
	
	<form action="<%=path %>/admin/adminList.do" id="form" method="post">
	<table class="table table-bordered" style="width:600px" align="center">
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">管理员账号：</td>
			<td width="30%">
				<input type="text" name="admin_account" value="${requestScope.admin_account }" maxlength="20" id="admin_account" class="span1-1" />
			</td>
			<td width="70%">
				<input type="submit" id="submit" value="确定" class="btn btn-info " style="width: 80px;" />&nbsp;&nbsp;&nbsp;
				<input type="button" id="button" value="添加管理员" onclick="location='<%=path %>/admin/adminAdd.do'"  class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
	
	<table width="90%" class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td width="15%" nowrap="nowrap"><strong>管理员名称</strong></td>
         <td nowrap="nowrap"><strong>管理员密码</strong></td>
         <td nowrap="nowrap"><strong>管理昵称</strong></td>
         <td width="25%" nowrap="nowrap"><strong>操作</strong></td>
        </tr>
       <c:forEach items="${requestScope.list}" var="admin">
       <tr align="center">
         <td nowrap="nowrap">${admin.admin_account}</td>
         <td nowrap="nowrap">${admin.admin_pwd}</td>
         <td nowrap="nowrap">${admin.admin_name}</td>
         <td nowrap="nowrap"><a href="javascript:void(0)" onclick="del('${admin.id}')">删除</a></td>
       </tr>
      </c:forEach>
     </tbody>
   </table>
</body>
</html>