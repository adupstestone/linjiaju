<%@page language="java" import="java.util.*,com.sys.utils.GetPropertiesVal" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
<head>

	<title>广东联通终端管理平台</title>
	<link href="<%=curUrl%>/lc/app/manage/resources/js/jquery-easyui/css/default.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/lc/app/manage/resources/js/jquery-easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/lc/app/manage/resources/js/jquery-easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/lc/app/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
	<script src="<%=curUrl%>/lc/app/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/lc/app/manage/resources/js/jquery-easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/lc/app/manage/resources/js/jquery-easyui/js/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/lc/app/display/my-js/common.js"></script>
	<style type="text/css">
	.field{
		width:200px;
	}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUserTable();
			$("#search").click(function(){
				loadUserTable();
			});

		});

function loadUserTable() {//加载列表
	var inputGroupDetailName = $("#input_groupDetailName").val().trim();
	var inputAccount = $("#input_account").val().trim();
	var inputGroupName = $("#input_groupName").val().trim();
	var inputName = $("#input_name").val().trim();
	
			$("#user_list").datagrid({
				   url: curUrl + '/lc/app/manage/action/user!loadScopeUserList.action', 
			       iconCls : 'icon-save',  
			       pageSize:7,  
			       pageList : [ 7, 10, 15 ],
			       queryParams : {
			        	account : inputAccount,
			        	groupDetailName : inputGroupDetailName,
						groupName : inputGroupName,
						name : inputName,
						userType : "",
						isValid : "2"//新注册
			        },
			       nowrap : true,
			       striped : true,  
			       collapsible : true,  
			       loadMsg : '数据装载中......',  
			       onLoadError : function() {  
			           alert('数据加载失败!');  
			       },  
			       columns : [[
						     {field:'userId',width:70,align : 'center',checkbox:true
						 	 },    
						     {field:'groupId',hidden:true},
						     {field:'groupDetailId',hidden:true},
							 {field:'name',title:'用户名',width:100,align : 'center'},
							 {field:'account',title:'账号',width:80,align : 'center'},
							 {field:'userType',title:'用户类型',width:80,align : 'center',
								 formatter:function(value, rowData,rowIndex){
									if(value == '1') {
										return "管理员";
								 	} else if(value == '2') {
								 		return "供货商";
								 	} else if(value == '3') {
								 		return "代理商";
								 	}
							 	}
							 },
							 {field:'groupDetailName',title:'名称',width:100,align : 'center'},
							 {field:'groupName',title:'区域',width:100,align : 'center'},
							 {field:'parentGroupName',title:'归属地',width:50,align : 'center'},
							 {field:'email',title:'邮箱',width:90,align : 'center'},
							 {field:'phone',title:'电话',width:90,align : 'center'},
							 {field:'qq',title:'QQ',width:90,align : 'center'},
							 {field:'createDate',title:'注册时间',width:100,align : 'center'},
							 {field:'isValid',title:'操作',width:140,align : 'center',formatter:function(value, rowData, rowIndex){
									//var html = "<a onclick='deleteUser(" + rowData.userId + "," + rowData.phone + ")'><span style='color:red;'>撤销</span> </a>";
								 	//html = html + " | " + "<input type='button' onclick='";
								 	//html = html + "changeUserValid(" + rowData.userId + ",\"" + rowData.groupDetailId + "\",\"" + rowData.account + "\",\"" + rowData.name + "\"," + rowData.phone + ")' value='审核'/>";
									
								 	var html = "<a href='javascript:void(0)' onclick='deleteUser(" + rowData.userId + "," + rowData.phone + ")' class='l-btn l-btn-plain hover-l-btn-plain'><span class='l-btn-left'><span class='l-btn-text icon-cancel' style='padding-left: 20px;'>撤销</span></span></a>";
								 	html = html + " | " + "<a href='javascript:void(0)' onclick='changeUserValid(" + rowData.userId + ",\"" + rowData.groupDetailId + "\",\"" + rowData.account + "\",\"" + rowData.name + "\"," + rowData.phone + ")' class='l-btn l-btn-plain hover-l-btn-plain'><span class='l-btn-left'><span class='l-btn-text icon-ok' style='padding-left: 20px;'>审核</span></span></a>";
								 	return html;
							 	}
							 },
							 {field:'remark',title:'备注', hidden:true}   
						]],  
			       pagination : true,  
			       rownumbers : true,
			       toolbar:[
							{
								text:'全选',
								iconCls:'icon-edit'
							},'-',{
								text:'撤销选中用户',
								iconCls:'icon-cancel',
								handler:function(){
									var sels = $("#user_list").datagrid("getSelections");
									deleteUsers(sels);
								}
							},'-',{
								text:'审核选中用户',
								iconCls:'icon-ok',
								handler:function(){
									var sels = $("#user_list").datagrid("getSelections");
									changeUsersValid(sels);
									
								}
							}
							],
							
			    });  
			    displayMsg(); 
		}

		function displayMsg() {
			$('#user_list').datagrid('getPager').pagination({
				displayMsg : '当前显示从{from}到{to}共{total}记录'
			});
		}
		
		//审批一批用户
		function changeUsersValid(sels){
			if(sels.length != 0){
				var idVals = "";
				var groupsDetailId = ""
				var phones = "";
				var accounts = "";
				$(sels).each(function(){
					idVals += this.userId + ",";
					groupsDetailId += "'" + this.groupDetailId + "',";
					phones += this.phone + ",";
					accounts += this.account + ",";
				});
				idVals = idVals.substr(0,idVals.length-1);
				groupsDetailId = groupsDetailId.substr(0,groupsDetailId.length-1);
				phones = phones.substr(0,phones.length-1);
				accounts = accounts.substr(0,accounts.length-1);
				
				 $.messager.confirm('操作提示', '您确定要审核选中用户吗?', function(r) {
		        	if (r) {
		        	$.ajax({
		        		url:curUrl + '/lc/app/manage/action/user!updateUsersValid.action',
						data:{
							usersId : idVals,
							groupsDetailId : groupsDetailId,
							phoneNums : phones,
							accounts : accounts
							},
		    			type : "post",
		    			dataType : "json",
		    			success:function(data) {
							if(data.status) {
								$("#user_list").datagrid("reload");
								$.messager.show({
									title:"系统提示",
									msg: "审核用户成功"
								});
							}
						},
		    			error: function(){
		    				$.messager.alert( "提示","操作出错，请稍后重试！", "error");
		    			}
		    		}); 
		        }
		    }); 
				
			}
		}
		
		//审批一个用户
		function changeUserValid(userId, groupDetailId, account, name, phone) {
			$.messager.confirm('操作提示', '您确定要审核【'+name+'】吗?', function(r) {
	        	if (r) {
	        		var isValid = '1';
	    			var msg = "审核";
	    			$.ajax({
	    				url:curUrl + '/lc/app/manage/action/user!updateUserValid.action',
	    				data:{userId : userId,
	    					  isValid  :isValid,
	    					  groupDetailId : groupDetailId,
	    					  account : account,
	    					  phone : phone
	    				},
	    				type:'post',
	    				dataType:'json',
	    				success:function(data) {
	    					if(data.status) {
	    						
	    						$("#user_list").datagrid("reload");
	    						$.messager.show({
	    							title:"系统提示",
	    							msg: msg + "用户【" + name + "】成功"
	    						});
	    					}
	    				}
	    			});
	        	}
			});
			
		}
		
		//销该一个用户
		function deleteUser(userId,phone){
			$.messager.confirm('操作提示', '您确定要撤销该用户吗?', function(r) {
		        if (r) {
		        	$.ajax({
						url:curUrl + '/lc/app/manage/action/user!deleteUser.action',
						dataType:'json',
						type:'post',
						data:{userId : userId,
							  phone : phone	
						},
						success:function(data) {
							if(data.status) {
								$("#user_list").datagrid("reload");
								$.messager.show({
									title:"系统提示",
									msg:"成功撤销 "
								});
							}
							
						}
					});
		        }
			}); 
		}
		
		//销该一批用户
		function deleteUsers(sels){
			if(sels.length != 0){
				$.messager.confirm('操作提示', '您确定要撤销选中的用户吗?', function(r) {
			        if (r) {
			        	
			        	var idVals = "";
			        	var phones = "";
						$(sels).each(function(){
							idVals += this.userId + ",";
							phones += this.phone + ",";
						});
						idVals = idVals.substr(0,idVals.length-1);
						phones = phones.substr(0,phones.length-1);
						
						$.ajax({
							url:curUrl + '/lc/app/manage/action/user!deleteUsers.action',
							dataType:'json',
							type:'post',
							data:{usersId : idVals,
								phoneNums : phones	
							},
							success:function(data) {
								if(data.status) {
									$("#user_list").datagrid("reload");
									$.messager.show({
										title:"系统提示",
										msg:"成功撤销所选中用户！"
									});
								}
								
							}
						});
			        }
				}); 
        	}
			
		}
	</script>	
</head>

<body  class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	<div region="north" title="查询条件" style="width: 200px;height : 100px; font-weight: 20px;" >

	<div class="conditions">
		<div class="inputs left">
			<ul>
				<li>
					<label style="width:60px;">帐号：</label>
					<input type="text" id="input_account" class="text"></input>
				</li>
				<li>
					<label style="width:60px;">名称：</label>
					<input type="text" id="input_groupDetailName" class="text"></input>
				</li>
			</ul>
			<span class="clear"></span>
			<ul>
				<li>
					<label style="width:60px;">用户名：</label>
					<input type="text" id="input_name" class="text"></input>
				</li>
				<li>
					<label style="width:60px;">区域：</label>
					<input type="text" id="input_groupName" class="text"></input>
				</li>
			</ul>
		</div>
		<div class="left">
			<a href="###" class="but_red" id="search">查询</a>
		</div>
		<span class="clear"></span>
	</div>
	</div>
	
	<div region="center">
		<table id="user_list"></table>
	</div>
		
</body>
</html>