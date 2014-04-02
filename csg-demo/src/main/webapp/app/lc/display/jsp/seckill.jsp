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
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/seckill.css" type="text/css" media="screen" />
		
		<script src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="<%=curUrl%>/lc/display/resources/js/jquery.countdown.min.js" type="text/javascript" async=""></script>
		<script type="text/javascript">
			$(function () {
				window.onload=function(){
					menuHit();
					var liftoffTime = new Date(2013, 6 - 1, 28, 13, 00);
					$('#counter').countdown({until: liftoffTime,
				    layout: '{dn} {dl}{hn} {hl}{mnn} {ml}{snn}'});
					//layout: '{dn} {dl},{hn} {hl}, {mnn} {ml}, {snn} {sl}'});
		    	}
			});
		</script>
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="content_width line"></div>
		<div class="outer_div">
			<div class="seckill_div">
				<div class="left pro_img">
					<img src="<%=curUrl%>/lc/display/resources/img/my/seckill/b_1.jpg"></img>
				</div>
				<div class="right pro_info">
					<div class="title">即将秒杀商品</div>
					<div class="name">小破孩 专业级高透液晶屏贴膜</div>
					<div class="summ">南网专供，全国首发！高透光率 呈现完美视觉高品质原材料制作，还原本色，有效保护眼睛；特有的纳米镜面微结构技术，提高光泽度，使影像更加鲜明靓丽。</div>
					<div class="to_detail"><a href="<%=curUrl%>/lc/display/jsp/pro-detail-phone.jsp">查看商品详情<b></b></a></div>
					<div class="price"><span class="inside">￥199.00</span><span class="original">原价：￥299.00</span></div>
					<div>50件等你秒杀</div>
					<div class="countdown_div">
						<span class="left">倒计时：</span>
						<div id="counter" class="countdown left"></div>
						<div class="to_begin left"><img alt="" src="<%=curUrl%>/lc/display/resources/img/my/seckillBtn.jpg"> </div>
						<br class="clear"/>
					</div>
				</div>
				<br class="clear"/>
				<div class="pro_sk_sn">
					<div class="title">活动说明</div>
					<div class="content">
						该活动只针对南网用户；
						每期一款限量秒杀，每个账号限购一件；
						秒杀成功后商品即进入购物车，并在购物车中保留24小时，超时将从购物车中自动删除，若您删除购物车中的秒杀商品，视为放弃秒杀资格；
						秒杀商品不再参加任何优惠活动，可计入满额免运费。
					</div>
				</div>
				<div class="pro_sk_previous">
					<div class="title">往期秒杀</div>
					<div class="ul_div">
						<ul>
							<li class="po_1 top_r">
								<div class="img">
									<img src="<%=curUrl%>/lc/display/resources/img/my/seckill/b_2.jpg"></img>
								</div>
								<div class="info">
									<div class="date">2013年5月9日</div>
									<div class="name">家用电器手电筒</div>
									<div class="price"><span class="inside">￥199.00</span><span class="original">原价：￥299.00</span></div>
									<div class="res">已抢光200件</div>
								</div>
								<br class="clear"/>
							</li>
							<li class="po_2 top_r">
								<div class="img">
									<img src="<%=curUrl%>/lc/display/resources/img/my/seckill/b_3.jpg"></img>
								</div>
								<div class="info">
									<div class="date">2013年5月8日</div>
									<div class="name">金立手机移动电源</div>
									<div class="price"><span class="inside">￥99.00</span><span class="original">原价：￥250.00</span></div>
									<div class="res">已抢光200件</div>
								</div>
								<br class="clear"/>
							</li>
							<li class="po_3 top_r">
								<div class="img">
									<img src="<%=curUrl%>/lc/display/resources/img/my/seckill/b_5.jpg"></img>
								</div>
								<div class="info">
									<div class="date">2013年5月7日</div>
									<div class="name">索尼蓝牙音箱</div>
									<div class="price"><span class="inside">￥199.00</span><span class="original">原价：￥299.00</span></div>
									<div class="res">已抢光200件</div>
								</div>
								<br class="clear"/>
							</li>
							<li class="po_1">
								<div class="img">
									<img src="<%=curUrl%>/lc/display/resources/img/my/seckill/b_6.jpg"></img>
								</div>
								<div class="info">
									<div class="date">2013年5月7日</div>
									<div class="name">索尼蓝牙音箱</div>
									<div class="price"><span class="inside">￥199.00</span><span class="original">原价：￥299.00</span></div>
									<div class="res">已抢光200件</div>
								</div>
								<br class="clear"/>
							</li>
							<li class="po_2">
								<div class="img">
									<img src="<%=curUrl%>/lc/display/resources/img/my/seckill/b_7.jpg"></img>
								</div>
								<div class="info">
									<div class="date">2013年5月7日</div>
									<div class="name">索尼蓝牙音箱</div>
									<div class="price"><span class="inside">￥199.00</span><span class="original">原价：￥299.00</span></div>
									<div class="res">已抢光200件</div>
								</div>
								<br class="clear"/>
							</li>
							<li class="po_3">
								<div class="img">
									<img src="<%=curUrl%>/lc/display/resources/img/my/seckill/b_8.jpg"></img>
								</div>
								<div class="info">
									<div class="date">2013年5月7日</div>
									<div class="name">索尼蓝牙音箱</div>
									<div class="price"><span class="inside">￥199.00</span><span class="original">原价：￥299.00</span></div>
									<div class="res">已抢光200件</div>
								</div>
								<br class="clear"/>
							</li>
						</ul>
						<br class="clear"/>
					</div>
					<div class="right"><a href="###">更多&gt;&gt;</a></div>
				</div>
			</div>			
			
			<br class="clear"/>
		</div>
		
		<jsp:include page="foot.jsp"></jsp:include>
		
		
	</body>
</html>