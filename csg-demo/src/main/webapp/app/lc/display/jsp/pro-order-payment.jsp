<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<%
	String orderId = request.getParameter("orderId");
	String paymentMethod = request.getParameter("paymentMethod");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>订单支付 - 广东联通B2B终端商城</title>
<link rel="stylesheet" type="text/css" href="<%=curUrl%>/lc/display/resources/css/my/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=curUrl%>/lc/display/resources/css/my/pro-order-payment.css"/>
<script type="text/javascript" src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=curUrl%>/b2b/display/my-js/common.js" ></script>

<!--将迁移 样式-->
<style type="text/css">
</style>
<!--将迁移 JS-->
<script type="text/javascript">
//初始化参数
var orderId = '<%=orderId %>';
var paymentMethod = '<%=paymentMethod %>';
//需迁移Js
</script>
<script type="text/javascript" src="<%=curUrl%>/lc/display/my-js/pro-order-payment.js" ></script>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="content_width line"></div>
<div class="content_width common_cart_order">
	<div class="head">
		<div class="head_title left">
			<span>支付订单查看</span>
		</div>	
		<div class="head_step right">
			<ul>
				<li class="nocurrent left"><span class="first">1.查看购物车</span></li>
				<li class="previous left"><span>2.确认订单</span></li>
				<li class="current last left"><span>3.支付订单</span></li>
			</ul>
		</div>	
	</div>
	
	<div class="body">
		<div class="list">
			<div class="list_head">
				<span class="left_title">订单详情</span>
			</div>
			<div class="order_res_info">
				<dl class="pay_on_line_res">
			        <dt>订单：<span id="titleNumber">1130505299007090 </span>
						&nbsp;&nbsp;&nbsp;&nbsp;金额：<strong id="titleAmount">¥ 1599.00</strong>
			        </dt>
			        <dd>
			                            张三<span>/</span>15602999938<span>/</span>
			              	北京,北京市,房山区 北京大学蘑菇屯乡政府            <br>
			                            不限                <span>/</span>普通个人发票
					</dd>
			    </dl>
			</div>
			
			<div class="pay_on_line">
				<img src="<%=curUrl%>/lc/display/resources/img/my/pay_on_line.png" alt="" />
			</div>
			
			<div class="order_body_content2 hide" id="divTemplate">
				<div class="content2_title">
				<input type="hidden" name="paymentId" value=""/>
				<span>订单:&nbsp;</span>
				<span>20130418035312CM</span>
				<span>&nbsp;(&nbsp;</span>
				<span>￥1000</span>
				<span>&nbsp;)</span>
				</div>
				
				<div class="content2_body">
					<div class="item">
						<div class="item_title1">一、付款方式</div>
						<div class="item_content1">转账汇款(款到发货)</div>
					</div>
					
					<div class="item">
						<div class="item_title1">二、账户信息</div>
						<div class="item_content2">
							<table cellpadding="0" cellspacing="0" border="1" class="account_table">
							<thead>
								<tr class="tr_title">
									<td>
										账户名称
									</td>	
									<td>
										开户行名称
									</td>	
									<td>
										银行账号
									</td>								
								</tr>
							</thead>
							<tbody class="tr_body">
								<tr>
									<td>
										深圳市爱施德股份有限公司1
									</td>	
									<td>
										建设银行广州东宝大厦支行1
									</td>	
									<td>
										44030501040010572aa
									</td>								
								</tr>
								<tr>
									<td>
										深圳市爱施德股份有限公司1
									</td>	
									<td>
										农业银行广州东山支行1
									</td>	
									<td>
										44001400115053002622aa
									</td>								
								</tr>
							</tbody>
							</table>
						</div>
					</div>
					
					<div class="item">
						<div class="item_title1">三、联系人及联系方式</div>
						<div class="item_content3">
							<span>1、联系人：&nbsp;</span>
							<span> 潘成勇</span>
						</div>
						<div class="item_content3">
							<span>2、联系电话：&nbsp;</span>
							<span> 186666dfds</span>
						</div>
						<div class="item_content3">
							<span>3、QQ：&nbsp;</span>
							<span>180562dfd</span>
						</div>
						<div class="item_content3">
							<span>4、备注：&nbsp;</span>
							<span>180562dfd</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="order_body_content2 hide" id="divTemplate2">
				<div class="content2_title">
				<input type="hidden" name="paymentId" value=""/>
				<span>订单:&nbsp;</span>
				<span>20130418035312CM</span>
				<span>&nbsp;(&nbsp;</span>
				<span>￥1000</span>
				<span>&nbsp;)</span>
				</div>
				
				<div class="content2_body">
					<div class="item">
						<div class="item_title1">一、付款方式</div>
						<div class="item_content1">转账汇款(款到发货)</div>
					</div>
					
					<div class="item">
						<div class="item_title1">二、联系人及联系方式</div>
						<div class="item_content3">
							<span>1、联系人：&nbsp;</span>
							<span> 潘成勇</span>
						</div>
						<div class="item_content3">
							<span>2、联系电话：&nbsp;</span>
							<span> 186666dfds</span>
						</div>
						<div class="item_content3">
							<span>3、QQ：&nbsp;</span>
							<span>180562dfd</span>
						</div>
						<div class="item_content3">
							<span>4、备注：&nbsp;</span>
							<span>180562dfd</span>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		<div class="bottom_button">
			<a class="button_pink_1" href="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1">付款</a>
		</div>
		<br class="clear"/>
	</div>
	
</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>