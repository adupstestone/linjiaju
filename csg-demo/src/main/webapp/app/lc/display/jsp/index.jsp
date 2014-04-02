<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<%
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><%=title %></title>
	<meta name="keywords" content="广东联通 社采直供  小额直供 数码手机 3G手机  智能手机 手机分销 手机采购 手机批发" />
	<meta name="description" content="广东联通 社采直供  小额直供 数码手机 3G手机  智能手机 手机分销 手机采购 手机批发" />
	<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/index.css" type="text/css" />
	
	<script src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		//$(function(){
		//	$("#content").load(curUrl+"/lc/display/jsp/index-main.jsp");
		//});
	</script>
	</head>
	<body>
		<div id="addrlist">
			<div id="logo">
				<img src="<%=curUrl%>/lc/display/resources/img/my/unicom-logo.png" alt="<%=imgalt%>" />
			</div>
			<div class="province_list">
				<ul>
					<li><a href="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1&groupId=16134">广东</a></li>
					<li><a href="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1&groupId=16103">广西</a></li>
					<li><a href="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1&groupId=16115">海南</a></li>
					<li><a href="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1&groupId=16108">云南</a></li>
					<li><a href="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1&groupId=16105">贵州</a></li>
				</ul>
				<br class="clear"/>
			</div>
			<br class="clear"/>
		</div>
		
		<div class="content">
			<iframe id="index_if" src="<%=curUrl%>/lc/display/jsp/index-main.jsp" width="1000px" height="600px" scrolling="no" frameborder="0"></iframe>
		</div>
	</body>
</html>