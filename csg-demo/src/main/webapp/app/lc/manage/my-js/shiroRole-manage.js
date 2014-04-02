$(function(){
			$("#roleTable").datagrid({
				url:curUrl + '/lc/manage/action/role!loadRole.action',
				pagination:true,
				pageSize:10,  
		        pageList : [ 10, 15 ,20 ],  
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
		        	$("input[name='roleId']:eq(" + rowIndex + ")").attr("checked", true);
		 		},   
			    idField:'roleId',   
				columns:[[
				     {field:'roleId',width:30,title:"选择",
							formatter:function(value, rowData, rowIndex) {
							var html = "<input type='radio' name='roleId' value='" + value + "'/>"
							return html;
				 			}
				 	 },    
					 {field:'roleName',title:'角色名',width:150,align : 'center'},
					 {field:'userType',title:'用户类型',width:100,align : 'center',
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
					 {field:'createDate',title:'创建时间',width:100,align : 'center',
						 formatter:function(value, rowData,rowIndex){
							return value;
						 }
					 },
					 {field:'updateDate',title:'更新时间',width:100,align : 'center',
						 formatter:function(value, rowData,rowIndex){
							return value;
						 }
					 },
					 {field:'defaultFlag',title:'是否默认角色',width:130,align : 'center',
						 formatter:function(value, rowData,rowIndex){
						 if(value == '1') {
							 	var html = '是';
								return html;
					 		}		 
							else if(value == '0') {
								var html = '<span style="color:red;">否</span>';
								if(rowData.isValid == '1') {
									//html = html + " | " + "<input type='button' onclick='";
								 	//html = html + "updateDefaultRole(" + rowData.roleId + ", \"" + rowData.userType + "\")' value='设为默认'/>";
								 	
								 	html += " | <a href='javascript:void(0)' onclick='updateDefaultRole(" + rowData.roleId + ", \"" + rowData.userType + "\")' class='l-btn l-btn-plain hover-l-btn-plain'><span class='l-btn-left'><span class='l-btn-text icon-ok' style='padding-left: 20px;'>设为默认</span></span></a>";
								}
								return html;
							}						
						 }
					 },
					 {field:'isValid',title:'状态',width:60,align : 'center',
						 formatter:function(value, rowData,rowIndex){
						 	if(value =='1') {
								return '<span style="color:green;">生效</span>'
							} else if(value =='0') { 
								return '<span style="color:red;">失效</span>'
							}
						 }
					 },
					 {field:'remark',title:'备注',width:200,align : 'center'}   
				]],
				toolbar:[
				{
					text:'新增',
					iconCls:'icon-add',
					handler:function() {
						$("#addRoleForm").form("clear");
						$("#save").show();
						$("#update").hide();
						createCombobox(null);
						$('#addRoleWin').window({   
							width:250,
							modal:true,
							title:'新增角色',
							iconCls:'icon-add'
						 });  
					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function() {
						var selected = getSelected();
						if(selected.defaultFlag != '1') {
							$.messager.confirm('操作提示', '您确定要删除该角色吗?', function(r) {
						        if (r) {
									$.ajax({
										url:curUrl + '/lc/manage/action/role!deleteRole.action',
										dataType:'json',
										type:'post',
										data:{id:selected.roleId},
										success:function(data) {
											if(data.status) {
												$("#roleTable").datagrid("reload");
												$.messager.show({
													title:"系统提示",
													msg:"成功删除 【" + selected["roleName"]+ "】"
												});
											}
											
										}
									});
						        }
						     });
						} else {
							$.messager.alert("系统提示","默认角色不能删除");
						}
					}
				},'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						var selected = getSelected();
						if(selected == null) {
							return false;
						}
						createCombobox(selected["isValid"]);
						$("#roleId").val(selected["roleId"]);
						$("#roleName").val(selected["roleName"]);
						$("#userType").combobox("setValue",selected["userType"]);
						$("#userType").combobox("disable");
						$("#remark").val(selected["remark"]);
						$("#isValid").combobox("setValue", selected["isValid"]);
						$("#defaultFlag").combobox("setValue", selected["defaultFlag"]);
						if(selected.defaultFlag == '1') {
							$("#isValid").combobox("disable");
							$("#defaultFlag").combobox("disable");
						}
						$("#save").hide();
						$("#update").show();
						$('#addRoleWin').window({   
							width:250,
							modal:true,
							title:'修改角色',
							iconCls:'icon-edit'
						 });  
					}
				},'-',{
					text:'资源授权',
					iconCls:'icon-ok',
					handler:function(){
						var selected = getSelected();
						if(selected == null) {
							return false;
						} else {
	
							$("#grantingRes").datagrid({
								url:curUrl + '/lc/manage/action/resource!loadResources.action?permissionType=1&isValid=1&id='+selected.roleId,
						        nowrap : true,  
						        striped : true,  
						        collapsible : true,
						        singleSelect : false,
						        remoteSort : false,  
						        loadMsg : '数据装载中......',  
						        onLoadError : function() {  
						           alert('数据加载失败!');  
						        },
						        onLoadSuccess:function(data){
						        	if($("input[name='resId']").length == $("input:checked[name='resId']").length) {
										$("#selectAll").attr("checked", true);
						        	}
							     },
							    idField:'resId',   
								columns:[[
									 {field:'resId', title:"<input type='checkbox' id='selectAll' onclick='selectAll()'/>",width:30,
											formatter:function(value, rowData, rowIndex){
									 		var html = "<input type='checkbox' name='resId' value='" + value + "'"
									 		if(rowData.isCheck > 0) {
												html += ' checked ';
									 		}
									 		html += " />";
											return html;
										}
									 },      
									 {field:'resName',title:'资源名',width:180},
									 {field:'resValue',title:'资源地址',width:320},
									 {field:'permission',title:'权限值',width:150}
								]]
							});

							$("#grantRes").window({
								width:750,
								height:400,
								modal:true
							});
						}
					}
				},'-',{
					text:'菜单授权',
					iconCls:'icon-ok',
					handler:function(){
						var selected = getSelected();
						if(selected == null) {
							return false;
						} else {
							var menusArr = 
								$.ajax({
								url : curUrl + "/lc/manage/action/menu!loadMenuTree.action",
								type : "post",
								async : false,
								data : {
									roleId : selected.roleId
								}
							}).responseText;
							var menusJson = $.parseJSON(menusArr);

							var menusTree = [];
							var rootChecked = true;
							for(var i = 0; i < menusJson.length; i++) {
								var menuJson = menusJson[i];
								
								var id = menuJson.menuId;
								var text = menuJson.menuName;
								var rownum = menuJson.rowNum;
								var checkedStr = menuJson.checked;
								var checked = true;;
								if(checkedStr+'' == 'false') {
									rootChecked = false;
									checked = false;
								}
								var menu = [];
								var state = "closed";
								if(menuJson.menuLevel == '1') {
									var iconCls = "icon-treefolde";
									menusTree[rownum] = {"id":id,"text":text,"state":state,"attributes":{"level" : 1},"iconCls":iconCls,"children":menu};
								} else if(menuJson.menuLevel == '2') {
									var iconCls = "icon-treefile";
									menu = menusTree[rownum].children;
									menu.push({"id":id,"text":text,"state":state,"attributes":{"level" : 2},"iconCls":iconCls,"checked":checked});
									menusTree[rownum].children = menu;
								}
							}

							var menusData = [];
							menusData.push({"id":"0","text":"菜单列表","state":"open","attributes":{"level" : 0},"iconCls":"icon-treefolde","children":menusTree});
							
							var loadSuccess = 'N';
							$("#grantingMenu").tree({
								data : menusData,
								checkbox : true,
								onLoadSuccess : function(node, data) {
									loadSuccess = 'Y';
								},
								onCheck : function(node, checked) {
									if(loadSuccess == 'Y') {
										$("#grantingMenu").tree("expand", node.target);
									}
								}
							});
							
							$("#grantMenu").window({
								width:300,
								height:400,
								modal:true
							});
						}
					}
				}
				]
			});

			$("#save").click(function(){
				if(!validateForm()) {
					return;
				}
				$.ajax({
					url : curUrl +'/lc/manage/action/role!saveRole.action',
					dataType:'json',
					type:'post',
					data:$("#addRoleForm").serialize(),
					success:function(data){
						$('#addRoleWin').window('close');
						if(data.status) {
							$("#roleTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"添加角色成功"
							});
						}
					}
				});
			});

			$("#update").click(function(){
				$("#userType").combobox("enable");
				$("#isValid").combobox("enable");
				$("#defaultFlag").combobox("enable");
				if(!validateForm()) {
					return;
				}
				var selected = getSelected();
				$.ajax({
					url : curUrl +'/lc/manage/action/role!updateRole.action',
					dataType:'json',
					type:'post',
					data:$("#addRoleForm").serialize(),
					success:function(data){
						$('#addRoleWin').window('close');
						if(data.status) {
							$("#roleTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"成功更新 【" + selected["roleName"]+ "】角色"
							});
						}
					}
				});
			});

			displayMsg();  
		});

		function displayMsg(obj) {  
			$('#roleTable').datagrid('getPager').pagination({  
		       displayMsg : '当前显示从{from}到{to}共{total}记录'  
		    });  
		}  

		// 创建下拉列表
		function createCombobox(isValid) {
			 $('#roleName').validatebox({   
				    required:true,
				    missingMessage:"该字段为必填项"
				}); 
			$("#userType").combobox({
				editable:false,
				valueField:'value',
                textField:'name',
                width:200,
				data:[{name:'管理员',value:'1', selected:true},{name:'代理商',value:'3'},{name:'供货商',value:'2'}]
			});

			$("#isValid").combobox({
				editable:false,
				valueField:'value',
                textField:'name',
                width:200,
				data:[{name:'有效',value:'1', selected:true},{name:'无效',value:'0'}],
				onSelect:function(record) {
				if(record.value == '0') {
					$("#defaultFlag").combobox({
						editable:false,
						valueField:'value',
		                textField:'name',
		                width:200,
		                data:[{name:'否',value:'0', selected:true}],
					});
				} else {
					$("#defaultFlag").combobox({
						editable:false,
						valueField:'value',
		                textField:'name',
		                width:200,
		                data:[{name:'是',value:'1', selected:true},{name:'否',value:'0'}],
					});
				}
			}
			});

			if(isValid == '0') {
				$("#defaultFlag").combobox({
					editable:false,
					valueField:'value',
	                textField:'name',
	                width:200,
	                data:[{name:'否',value:'0',selected:true}],
				});
			} else {
				$("#defaultFlag").combobox({
					editable:false,
					valueField:'value',
	                textField:'name',
	                width:200,
	                data:[{name:'是',value:'1', selected:true},{name:'否',value:'0'}],
				});
			}

		}

		function validateForm() {
			var flag = true;
			if(!$("#roleName").validatebox("isValid")) {
				flag = false;
			}
			return flag;
		}
		
		function getSelected() {
			var selectedId = $("input:checked[name='roleId']");
			if(selectedId.length == 0) {
				$.messager.alert("系统提示","您还没选择角色，请选择一条记录");
				return null;
			} else {
				var rowIndex = $("#roleTable").datagrid("getRowIndex", $(selectedId).val());
				var rows = $("#roleTable").datagrid("getRows");
				return rows[rowIndex];
			}
		}

		function updateDefaultRole(roleId, userType){
			var rowIndex = $("#roleTable").datagrid("getRowIndex", roleId);
			var rows = $("#roleTable").datagrid("getRows");
			var selected =  rows[rowIndex];
			$.ajax({
				url : curUrl +'/lc/manage/action/role!updateDefaultRole.action',
				dataType:'json',
				type:'post',
				data:{roleId : roleId, userType : userType},
				success:function(data){
					if(data.status) {
						$("#roleTable").datagrid("reload");
						$.messager.show({
							title:"系统提示",
							msg:"成功更新 【" + selected["roleName"]+ "】角色"
						});
					}
				}
			});
		}

		//开始提交到后台分配角色
		function grantRes(){
			var resIds="";
			$("input:checked[name='resId']").each(function(){
				resIds += $(this).val() + ",";
			});	
			
			resIds = resIds.substring(0,resIds.length-1);
			var roleId = getSelected()['roleId'];
			$.ajax({
				url:curUrl + '/lc/manage/action/role!grantRes.action',
				data:{roleId:roleId,resIds:resIds},
				type:'post',
				dataType:'json',
				success:function(data) {
					if(data.status) {
						$("#grantRes").window("close");
						$.messager.show({title:"系统提示",msg:"分配资源成功"});
					}
				}
			})
		}
		
		function cancelRes() {
			$("#grantRes").window('close');
		}

		//开始提交到后台分配角色
		function grantMenu(){
			var menuIds="";
			var root = $("#grantingMenu").tree("find", "0");
			var roots = $("#grantingMenu").tree("getChildren", root.target);
			for(var i = 0; i < roots.length; i++) {
				if(roots[i].attributes.level == 1) {
					var isCheck = roots[i].checked;
					var childs = $("#grantingMenu").tree("getChildren", roots[i].target);
					for(var j = 0; j < childs.length; j ++) {
						if(childs[j].checked) {
							isCheck = true;
							menuIds += childs[j].id + ","
						}
					}
					if(isCheck) {
						menuIds += roots[i].id + ","
					}
				}
			}
			menuIds = menuIds.substring(0,menuIds.length-1);
			var roleId = getSelected()['roleId'];
			$.ajax({
				url:curUrl + '/lc/manage/action/role!grantMenu.action',
				data:{roleId:roleId,menuIds:menuIds},
				type:'post',
				dataType:'json',
				success:function(data) {
					if(data.status) {
						$("#grantMenu").window("close");
						$.messager.show({title:"系统提示",msg:"分配菜单成功"});
					}
				}
			})
		}
		
		function cancelMenu() {
			$("#grantMenu").window('close');
		}
		
		function selectAll(){
			var checked = true;
			if($("#selectAll").attr("checked")) {
				checked = true;
			} else {
				checked = false;
			}

			$("input[name='resId']").attr("checked", checked);
		}
		