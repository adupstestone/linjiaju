<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<%@include file="url.jsp" %>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
		<meta name="keywords" content="广东联通">
		<meta name="description" content="广东联通">
		
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/detail-zo0m.css" type="text/css"/>
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/common.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/pro-buy.css" type="text/css" media="all" />
		
		<script src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			jQuery(function() {
				$('#province_text').toggle(function(){
					$('#province_list').show();
				},function(){
					$('#province_list').hide();
				});

				$('#city_text').toggle(function(){
					$('#city_list').show();
				},function(){
					$('#city_list').hide();
				});

				$('#province_list li').click(function(){
					$(this).parent().parent().hide();
					$('#province_text').val($(this).text());
					$('.city').show();
				});
				
				
				$('#city_list li').click(function(){
					$(this).parent().parent().hide();
					$('#city_text').val($(this).text());
					$('.area').show();
				});

				$('.contract').click(function(){
					$('.contract').removeClass("selected");
					//$('.contract').find("i").css("visibility","hidden");
					//$('.contract').find(".info").css("opacity","0");
					$(this).addClass("selected");
					//$(this).find("i").css("visibility","visible");
					//$(this).find(".info").css("opacity","1");
				});

				$('.fee').click(function(){
					$('.fee').removeClass("selected");
					$(this).addClass("selected");
				});

				$('.dinner').click(function(){
					$('.dinner').removeClass("selected");
					$(this).addClass("selected");
				});

				$('.number').click(function(){
					$('.number').removeClass("selected");
					$(this).addClass("selected");
				});
				
				$('.button_div').click(function(){
					var n=Number($(this).attr("step"));
					if(n<3){
						$('#step_'+n).hide();
						$('#step_'+(n+1)).show();
						$(this).attr("step",(n+1)+"");
					}else if(n==3){
						window.location.href=curUrl+"/lc/display/jsp/pro-cart.jsp";
					}
				});
			});
		</script>

	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="content_width line"></div>
		<div class="outer_div">
			<div class="top_ad">
				<img width="100%" height="100" alt="" src="<%=curUrl%>/lc/display/resources/img/my/pro-ad/960-100.jpg"/>
			</div>
			
			<div class="left_oper left" id="step_1">
				<div class="floor_1">
					<div class="province left">
						<span class="left">省份/自治区：</span>
						<div class="pop_div left">
							<input type="text" id="province_text" class="div_text"/>
							<div id="province_list" class="div_list">
								<ul>
									<!-- 
									<li>北京</li>
									<li>四川</li>
									<li>浙江</li>
									 -->
									<li>广东</li>
									<li>云南</li>
									<li>广西</li>
									<li>海南</li>
									<li>贵州</li>
									<!-- 
									<li>山东</li>
									<li>安徽</li>
									<li>山西</li>
									<li>陕西</li>
									<li>湖南</li>
									<li>河南</li>
									<li>河北</li>
									<li>福建</li>
									<li>江苏</li>
									<li>辽宁</li>
									<li>天津</li>
									<li>黑龙江</li>
									<li>上海</li>
									<li>重庆</li>
									<li>湖北</li>
									-->
								</ul>
								<br class="clear"/>
							</div>
						</div>
					</div>
					
					<div class="city left" name="sichuan">
						<span class="left">城市/地区/自治州：</span>
						<div class="pop_div left">
							<input type="text" id="city_text" class="div_text"/>
							<div id="city_list" class="div_list">
								<ul>
									<li>广州</li>
									<li>深圳</li>
									<li>东莞</li>
									<li>佛山</li>
									<li>珠海</li>
									<li>江门</li>
									<li>惠州</li>
									<li>清远</li>
									<li>佛山</li>
									<li>佛山</li>
									<li>珠海</li>
									<li>江门</li>
									<li>惠州</li>
									<li>清远</li>
									<li>佛山</li>
									<li>珠海</li>
									<li>江门</li>
									<li>惠州</li>
									<li>清远</li>
								</ul>
								<br class="clear"/>
							</div>
						</div>
					</div>
					<br class="clear"/>
					
					<div class="area" name="leshan">
						<div>仅支持以下区域：市中区、五通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区通桥区</div>
					</div>
				</div>
				
				
				<div class="floor_2">
					<span>选择产品类型</span>
					<div class="contract_type">
						<ul>
							<li>
								<div class="selected contract selected_div">
									<p>0元购机 </p>
									<p>24个月合约期</p>
									<i></i>
									<br class="clear"/>
									<div class="info al">预存1999话费，您将免费获得iphone5s手机一部</div>
								</div>
							</li>
							<li>
								<div class="contract selected_div">
									<p>0元购机 </p>
									<p>36个月合约期</p>
									<i></i>
									<br class="clear"/>
									<div class="info ac">预存2999话费，您将免费获得iphone5s手机一部</div>
								</div>
							</li>
							<li>
								<div class="contract selected_div">
									<p>0元购机 </p>
									<p>购机送费</p>
									<i></i>
									<br class="clear"/>
									<div class="info ar">预存3999话费，您将免费获得iphone5s手机一部</div>
								</div>
							</li>
						</ul>
						<br class="clear"/>
					</div>
				</div>
				
				<div class="floor_3">
					<span>选择月费档位</span>
					<div class="fee_type">
						<ul>
							<li>
								<div class="selected fee selected_div">
									<p>126元/月</p>
									<i></i>
									<br class="clear"/>
									<div class="info al">预存2999话费，您将免费获得iphone5s手机一部</div>
								</div>
							</li>
							<li>
								<div class="fee selected_div">
									<p>196元/月</p>
									<i></i>
									<br class="clear"/>
									<div class="info ac">预存2999话费，您将免费获得iphone5s手机一部</div>
								</div>
							</li>
							<li>
								<div class="fee selected_div">
									<p>156元/月</p>
									<i></i>
									<br class="clear"/>
									<div class="info ar">预存2999话费，您将免费获得iphone5s手机一部</div>
								</div>
							</li>
						</ul>
						<br class="clear"/>
					</div>
				</div>
				
				<div class="floor_4">
					<span>选择套餐</span>
					<div class="dinner_type">
						<ul>
							<li>
								<div class="selected dinner selected_div">
									<p>A套餐（更多上网流量）</p>
									<i></i>
									<br class="clear"/>
									<div class="info al">300M国内流量，240分钟国内语音拨打分钟数，接听免费。套餐超出后国内语音拨打为0.15元/分钟，其他资费标准见套餐详情。</div>
								</div>
							</li>
							<li>
								<div class="dinner selected_div">
									<p>B套餐（更多通话时长）</p>
									<i></i>
									<br class="clear"/>
									<div class="info ac">80M国内流量，450分钟国内语音拨打分钟数，接听免费。套餐超出后国内语音拨打为0.15元/分钟，其他资费标准见套餐详情。</div>
								</div>
							</li>
							<li>
								<div class="dinner selected_div">
									<p>C套餐（更多本地通话）</p>
									<i></i>
									<br class="clear"/>
									<div class="info ar">80M国内流量，550分钟国内语音拨打分钟数，接听免费。套餐超出后国内语音拨打为0.15元/分钟，其他资费标准见套餐详情。</div>
								</div>
							</li>
						</ul>
						<br class="clear"/>
					</div>
				</div>
			</div>
			
			<div class="left_oper left hide" id="step_2">
				<div class="floor_5">
					<span>选择产品类型</span>
					<div class="number_type">
						<ul>
							<li>
								<div class="selected number selected_div">
									<p>15602309500</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309501</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
							<li>
								<div class="number selected_div">
									<p>15602309502</p>
								</div>
							</li>
						</ul>
						<br class="clear"/>
					</div>
				</div>
			</div>
			
			
			<div class="left_oper left hide" id="step_3">
				<ul>
					<li>
						<label>姓名：</label>
						<input type="text" value="" class="input_text"/>
						<span>该项不能为空</span>
					</li>
					<li>
						<label>证件号码：</label>
						<input type="text" value="" class="input_text"/>
						<span>该项不能为空</span>
					</li>
					<li>
						<label>证件地址：</label>
						<input type="text" value="" class="input_text"/>
						<span>地址长度有问题</span>
					</li>
				</ul>
				
				<br class="clear"/>
				<div class="read_sn">
					<span>购机必读 </span>
					<p>
						（1）号码选择后，将会保留1小时，1小时内没有支付成功，号码将被取消退回。<br/>
						（2）您购买的联通合约产品，入网（收货）当月执行“套餐包外资费”，合约套餐包次月生效。 <br/>
						（3）联通号卡一旦签收，即视为用户认可协议书上的所有内容。按照联通规定，合约期内，不可办理停机、销号、停机保号、改号及过户等业务。<br/>
						（4）“0元购机”、“购机送费”的签约期内，请不要将手机与SIM卡分离使用，以免造成话费不返还或停机。<br/>
						（5） “存费送费”、“购机送费”用码选择后，将会保留1小时，1小时内没有支付成功，号码将“0元购机”用户，需机主本人持身份证原件到联通自有营业厅办理话费发票。<br/>
						（6）话费发票均为联通公司提供的符合国家规定的正规个人（非单位抬头）通讯费发票。
		            </p>
		            <div class="agree_sn">
			            <input type="checkbox"/> &nbsp;我已阅读并同意&lt;<a href="###">购前须知</a>&gt;和&lt;<a href="###">联通协议</a>&gt;
			        </div>
				</div>
			</div>
			
			
			<div class="right_res right">
				<div class="header">您选择的合约</div>
				<div class="res_info">
					<ul>
						<li>
							<strong>小米手机2S 16GB标准版</strong>
						</li>
						<li>
							<strong>0元购机 </strong>
						</li>
					</ul>
					<div class="right price">
						总价 ￥ <ins>2399</ins>
					</div>
					<br class="clear"/>
					<div class="button_div" step="1">
						<a href="###" class="button">下一步</a>
					</div>
					
					<div class="detail">
						<ul>
							<li>
								<span>四川省成都市</span>
							</li>
							<li>
								<strong>0元购机24个月</strong>
								<span>预存2399元话费，您将免费获得小米手机2S（16G）一台。</span>
							</li>
							<li>
								<strong>186元/月</strong>
								<span>预存话费返还规则：入网即返479元，合约期内每月返还80元。</span>
							</li>
							<li>
								<strong>A套餐</strong>
								<span>650M国内流量，510分钟国内语音拨打分钟数，接听免费。套餐超出后国内语音拨打为0.15元/分钟，其他资费标准见套餐详情。</span>
							</li>
						</ul>
					</div>
					
				</div>
				
			</div>
			<br class="clear"/>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>