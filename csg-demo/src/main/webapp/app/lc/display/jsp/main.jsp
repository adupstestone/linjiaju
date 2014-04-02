<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<%@include file="url.jsp" %>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
		<meta name="keywords" content="广东联通">
		<meta name="description" content="广东联通">
		
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/ppt/nivo-slider/themes/default/default.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/ppt/nivo-slider/themes/pascal/pascal.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/ppt/nivo-slider/themes/orman/orman.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/ppt/nivo-slider/nivo-slider.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/common.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/main.css" type="text/css" media="screen" />
		
		<script src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="<%=curUrl%>/lc/display/resources/js/ppt/nivo-slider/jquery.nivo.slider.pack.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			jQuery(function() {
				$('#slider').nivoSlider();
			});
		</script>
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="outer_div">
			<div id="wrapper" style="width:960px;">
				<div class="slider-wrapper theme-default">
					<div id="slider" class="nivoSlider" style="margin:0 auto;width:960px;height:430px;">
					    <a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp?menu=1"><img src="<%=curUrl%>/lc/display/resources/img/my/nivo-slider/a.jpg" alt="<%=imgalt%>"/></a>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp?menu=1"><img src="<%=curUrl%>/lc/display/resources/img/my/nivo-slider/b.jpg" alt="<%=imgalt%>"/></a>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp?menu=1"><img src="<%=curUrl%>/lc/display/resources/img/my/nivo-slider/c.jpg" alt="<%=imgalt%>"/></a>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp?menu=1"><img src="<%=curUrl%>/lc/display/resources/img/my/nivo-slider/d.jpg" alt="<%=imgalt%>"/></a>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp?menu=1"><img src="<%=curUrl%>/lc/display/resources/img/my/nivo-slider/e.jpg" alt="<%=imgalt%>"/></a>
						<a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp?menu=1"><img src="<%=curUrl%>/lc/display/resources/img/my/nivo-slider/f.jpg" alt="<%=imgalt%>"/></a>
						<!-- 
						<img src="<%=curUrl%>/lc/display/resources/img/my/nivo-slider/d.jpg" alt="<%=imgalt%>" title="#htmlcaption" />
						 -->
					</div>
					<!-- 
					<div id="htmlcaption" class="nivo-html-caption">
						<strong><a href="<%=indexurl%>">广东联通沃盟终端采购服务平台</a></strong>
					</div>
					 -->
				</div>
			</div>
			
			<div class="ad_l left">
				<div class="ad_title">
					<h2>
						<a target="_blank" href="###" style="color:#999;">购买Iphone5手机仅¥4500</a>
					</h2>
				</div>
	      
				<div class="ad_l_img">
					<ul>
						<li>
							<a href="###">
								<img alt="" style="margin: 0px; opacity: 1;" src="<%=curUrl%>/lc/display/resources/img/my/main/m_1.jpg"/>
							</a>
						</li>
	                    <li style="border-top:0">
							<a href="###">
								<img alt="" style="margin: 0px; opacity: 1;" src="<%=curUrl%>/lc/display/resources/img/my/main/m_2.jpg"/>
							</a>
						</li>
					</ul>              
				</div>
			</div>
			
			<div class="ad_r right">
				<div class="ad_title">
					<h2 style="overflow:hidden;" class="cfl">
						<a href="###" style="float:left">购买小米手机</a>
					</h2>
				</div>
				<p class="ad_r_notice">
					<a href="###" onclick="_gaq.push(['_trackEvent','首页广告点击','购买小米手机栏']);" target="_blank"><img src="<%=curUrl%>/lc/display/resources/img/my/main/s_ad.jpg"/></a>              
				</p>
				<div class="ad_r_phone" style="background:#FAFAFA url(<%=curUrl%>/lc/display/resources/img/my/main/rt_1.jpg) 166px 27px no-repeat;border-bottom:0;">
					<h3>华为 G510</h3>
					<p class="item1">南网用户专供<br>
					性能提速25%<br>
					<em>900元起</em></p>
					<a class="button_round button_pink_1" href="###">立即购买</a><br>
					<p class="item2"><a class="home_btn_link" href="###" style="margin-right:10px;">了解更多</a> <a class="home_btn_link" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '小米手机2', 'F码通道']);">F码通道</a></p>
				</div>
				<div class="ad_r_phone" style="margin-bottom: 10px;background:#FAFAFA url(<%=curUrl%>/lc/display/resources/img/my/main/rt_2.png) 166px 27px no-repeat;">
					<h3>小米手机 2A</h3>
					<p class="item1" style="margin-bottom: 20px;">28纳米双核1.7GHz<br>
					全新演绎2S青春版</p>
					<a class="button_round button_pink_1" href="###">立即购买</a>
					<p class="item2"><a class="home_btn_link" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '小米手机2', '了解更多']);" style="margin-right:10px;">了解更多</a><a class="home_btn_link" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '小米手机2', 'F码通道']);">F码通道</a></p>
				</div>
				<ul class="news">
					<li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '十点秒杀处-小米手机2S合约版']);" style="color:#C00;" target="_blank">小米手机2S合约版</a></li>
					<li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '十点秒杀处-充话费享超低折扣']);" target="_blank">充话费享超低折扣</a></li>
					<li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '十点秒杀处-企业用户采购通道']);" target="_blank">企业用户采购通道</a></li>
					<li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '活动-可口可乐活动专区']);" target="_blank">可口可乐活动专区</a></li>
				</ul>
				<br class="clear"/>
			</div>
			<br class="clear"/>
			
			<div class="main_pro_list">
			    <div class="filter_title">
					<dl>
						<dt>
						  	热门配件：        
						</dt>
						<dd>
						    <a href="###">手机配件</a> <span>|</span> <a href="###" >电源</a> <span>|</span> <a href="###">酷玩</a> <span>|</span> <a href="###">耳机音箱</a> <span>|</span> <span style="display: none">&nbsp;</span><a href="###">服饰类</a><span>|</span><a href="###" >多彩后盖</a> <span>|</span> <a href="###" >保护</a> <span>|</span> <a href="###" >全部配件</a> <span>|</span><a href="###" >优惠套装</a> <span>|</span> <a href="###" >每周新品</a>        
						</dd>
					</dl>
			    </div>
			    <div class="filter_content">
					<ul class="home_xmAcce_con_ul cfl">
						<!--中部4张图开始 -->
						<li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt="" src="<%=curUrl%>/lc/display/resources/img/my/main/m3.jpg"> </a></li>
						<li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt="" src="<%=curUrl%>/lc/display/resources/img/my/main/m4.jpg"> </a></li>
						<li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt="" src="<%=curUrl%>/lc/display/resources/img/my/main/m5.jpg"> </a></li>
						<li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt="" src="<%=curUrl%>/lc/display/resources/img/my/main/m6.jpg"> </a></li>            <!--底部商品列表 -->
						<li class="s_img_li">
							<dl style="display:block;">
								<dt class="img_dt" style="display:block;">
									<a href="###" style="line-height: 185px;display:block;"><img style="vertical-align:middle;" alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_1.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###">线控通话耳机</a>
								</dd>
								<dd class="info_dd_2">
									<em>¥49</em>
								</dd>
							</dl>
						</li>
						<li class="s_img_li">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###"><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_2.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###">磨砂贴膜升级版</a>
								</dd>
								<dd class="info_dd_2">
									<em>¥19</em>
								</dd>
							</dl>
						</li>
						<li class="s_img_li">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###"><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_3.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###">小米短袖POLO两件装</a>
									<b>特价</b>
								</dd>
								<dd class="info_dd_2">
									<span>¥198</span><strong>¥169</strong>
								</dd>
							</dl>
						</li>
						<li class="s_img_li">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###"><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_4.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###">小钢炮蓝牙音乐座充</a>
									<b>特价</b>
								</dd>
								<dd class="info_dd_2">
									<span>¥199</span><strong>¥179</strong>
								</dd>
							</dl>
						</li>
						<li class="s_img_li trend">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###"><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_5.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###">大电池全能套装</a>
									<b>特价</b>
								</dd>
								<dd class="info_dd_2">
									<span>¥247</span><strong>¥169</strong>
								</dd>
							</dl>
						</li>
						<li class="s_img_li">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###"><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_6.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###">车载充电器</a>
									<b>特价</b>
								</dd>
								<dd class="info_dd_2">
									<span>¥49</span><strong>¥39</strong>
								</dd>
							</dl>
						</li>
						<li class="s_img_li">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###"><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_7.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###"W>米兔超人版</a>
								</dd>
								<dd class="info_dd_2">
									<em>¥69</em></dd>
							</dl>
						</li>
						<li class="s_img_li">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###"><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_8.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###">学院风帆布双肩包-黑色</a>
								</dd>
								<dd class="info_dd_2">
									<em>¥99</em>
								</dd>
							</dl>
						</li>
						<li class="s_img_li">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###" ><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_9.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###" >森海塞尔MX375立体声耳机</a>
								</dd>
								<dd class="info_dd_2">
									<em>¥189</em>
								</dd>
							</dl>
						</li>
						<li class="s_img_li trend">
							<dl class="goodsDisplay">
								<dt class="img_dt">
									<a href="###" ><img alt="" width="110" src="<%=curUrl%>/lc/display/resources/img/my/main/b_10.jpg"/></a>
								</dt>
								<dd class="info_dd_1">
									<a href="###" >抽取式保护套</a></dd>
								<dd class="info_dd_2">
									<em>¥79</em>
								</dd>
							</dl>
						</li>  
					</ul>
					<br class="clear"/>
			    </div>
			</div>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>