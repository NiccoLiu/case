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
<title>添加患者</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/css.css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").click(function(){
			var suf_name=$("#suf_name").val();
			var suf_age=$("#suf_age").val();
			var suf_card=$("#suf_card").val();
			var suf_address=$("#suf_address").val();
			var suf_phone=$("#suf_phone").val();
			var suf_nation=$("#suf_nation").val();
			var suf_native=$("#suf_native").val();
			var suf_his=$("#suf_his").val();
			var cardTest=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			if($.trim(suf_name)==""){
				alert("请输入患者姓名");
				return false;
			}
			if($.trim(suf_age)==""){
				alert("请输入年龄");
				return false;
			}
			if(!cardTest.test(suf_card)){
				alert("身份证格式不正确");
				return false;
			}
			if($.trim(suf_address)==""){
				alert("请输入患者家庭地址");
				return false;
			}
			if($.trim(suf_phone)==""){
				alert("请输入联系电话");
				return false;
			}
			if($.trim(suf_nation)==""){
				alert("请输入名族");
				return false;
			}
			if($.trim(suf_native)==""){
				alert("请输入籍贯");
				return false;
			}
			if($.trim(suf_his)==""){
				alert("请输入患者病史");
				return false;
			}
			alert("添加成功");
			$("#form").submit();
		});
		//严重名称重复性
		$("#suf_card").blur(function(){
			if($.trim($(this).val())!=""){
				$.post("<%=path%>/doctor/checkSufferAccount.do", {"suf_card":$.trim($(this).val())} , function(json) {
					if(json=="1"){
						alert("患者已经在系统中存在,请勿重复添加!");
						$("#suf_card").val("");
					}
			    });
			}
		});
	});
</script>
</head>
<body style="overflow: auto;">
	<div class="right_cont">
		<ul class="breadcrumb">当前位置：患者管理<span class="divider">/</span></span>添加患者</ul>
	</div>
	<div class="title_right"><strong>添加患者</strong></div>
	<form action="<%=path %>/doctor/sufferAddOk.do" id="form" method="post">
	<table class="table table-bordered" style="width:700px" align="center">
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">患者姓名：</td>
			<td width="70%">
				<input type="text" name="suf_name" maxlength="20" id="suf_name" value="" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">性别：</td>
			<td width="70%">
				<input type="radio" value="1"  name="suf_sex" checked="checked"/>男&nbsp;&nbsp;
				<input type="radio" value="2"  name="suf_sex" />女
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">年龄：</td>
			<td width="70%">
				<input type="text" name="suf_age" maxlength="3" style="width: 50px" id="suf_age" value="" class="span1-1" />岁
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">身份证号：</td>
			<td width="70%">
				<input type="text" name="suf_card" maxlength="18" id="suf_card" style="width: 200px" class="span1-1" /><font color="red">*用于患者登录,密码为身份证后6位</font>
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">家庭住址：</td>
			<td width="70%">
				
				<input type="text" name="suf_address" maxlength="30" style="width: 400px" value="" id="suf_address" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">联系电话：</td>
			<td width="70%">
				<input type="text" name="suf_phone" maxlength="11" value="" id="suf_phone" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">民族：</td>
			<td width="70%">
				<input type="text" name="suf_nation" maxlength="20" value="" id="suf_nation" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">籍贯：</td>
			<td width="70%">
				<input type="text" name="suf_native" maxlength="20" value="" id="suf_native" class="span1-1" />
			</td>
		</tr>
		<tr>
			<td width="30%" align="right" bgcolor="#f1f1f1">病史：</td>
			<td width="70%">
				<textarea rows="5" cols="40" style="width: 400px;height:150px" name="suf_his" id="suf_his"></textarea>
			</td>
		</tr>
	</table>
	<table class="margin-bottom-20 table  no-border">
		<tr>
			<td class="text-center">
				<input type="submit" id="submit" value="确定" class="btn btn-info " style="width: 80px;" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>