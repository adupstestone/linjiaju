var loadSuccess = false;
		if(groupId != '') {
			urlParam = "groupId="+groupId;
		}
		$(function(){
			//加载树
			$("#groupTree").tree({
				url:curUrl + "/lc/manage/action/group!loadGroupsTree.action?"+urlParam,
				onBeforeExpand:function(node,param){
					var url = curUrl + "/lc/manage/action/group!loadGroupsTree.action?parentId=" +  node.id;
					$('#groupTree').tree('options').url = url;
     			},
     			onClick:function(node){
     				$("#userTypeSelect").change();
         		},
         		onLoadSuccess:function(node,data){
         			if(!loadSuccess) {
         				$("#groupTree").tree("select", $("#groupTree").tree("getRoots")[0].target);
         				loadUserTable();
         				loadSuccess = true;
         			}
         			
         		}
         		   
			});
			
			$("#userTypeSelect").change(function(){
				var treeSelected = $("#groupTree").tree("getSelected");
				var userType = $("#userTypeSelect").val();
				var html = '<label>组织分类：</label>';
				if(userType == '0') {
					html += '<select id="groupDetailSelect" style="width:200px;">';
					html += '<option value="-1">请选择</option>'
					html += '</select>';
					$("#groupDetailLi").html(html);
					loadUserTable();
				} else if(treeSelected != null){
					$.ajax({
						url : curUrl +'/lc/manage/action/groupDetail!loadGroupDetailSelect.action',
						dataType:'json',
						type:'post',
						data:{userType : userType, groupId : treeSelected.id},
						success:function(data){
							html += '<select id="groupDetailSelect" style="width:200px;" onchange="changeGroupDetail()">';
							html += '<option value="-1">请选择</option>'
							for(var i=0; i < data.length; i++) {
								html += '<option value="' + data[i].groupDetailId + '">' + data[i].groupDetailName + '</option>'
							}
							html += '</select>';
							$("#groupDetailLi").html(html);
							loadUserTable();
						}
					});
				} else {
					$.ajax({
						url : curUrl +'/lc/manage/action/groupDetail!loadGroupDetailSelect.action',
						dataType:'json',
						type:'post',
						data:{userType : userType},
						success:function(data){
							html += '<select id="groupDetailSelect" style="width:200px;" onchange="changeGroupDetail()">';
							html += '<option value="-1">请选择</option>'
							for(var i=0; i < data.length; i++) {
								html += '<option value="' + data[i].groupDetailId + '">' + data[i].groupDetailName + '</option>'
							}
							html += '</select>';
							$("#groupDetailLi").html(html);
							loadUserTable();
						}
					});
				}

			});

			$("#search").click(function(){
				loadUserTable();
			});

			//保存用户
			$("#save").click(function(){
				if(!validateForm()) {
					return;
				}
				$.ajax({
					url : curUrl +'/lc/manage/action/user!saveUser.action',
					dataType:'json',
					type:'post',
					data:$("#addUserForm").serialize(),
					success:function(data){
						$('#addUserWin').window('close');
						if(data.status) {
							$("#userTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"添加用户成功"
							});
						}
					}
				});
			});

			//更新用户
			$("#update").click(function(){
				if(!validateForm()) {
					return;
				}
				$.ajax({
					url : curUrl +'/lc/manage/action/user!updateUser.action',
					dataType:'json',
					type:'post',
					data:$("#addUserForm").serialize(),
					success:function(data){
						$('#addUserWin').window('close');
						if(data.status) {
							var selected = getSelected();
							$("#userTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"修改用户【" + selected["name"] + "】成功"
							});
						}
					}
				});
			});

		});

		function loadUserTable() {
			var url = curUrl + '/lc/manage/action/user!loadUser.action?date=' + (new Date());
			var treeSelected = $("#groupTree").tree("getSelected");
			var groupDetailId = $("#groupDetailSelect").val();
			var groupId;
			var userType = $("#userTypeSelect").val();
			if(treeSelected == null) {
				groupId = '0';
			} else {
				groupId = treeSelected.id;
			}
			if(groupId != '0') {
				url += '&groupId='+groupId
			}
			if(groupDetailId != '-1') {
				url += '&groupDetailId='+groupDetailId
			}
			if(userType != '0') {
				url += '&userType='+userType
			}

			var inputAccount = $("#inputAccount").val();
			var inputName = $("#inputName").val();
			
			$("#userTable").datagrid({
				url: url,
				pagination:true,
				pageNumber : 1,
				pageSize:7,  
		        pageList : [ 7, 10, 15 ], 
		        queryParams : {
		        	account : inputAccount,
		        	name : inputName
		        },
		        nowrap : true,  
		        striped : true,  
		        collapsible : true,
		        singleSelect : true,
		        remoteSort : false,  
		        loadMsg : '数据装载中......',  
		        onLoadError : function() {  
		           alert('数据加载失败!');  
		        },
		        onSelect : function(rowIndex, rowData){
		        	$("input[name='userId']:eq(" + rowIndex + ")").attr("checked", true);
		 		},
			    idField:'userId',   
				columns:[[
				     {field:'userId',width:30,title:"选择",
							formatter:function(value, rowData, rowIndex) {
							var html = "<input type='radio' name='userId' value='" + value + "'/>"
							return html;
				 			}
				 	 },    
				     {field:'groupId',hidden:true},
				     {field:'groupDetailId',hidden:true},
				     {field:'pwd',hidden:true},
					 {field:'name',title:'用户名',width:100,align : 'center'},
					 {field:'account',title:'登陆账号',width:80,align : 'center'},
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
					 {field:'groupDetailName',title:'组织细分',width:80,align : 'center'},
					 {field:'isValid',title:'状态',width:120,align : 'center',formatter:function(value, rowData, rowIndex){
						 if(value == '1') {
							 	var html = '<span style="color:green;">已生效</span>';
							 	html = html + " | " + "<input type='button' onclick='";
							 	html = html + "changeUserValid(" + rowData.userId + ",\"" + rowData.groupDetailId + "\", true)'/ value='注销'>";
								return html;
					 		}		 
							else if(value == '0') {
								var html = '<span style="color:red;">未生效</span>';
							 	html = html + " | " + "<input type='button' onclick='";
							 	html = html + "changeUserValid(" + rowData.userId + "," + rowData.groupDetailId + ", false)' value='审核'/>";
								return html;
							} else if(value == '2') {
								var html = '<span style="color:red;">未审核</span>';
							 	html = html + " | " + "<input type='button' onclick='";
							 	html = html + "changeUserValid(" + rowData.userId + ",\"" + rowData.groupDetailId + "\", false)' value='审核'/>";
								return html;
							}
						 }
					 },
					 {field:'email',title:'邮箱',width:90,align : 'center'},
					 {field:'phone',title:'电话',width:90,align : 'center'},
					 {field:'qq',title:'QQ',width:90,align : 'center'},
					 {field:'createDate',title:'注册时间',width:100,align : 'center',formatter:function(value, rowData,rowIndex){
							return value;
						 }
					 },
					
					 {field:'remark',title:'备注', hidden:true}   
				]],
				toolbar:[
				{
					text:'新增',
					iconCls:'icon-add',
					handler:function(){
						var treeSelected = $("#groupTree").tree("getSelected");
									
						if(treeSelected != null) {
							$("#save").show();
							$("#update").hide();

							createValidatebox();
							
							$("#addUserForm").form("clear");
							$("#userType").val("1");
							$("#groupId").val(treeSelected.id);
							
							$("#groupName").val(treeSelected.text);
// 							$("#groupDetailId").combobox({
// 								 url:curUrl +'/lc/manage/action/groupDetail!loadGroupDetailSelect.action?userType=1&groupId='+treeSelected.id,
// 								valueField:'groupDetailId',
// 				                textField:'groupDetailName',
// 				                width:200,
// 				                onLoadSuccess:function(){
// 				                	if($("#groupDetailId").combobox("getData").length > 0) {
// 				                		$("#groupDetailId").combobox("select", $("#groupDetailId").combobox("getData")[0].groupDetailId);
// 				                	}
// 				                }
// 							});
							
							
							$("#isValid").val('1');
							$('#addUserWin').window({   
								width:250,
								modal:true,
								title:'新增用户',
								iconCls:'icon-add'
							 });  
							
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function(){
						var selected = getSelected();
						if(selected.isValid == '2') {
							$.messager.confirm('操作提示', '您确定要删除该用户吗?', function(r) {
						        if (r) {
						        	$.ajax({
										url:curUrl + '/lc/manage/action/user!deleteUser.action',
										dataType:'json',
										type:'post',
										data:{userId:selected.userId},
										success:function(data) {
											if(data.status) {
												$("#userTable").datagrid("reload");
												$.messager.show({
													title:"系统提示",
													msg:"成功删除 【" + selected["name"]+ "】"
												});
											}
											
										}
									});
						        }
							});
						} else {
							$.messager.alert("系统提示","用户已生效, 不能删除");
						}
						
					}
				},'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						var treeSelected = $("#groupTree").tree("getSelected");
						var selected = getSelected();
						if(selected == null) {
							return false;
						}
						$("#save").hide();
						$("#update").show();

						createValidatebox();
						
						$("#userType").val(selected.userType);
						$("#groupId").val(selected.groupId);
						
						$("#groupName").val(treeSelected.text);
						
						$("#isValid").val(selected.isValid);
						$("#userId").val(selected["userId"]);
						$("#name").val(selected["name"]);
						//$("#pwd").val(selected["pwd"]);
						//$("#confirmPwd").val(selected["pwd"]);
						$("#account").val(selected["account"]);
						$("#email").val(selected["email"]);
						$("#phone").val(selected["phone"]);
						$("#qq").val(selected["qq"]);
						$("#remark").val(selected["remark"]);
// 						$("#groupDetailId").combobox({
// 							valueField:'groupDetailId',
// 			                textField:'groupDetailName',
// 			                width:200,
// 			                url:curUrl +'/lc/manage/action/groupDetail!loadGroupDetailSelect.action?userType=' + selected.userType + '&groupId='+selected.groupId
// 						});
// 						$("#groupDetailId").combobox("setValue", selected.groupDetailId);
						$('#addUserWin').window({   
							width:250,
							modal:true,
							title:'修改用户',
							iconCls:'icon-edit'
						 });  
					}
				},'-',{
					text:'授权',
					iconCls:'icon-ok',
					handler:function(){
						var selected = getSelected();

						if(selected == null) {
							return false;
						}
						
						$("#grantRole").window({
							width:600,
							height:400,
							modal:true
						});
						
						$("#granted").datagrid({
							url:curUrl + '/lc/manage/action/user!granted.action?id='+selected['userId']+'&userType='+selected.userType,
							rownumbers : true,
							loadMsg : "",
							columns:[[
								{field:'roleId',hidden:true},
								{field:'roleName',title:'角色名',width:100},
								{field:'remark',hidden:true}
							]],
							onClickRow:function(rowIndex, rowData) {
								$("#granting").datagrid("appendRow",
								{
									roleId:rowData['roleId'],
									roleName:rowData['roleName'],
									remark:rowData['remark']
								});
								$("#granted").datagrid("deleteRow",rowIndex);
								// 重新加载表格的数据，让index正确排序
								var rows = $("#granted").datagrid("getData");
								$("#granted").datagrid("loadData",rows);
							}
							
						});
						
						$("#granting").datagrid({
							url:curUrl + '/lc/manage/action/user!granting.action?id='+selected['userId']+'&userType='+selected.userType,
							rownumbers : true,
							loadMsg : "",
							columns:[[
								{field:'roleId',hidden:true},
								{field:'roleName',title:'角色名',width:100},
								{field:'remark',title:'角色描述',width:200},
							]],
							onClickRow:function(rowIndex, rowData) {
								$("#granted").datagrid("appendRow",
									{
										roleId:rowData['roleId'],
										roleName:rowData['roleName'],
										remark:rowData['remark']
									}
								);
								$("#granting").datagrid("deleteRow",rowIndex);
								// 重新加载表格的数据，让index正确排序
								var rows = $("#granting").datagrid("getData");
								$("#granting").datagrid("loadData",rows);
								
							}
						});
					}
				}
				]
			});

			displayMsg();  
		
		}

		function displayMsg() {  
		    $('#userTable').datagrid('getPager').pagination({  
		       displayMsg : '当前显示从{from}到{to}共{total}记录'  
		    });  
		}  
		
		
		function getSelected() {
			var selectedId = $("input:checked[name='userId']");
			if(selectedId.length == 0) {
				$.messager.alert("系统提示","您还没选择用户，请选择一条记录");
				return null;
			} else {
				var rowIndex = $("#userTable").datagrid("getRowIndex", $(selectedId).val());
				var rows = $("#userTable").datagrid("getRows");
				return rows[rowIndex];
			}
		}

		function changeUserValid(userId, groupDetailId, isCancel) {
			var isValid = '1';
			var msg = "审核";
			if(isCancel) {
				isValid = '0';
				msg = "注销";
			}
			
			$.messager.confirm('操作提示', '您确定要'+msg+'该用户吗?', function(r) {
		        if (r) {
		        	$.ajax({
						url:curUrl + '/lc/manage/action/user!updateUserValid.action',
						data:{userId:userId,isValid:isValid,groupDetailId:groupDetailId},
						type:'post',
						dataType:'json',
						success:function(data) {
							if(data.status) {
								var rowIndex = $("#userTable").datagrid("getRowIndex", userId);
								var rows = $("#userTable").datagrid("getRows");
								var selected = rows[rowIndex];
								$("#userTable").datagrid("reload");
								$.messager.show({
									title:"系统提示",
									msg: msg + "用户【" + selected["name"] + "】成功"
								});
							}
						}
					});
		        }
			});
			
		}
		
		//开始提交到后台分配角色
		function grant(){
			var rows = $("#granted").datagrid("getRows");
			var roleIds=""
			if(rows.length > 0){
				for(var i=0;i<rows.length;i++) {
					roleIds += rows[i]['roleId'] + ",";
				}
			}
			roleIds = roleIds.substring(0,roleIds.length-1);
			var userId = getSelected()['userId'];
			$.ajax({
				url:curUrl + '/lc/manage/action/user!grant.action',
				data:{id:userId,roleIds:roleIds},
				type:'post',
				dataType:'json',
				success:function(data) {
					if(data.status) {
						$("#grantRole").window("close");
						$.messager.show({title:"系统提示",msg:"分配角色成功"});
					}
				}
			})
		}
		
		function cancel() {
			$("#grantRole").window('close');
		}

		function changeGroupDetail(){
			loadUserTable();
		}

		  $.extend($.fn.validatebox.defaults.rules, {   
		      validateAccount: {   
		            validator: function(value, param){
	            		if(checkStrLength(value) < 4 || checkStrLength(value) > 30) {
							return false;
	            		} else {
	            			var data = 
		            			$.ajax({
	    						url:curUrl + '/lc/manage/action/user!findUser.action',
	    						type : "post",
	    						async: false,
	    						data : {
	    							account : value
	    						}
	    					}).responseText;
	    					if($.parseJSON(data).count == 1) {
	    						return false;
	    					} else {
								return true;
	    					}
	            		} 
		            },   
		         message: '该字段长度必须为[4-30], 并不能重复'  
		     },
		     validateName: {
		    	 validator: function(value, param){
	         		if(checkStrLength(value) < 3) {
							return false;
	         		}   
	         		return true;
	            },   
	         	message: '该字段长度必须大于2' 
			 },
		     validatePwd: {
		    	 validator: function(value, param){
	         		if(checkStrLength(value) < 6 ) {
							return false;
	         		}   
	         		return true;
	            },   
	         	message: '该字段长度必须大于5' 
			 },
		     validateRePwd: {
		    	 validator: function(value, param){
		    	 	var pwd = $("#pwd").val();
	         		if(value != pwd) {
							return false;
	         		}   
	         		return true;
	            },   
	         	message: '两次输入的密码不一致' 
			 },
		     validatePhone: {
		    	 validator: function(value, param){
	         		if(!checkLTmun(value)) {
							return false;
	         		}   
	         		return true;
	            },   
	         	message: '手机号码有误, 请输入联通手机号码' 
			 }
			});  

			  		

		function createValidatebox() {
		 $('#account').validatebox({
			 	required : true,
			 	missingMessage : "该字段为必填项",
			 	validType :"validateAccount"
			});

		 $('#name').validatebox({
			 	required : true,
			 	missingMessage : "该字段为必填项",
			 	validType : "validateName"
			});

		 $('#pwd').validatebox({
			 	required : true,
			 	missingMessage : "该字段为必填项",
			 	validType : "validatePwd"
			});

		 $('#confirmPwd').validatebox({
			 	required : true,
			 	missingMessage : "该字段为必填项",
			 	validType : "validateRePwd"
			});

		 $('#email').validatebox({
			 	validType : "email",
			 	invalidMessage : "请填入合法的邮箱"
			});

		 $('#phone').validatebox({
			 	required : true,
			 	missingMessage : "该字段为必填项",
			 	validType : "validatePhone"
			});

		}

		function validateForm() {
			var flag = true;
			if(!$("#account").validatebox("isValid")) {
				flag = false;
			}
			if(!$("#name").validatebox("isValid")) {
				flag = false;
			}
			if(!$("#pwd").validatebox("isValid")) {
				flag = false;
			}
			if(!$("#confirmPwd").validatebox("isValid")) {
				flag = false;
			}
			if(!$("#email").validatebox("isValid")) {
				flag = false;
			}
			if(!$("#phone").validatebox("isValid")) {
				flag = false;
			}
			return flag;
		}
