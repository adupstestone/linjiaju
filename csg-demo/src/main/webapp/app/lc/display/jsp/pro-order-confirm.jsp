<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>订单确认 - 广东联通B2B终端商城</title>
<link rel="stylesheet" type="text/css" href="<%=curUrl%>/lc/display/resources/css/my/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=curUrl%>/lc/display/resources/css/my/pro-order-confirm.css"/>
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
<script type="text/javascript" src="<%=curUrl%>/lc/display/my-js/pro-order-confirm.js" ></script>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="content_width line"></div>
<div class="content_width common_cart_order">
	<div class="head">
		<div class="head_title left">
			<span>订单信息确认</span>
		</div>	
		<div class="head_step right">
			<ul>
				<li class="nocurrent previous left"><span class="first">1.查看购物车</span></li>
				<li class="current left"><span>2.确认订单</span></li>
				<li class="nocurrent last left"><span>3.支付订单</span></li>
			</ul>
		</div>	
	</div>
	
	<div class="body">
		<div class="list">
			<div class="list_head">
				<div class="left_title left">商品清单</div>
				<div class="right_title right">
				<a href="<%=curUrl %>/b2b/display/action/phoneCartAction!showCart.action">
				<span>
					【返回购物车修改商品】
				</span>
				</a>
				</div>
			</div>
			<div class="order_body_item_content">
				<div id="phoneList">
				
					<table cellpadding="0" cellspacing="0" class="phone_list_table">
						<tr class="tr_title">
							<td>商品名称</td>
							<td class="td_item">单价</td>
							<td class="td_item">数量</td>
							<td class="td_item">￥10000</td>
						</tr>
						<tr class="tr_body">
							<td>苹果手机IPhone5S 16G联通0元购元购元购元购机</td>
							<td>￥5000</td>
							<td>2</td>
							<td>￥10000</td>
						</tr>
						<tr class="tr_body">
							<td>苹果手机IPhone5S 16G联通0元购机</td>
							<td>￥5000</td>
							<td>2</td>
							<td>￥10000</td>
						</tr>
						<tr class="tr_body">
							<td>苹果手机IPhone5S 16G联通0元购元购元购机</td>
							<td>￥5000</td>
							<td>2</td>
							<td>￥10000</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="list">
			<div class="list_head">
				<div class="left_title left">送货地址</div>
				<div class="right_title right">
				<a href="###" onclick="addAddrButton(0)">
				<span>
					【添加新地址】
				</span>
				</a>
				</div>
			</div>
			<div class="order_body_item_content">
				<div id="addrList">
				</div>
				
				<div class="item_content3" id="addAddrDiv" style="display:none;">
					<div class="addr_show">
						<table cellpadding="0" cellspacing="0" border='1' class="addr_table">
						<tr>
							<td class="table_title">配送区域:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content" colspan="3">
								&nbsp;
								<span id="addCountrySelectSpan">
									<select class="addr_select" name="countryId">
									<option value='0'>请选择国家</option>
									</select>
								</span>
								<span id="addProvinceSelectSpan">
									<select class="addr_select" name="provinceId">
									<option value='0'>请选择省份</option>
									</select>
								</span>
								<span id="addCitySelectSpan">
									<select class="addr_select" name="cityId" >
									<option value='0'>请选择城市</option>
									</select>
								</span>
								<span id="addAreaSelectSpan">
									<select class="addr_select" name="areaId">
									<option value='0'>请选择区域</option>
									</select>
								</span>
								<span>
									&nbsp;
								(必选)
								</span>
								<span class="validate_span">&nbsp;请选择正确的地市或区县</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">详细地址:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content" colspan="3">
							<span>
								&nbsp;							
							</span>
							<span>
								<input type="text" name="addrDetail" style="width:70%;"/>
							</span>
							<span>
								&nbsp;(必填)								
							</span>
							<span class="validate_span">&nbsp;详细地址为必填项</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">收货人姓名:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="receiverName" style="width:50%;"/>
								</span>
								<span>
									&nbsp;(必填)								
								</span>
								<span class="validate_span">&nbsp;收货人姓名为必填项</span>
							</td>
							<td class="table_title">手机:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" maxlength="11" name="receiverMobile" style="width:50%;"/>
								</span>
								<span>
									&nbsp;(必填)								
								</span>
								<span class="validate_span">&nbsp;手机格式不正确</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">电子邮件地址:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="receiverMail" style="width:50%;"/>
								</span>
								<span class="validate_span">&nbsp;电子邮件格式不正确</span>
							</td>
							<td class="table_title">固定电话:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="receiverTel" style="width:50%;"/>
								</span>
								<span class="validate_span">&nbsp;固定电话格式不正确</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">邮政编码:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="addrPostal" style="width:50%;"/>
								</span>
								<span class="validate_span" >&nbsp;邮政编码格式不正确</span>
							</td>
							<td class="table_title">设为默认地址:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
									<input name="defaultAddrFlag" type="checkbox" />
								</span>
							</td>
						</tr>
					</table>
					</div>
					<div class="addr_button">
						<a class="button_gray left" href="#" onmouseover="mouseoverOccur(this)" onclick="saveNewAddr()"><b class="add"></b>新增地址</a>
						<a class="button_gray left" href="#" onmouseover="mouseoverOccur(this)" onclick="addAddrButton(1)"><b class="sub"></b>取消新增</a>
						<br class="clear"/>
					</div>
				</div>
				<div class="item_content3" id="editAddrDiv">
					<div class="addr_show">
						<table cellpadding="0" cellspacing="0" border="1" class="addr_table">
						<tr>
							<td class="table_title">配送区域:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content" colspan="3">
								&nbsp;
								<span id="editCountrySelectSpan">
									<select class="addr_select" name="countryId">
									<option value='0'>请选择国家</option>
									</select>
								</span>
								<span id="editProvinceSelectSpan">
									<select class="addr_select" name="provinceId">
									<option value='0'>请选择省份</option>
									</select>
								</span>
								<span id="editCitySelectSpan">
									<select class="addr_select" name="cityId" >
									<option value='0'>请选择城市</option>
									</select>
								</span>
								<span id="editAreaSelectSpan">
									<select class="addr_select" name="areaId">
									<option value='0'>请选择区域</option>
									</select>
								</span>
								<span>
									&nbsp;
								(必选)
								</span>
								<span class="validate_span">&nbsp;请选择正确的地市或区县</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">详细地址:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content" colspan="3">
							<span>
								&nbsp;							
							</span>
							<span>
								<input type="text" name="addrDetail" style="width:70%;"/>
							</span>
							<span>
								&nbsp;(必填)								
							</span>
							<span class="validate_span">&nbsp;详细地址为必填项</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">收货人姓名:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="receiverName" style="width:50%;"/>
								</span>
								<span>
									&nbsp;(必填)								
								</span>
								<span class="validate_span">&nbsp;收货人姓名为必填项</span>
							</td>
							<td class="table_title">手机:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" maxlength="11" name="receiverMobile" style="width:50%;"/>
								</span>
								<span>
									&nbsp;(必填)								
								</span>
								<span class="validate_span">&nbsp;手机格式不正确</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">电子邮件地址:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="receiverMail" style="width:50%;"/>
								</span>
								<span class="validate_span">&nbsp;电子邮件格式不正确</span>
							</td>
							<td class="table_title">固定电话:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="receiverTel" style="width:50%;"/>
								</span>
								<span class="validate_span">&nbsp;固定电话格式不正确</span>
							</td>
						</tr>
						<tr>
							<td class="table_title">邮政编码:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
								<input type="text" name="addrPostal" style="width:50%;"/>
								</span>
								<span class="validate_span" >&nbsp;邮政编码格式不正确</span>
							</td>
							<td class="table_title">设为默认地址:&nbsp;&nbsp;&nbsp;</td>
							<td class="table_content">
								<span>
								&nbsp;							
								</span>
								<span>
									<input name="defaultAddrFlag" type="checkbox" />
								</span>
							</td>
						</tr>
					</table>
					</div>
					<div class="addr_button">
						<input type="hidden" name="addrId"/>
						<div class="cancleUpdate right" onmouseover="mouseoverOccur(this)" onclick="editAddrButton('', 1)">取消</div>
						<div class="updateAddr right" onmouseover="mouseoverOccur(this)" onclick="updateAddr()">保存</div>
						<br class="clear"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="list">
			<div class="list_head">
				<div class="left_title left">支付方式</div>
			</div>
			<div class="order_body_item_content">
				<div class="item_content1">
					<input type="radio" name="paymentMethod" value="0" checked/>&nbsp;&nbsp;&nbsp;线下支付
				</div>
			</div>
		</div>
		
		<div class="list">
			<div class="list_head">
				<div class="left_title left">配送方式</div>
			</div>
			<div class="order_body_item_content">
				<div class="item_content1">
					<input type="radio" name="deliveryMethod" value="0" checked/>&nbsp;&nbsp;&nbsp;工作日、双休日与假日均可送货
				</div>
				<div class="item_content1">
					<input type="radio" name="deliveryMethod" value="1"/>&nbsp;&nbsp;&nbsp;只双休日、假日送货（工作日不用送）
				</div>
				<div class="item_content1">
					<input type="radio" name="deliveryMethod" value="2"/>&nbsp;&nbsp;&nbsp;只工作日送货（双休日、假日不用送）写字楼、商用地址客户请选择 
				</div>
			</div>
		</div>
		
		<div class="list">
			<div class="list_head">
				<div class="left_title left">备注</div>
			</div>
			<div class="order_body_item_content">
				<div class="item_content2">
					<textarea id="orderComment"></textarea>
				</div>
			</div>
		</div>
		
		<div class="list">
			<div class="list_head">
				<div class="left_title left">支付金额</div>
			</div>
			<div class="order_body_item_content">
				<div class="item_content1">
					<div class="order_sum right">
						<span class="order_desc">商品总价:&nbsp;&nbsp;&nbsp;</span>
						<span class="order_key">￥30000</span>
						<span class="order_key" id="totalPrice"></span>
					</div>
				</div>
				<div class="item_content1">
					<div class="order_sum right">
						<span class="order_desc">应付款金额:&nbsp;&nbsp;&nbsp;</span>
						<span class="order_key">￥30000</span>
						<span class="order_key" id="actualTotalPrice"></span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="foot">
			<div class="submit right" onmouseover="mouseoverOccur(this)" onclick="confirmOrder()">
				<a class="button_pink_1" href="<%=curUrl%>/lc/display/jsp/pro-order-payment.jsp">提交订单</a>
			</div>
		</div>
	</div>
	
</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>