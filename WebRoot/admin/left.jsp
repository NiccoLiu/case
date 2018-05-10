<%@ page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单页面</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path%>/css/css.css" />
<script type="text/javascript" src="<%=path%>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path%>/js/laydate/laydate.js"></script>
<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>
<script type="text/javascript">
			$(document).ready(function(e) {
				$(".Switch").click(function(){
						$(".left").toggle();
				 });
			});
</script>
</head>
<body>
<div class="left">
    <div id="my_menu" class="sdmenu">
				<div class="collapsed">
					<span>个人信息管理</span> 
					<a href="<%=path%>/admin/welcome.jsp" target="main">欢迎页面</a> 
					<a href="<%=path%>/admin/pwd.do" target="main">修改密码</a> 
					<a href="<%=path%>/admin/info.do" target="main">修改个人信息</a>
				</div>
				<div class="collapsed">
					<span>科室管理</span> 
					<a href="<%=path%>/admin/departmentAdd.do" target="main">添加科室</a> 
					<a href="<%=path%>/admin/departmentList.do" target="main">科室列表</a>
				</div>
				<div class="collapsed">
					<span>人员管理</span> 
					<a href="<%=path%>/admin/adminList.do" target="main">管理员管理</a> 
					<a href="<%=path%>/admin/doctorList.do" target="main">医生管理</a>
					<a href="<%=path%>/admin/suffererList.do" target="main">患者管理</a>
				</div>
				<div class="collapsed">
					<span>疾病类别管理</span>  
					<a href="<%=path%>/admin/diseaseAdd.do" target="main">添加疾病类别</a>
					<a href="<%=path%>/admin/diseaseList.do" target="main">疾病类别管理</a>
				</div>
				<div class="collapsed">
					<span>病历管理</span>  
					<a href="<%=path%>/admin/caseList.do" target="main">病历管理</a>
				</div>
	</div>
</div>		
</body>
</html>
