var rootUrl = curUrl + "/lc/manage/action/group!loadGroups.action?parentId=0&groupType=0"; 
		$(function(){
			$("#groupTable").treegrid({
				url:rootUrl,
				treeField:'text',
				idField:'id',
				loadMsg : '数据装载中......',  
				onBeforeExpand:function(row){
					var url = curUrl + "/lc/manage/action/group!loadGroups.action?parentId=" + row.id;
					$('#groupTable').treegrid('options').url = url;
         		},
				columns:[[
					 {field:'id',width:30,title:"<input type='radio' name='groupId' value='0'/>",
							formatter:function(value, rowData, rowIndex) {
								var html = "<input type='radio' name='groupId' value='" + value + "'/>"
								return html;
					 		}
					 },  
					 {field:'parentId',hidden:true},
					 {field:'text',title:'组织架构名',width:300},
					 {field:'groupOrder',title:'级类顺序',width:80,align : 'center'},
					 {field:'groupLevel',title:'组织架构级别',width:100,align : 'center',
						 formatter:function(value, rowData, rowIndex){
							return value + "级";
						 }
					 },
					 {field:'createDate',title:'创建时间',width:100,align : 'center',
						 formatter:function(value, rowData, rowIndex) {
							return value;
						 }
					 },
					 {field:'updateDate',title:'更新时间',width:100,align : 'center',
						 formatter:function(value, rowData, rowIndex) {
							return value; 
						 }
					 },
					 {field:'remark',title:'备注',width:280,align : 'center'}
				  
				]],
				toolbar:[
				{
					text:'新增',
					iconCls:'icon-add',
					handler:function() {
						$("#addGroupForm").form("clear"); //清楚表单的数据

						var selected = getSelected();
						var groupLevel = '1';
						
						if(selected == null){
							$("#parentId").val('0');
						}else {
							groupLevel = selected['groupLevel']; 
							groupLevel = parseInt(groupLevel) + 1;
							$("#parentId").val(selected['id']);
						}
						
						createCombobox(groupLevel);


						$("#save").show();
						$("#update").hide();
						
						$("#addGroupWin").window({
							width:250,
							modal:true,
							title:'新增组织架构',
							iconCls:'icon-add'
						});
						
					}
				}
// 				,'-',{
// 					text:'删除',
// 					iconCls:'icon-cancel',
// 					handler:function() {
// 						var selected = getSelected();
// 						if(selected != null) {
// 							$.ajax({
// 								url:curUrl + '/lc/manage/action/group!deleteGroup.action',
// 								dataType:'json',
// 								type:'post',
// 								data:{id : selected.id},
// 								success:function(data) {
// 									if(data.status) {
// 										if(selected['parentId'] == '0') {
// 											$('#groupTable').treegrid('options').url = rootUrl;
// 											$("#groupTable").treegrid("reload");
// 										} else {
// 											$("#groupTable").treegrid("reload", selected['parentId']);
// 										}
// 										$.messager.show({
// 											title:"系统提示",
// 											msg:"成功删除 【" + selected["text"]+ "】"
// 										});
// 									}
// 								}
// 							});
// 						} else {
// 							$.messager.alert("系统提示","请选择一条记录进行删除")
// 						}
// 					}
// 				}
				,'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						var selected = getSelected();
						if(selected == null){
							$.messager.alert("系统提示","请选择一条资源进行修改");
						}else {
							var groupLevel = selected['groupLevel'];
							createCombobox(groupLevel);
							$("#groupId").val(selected['id']); 
							$("#parentId").val(selected['parentId']); 
							$("#groupOrder").val(selected['groupOrder']); 
							$("#groupName").val(selected['text']); 
							$("#remark").val(selected['remark']);
							
							$("#save").hide();
							$("#update").show();

							$("#addGroupWin").window({
								width:250,
								modal:true,
								title:'修改组织架构',
								iconCls:'icon-edit'
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
					url:curUrl + '/lc/manage/action/group!saveGroup.action',
					dataType:'json',
					type:'post',
					data:$("#addGroupForm").serialize(),
					success:function(data) {
						$("#addGroupWin").window("close");
						if(data.status) {
							var selected = getSelected();
							if(selected == null) {
								$('#groupTable').treegrid('options').url = rootUrl;
								$("#groupTable").treegrid("reload");
							} else {
								$("#groupTable").treegrid("reload", selected['id']);								
							}
							$.messager.show({
								title:"系统提示",
								msg:"添加组织架构成功"
							});
						}
					}
				});
			});

			$("#update").click(function(){
				if(!validateForm()) {
					return;
				}
				$.ajax({
					url:curUrl + '/lc/manage/action/group!updateGroup.action',
					dataType:'json',
					type:'post',
					data:$("#addGroupForm").serialize(),
					success:function(data) {
						$("#addGroupWin").window("close");
						if(data.status) {
							var selected = getSelected();
							if(selected['parentId'] == '0') {
								$('#groupTable').treegrid('options').url = rootUrl;
								$("#groupTable").treegrid("reload");
							} else {
								$("#groupTable").treegrid("reload", selected['parentId']);
							}
							
							$.messager.show({
								title:"系统提示",
								msg:"成功更新 【" + selected["text"]+ "】组织架构"
							});
						}
					}
				});
			});
		});
		
		 $.extend($.fn.validatebox.defaults.rules, {   
		      validateOrder: {   
		            validator: function(value, param){
	            		return /^[0-9]+$/.test(value);
		            },   
		         message: '该字段必须为数字'  
		     }
			});  


		// 创建下拉列表
		function createCombobox(groupLevel) {
			 $('#groupName').validatebox({   
				    required:true,
				    missingMessage:"该字段为必填项"
				}); 
			 $('#groupOrder').validatebox({   
				 required:true,
				 missingMessage:"该字段为必填项",
				 validType : "validateOrder"
				}); 

			 $("#groupLevel").combobox({
				valueField:'value',
                textField:'name',
                width:200,
				data:[{name:groupLevel + '级',value:groupLevel,selected:true}]
			});
		}

		function getSelected() {
			var selectedId = $("input:checked[name='groupId']").val();
			if(selectedId == '0') {
				return null;
			} else {
				return $("#groupTable").treegrid("find", selectedId);
			}
		}

		function validateForm() {
			var flag = true;
			if(!$("#groupName").validatebox("isValid")) {
				flag = false;
			}
			if(!$("#groupOrder").validatebox("isValid")) {
				flag = false;
			}
			return flag;
		}
		