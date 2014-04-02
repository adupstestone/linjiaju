<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
<head>

	<title>静态化管理</title>
	<link href="<%=curUrl%>/app/lc/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
		<link href="<%=curUrl%>/app/lc/manage/resources/css/my/htmlModule.css" rel="stylesheet" type="text/css" />
		<style type="text/css" >
	.common_out_div #brandShow ul li a {
    color: #426ab3;
    font-family: Microsoft Yahei;
    font-size: 15px;
}
		</style>
</head>

<body >
					<div class="common_out_div">
		<br class="clear"/>
		<div>
			<label class='left'>页面分类：</label>
			<div class="left" id="brandShow"><ul>
			
			<li class="left"><a id="1369221744692" name="CESS"  href="static-all.jsp">生成全部</a></li>
			<li class="left"><a id="1369221744692" name="CESS" href="static-index.jsp" >首页</a></li>
			<li class="left"><a id="1369221744692" name="CESS" href="static-main.jsp">主页</a></li>
			<li class="left"><a id="1369221744692" name="CESS" href="static-phone.jsp">主推机型</a></li>
			<li class="left"><a id="1369221744692" name="CESS" href="static-seckill.jsp">秒杀</a></li>
			</ul></div>
		</div>
		<br class="clear"/>
	</div>
</body>
</html> 