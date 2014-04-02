<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="org.apache.commons.net.util.Base64" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<%
// 	String menuname = request.getParameter("menuname");
	String queryString = request.getQueryString();
	Base64 decoder = new Base64();
	String url = (queryString == null ? "" : new String(decoder.decode(queryString)));
// 	String menuid = request.getParameter("menuid");
// 	String icon = request.getParameter("icon");
// 	if(!(menuname == null || "".equals(menuname) || url == null || "".equals(url) || menuid == null || "".equals(menuid) || icon == null || "".equals(icon))){
// 		menuname = new String(request.getParameter("menuname").getBytes("ISO-8859-1"),"UTF-8");
// 		url = new String(request.getParameter("url").getBytes("ISO-8859-1"),"UTF-8");
// 		menuid = new String(request.getParameter("menuid").getBytes("ISO-8859-1"),"UTF-8");
// 		icon = new String(request.getParameter("icon").getBytes("ISO-8859-1"),"UTF-8");
// 	}

	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragrma","no-cache");
	response.setDateHeader("Expires",0);
%>
<html>
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="0" />
	<title>广东联通终端管理平台</title>
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/css/default.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/css/my/main.css" rel="stylesheet" type="text/css" />
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/shenph.js" type="text/javascript"> </script>
	<script src="<%=curUrl%>/app/lc/manage/my-js/main.js"></script>
	<script type="text/javascript">
		var menuname = "";
		var url = "<%=url%>";
		var icon = "";
		$(function (){
			//logAnalysis("登录","后台管理系统主页");
		});
	</script>
</head>

<body class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">

	<div id="loading-mask"
		style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; background: #D2E0F2; z-index: 20000">
		<div id="pageloading"
			style="position: absolute; top: 50%; left: 50%; margin: -120px 0px 0px -120px; text-align: center; border: 2px solid #8DB2E3; width: 200px; height: 40px; font-size: 14px; padding: 10px; font-weight: bold; background: #fff; color: #15428B;">
			<img src="<%=curUrl%>/app/lc/resources/js/jquery-easyui/images/loading.gif"
				align="absmiddle" /> 正在加载中,请稍候...
		</div>
	</div>

	<div region="north" split="false" border="false"
		style="overflow: hidden; height: 70px; line-height: 20px; font-family: Verdana, 微软雅黑, 黑体;">
		<span style="float: right; padding-right: 20px; margin-top: 30px;">
			<shiro:user>
			<label style="font-size: 13px;">当前登录：
				<em style="font-weight: bold;"><shiro:principal/></em>
			</label>
			</shiro:user>
			<a href="###" style="margin-left:80px;color: #ff0000;font-size: 13px;font-weight: bold;" id="editpass">返回首页</a>
			<shiro:user>
			<a href="###" style="margin-left:10px;color: #ff0000;font-size: 13px;font-weight: bold;" id="loginOut">安全退出</a>
			</shiro:user>
			</span>
		<span style="padding-left: 10px; font-size: 16px;"> 
			<a href="/index.jsp">
				<img src="<%=curUrl%>/app/lc/resources/img/logo.jpg" alt="深圳君南信息系统有限公司"/>
			</a>
		</span>
	</div>
	
	<div region="west" split="true" title="导航菜单"
		style="width: 220px; font-weight: 20px;" id="west">
		<div id="nav">
			<!--  导航内容 -->
		</div>
	</div>

	<div id="mainPanle" region="center" style="overflow-y: hidden;">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="欢迎光临"  style="padding: 20px; overflow: true;" closable=true>
				深圳君南信息系统有限公司<br/>
			</div>
		</div>
	</div>

	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="close">关闭</div>
		<div id="closeall">全部关闭</div>
		<div id="closeother">除此之外全部关闭</div>
	</div>
</body>
</html>