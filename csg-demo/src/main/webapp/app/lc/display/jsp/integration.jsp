<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<%@include file="url.jsp" %>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
		<meta name="keywords" content="广东联通">
		<meta name="description" content="广东联通">
		
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/common.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/pro-list.css" type="text/css" media="screen" />
		
		<script src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			jQuery(function() {
				$("#brand_li .item_ul li a").click(function(){
					$("#brand_li .item_ul li a").removeClass("selected");
					$(this).addClass("selected");
				});

				$("#type_li .item_ul li a").click(function(){
					$("#type_li .item_ul li a").removeClass("selected");
					$(this).addClass("selected");
				});

				$(".buttons .add_cart").click(function(){
					window.location.href="<%=curUrl%>/lc/display/jsp/pro-buy-contract.jsp";
				});
				
				$(".buttons .to_compare").toggle(function(){
					$(this).addClass("checked");
				},function(){
					$(this).removeClass("checked");
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="content_width line"></div>
		<div class="outer_div">
			<div class="dir_title left">
				产品列表
			</div>
			
			<div class="search right">
				<input type="text"/>
				<b></b>
			</div>
			<br class="clear"/>
			<div class="filter">
				<ul>
					<li id="brand_li">
						<span class="title">品牌：</span>
						<ul class="item_ul">
							<li><a href="###" class="selected">不限</a></li>
							<li><a href="###">苹果</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">诺基亚</a></li>
							<li><a href="###">小米</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
							<li><a href="###">三星</a></li>
						</ul>
						<br class="clear"/>
					</li>
					<li id="type_li">
						<span class="title">种类：</span>
						<ul class="item_ul">
							<li><a href="###" class="selected">全部</a></li>
							<li><a href="###">电源</a></li>
							<li><a href="###">耳机</a></li>
							<li><a href="###">音箱</a></li>
							<li><a href="###">保护后盖</a></li>
							<li><a href="###">贴膜</a></li>
							<li><a href="###">挂饰</a></li>
							<li><a href="###">贴纸</a></li>
							<li><a href="###">支架与绕线器</a></li>
							<li><a href="###">服饰类</a></li>
							<li><a href="###">存储卡与读卡器</a></li>
							<li><a href="###">生活应用类</a></li>
							<li><a href="###">优惠套装</a></li>
							<li><a href="###">酷玩</a></li>
							<li><a href="###">每周新品</a></li>
							<li><a href="###">每周新品</a></li>
							<li><a href="###">每周新品</a></li>
						</ul>
						<br class="clear"/>
					</li>
				</ul>
				<!--[if IE]>
				<br class="clear"/>
				<![endif]-->
			</div>			
			
			<div class="pro_sort">
				<ul>
					<li>&nbsp;&nbsp;&nbsp;排序：</li>
					<li class="order_btn up notsel_li" by="score">相关度</li>
					<li class="order_btn up notsel_li" by="price" onmouseover="mouseoverOccur(this)" style="cursor: pointer;">价格<b></b></li>
					<li class="order_btn select_li up" by="stock" onmouseover="mouseoverOccur(this)" style="cursor: pointer;">库存<b></b></li>
					<li class="order_btn down notsel_li" by="sale" onmouseover="mouseoverOccur(this)" style="cursor: pointer;">销量<b></b></li>
					<li class="order_btn up notsel_li" by="inTime" onmouseover="mouseoverOccur(this)" style="cursor: pointer;">上架时间<b></b></li>
				</ul>
			</div>
			
			<div class="list">
				<ul>
					<li>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p1.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM依旧出色的iPhone
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p2.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM依旧出色的iPhone
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
					<li>
						<b class="sign">特价</b>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p3.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 5 16G版 3G手机（白色）WCDMA/GSM全新设计，更
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p4.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 4 8G版 3G手机（黑色）WCDMA/GSM依旧出色的iPhon
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p5.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM依旧出色的iPhone
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
					<li>
						<b class="sign">特价</b>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p6.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM依旧出色的iPhone
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p7.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM依旧出色的iPhone
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-list/p8.jpg" alt="">
						</a>
						<div class="summ_title">
							苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM依旧出色的iPhone
						</div>
						<div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
						<div class="buttons">
							<a href="###" class="add_cart">加入购物车</a>
							<a href="###" class="to_compare">对比</a>
						</div>
					</li>
				</ul>
				<br class="clear"/>
			</div>
			<div class="page_div right">
				<img alt="" src="<%=curUrl%>/lc/display/resources/img/my/page.jpg"/>
			</div>
			<br class="clear"/>
		</div>
		
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>