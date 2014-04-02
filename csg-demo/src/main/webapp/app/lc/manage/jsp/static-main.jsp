

<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
<head>

	<title>静态化管理</title>
		<link href="<%=curUrl%>/app/lc/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/css/my/htmlModule.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
  	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
  		<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/my-js/static-htmlPage.js"></script>
</head>

<body >

<!-- 等待框 start -->
		<div id="loading">
		</div>
		<!-- 等待框 end -->

				<a style="color:#fff;text-align: center;margin-top:20px;" class="button_ok" id="submitInfo"  href="javascript:void(0);"  onclick="createHtml('/lc/manage/action/createHtmlModule!createMainModule.action')" >生成主页全部</a>
		往下拉  有惊喜
		<br/>
			<img src="<%=curUrl%>/app/lc/manage/resources/img/my/htmlmodule/20130621172731.jpg" alt=""  width="800px"/>
			
			<br/>
			<img src="<%=curUrl%>/app/lc/manage/resources/img/my/htmlmodule/20130619142331.jpg" alt="" width="800px"/>
			<a style="color:#fff;text-align: center;margin-top:20px;" class="button_ok" id="submitInfo"   href="javascript:void(0);"  onclick="createHtml('/lc/manage/action/createHtmlModule!createHtmlPageMainAdver.action')" >生成广告区域</a>
			<br/>
			<img src="<%=curUrl%>/app/lc/manage/resources/img/my/htmlmodule/20130619142406.jpg" alt="" width="800px"/>
			<a style="color:#fff;text-align: center;margin-top:20px;" class="button_ok" id="submitInfo"   href="javascript:void(0);"  onclick="createHtml('/lc/manage/action/createHtmlModule!createHtmlPageMain.action')" >生成主推区域</a>
	
			<br/>
			<img src="<%=curUrl%>/app/lc/manage/resources/img/my/htmlmodule/20130619142437.jpg" alt="" width="800px"/>
			<a style="color:#fff;text-align: center;margin-top:20px;" class="button_ok" id="submitInfo"   href="javascript:void(0);"  onclick="createHtml('/lc/manage/action/createHtmlModule!createHtmlPageMainFtting.action')" >生成推荐配件区域</a>
	
			<br/>
			<img src="<%=curUrl%>/app/lc/manage/resources/img/my/htmlmodule/20130619142454.jpg" alt=""  width="800px"/>
				<a style="color:#fff;text-align: center;margin-top:20px;" class="button_ok" id="submitInfo"   href="javascript:void(0);"  onclick="createHtml('/lc/manage/action/createHtmlModule!createHtmlPageMainNewFtting.action')" >生成最新配件区域</a>
	
</body>
</html> 