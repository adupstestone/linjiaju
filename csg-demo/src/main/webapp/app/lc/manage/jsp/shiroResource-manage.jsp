<%@page language="java" import="java.util.*,com.sys.utils.GetPropertiesVal" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
<head>

	<title>广东联通终端管理平台</title>
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/css/default.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
	
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script type="text/javascript">
	</script>
	<script type="text/javascript" src="<%=curUrl %>/app/lc/manage/my-js/shiroResource-manage.js"></script>
	<style type="text/css">
		.field{
			width:200px;
		}
	</style>	
</head>

<body class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	<div region="center" title="资源管理">
		<table id="resourceTable"></table>
	</div>
	
	<div id="addResourceWin" style="margin: 5px;">
		<form  method="post" id="addResForm" class="easyui-form">
			<input id="resId" name="resMap['resId']" type="hidden"/>
			<div style="float: left;padding-right:10px;">
			<span>资源名:</span><br/>
			<input name="resMap['resName']" class="field" id="resName"/><br/>
			<span>资源地址:</span><br/>
			<input name="resMap['resValue']" class="field" id="resValue"/><br/>
			<span>访问类型:</span><br/>
			<input name="resMap['permissionType']" class="field" id="permissionType"/><br/>
			<span>权限值:</span><br/>
			<input name="resMap['permission']" class="field" id="permission"/><br/>
			</div>
			<div style="padding-bottom: 5px;clear: right;">
			<span>状态:</span><br/>
			<input name="resMap['isValid']" class="field" id="isValid"/><br/>
			<span>资源加载顺序:</span><br/>
			<input name="resMap['resOrder']" class="field" id="resOrder"/><br/>
			<span>备注：</span><br/>
			<textarea rows="3" cols="60" name="resMap['remark']" class="field" id="remark"></textarea><br/>
			</div>
			<div style="clear: both;"></div>
			<input type="button" value="添加" id="save"/>
			<input type="button" value="修改" id="update"/>
		</form>
	</div>
</body>
</html>