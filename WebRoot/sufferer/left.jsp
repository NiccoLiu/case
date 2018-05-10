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
					<a href="<%=path%>/doctor/welcome.jsp" target="main">欢迎页面</a> 
					<a href="<%=path%>/sufferer/info.do" target="main">个人信息查看</a> 
				</div>
				<div class="collapsed">
					<span>就诊管理</span> 
					<a href="<%=path%>/sufferer/scaseList.do" target="main">就诊病历查询</a> 
				</div>
	</div>
</div>		
</body>
</html>
