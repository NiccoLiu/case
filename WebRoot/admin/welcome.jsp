<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<title>欢迎页面</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	</head>

	<body background='<%=path %>/images/allbg.gif'>
			<br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/>	
	    	<table border="0" width="600px" align="center" background="<%=path %>/images/welcome.jpg" height="100px">
	    		<tr>
	    			<td>&nbsp;</td>
	    		</tr>
	    	</table>  
	</body>
</html>
