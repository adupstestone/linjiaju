<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="url.jsp" %>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
        <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/style.css">
        <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/common.css">
        <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/detail-zo0m.css">
        <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/pro-detail.css">

        <script src="<%=curUrl%>/demo/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	</head>
	<body>
        <%@include file="head.jsp" %>
		<div class="content_width line"></div>
	    <div class="content_width phone_detail_out_div" style="padding-top: 10px;">
	        <div id="product-intro">
	            <div id="good_name">
	                <h1>苹果Iphone4S</h1>
	            </div>
	            <div>
	                <ul id="summary">
		                <li id="summary-price">
		                	<div class="left">
			                	<div class="dt">内部价格：</div>
			                    <div class="dd">
			                        <span class="p-price" id="good_local_price">￥3000元</span>
			                    </div>
		                	</div>
							<div class="left">
			                	<div class="dt">市场价格：</div>
			                    <div class="dd">
			                        <span class="p-price" id="good_market_price">￥5000元</span>
			                    </div>
		                	</div>
		                	<br class="clear"/>
		                </li>
		                <li>
		                    <div class="left">
			                	<div class="dt">商品货号：</div>
		                        <div class="dd" id="good_id">201305082050110200</div>
		                	</div>
							<div class="left">
			                	<div class="dt">上架时间：</div>
		                        <div class="dd" id="good_in_time">2013年5月8日</div>
		                	</div>
		                	<br class="clear"/>
		                </li>
		                <li>
		                	<div class="left">
			                	<div class="dt">供货商家：</div>
		                        <div class="dd" id="good_sh_group">广州联通</div>
		                	</div>
							<div class="left">
			                	<div class="dt">库 存：</div>
		                        <div class="dd" id="good_stock">1000台</div>
		                	</div>
		                	<br class="clear"/>
		                </li>
		                <li>
		                	<div class="left">
			                	<div class="dt">优惠活动：</div>
		                    	<div class="dd">
			                        <span id="good_per_type">南网专供</span>
								</div>
		                	</div>
							<div class="left">
			                	<div class="dt">配送范围：</div>
			                    <div class="dd">
			                        <span id="good_send_group">广东全省</span>
			                    </div>
		                	</div>
		                	<br class="clear"/>
		                </li>
		                <li>
		                	<div class="left">
			                    <div class="dt">付款方式：</div>
			                    <div class="dd">
			                    	<img id="pay_mode_wy"/>网银支付&nbsp;&nbsp;
			                    	<img id="pay_mode_ali"/>支付宝
			                    </div>
			                </div>    
			                <div class="left">
			                    <div class="dt">手机配件：</div>
			                    <div class="dd">
			                        <span id="good_annex">耳机、保护膜</span>
			                    </div>
							</div>
							<br class="clear"/>
		                </li>
		                <li>
		                	<div class="left">
			                    <div class="dt">联系客服：</div>
			                    <div class="dd" id="good_sh_qq">
			                    	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2450939153&site=qq&menu=yes">
			                    		<img border="0" src="http://wpa.qq.com/pa?p=2:2450939153:42" alt="点击这里给我发消息" title="点击这里给我发消息"/>
			                    	</a>
			                    </div>
			                </div>    
							<br class="clear"/>
		                </li>
					</ul>
		            <!--summary end-->
					<ul id="choose">
		                <li id="choose-color">
		                	<div class="dt">选择颜色：</div>
		                	<div class="dd" style="width:460px">
		                		<div class="item selected"><b></b>
			                		<a href="#none" title="白色">
			                			白色
			                		</a>
		                		</div>
		                		<div class="item"><b></b>
			                		<a href="#none" title="黑色">
			                			黑色
			                		</a>
		                		</div>
		                	</div>
		                </li>
		                <li id="choose-version">
		                	<div class="dt">选择版本：</div>
		                	<div class="dd" style="width:460px">
		                		<div class="item selected"><b></b>
			                		<a href="#none" name="v2" title="合约机">
			                			合约机
			                		</a>
		                		</div>
		                		<div class="item"><b></b>
			                		<a href="#none" name="v1" title="裸机">
			                			裸机
			                		</a>
		                		</div>
		                	</div>
		                </li>
		                <li id="choose-amount">
							<div class="dt">购买数量：</div>
							<div class="dd">
								<div class="wrap-input">
									<a class="btn-reduce left" href="javascript:;">减少数量</a>
									<a class="btn-add right" href="javascript:;">增加数量</a>
									<input class="text left" id="buy-num" value="1"/>
									<span class="clear"></span>
								</div>
							</div>
						</li>
		                <li id="choose-btns">
		                    <div id="choose-btn-append">
		                        <a href="##" id="buy_now" class="btn-append left button_pink">立即购买</a>
		                        <span class="clear"></span>
		                    </div>
		                </li>
	                </ul>
	                <!--choose end-->
	                <br class="clear"/>
	            </div>
	            
	            <div id="preview">
	                <div id="spec-n1" class="jqzoom" onclick="">                    
						<img width='350' height='350' src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/a.jpg'/>
	                </div>
	                <!-- 
				    <div id="sell_type" class="view-sup"><a target="_blank" href="#">360度</a></div>
				     -->
				    
	                <div id="spec-list">
					    <a href="javascript:;" class="spec-control" id="spec-forward"></a>
					    <a href="javascript:;" class="spec-control" id="spec-backward"></a>
	                    <div class="spec-items">
	                        <ul class="lh" id='good_img_list'>
	                            <li>
   									<img src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/a.jpg' width='50' height='50' class="img-hover"/>
								</li>
								<li>
   									<img src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/a.jpg' width='50' height='50'/>
								</li>
								<li>
   									<img src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/b.jpg' width='50' height='50'/>
								</li>
								<li>
   									<img src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/c.jpg' width='50' height='50'/>
								</li>
								<li>
   									<img src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/d.jpg' width='50' height='50'/>
								</li>
								<li>
   									<img src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/e.jpg' width='50' height='50'/>
								</li>
								<li>
   									<img src='<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/mb/f.jpg' width='50' height='50'/>
								</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <!--preview end-->
	        </div>
	        <!--product-intro end-->
	    </div>
	    
	    <div class="content_width">
	    	<div class="fitting_list">
	    		<!-- 
	    		<div class="line"></div>
	    		 -->
	    		<div class="title">
	    			<ul>
		    			<li class="selected">
		    				<a href="###">精选配件</a>
		    			</li>
		    			<li>
							<a href="###">耳机</a>
						</li>
						<li>
							<a href="###">贴膜</a>
						</li>
						<li>
							<a href="###">电池</a>
						</li>
						<li>
							<a href="###">保护套</a>
						</li>
						<li>
							<a href="###">数据线</a>
						</li>
						<li>
							<a href="###">移动电源</a>
						</li>
						<li>
							<a href="###">蓝牙耳机</a>
						</li>
						<li>
							<a href="###">车载配件</a>
						</li>
						<li>
							<a href="###">其他</a>
						</li>
						
						
						<li class="right">
							<a href="###">更多</a>
						</li>
		    		</ul>
		    		<br class="clear"/>
	    		</div>
	    		
	    		<div class="content">
		    		<ul>
		    			<li>
		    				<div class="img">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/seckill/b_2.jpg"/>
							</div>
							<div class="info">
								<div class="name">家用电器手电筒</div>
								<div class="price">
									<input type="checkbox"/>
									<span class="inside">￥199.00</span>
								</div>
							</div>
		    			</li>
		    			<li>
							<div class="img">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/seckill/b_3.jpg"/>
							</div>
							<div class="info">
								<div class="name">金立手机移动电源</div>
								<div class="price">
									<input type="checkbox"/>
									<span class="inside">￥99.00</span>
								</div>
							</div>
						</li>
						<li>
							<div class="img">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/seckill/b_5.jpg"/>
							</div>
							<div class="info">
								<div class="name">索尼蓝牙音箱</div>
								<div class="price">
									<input type="checkbox"/>
									<span class="inside">￥199.00</span>
								</div>
							</div>
						</li>
						<li>
							<div class="img">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/seckill/b_6.jpg"/>
							</div>
							<div class="info">
								<div class="name">索尼蓝牙音箱</div>
								<div class="price">
									<input type="checkbox"/>
									<span class="inside">￥199.00</span>
								</div>
							</div>
						</li>
						<li>
							<div class="img">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/seckill/b_7.jpg"/>
							</div>
							<div class="info">
								<div class="name">索尼蓝牙音箱</div>
								<div class="price">
									<input type="checkbox"/>
									<span class="inside">￥199.00</span>
								</div>
							</div>
						</li>
		    		</ul>
		    		<div class="right buy_buttons">
						<a href="<%=curUrl%>/app/lc/display/jsp/pro-buy-contract.jsp" id="buy_together" class="btn-append button_pink">一起购买</a>
		    		</div>
		    		<br class="clear"/>
	    		</div>
	    	</div>
	    </div>
	    
		<div class="content_width">
	        <div class="right" style="width: 100%;">
	            <div id="product-detail" class="m m1" data-widget="tabs">
	                <div class="mt">
	                    <ul class="tab">
	                        <li data-widget="tab-item" class="curr"><a>商品信息</a></li>
						    <li data-widget="tab-item" id="item-detail-2"><a>参数列表</a></li>
						    <li data-widget="tab-item" id="item-detail-3"><a>购买记录</a></li>
	                    </ul>
	                </div>
	                
	                <div class="mc" data-widget="tab-content" id="product-detail-1">
						<div id="item-detail-1-1" class="item-detail">
							<div class="content">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/detail2.png" alt=""/>
							</div>
						</div>
	                </div>
	                
	                <div class="mc hide" data-widget="tab-content" id="product-detail-2">
						<div id="item-detail-2-1" class="item-detail">
							<div class="content">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/detail1.png" alt="" style="margin-left: -3px;"/>
							</div>
						</div>
	                </div>
	                
	                <div class="mc hide" data-widget="tab-content" id="product-detail-3">
						<div id="item-detail-3-1" class="item-detail">
							<div class="content">
								<img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-detail/buy_rec.png" alt=""/>
							</div>
							<div class="pagination_div">
								<div id="Pagination"></div>
								<br class="clear"/>
							</div><br class="clear"/>
						</div>
	                </div>
	                
	                
	                <div id="promises">
						<strong>溫馨提示：</strong><br />
						如有疑问，请联系客服人员为您服务。
						<br /><br />
					</div>
				</div>
	            <!--product-detail end-->
	        </div>
	        <!--right end-->
	        <br class="clear"/>
		</div>
	    
	    <script type="text/javascript" src="<%=curUrl%>/app/lc/display/resources/js/detail-zo0m.js?t=20120717.js"></script>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>

