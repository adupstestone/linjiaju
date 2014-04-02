<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>我的购物车 - 广东联通B2B终端商城</title>
<link rel="stylesheet" type="text/css" href="<%=curUrl%>/lc/display/resources/css/my/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=curUrl%>/lc/display/resources/css/my/pro-cart.css"/>
<script type="text/javascript" src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=curUrl%>/lc/display/my-js/common.js" ></script>

<!--将迁移 样式-->
<style type="text/css">
</style>
<!--将迁移 JS-->
<script type="text/javascript">
//初始化参数
//需迁移Js
</script>
<script type="text/javascript" src="<%=curUrl%>/lc/display/my-js/pro-cart.js" ></script>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="content_width line"></div>
<div class="content_width common_cart_order">
	<div class="head">
		<div class="head_title left">
			<span>我的购物车</span>
		</div>	
		<div class="head_step right">
			<ul>
				<li class="current left"><span class="first">1.查看购物车</span></li>
				<li class="left"><span>2.确认订单</span></li>
				<li class="nocurrent last left"><span>3.支付订单</span></li>
			</ul>
		</div>	
	</div>
	
	<div class="body">
		<div class="list">
			<div class="list_head">
				<div class="cart_list_head_item_name left">
					<span>商品名称</span>
				</div>
				<div class="cart_list_head_item left">
					<span>单价(元)</span>
				</div>
				<div class="cart_list_head_item left">
					<span>数量</span>
				</div>
				<div class="cart_list_head_item left">
					<span>总额</span>
				</div>
				<div class="cart_list_head_item left">
					<span>删除</span>
				</div>
			</div>
			<div id="cartList">
				
				
				<!-- 动态拼 begin-->
				<ul>
					<li>
						<p class="c_pro_img">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-cart/a.jpg"/>
						</p>
						<p class="c_pro_name">
							<span>苹果手机IPhone5S 16G联通0元购机联通0元购机联通0元购机联通0元购机联通0元购机联</span>
						</p>
						<p class="c_pro_price">
						    ¥<span>5000</span>
						</p>
						<p class="c_pro_num">
							<span class="pro_num_div">
								<a href="javascript:void(0);" class="decrement" id="decrement-833315-7-1">-</a>
			                    <input type="text" class="quantity-text" value="2" id="changeQuantity-833315-7-1-0">
			                    <a href="javascript:void(0);" class="increment" id="increment-833315-7-1-0">+</a>
							</span>
						</p>
						<p class="c_pro_price_t">
						    ¥<span>10000</span>
						</p>
						<p class="c_pro_del">
							<a id="2249_1_buy_s_c"  href="###">删除</a>
						</p>
					</li>
					
					<li>
						<p class="c_pro_img">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-cart/c.jpg"/>
						</p>
						<p class="c_pro_name">
							<span>苹果手机IPhone5S 16G联通0元购机联通0元购机联通0元购机联通0元购机联通0元购机联通0元购机联通0</span>
						</p>
						<p class="c_pro_price">
						    ¥<span>5000</span>
						</p>
						<p class="c_pro_num">
							<span class="pro_num_div">
								<a href="javascript:void(0);" class="decrement" id="decrement-833315-7-1">-</a>
			                    <input type="text" class="quantity-text" value="2" id="changeQuantity-833315-7-1-0">
			                    <a href="javascript:void(0);" class="increment" id="increment-833315-7-1-0">+</a>
							</span>
						</p>
						<p class="c_pro_price_t">
						    ¥<span>10000</span>
						</p>
						<p class="c_pro_del">
							<a id="2249_1_buy_s_c"  href="###">删除</a>
						</p>
					</li>
					
					<li>
						<p class="c_pro_img">
							<img src="<%=curUrl%>/lc/display/resources/img/my/pro-cart/b.jpg"/>
						</p>
						<p class="c_pro_name">
							<span>苹果手机IPhone5S 16G联通0元购机联通0元购元购机联通0元购机联通0元购机联通0元购机联通0元购机联通0元购机联通联通联通联通联通0元购机</span>
						</p>
						<p class="c_pro_price">
						    ¥<span>5000</span>
						</p>
						<p class="c_pro_num">
							<span class="pro_num_div">
								<a href="javascript:void(0);" class="decrement" id="decrement-833315-7-1">-</a>
			                    <input type="text" class="quantity-text" value="2" id="changeQuantity-833315-7-1-0">
			                    <a href="javascript:void(0);" class="increment" id="increment-833315-7-1-0">+</a>
							</span>
						</p>
						<p class="c_pro_price_t">
						    ¥<span>10000</span>
						</p>
						<p class="c_pro_del">
							<a id="2249_1_buy_s_c"  href="###">删除</a>
						</p>
					</li>
				</ul>
				<!-- 动态拼 end-->
				<span class="clear"></span>
				
			</div>
			
			<div class="cart_list_foot">
					<div class="foot_delete_div left">
						<a href="###" onclick="clearPhoneCart()">
						<b></b>
						<span>
							清空购物车
						</span>
						</a>
					</div>
					<div class="foot_info_div right">
						<div class="phone_key left" id="phoneCount">6</div>
						<div class="phone_desc left">&nbsp;&nbsp;件商品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总计:</div>
						<div class="right">&nbsp;&nbsp;&nbsp;</div>
						<div class="phone_key right" id="phoneSum">￥30000</div>
					</div>
					
			</div>		
		</div>
	</div>
	
	<div class="foot">
		<div class="cart_to_phone left" onmouseover="mouseoverOccur(this)" onclick="Javascript:window.location.href='###'">
			<span>
			继续购物
			</span>
		</div>
		<div class="submit right" onmouseover="mouseoverOccur(this)" onclick="confirmOrder();">
			<a class="button_pink_1" href="<%=curUrl%>/lc/display/jsp/pro-order-confirm.jsp">去结算</a>
		</div>
	</div>	
</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>