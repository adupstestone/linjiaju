<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
<head>

	<title>日志监控</title>
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/themes/icon.css" rel="stylesheet" type="text/css" />
	
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery.easyui.min.js" type="text/javascript"></script>
	
	<!--中文js  -->
	<script type="text/javascript" src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/locale/easyui-lang-zh_CN.js"></script> 
	
	<script type="text/javascript">
	
		$(function(){
			$('#tt').datagrid({  
			       title : '监控列表',  
			       iconCls : 'icon-save',  
			       width : 'auto',  
			       height : 'auto',  
			       pageSize: 12,  
			       pageList : [ 12, 15],  
			       pageNumber : 1,
			       nowrap : true,  
			       striped : true,  
			       collapsible : true,  
			       url : curUrl+'/lc/manage/action/log!selectLogSur.action',  
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
			           width : '200',  
			           align : 'center'  
			       }, {  
			           title : '用户名',  
			           field : 'name',  
			           width : '200',  
			           align : 'center'  
			       },{  
			           title : '操作时间',  
			           field : 'access_time',  
			           width : '200',  
			           align : 'center'  
			       },{  
			           title : 'IP',  
			           field : 'access_ip',  
			           width : '200',  
			           align : 'center'  
			       },{  
			           title : '操作',  
			           field : ' ',  
			           width : '200',  
			           align : 'center',  
		        	   formatter:function(value,row,index){
                 	  	   return  "<font style='color:red;'>登录</red>";
                   	   }
			       }] ],  
			       pagination : true,  
			       rownumbers : true,  
			    });  
			    displayMsg();  
			});  
		
			function displayMsg() {  
			    $('#tt').datagrid('getPager').pagination({  
			       displayMsg : '当前显示从{from}到{to}共{total}记录'  
			    });  
			}  
			
	</script>
	
</head>

<body  class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
	<div region="north" style="width: 200px;height : 0px; font-weight: 20px;" >
	</div>
	
	<div region="center">
		<table id="tt"></table>
	</div>
	
</body>
</html>