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
     				loadGroupDetailTable(node.id);
         		},
         		onLoadSuccess:function(node,data){
         			if(!loadSuccess) {
         				$("#groupTree").tree("select", $("#groupTree").tree("getRoots")[0].target);
         				loadGroupDetailTable($("#groupTree").tree("getRoots")[0].id);
         				loadSuccess = true;
         			}
         		}   
			});

			//保存明细
			$("#save").click(function(){
				if(!validateForm()) {
					return;
				}
				$.ajax({
					url : curUrl +'/lc/manage/action/groupDetail!saveGroupDetail.action',
					dataType:'json',
					type:'post',
					data:$("#addGroupDetailForm").serialize(),
					success:function(data){
						$('#addGroupDetailWin').window('close');
						if(data.status) {
							$("#groupDetailTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"添加组织架构分类成功"
							});
							
							$.ajax({
								url : solrUrl + deltaParam,
								type : "POST"	
							});
						}
					}
				});
			});

			//更新用户
			$("#update").click(function(){
				$("#userType").combobox("enable");
				if(!validateForm()) {
					return;
				}
				$.ajax({
					url : curUrl +'/lc/manage/action/groupDetail!updateGroupDetail.action',
					dataType:'json',
					type:'post',
					data:$("#addGroupDetailForm").serialize(),
					success:function(data){
						$('#addGroupDetailWin').window('close');
						if(data.status) {
							var selected = getSelected();
							$("#groupDetailTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"修改组织架构分类【" + selected["groupDetailName"] + "】成功"
							});
							
							$.ajax({
								url : solrUrl + deltaParam,
								type : "POST"	
							});
						}
					}
				});
			});

		});

		function loadGroupDetailTable(groupId) {
			$("#groupDetailTable").datagrid({
				url:curUrl + '/lc/manage/action/groupDetail!loadGroupDetails.action?groupId=' + groupId,
				pagination:true,
				pageSize:7,  
		        pageList : [ 7, 10, 15 ],  
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
		        	$("input[name='groupDetailId']:eq(" + rowIndex + ")").attr("checked", true);
		 		},
			    idField:'groupDetailId',   
				columns:[[
				     {field:'groupDetailId',width:30,title:"选择",
							formatter:function(value, rowData, rowIndex) {
							var html = "<input type='radio' name='groupDetailId' value='" + value + "'/>"
								return html;
				 			}
				 	 },    
				     {field:'groupId',hidden:true},
				     {field:'detailType',hidden:true},
					 {field:'groupDetailName',title:'分类名称',width:200,align : 'center'},
					 {field:'userType',title:'用户类型',width:100,align : 'center',formatter:function(value, rowData,rowIndex){
							if(value == '1') {
								return "管理员";
							} else if (value == '2') {
								return "供货商";
							} else if (value == '3') {
								return "代理商";
							}
						 }
					 },
					 {field:'createDate',title:'创建时间',width:100,align : 'center',formatter:function(value, rowData,rowIndex){
							return value;
						 }
					 },
					 {field:'updateDate',title:'更新时间',width:100,align : 'center',formatter:function(value, rowData,rowIndex){
							return value;
						 }
					 },
					 {field:'isValid',title:'状态',width:80,align : 'center',formatter:function(value, rowData, rowIndex){
						 if(value == '1') {
							 	var html = '<span style="color:green;">生效</span>';
								return html;
					 		}		 
							else if(value == '0') {
								var html = '<span style="color:red;">失效</span>';
								return html;
							}
						 }
					 }
					    
				]],
				toolbar:[
				{
					text:'新增',
					iconCls:'icon-add',
					handler:function(){
						var treeSelected = $("#groupTree").tree("getSelected");
						$("#addGroupDetailForm").form("clear");
						if(treeSelected != null) {
							$("#save").show();
							$("#update").hide();

							createCombobox();

							$("#groupId").val(treeSelected.id);
							
							$('#addGroupDetailWin').window({   
								width:250,
								modal:true,
								title:'新增组织架构分类',
								iconCls:'icon-add'
							 });  
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function(){
						var selected = getSelected();
						if(selected == null) {
							return false;
						}
						if(selected.isValid == '1') {
							$.messager.alert("系统提示","该组织架构分类已生效，不能删除");
							return;
						}
						$.messager.confirm('操作提示', '您确定要删除该组织架构分类吗?', function(r) {
					        if (r) {
					        	$.ajax({
									url:curUrl + '/lc/manage/action/groupDetail!deleteGroupDetail.action',
									dataType:'json',
									type:'post',
									data:{groupDetailId : selected.groupDetailId},
									success:function(data) {
										if(data.status) {
											var selected = getSelected();
											$("#groupDetailTable").datagrid("reload");
											$.messager.show({
												title:"系统提示",
												msg:"删除组织架构分类【" + selected["groupDetailName"] + "】成功"
											});
											
											$.ajax({
												url : solrUrl + deltaParam,
												type : "POST"	
											});
										}
									}
								});
					        }
					    });
						
					}
				},'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						var selected = getSelected();
						if(selected == null) {
							return false;
						}
						var treeSelected = $("#groupTree").tree("getSelected");
						$("#save").hide();
						$("#update").show();

						$("#groupDetailId").val(selected.groupDetailId);
						$("#groupDetailName").val(selected.groupDetailName);
						$("#detailType").val(selected.detailType);
						$("#groupId").val(treeSelected.id);

						
						createCombobox();
						$("#userType").combobox("setValue", selected.userType);
						$("#userType").combobox("disable");
						
						
						$('#addGroupDetailWin').window({   
							width:250,
							modal:true,
							title:'修改组织架构分类',
							iconCls:'icon-edit'
						 });  
					}
				}
				]
			});

			displayMsg();  
		
		}

		function displayMsg() {  
		    $('#groupDetailTable').datagrid('getPager').pagination({  
		       displayMsg : '当前显示从{from}到{to}共{total}记录'  
		    });  
		}  
		
		
		function getSelected() {
			var selectedId = $("input:checked[name='groupDetailId']");
			if(selectedId.length == 0) {
				$.messager.alert("系统提示","您还没选择组织架构明细，请选择一条记录");
				return null;
			} else {
				var rowIndex = $("#groupDetailTable").datagrid("getRowIndex", $(selectedId).val());
				var rows = $("#groupDetailTable").datagrid("getRows");
				return rows[rowIndex];
			}
		}

		function createCombobox() {
			 $('#groupDetailName').validatebox({   
				    required:true,
				    missingMessage:"该字段为必填项"
				}); 
			
			$("#userType").combobox({
				editable:false,
				valueField:'value',
                textField:'name',
                width:200,
				data:[{name:'管理员',value:'1',selected:true},{name:'供货商',value:'2'},{name:'代理商',value:'3'}]
			});

			$("#isValid").combobox({
				valueField:'value',
                textField:'name',
                width:200,
				data:[{name:'生效',value:'1',selected:true}]
			});
		}

		function validateForm() {
			var flag = true;
			if(!$("#groupDetailName").validatebox("isValid")) {
				flag = false;
			}
			return flag;
		}