<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="url.jsp"%>
<%
	String menu = request.getParameter("menu");
	//if(menu==null){
	//	menu="1";
	//}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/common.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/head.css" type="text/css" media="screen" />
		<script type="text/javascript">
			function AddFavorite(title){
				var url=window.location.href;
				try
				{
					window.external.addFavorite(url,title);
				}
				catch (e)
				{
					try
					{
						window.sidebar.addPanel(title, url, "");
					}
					catch (e)
					{
						alert("加入收藏失败，请使用Ctrl+D进行添加");
					}
				}
			}

			function menuHit(){
				var obj=document.getElementById("menu_"+"<%=menu%>");
				obj.className="cur";
			}

			function showLoginBox(){
				document.getElementById("login_box").className="show";
			}
			function hideLoginBox(){
				document.getElementById("login_box").className="hide";
			}

			function login(){
				if(document.getElementById("username").value.indexOf("用户名")!=-1){
					alert("请正确输入用户名");
					return false;
				}
				if(document.getElementById("password").value.indexOf("密码")!=-1){
					alert("请正确输入密码");
					return false;
				}
				//document.location.href="<%=curUrl%>/b2b/display/jsp/main.jsp";
				document.getElementById("login_form").submit();
			}

			function trim(){
				return this.replace(/(^\s*)|(\s*$)/g,"");
			}

			function hideDis(){
				document.getElementById("password_dis").className="password_dis_hide";
			}

			function showDis(obj){
				if(obj.value==""){
					document.getElementById("password_dis").className="password_dis";
				}
			}

			
		</script>
	</head>
	<body onload="menuHit()">
	<!--头部-->
		<div>
			<div class="toplink">
				<div class="content_width topdiv">
					<div class="right">
						<span class="login_name">admin</span> 
						<span>你好，欢迎光临南网沃店</span>
						<a class="to_back_manage" href="<%=curUrl %>/lc/display/jsp/manage-bi.jsp">管理中心</a>
						<a id="login_a" href="###" onclick="showLoginBox()">[登录]</a>
						<a href="###" target="_blank">[注册]</a>
						<a href="<%=curUrl%>/lc/manage/jsp/login.jsp">注销</a>
						<a href="<%=curUrl%>/lc/display/jsp/pro-cart.jsp" class="cart"><b></b>购物车</a>
					</div>
					<br class="clear"/>
					
					<div id="login_box">
						<a class="close" onclick="hideLoginBox()"></a>
						<form action="###" method="post" id="login_form">
						<ul>
							<li><input id="username" type="text" name="username" value="用户名" onfocus="if(value=='用户名') {value='';this.style.color='#333'}" onblur="if (value=='') {value='用户名';this.style.color='#999'}"/></li>
							<li><input id="password" type="password" name="password" onfocus="hideDis()" onblur="showDis(this)"/></li>
							<li><a href="###" id="login_btn" onclick="login()">登录</a></li>
							<li id="password_dis" class="password_dis"><span style="color: rgb(153, 153, 153);">密码</span></li>
						</ul>
						<span class="clear"></span>
						</form>
					</div>
				</div>
			</div>
			<div>
				<div class="content_width">
					<div class="left logo">
						<a href="<%=curUrl%>/lc/display/jsp/index.jsp">
							<!-- <img src="<==%=resourceUrl%==>/b2b/display/resources/img/my/unicom-logo.png" alt="联通" width="72px"/> -->
							<img src="<%=curUrl%>/lc/display/resources/img/my/unicom-logo.png" alt="联通"/>
						</a>
					</div>
					<div class="header">
						<ul class="right header_menu">
						    <li id="menu_1"><a href="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1"><span>首页</span></a></li>
						    <li id="menu_2"><a href="<%=curUrl%>/lc/display/jsp/industrial.jsp?menu=2"><span>行业应用</span></a></li>
						    <li id="menu_3"><a href="<%=curUrl%>/lc/display/jsp/pro-list.jsp?menu=3"><span>主推机型</span></a></li>			
						    <li id="menu_4"><a href="<%=curUrl%>/lc/display/jsp/manage-bi.jsp?menu=4"><span>数据分析</span></a></li>
						    <li id="menu_5"><a href="<%=curUrl%>/lc/display/jsp/pro-list-fitting.jsp?menu=5"><span>配件</span></a></li>
						    <li id="menu_6"><a href="<%=curUrl%>/lc/display/jsp/seckill.jsp?menu=6"><span>秒杀</span></a></li>
						    <li id="menu_7"><a href="<%=curUrl%>/lc/display/jsp/integration.jsp?menu=7"><span>积分商城</span></a></li>
						    <li id="menu_8"><a href="<%=curUrl%>/lc/display/jsp/service.jsp?menu=8"><span>服务支持</span></a></li>
						    <!-- 
						    <li><a href="#"><span>我的沃盟</span></a></li>
						     -->
						</ul>
						
						<!-- 
						<ul class="right header_menu">
							<li><a href="#"><span style="font-size:20px;font-weight:bold;color:yellow">黄金周特卖</span></a></li>
						</ul>
						-->
						<br class="clear"/>
					</div>
					<span class="clear"></span>
				</div>
			</div>
		</div>
		<!--头部结束--> 
	</body>
</html>