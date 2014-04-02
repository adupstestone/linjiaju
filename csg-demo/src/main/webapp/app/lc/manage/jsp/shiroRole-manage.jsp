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
 	<script type="text/javascript" src="<%=curUrl %>/app/lc/manage/my-js/shiroRole-manage.js"></script>	
	<style type="text/css">
		.field{
			width:200px;
		}
	</style>
</head>

<body class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	<div region="center" title="角色管理">
		<table id="roleTable"></table>
	</div>
	
	<div id="addRoleWin">
		<form id="addRoleForm" method="post"  class="easyui-form">
		<input type="hidden" name="roleMap['roleId']" id="roleId"/>
			<div>
				<div>
					<span>角色名:</span><br/>
					<input name="roleMap['roleName']" id="roleName" class="field"/><br/>
				</div>
				
				<div>
					<span>用户类型:</span><br/>
					<input name="roleMap['userType']" id="userType" class="field"/><br/>
				</div>
				
				<div>
					<span>是否有效:</span><br/>
					<input name="roleMap['isValid']" id="isValid" class="field"/><br/>
				</div>
				
				<div>
					<span>是否默认:</span><br/>
					<input name="roleMap['defaultFlag']" id="defaultFlag" class="field"/><br/>
				</div>
				
				<div>
					<span>角色描述：</span><br/>
					<textarea rows="3" cols="60" name="roleMap['remark']" id="remark" class="field"></textarea><br/>
				</div>
			</div>
			<div>
					<input type="button" value="添加" id="save"/>
					<input type="button" value="修改" id="update"/>
			</div>
		</form>
	</div>
	
	<div id="grantRes" title="分配资源" iconCls='icon-tip' class="easyui-layout" style="overflow: hidden;">
		<div region="center" border="false">
			<div region="center" border="false" style="height: 300px;width:720px;overflow-y:scroll">
				<table id="grantingRes"></table>
			</div>
		</div>
		 <div region="north" border="false" style="text-align:left;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" icon="icon-ok" href="javascript:grantRes()">分配</a>
            <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:cancelRes()">取消</a>
        </div>
    </div>
    
    <div id="grantMenu" title="分配菜单" iconCls='icon-tip' class="easyui-layout" style="overflow:hidden;">
    	<div region="center" border="false">
			<div region="center" border="false" style="height: 300px;width:280px;overflow-y:scroll">
				<ul id="grantingMenu"></ul>
			</div>
		</div>
		 <div region="north" border="false" style="text-align:left;height:30px;width:280px;line-height:30px;">
            <a class="easyui-linkbutton" icon="icon-ok" href="javascript:grantMenu()">分配</a>
            <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:cancelMenu()">取消</a>
        </div>
    </div>
	
</body>
</html>