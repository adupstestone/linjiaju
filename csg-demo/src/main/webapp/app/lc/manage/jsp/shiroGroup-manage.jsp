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
	
	<style type="text/css">
		.field{
			width:200px;
		}
	</style>	
	
	<script type="text/javascript">
	</script>
	<script type="text/javascript" src="<%=curUrl %>/app/lc/manage/my-js/shiroGroup-manage.js"></script>
</head>

<body class="easyui-layout" style="overflow-y:hidden" fit="true" scroll="no">
	<div region="center" title="组织架构管理" id="groupDiv">
		<table id="groupTable"></table>
	</div>
	
	<div id="addGroupWin">
		<form method="post" id="addGroupForm" class="easyui-form">
			<input id="groupId" name="groupMap['groupId']" type="hidden"/>
			<input id="parentId" name="groupMap['parentId']" type="hidden"/>
			<div>
				<div>
					<span>组织名称:</span>
					<br/>
					<input name="groupMap['groupName']" class="field" id="groupName"/><br/>
				</div>
				
				<div>
					<span>组织级别:</span>
					<br/>
					<input name="groupMap['groupLevel']" class="field" id="groupLevel" disabled/><br/>
				</div>
				<div>
					<span>级类顺序:</span>
					<br/>
					<input name="groupMap['groupOrder']" class="field" id="groupOrder"/><br/>
				</div>
				<div>
					<span>备注:</span><br/>
					<textarea name="groupMap['remark']" class="field" id="remark"></textarea>
					<br/>
				</div>
				<div>
					<input type="button" value="添加" id="save"/>
					<input type="button" value="修改" id="update"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>