$(function(){
	//加载主菜单
		$("#mainMenuTable").datagrid({
			url:curUrl + '/lc/manage/action/menu!loadMenus.action?menuId=0',
	        nowrap : true,  
	        striped : true,  
	        collapsible : true,
	        singleSelect : true,
	        remoteSort : false,
	        rownumbers : true,
	        loadMsg : '数据装载中......',  
	        onLoadError : function() {  
	           alert('数据加载失败!');  
	        },
	        onLoadSuccess : function(data) {
	        	$("input[name='mainMenuId']:eq(0)").attr("checked", true);
	        	var rows = $("#mainMenuTable").datagrid("getRows");
	        	loadMenuTable(rows[0].menuId)
	        },
	        onSelect : function(rowIndex, rowData){
	        	$("input[name='mainMenuId']:eq(" + rowIndex + ")").attr("checked", true);
	        	loadMenuTable(rowData.menuId)
	 		},
		    idField:'menuId',   
			columns:[[
				 {field:'parentId',hidden:true},
				 {field:'menuUrl',hidden:true},
				 {field:'menuLevel',hidden:true},
				 {field:'menuDesc',hidden:true},
				 {field:'menuId',width:30,title:"选择",
						formatter:function(value, rowData, rowIndex) {
						var html = "<input type='radio' name='mainMenuId' value='" + value + "'/>";
						return html;
			 		}
			 	 },   
				 {field:'menuName',title:'菜单名称',width:120,align : 'center'},
				 {field:'menuOrder',title:'加载顺序',width:80,align : 'center'},
				 {field:'isValid',title:'状态',width:50,align : 'center',
					 formatter:function(value, rowData, rowIndex){
						if(value =='1') {
							return '<span style="color:green;">生效</span>'
						} else if(value =='0') { 
							return '<span style="color:red;">失效</span>'
						}
					 }
				 }
			]],
			toolbar:[
			{
				text:'新增',
				iconCls:'icon-add',
				handler:function() {
					
					$("#addMenuForm").form("clear");
					
					$("#save").show();
					$("#update").hide();
					
					$("#menuLevel").val('1');
					$("#parentId").val('0');
					$("#menuUrl1").show();
					$("#menuUrl2").hide();
					
					createCombobox();
					
					$('#addMenuWin').window({   
						width:250,
						modal:true,
						title:'新增主菜单',
						iconCls:'icon-add'
					 });  
				}
			},'-',{
				text:'删除',
				iconCls:'icon-cancel',
				handler:function() {
					var selected = getSelectedMainMenu();
					if(selected != null) {
						$.messager.confirm('操作提示', '您确定要删除该主菜单吗?', function(r) {
					        if (r) {
					        	$.ajax({
									url:curUrl + '/lc/manage/action/menu!deleteMenu.action',
									dataType:'json',
									type:'post',
									data:{menuId:selected.menuId, menuLevel:selected.menuLevel},
									success:function(data) {
										if(data.status) {
											$("#mainMenuTable").datagrid("reload");
											$.messager.show({
												title:"系统提示",
												msg:"成功删除 【" + selected["menuName"]+ "】"
											});
										}
									}
								});
					        }
						});
					
					} 
				}
			},'-',{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					var selected = getSelectedMainMenu();
					if(selected != null) {
						$("#save").hide();
						$("#update").show();
						
						$("#menuLevel").val(selected.menuLevel);
						$("#parentId").val(selected.parentId);
						$("#menuId").val(selected.menuId);
						$("#menuName").val(selected.menuName);
						$("#menuUrl1").val(selected.menuUrl);
						$("#menuOrder").val(selected.menuOrder);
						$("#menuDesc").val(selected.menuDesc);
						
						$("#menuUrl1").show();
						$("#menuUrl2").hide();
						
						createCombobox();
						
						$("#isValid").combobox("setValue", selected.isValid);
						
						$('#addMenuWin').window({   
							width:250,
							modal:true,
							title:'修改主菜单',
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
			var menuLevel = $("#menuLevel").val();
			$.ajax({
				url : curUrl +'/lc/manage/action/menu!saveMenu.action',
				dataType:'json',
				type:'post',
				data:$("#addMenuForm").serialize(),
				success:function(data){
					$('#addMenuWin').window('close');
					if(data.status) {
						if(menuLevel == '1') {
							$("#mainMenuTable").datagrid("reload");
						} else if(menuLevel == '2') {
							$("#menuTable").datagrid("reload");
						}
						$.messager.show({
							title:"系统提示",
							msg:"添加菜单成功"
						});
					}
				}
			});
		});

		$("#update").click(function(){
			if(!validateForm()) {
				return;
			}
			var menuLevel = $("#menuLevel").val();
			var selected;
			if(menuLevel == '1') {
				selected = getSelectedMainMenu();
			} else if(menuLevel == '2') {
				selected = getSelectedMenu();
			}
			
			$.ajax({
				url : curUrl +'/lc/manage/action/menu!updateMenu.action',
				dataType:'json',
				type:'post',
				data:$("#addMenuForm").serialize(),
				success:function(data){
					$('#addMenuWin').window('close');
					if(data.status) {
						if(menuLevel == '1') {
							$("#mainMenuTable").datagrid("reload");
						} else if(menuLevel == '2') {
							$("#menuTable").datagrid("reload");
						}
						$.messager.show({
							title:"系统提示",
							msg:"成功更新 【" + selected["menuName"]+ "】菜单"
						});
					}
				}
			});
		});
			
	});
	
	function loadMenuTable(parentId) {
		$("#menuTable").datagrid({
			url:curUrl + '/lc/manage/action/menu!loadMenus.action?menuId='+parentId,
	        nowrap : true,  
	        striped : true,  
	        collapsible : true,
	        singleSelect : true,
	        remoteSort : false, 
	        rownumbers : true,
	        loadMsg : '数据装载中......',  
	        onLoadError : function() {  
	           alert('数据加载失败!');  
	        },
	        onSelect : function(rowIndex, rowData){
	        	$("input[name='menuId']:eq(" + rowIndex + ")").attr("checked", true);
	 		},
		    idField:'menuId',   
			columns:[[
				 {field:'parentId',hidden:true},
				 {field:'menuLevel',hidden:true},
				 {field:'menuId',width:30,title:"选择",
						formatter:function(value, rowData, rowIndex) {
						var html = "<input type='radio' name='menuId' value='" + value + "'/>";
						return html;
			 		}
			 	 },   
				 {field:'menuName',title:'菜单名称',width:120,align : 'center'},
				 {field:'menuUrl',title:'菜单地址',width:320,align : 'center'},
				 {field:'menuDesc',title:'菜单描述',width:120,align : 'center'},
				 {field:'menuOrder',title:'加载顺序',width:80,align : 'center'},
				 {field:'isValid',title:'状态',width:50,align : 'center',
					 formatter:function(value, rowData, rowIndex){
						if(value =='1') {
							return '<span style="color:green;">生效</span>'
						} else if(value =='0') { 
							return '<span style="color:red;">失效</span>'
						}
					 }
				 }
			]],
			toolbar:[
			{
				text:'新增',
				iconCls:'icon-add',
				handler:function() {
					var mainSelected = getSelectedMainMenu();
					if(mainSelected != null) {
						$("#addMenuForm").form("clear");
						
						$("#save").show();
						$("#update").hide();
						
						$("#menuLevel").val('2');
						$("#parentId").val(mainSelected.menuId);
						$("#menuUrl1").hide();
						$("#menuUrl2").show();
						
						createCombobox();
						
						$('#addMenuWin').window({   
							width:250,
							modal:true,
							title:'新增子菜单',
							iconCls:'icon-add'
						 });  
					}
					
				}
			},'-',{
				text:'删除',
				iconCls:'icon-cancel',
				handler:function() {
					var selected = getSelectedMenu();
					if(selected != null) {
						$.messager.confirm('操作提示', '您确定要删除该子菜单吗?', function(r) {
					        if (r) {
								$.ajax({
									url:curUrl + '/lc/manage/action/menu!deleteMenu.action',
									dataType:'json',
									type:'post',
									data:{menuId:selected.menuId, menuLevel:selected.menuLevel},
									success:function(data) {
										if(data.status) {
											$("#menuTable").datagrid("reload");
											$.messager.show({
												title:"系统提示",
												msg:"成功删除 【" + selected["menuName"]+ "】"
											});
										}
									}
								});
					        }
						});
					} 
				}
			},'-',{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					var selected = getSelectedMenu();
					if(selected != null) {
						$("#save").hide();
						$("#update").show();
						
						$("#menuLevel").val(selected.menuLevel);
						$("#parentId").val(selected.parentId);
						$("#menuId").val(selected.menuId);
						$("#menuName").val(selected.menuName);
						$("#menuUrl2").val(selected.menuUrl);
						$("#menuOrder").val(selected.menuOrder);
						$("#menuDesc").val(selected.menuDesc);
						
						$("#menuUrl1").hide();
						$("#menuUrl2").show();
						
						createCombobox();
						
						$("#isValid").combobox("setValue", selected.isValid);
						
						$('#addMenuWin').window({   
							width:250,
							modal:true,
							title:'修改子菜单',
							iconCls:'icon-edit'
						 });  
					}
				}
			}
			]
		});
		
	}
	
	function getSelectedMenu() {
		var selectedId = $("input:checked[name='menuId']");
		if(selectedId.length == 0) {
			$.messager.alert("系统提示","您还没选择子菜单，请选择一条记录");
			return null;
		} else {
			var rowIndex = $("#menuTable").datagrid("getRowIndex", $(selectedId).val());
			var rows = $("#menuTable").datagrid("getRows");
			return rows[rowIndex];
		}
	}
	
	function getSelectedMainMenu() {
		var selectedId = $("input:checked[name='mainMenuId']");
		if(selectedId.length == 0) {
			$.messager.alert("系统提示","您还没选择子菜单，请选择一条记录");
			return null;
		} else {
			var rowIndex = $("#mainMenuTable").datagrid("getRowIndex", $(selectedId).val());
			var rows = $("#mainMenuTable").datagrid("getRows");
			return rows[rowIndex];
		}
	}
	
	 $.extend($.fn.validatebox.defaults.rules, {   
	      validateOrder: {   
	            validator: function(value, param){
          		return /^[0-9]+$/.test(value);
	            },   
	         message: '该字段必须为数字'  
	     }
		});  
	
	function createCombobox() {
		$('#menuName').validatebox({   
		    required:true,
		    missingMessage:"该字段为必填项"
		}); 
		
		$('#menuUrl2').validatebox({   
			required:true,
		    missingMessage:"该字段为必填项"
		}); 

	 	$('#menuOrder').validatebox({
	 		required:true,
			missingMessage:"该字段为必填项",
	 		validType : "validateOrder"
		}); 
		
		$("#isValid").combobox({
			editable:false,
			valueField:'value',
            textField:'name',
            width:200,
			data:[{name:'有效',value:'1', selected:true},{name:'无效',value:'0'}]
		});
	}
	
	function validateForm() {
		var flag = true;
		if(!$("#menuName").validatebox("isValid")) {
			flag = false;
		}
		var menuLevel = $("#menuLevel").val();
		if(menuLevel == '2') {
			if(!$("#menuUrl2").validatebox("isValid")) {
				flag = false;
			}
		}
		if(!$("#menuOrder").validatebox("isValid")) {
			flag = false;
		}
		return flag;
	}