<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理页面</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path%>/css/css.css" />
<script type="text/javascript" src="<%=path%>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path%>/js/laydate/laydate.js"></script>
<script language=JavaScript>
function logout(){
	if (confirm("您确定要退出系统吗？"))
	top.location = "<%=path %>/admin/logout.do";
	return false;
}
</script>
</head>
<body leftmargin="0" topmargin="0">
	<div class="header">
		<div class="logo">
			<img src="<%=path%>/images/logo.png" />
		</div>

		<div class="header-right"> 
			<a id="modal-973558" href="javascript:void(0)" onclick="logout()" role="button" data-toggle="modal">注销</a>
			
		</div>
	</div>
</body>
</html>
