$(function(){
			$("#resourceTable").datagrid({
				url:curUrl + '/lc/manage/action/resource!loadResources.action',
				pagination:true,
				pageSize:7,  
		        pageList : [ 7, 10, 15 ],  
		        nowrap : true,  
		        striped : true,  
		        collapsible : true,
		        singleSelect : true,
		        remoteSort : false,  
		        fitColumns : true,
		        loadMsg : '数据装载中......',  
		        onLoadError : function() {  
		           alert('数据加载失败!');  
		        },
		        onSelect : function(rowIndex, rowData){
		        	$("input[name='resId']:eq(" + rowIndex + ")").attr("checked", true);
		 		},
			    idField:'resId',   
				columns:[[
					 {field:'resId',width:30,title:"选择",
							formatter:function(value, rowData, rowIndex) {
							var html = "<input type='radio' name='resId' value='" + value + "'/>";
							return html;
				 		}
				 	 },   
					 {field:'resName',title:'资源名',width:120,align : 'center'},
					 {field:'resValue',title:'资源地址',width:230,align : 'center'},
					 {field:'permissionType',title:'访问类型',width:70,align : 'center',
						 formatter:function(value, rowData, rowIndex){
							if(value == '1') {
								return '权限';
							} else if(value == '2') {
								return '认证';
							}  else if(value == '3') {
								return '匿名';
							}
						 }
					 },
					 {field:'permission',title:'权限值',width:130,align : 'center'},
					 {field:'resOrder',title:'资源加载顺序',width:80,align : 'center'},
					 {field:'createDate',title:'创建时间',width:90,align : 'center',
						 formatter:function(value, rowData, rowIndex) {
							return value;
						 }
					 },
					 {field:'updateDate',title:'更新时间',width:100,align : 'center',
						 formatter:function(value, rowData, rowIndex) {
							return value;
						 }
					 },
					 {field:'isValid',title:'状态',width:50,align : 'center',
						 formatter:function(value, rowData, rowIndex){
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
						$("#addResForm").form("clear"); //清楚表单的数据

						createCombobox();

						$("#permission").attr('disabled', false);
						
						$("#save").show();
						$("#update").hide();
						
						$("#addResourceWin").window({
							width:450,
							modal:true,
							title:'新增资源',
							iconCls:'icon-add'
						});

					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function() {
						var selected = getSelected();
						if(selected != null) {
							$.messager.confirm('操作提示', '您确定要删除该资源吗?', function(r) {
						        if (r) {
									$.ajax({
										url:curUrl + '/lc/manage/action/resource!deleteResource.action',
										dataType:'json',
										type:'post',
										data:{id:selected.resId},
										success:function(data) {
											if(data.status) {
												$("#resourceTable").datagrid("reload");
												$.messager.show({
													title:"系统提示",
													msg:"成功删除 【" + selected["resName"]+ "】"
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
						var selected = getSelected();
						if(selected != null ) {
							createCombobox();
							
							$("#resId").val(selected['resId']);
							$("#resName").val(selected['resName']);
							$("#resValue").val(selected['resValue']);
							$("#permissionType").combobox("setValue",selected['permissionType']);
							$("#isValid").combobox("setValue", selected['isValid']);
							$("#permission").val(selected['permission']);
							$("#remark").val(selected['remark']);
							$("#resOrder").val(selected['resOrder']);

							if(selected['permissionType'] != '1') {
								$("#permission").attr('disabled', true);
							} else {
								$("#permission").attr('disabled', false);
							}
							
							$("#save").hide();
							$("#update").show();
							
							$("#addResourceWin").window({
								width:450,
								modal:true,
								title:'修改资源',
								iconCls:'icon-edit'
							});
						} 
					}
				}
				]
			});

			$("#save").click(function(){
				$("#permission").attr('disabled', false);
				if(!validateForm()) {
					return;
				}
				$.ajax({
					url:curUrl + '/lc/manage/action/resource!saveResource.action',
					dataType:'json',
					type:'post',
					data:$("#addResForm").serialize(),
					success:function(data) {
						$("#addResourceWin").window("close");
						if(data.status) {
							$("#resourceTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"添加资源成功"
							});
						}
					}
				});
			});
			
			$("#update").click(function(){
				$("#permission").attr('disabled', false);
				if(!validateForm()) {
					return;
				}
				var selected = getSelected();
				$.ajax({
					url:curUrl + '/lc/manage/action/resource!updateResource.action',
					dataType:'json',
					type:'post',
					data:$("#addResForm").serialize(),
					success:function(data) {
						$("#addResourceWin").window("close");
						if(data.status) {
							$("#resourceTable").datagrid("reload");
							$.messager.show({
								title:"系统提示",
								msg:"成功更新 【" + selected["resName"]+ "】资源"
							});
						}
					}
				});
			});

			displayMsg();  
			
		});

	function displayMsg() {  
	    $('#resourceTable').datagrid('getPager').pagination({  
	       displayMsg : '当前显示从{from}到{to}共{total}记录'  
	    });  
	}  


	function getSelected() {
		var selectedId = $("input:checked[name='resId']");
		if(selectedId.length == 0) {
			$.messager.alert("系统提示","您还没选择资源，请选择一条记录");
			return null;
		} else {
			var rowIndex = $("#resourceTable").datagrid("getRowIndex", $(selectedId).val());
			var rows = $("#resourceTable").datagrid("getRows");
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

	// 创建下拉列表
	function createCombobox() {
		 $('#resName').validatebox({   
			    required:true,
			    missingMessage:"该字段为必填项"
			}); 

		 $('#resValue').validatebox({   
			    required:true,
			    missingMessage:"该字段为必填项"
			}); 

		 $('#permission').validatebox({   
			    required:true,
			    missingMessage:"该字段为必填项"
			}); 

		 $('#resOrder').validatebox({   
			    required:true,
			    missingMessage:"该字段为必填项",
			    validType : "validateOrder"
			}); 
		
		$("#permissionType").combobox({
			editable:false,
			valueField:'value',
            textField:'name',
            width:200,
			data:[{name:'权限',value:'1',selected:true},{name:'认证',value:'2'},{name:'匿名',value:'3'}],
			onSelect:function(record) {
				if(record.value == '2') {
					$("#permission").val('authc');
					$('#permission').validatebox("validate");
					$("#permission").attr('disabled', true);
				} else if(record.value == '3') {
					$("#permission").val('anon');
					$('#permission').validatebox("validate");
					$("#permission").attr('disabled', true);
				} else {
					$("#permission").val('');
					$("#permission").attr('disabled', false);
					$('#permission').validatebox({   
					    required:true,
					    missingMessage:"该字段为必填项"
					}); 
				}
			}
		});
		$("#isValid").combobox({
			editable:false,
			valueField:'value',
            textField:'name',
            width:200,
			data:[{name:'生效',value:'1',selected:true},{name:'失效',value:'0'}]
		});
	}

	function validateForm() {
		var flag = true;
		if(!$("#resName").validatebox("isValid")) {
			flag = false;
		}
		if(!$("#resValue").validatebox("isValid")) {
			flag = false;
		}
		if(!$("#permission").validatebox("isValid")) {
			flag = false;
		}
		if(!$("#resOrder").validatebox("isValid")) {
			flag = false;
		}
		return flag;
	}