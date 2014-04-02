<%@page language="java" import="java.util.*,com.sys.utils.GetPropertiesVal" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
<head>

	<title>广东联通终端管理平台</title>
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/css/default.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/locale/easyui-lang-zh_CN.js"></script>
	<script src="<%=curUrl%>/app/lc/display/my-js/common.js"></script>
	<style type="text/css">
	.field{
		width:200px;
	}
	</style>
	<script type="text/javascript">
		var groupId = '${requestScope.groupId}';
		var urlParam = "parentId=0";
	</script>
	<script type="text/javascript" src="<%=curUrl%>/app/lc/manage/my-js/shiroUser-manage.js"></script>	
</head>

<body class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	<div region="west" title="组织结构" style="width: 200px;" >
		<ul id="groupTree"></ul>
	</div>
	<div region="center" class="easyui-layout" style="overflow-y: hidden" scroll="no">
		<div region="center">
		<table id="userTable"></table>
		</div>
		<div region="north" title="用户查询" style="height:120px;padding:10px 10px;text-align:center">
		
		
		<div class="conditions">
		<div class="inputs left">
			<ul>
				<li>
					<label>用户类型：</label>
					<select id="userTypeSelect" style="width:200px;">
						<option value="0">请选择</option>
						<option value="1">管理员</option>
						<option value="2">供货商</option>
						<option value="3">代理商</option>
					</select>
				</li>
				<li id="groupDetailLi">
					<label>组织分类：</label>
					<select id="groupDetailSelect" style="width:200px;">
						<option value="-1">请选择</option>
					</select>
				</li>
			</ul>
			<span class="clear"></span>
			<ul>
				<li>
					<label>用户名：</label>
					<input type="text" id="inputName" class="text"></input>
				</li>
				<li>
					<label>登录账号：</label>
					<input type="text" id="inputAccount" class="text"></input>
				</li>
			</ul>
		</div>
		<div class="left">
			<a href="###" class="but_red" id="search">查询</a>
		</div>
		<span class="clear"></span>
	</div>
			
		</div>
	</div>
	
	<div id="addUserWin">
		<form id="addUserForm" method="post"  class="easyui-form">
		<input type="hidden" name="userMap['userId']" id="userId"/>
		<input type="hidden" name="userMap['groupId']" id="groupId"/>
		<input type="hidden" name="userMap['groupName']" id="groupName"/>
		<input type="hidden" name="userMap['userType']" id="userType"/>
		<input type="hidden" name="userMap['isValid']" id="isValid" />
			<div>
				<div>
					<span>登陆账号:</span><br/>
					<input name="userMap['account']" id="account" class="field"/><br/>
				</div>
				<div>
					<span>用户名:</span><br/>
					<input name="userMap['name']" id="name" class="field"/><br/>
				</div>
				<div>
					<span>密码:</span><br/>
					<input type="password" name="userMap['pwd']" id="pwd" class="field"/><br/>
				</div>
				<div>
					<span>确认密码:</span><br/>
					<input type="password" id="confirmPwd" class="field"/><br/>
				</div>
				<div>
					<span>邮箱:</span><br/>
					<input name="userMap['email']" id="email" class="field"/><br/>
				</div>
				<div>
					<span>手机:</span><br/>
					<input name="userMap['phone']" id="phone" class="field"/><br/>
				</div>
				<div>
					<span>QQ:</span><br/>
					<input name="userMap['qq']" id="qq" class="field"/><br/>
				</div>
<!-- 				<div> -->
<!-- 					<span>组织分类:</span><br/> -->
<!-- 					<input name="userMap['groupDetailId']" id="groupDetailId" class="field" disabled/><br/> -->
<!-- 				</div> -->
				<div>
					<span>备注:</span><br/>
					<textarea rows="3" cols="60" name="userMap['remark']" id="remark" class="field"></textarea><br/>
				</div>
				
			</div>
			<div>
					<input type="button" value="添加" id="save"/>
					<input type="button" value="修改" id="update"/>
			</div>
		</form>
	</div>
	
	<div id="grantRole" title="分配角色" iconCls='icon-tip' class="easyui-layout" style="overflow: hidden;">
		<div split="true" region="west" title="已分配角色" style="width: 180px; font-weight: 20px;">
			<table id="granted" style="height: 300px; width: 160px;">
			</table>
		</div>
		<div region="center" title="未分配角色" border="false" >
			<table id="granting" style="height: 300px; width: 380px;"></table>
		</div>
		 <div region="north" border="false" style="text-align:left;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" icon="icon-ok" href="javascript:grant()">分配</a>
            <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:cancel()">取消</a>
        </div>
    </div>
</body>
</html>