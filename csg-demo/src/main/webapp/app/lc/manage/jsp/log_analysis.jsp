<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
<head>

	<title>日志分析</title>
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
	
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
	<!--中文js  -->
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/locale/easyui-lang-zh_CN.js" type="text/javascript"></script> 
	
	<script type="text/javascript">
	
		$(function(){
			$('#selBybrand').click(function(){
				loading();
			});
			 loading();
		});  
		
			function loading(){
				$('#tt').datagrid({  
				       title : '分析列表',  
				       iconCls : 'icon-save',  
				       width : 'auto',  
				       height : 'auto',  
				       pageSize: 12,  
				       pageList : [ 12, 15],  
				       pageNumber : 1,
				       queryParams : {
				    	 "module" : $('#module').val(),
				    	 "userName" : $('#userName').val()
				       },
				       nowrap : true,  
				       striped : true,  
				       collapsible : true,  
				      // fitColumns : true,
				       url : curUrl+'/lc/manage/action/log!selectLogAnalysis.action',  
				       loadMsg : '数据装载中......',  
				       onLoadError : function() {  
				           alert('数据加载失败!');  
				       },  
				       sortName : 'access_time',  
				       sortOrder : 'desc',  
				       remoteSort : false,  
				       columns : [   [{  
				           title : 'user_id',  
				           field : 'user_id',  
				           width : '200',
				           hidden : true,
				           align : 'center'  
				       }, {  
				           title : '帐号',  
				           field : 'account',  
				           width : '100',  
				           align : 'center'  
				       }, {  
				           title : '用户名',  
				           field : 'name',  
				           width : '160',  
				           align : 'center'  
				       },{  
				           title : '操作时间',  
				           field : 'access_time',  
				           width : '150',  
				           align : 'center'  
				       },{  
				           title : 'IP',  
				           field : 'access_ip',  
				           width : '170',  
				           align : 'center'  
				       },{  
				           title : '类别',  
				           field : 'module',  
				           width : '200',  
				           align : 'center'
				       },{  
				           title : '操作',  
				           field : 'access_module',  
				           width : '130',  
				           align : 'center',
			        	   formatter:function(value,row,index){
	                 	  	   return  "<font style='color:red;'>"+row.access_module+"</red>";
	                   	   }
				       },{  
				           title : '详情',  
				           field : 'detail',  
				           width : '130',  
				           align : 'center',
				           formatter : function(value,row,index){
				        	   var title = "无";
				        	   if(row.detail != undefined){
				        		   title = row.detail;
				        	   }
				        	   //return "<a href='###' onclick='info(\""+title+"\")'>查看详情 </a>";
				        	   return "<a href='javascript:void(0)' onclick='info(\""+title+"\")' class='l-btn l-btn-plain'><span class='l-btn-left'><span class='l-btn-text icon-search' style='padding-left: 20px;'>查看详情</span></span></a>";
				           }
				        
				       }] ],  
				       pagination : true,  
				       rownumbers : true,  
				    });  
				    displayMsg(); 
			}
		
			function displayMsg() {  
			    $('#tt').datagrid('getPager').pagination({  
			       displayMsg : '当前显示从{from}到{to}共{total}记录'  
			    });  
			}  
			
			function info(title){
				$('#info').html(title);
				$('#info').window({   
					 width:300,   
					 height:200,   
					 modal:true ,
					 title:'查看详情',
					 iconCls:'icon-seach'
				  });
			}
			
			
	</script>
	
</head>

<body  class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	<div region="north" title="查询条件" style="width: 200px;height : 70px; font-weight: 20px;" >
				<table align="left" style="margin-top: 5px;">
					<tr>
						<td width="50" align="right">用户名：</td>
						<td width="200"><input type="text" id="userName"></input></td>
						<td width="50" align="right">类别：</td>
						<td width="200"><input type="text" id="module"></input></td>
						<td width="100" align="right"><a style="color:#fff;" href="###" class="but_red" id="selBybrand">查询</a></td>
					</tr>
				</table>
	</div>
	
	<div region="center">
		<table id="tt"></table>
	</div>
	
	<div id="info">
	</div>
</body>
</html>