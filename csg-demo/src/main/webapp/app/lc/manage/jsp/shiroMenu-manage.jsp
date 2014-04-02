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
	<script type="text/javascript" src="<%=curUrl %>/app/lc/manage/my-js/shiroMenu-manage.js"></script>
	<style type="text/css">
		.field{
			width:200px;
		}
	</style>	
</head>

<body class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	
	<div region="west" title="主菜单目录" style="width: 320px;" >
		<table id="mainMenuTable"></table>
	</div>
	<div region="center" title="子菜单管理">
		<table id="menuTable"></table>
	</div>
	
	<div id="addMenuWin">
		<form  method="post" id="addMenuForm" class="easyui-form">
			<input id="menuId" name="menuMap['menuId']" type="hidden"/>
			<input id="parentId" name="menuMap['parentId']" type="hidden"/>
			<input id="menuLevel" name="menuMap['menuLevel']" type="hidden"/>
			<div>
				<div>
					<span>菜单名:</span><br/>
					<input name="menuMap['menuName']" class="field" id="menuName"/><br/>
				</div>
				
				<div>
					<span>菜单地址:</span><br/>
					<input class="field" id="menuUrl1" disabled/>
					<input name="menuMap['menuUrl']" class="field" id="menuUrl2"/><br/>
				</div>
				
				<div>
					<span>加载顺序:</span><br/>
					<input name="menuMap['menuOrder']" class="field" id="menuOrder"/><br/>
				</div>
				
				<div>
					<span>菜单描述:</span><br/>
					<input name="menuMap['menuDesc']" class="field" id="menuDesc"/><br/>
				</div>
				
				<div>
					<span>是否有效:</span><br/>
					<input name="menuMap['isValid']" class="field" id="isValid"/><br/>
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