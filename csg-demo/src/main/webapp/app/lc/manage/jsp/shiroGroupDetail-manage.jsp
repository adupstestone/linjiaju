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
	<style type="text/css">
	.field{
		width:200px;
	}
	</style>
	<script type="text/javascript">
		var groupId = '${requestScope.groupId}';
		var urlParam = "parentId=0";
	</script>
	<script type="text/javascript" src="<%=curUrl %>/app/lc/manage/my-js/shiroGroupDetail-manage.js"></script>	
</head>

<body class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	<div region="west" title="组织结构" style="width: 200px;" >
		<ul id="groupTree"></ul>
	</div>
	
	<div region="center" title="组织架构分类管理">
		<table id="groupDetailTable"></table>
	</div>
	
	<div id="addGroupDetailWin">
		<form id="addGroupDetailForm" method="post"  class="easyui-form">
		<input type="hidden" name="groupDetailMap['groupDetailId']" id="groupDetailId"/>
		<input type="hidden" name="groupDetailMap['groupId']" id="groupId"/>
		<input type="hidden" name="groupDetailMap['detailType']" id="detailType"/>
			<div>
				<div>
					<span>组织架构分类名称:</span><br/>
					<input name="groupDetailMap['groupDetailName']" id="groupDetailName" class="field"/><br/>
				</div>
				<div>
					<span>用户类型:</span><br/>
					<input name="groupDetailMap['userType']" id="userType" class="field"/><br/>
				</div>
				<div>
					<span>是否生效:</span><br/>
					<input name="groupDetailMap['isValid']" id="isValid" class="field" disabled/><br/>
				</div>
			</div>
			<div>
					<input type="button" value="添加" id="save"/>
					<input type="button" value="修改" id="update"/>
			</div>
		</form>
	</div>
	
</body>
</html>