<%@page language="java" import="java.util.*,com.sys.utils.GetPropertiesVal" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="url.jsp" %>
<html>
	<head>
		<title>广东联通终端管理平台-注册用户</title>
		<link href="<%=curUrl%>/app/lc/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
		<link href="<%=curUrl%>/app/lc/manage/resources/css/my/register.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=curUrl%>/app/lc/manage/resources/js/jquery-easyui/js/jquery-1.7.2.min.js" ></script>
		
		<script src="<%=curUrl%>/app/lc/display/my-js/common.js"></script>
		<script src="<%=curUrl%>/app/lc/manage/my-js/register.js"></script>	
	</head>
	<body fit="true">
		<div class="login_register">
			<div class="outer_div">
				<div class="register_div glass_blue_div">
					<div class="div_top">
						<div class="left">
							欢迎注册沃盟
						</div>
						<div class="right">
							<a href="<%=curUrl %>/b2b/manage/jsp/login.jsp">直接登录</a>
						</div>
						<span class="clear"></span>
					</div>
					<div class="form_div">
						<form action="<%=curUrl %>/b2b/manage/action/user!register.action" method="post" id="registerForm">
							<input type="hidden" id="cGroupId" value="-1" name="userMap['groupId']" />
							<input type="hidden" id="groupLevel" value="0" />
							<div class="register">
								<ul>
									<li class="li" id="groupDetailDivLi">
										<b>※</b>
										<div class="label">
											名称：
										</div>
										<div class="inputOuter">
											<input id="groupDetailName_val" class="inputStyle" type="text" name="userMap['groupDetailName']"/>
										</div>
										<div id="groupDetailName_msg" class="msg">
											
										</div>
										<br class="clear"/>
									</li>
									<li class="li">
										<b>※</b>
										<div class="label">
											登录帐号：
										</div>
										<div class="inputOuter">
											<input id="account_val" class="inputStyle" type="text" name="userMap['account']"/>
										</div>
										<div id="account_msg" class="msg">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;3G网点请填写BSS五位数代码,2G网点请填写ID号</span>
										</div>
										<br class="clear"/>
									</li>
									<li class="li">
										<b>※</b>
										<div class="label">
											密码：
										</div>
										<div class="inputOuter">
											<input id="pwd_val" class="inputStyle" type="password" name="userMap['pwd']"/>
										</div>
										<div  id="pwd_msg" class="msg">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;长度大于5的字符密码</span>
										</div>
										<br class="clear"/>
									</li>
									<li class="li">
										<b>※</b>
										<div class="label">
											重复密码：
										</div>
										<div class="inputOuter">
											<input id="re_pwd_val" class="inputStyle" type="password" />
										</div>
										<div id="re_pwd_msg" class="msg">
											
										</div>
										<br class="clear"/>
									</li>
									<li>
										<b>※</b>
										<div class="label">
											用户类型：
										</div>
										<div class="left notInput">
											<span>
												<select id="userType" name="userMap['userType']">
													<option value="3" selected>代理商</option>
													<option value="2">供货商</option>
												</select>
											</span>
											
											<span>
												未注册：<input type="radio" name="userMap['isReg']" value="0" checked/>
											</span>
											
											<span>
												已注册：<input type="radio" name="userMap['isReg']" value="1"/>
											</span>
										</div>
										<br class="clear"/>
									</li>
									<li>
										<b>※</b>
										<div class="label">
											用户归属：
										</div>
										
										<div class="left notInput">
											<div id="levelDiv1">
												<span>
													<select style="width:150px;" onchange="groupChange(this, 1)">
														<option value="-1">请选择</option>
													</select>
												</span>
											</div>
											<div id="groupDetailDiv">
												<span>
													<select style="width:150px">
														<option value="-1">请选择组织</option>
													</select>
												</span>
											</div>
										</div>
										<div id="group_msg" class="msg">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;请选择归属地</span>
										</div>
										<br class="clear"/>
									</li>
									<li class="li"><!-- ★ **※-->
										<b>※</b>
										<div class="label">
											用户名：
										</div>
										<div class="inputOuter">
											<input id="name_val" class="inputStyle" type="text" name="userMap['name']"/>
										</div>
										<div id="name_msg" class="msg">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;请输入6-30位的字母数字组合</span>
										</div>
										<br class="clear"/>
									</li>
									<li class="li">
										<b>※</b>
										<div class="label">
											电话：
										</div>
										<div class="inputOuter">
											<input id="phone_val" class="inputStyle" type="text" name="userMap['phone']"/>
										</div>
										<div id="phone_msg" class="msg">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;请填写联通手机号码,用于短信通知提醒</span>
										</div>
										<br class="clear"/>
									</li>
									<li class="li">
										<b></b>
										<div class="label">
											邮箱：
										</div>
										<div class="inputOuter">
											<input class="inputStyle" type="text" name="userMap['email']"/>
										</div>
										<br class="clear"/>
									</li>
									<li class="li">
										<b></b>
										<div class="label">
											QQ：
										</div>
										<div class="inputOuter">
											<input class="inputStyle" type="text" name="userMap['qq']"/>
										</div>
										<br class="clear"/>
									</li>
									<li class="textarea">
										<b></b>
										<div class="label">
											备注：
										</div>
										<div>
											<textarea name="userMap['email']" cols="25" rows="3"></textarea>
										</div>
										<br class="clear"/>
									</li>
									
									<li>
										<b></b>
										<div class="label">
											验证码：
										</div>
										<div class="inputVcOuter">
				            				<input type="text" class="inputVcStyle" id="inputVc" maxlength="5" />
				           				 </div>
										<div class="left">
											<a href="###" id="change_code_img">
												<img src="<%=curUrl %>/verification_code.jpg" height="39" width="80"/>
											</a>
										</div>
										<div id="inputVc_msg" class="msg"></div>
										<br class="clear"/>
									</li>
									
									<li>
										<div class="textcenter">
											<a href="###" id="register">注 册</a>
										</div>
										<br class="clear"/>
									</li>
									
								</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
			<br class="clear"/>
		</div>
		<div class="txt_bg"></div>
	</body>
</html>