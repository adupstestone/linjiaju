<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="url.jsp" %>
<html>
<head>
<title>用户登录</title>
<meta http-equiv=content-type content="text/html; charset=utf-8">
<link href="<%=curUrl%>/lc/manage/resources/css/my/common.css" rel="stylesheet" type="text/css" />
<link href="<%=curUrl%>/lc/manage/resources/css/my/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=curUrl%>/lc/manage/resources/js/jquery-1.7.2.min.js" language="javascript"></script>
<script type="text/javascript">
	var nowVc = null;
	$(function() {
		
		$("#login_btn").click(function(){
			if(checkVerificationCode()){
				$("#login_form").submit();
			}
			
			//return false;
		});
		
		//更换验证码图片
		$("#change_code_img").click(function() {
			$("#change_code_img img").attr('src', curUrl + '/verification_code.jpg?' + Math.floor(Math.random()*100) );
			$.ajax({
				url :  curUrl + "/b2b/manage/action/loginAction!verificationCode.action",
				type : "post",
				dataType : "json",
				success : function(data){
					nowVc = data[0].captcha;
				}
			});
		});
		
		$(".inputStyle,.inputVcStyle").focus(function(){
			$(this).parent().removeClass("blur");
			$(this).parent().addClass("focus");
		}).blur(function(){
			$(this).parent().removeClass("focus");
			$(this).parent().addClass("blur");
		});
		
		/* $.ajax({
			url :  curUrl + "/b2b/manage/action/loginAction!verificationCode.action",
			type : "post",
			dataType : "json",
			success : function(data){
				nowVc = data[0].captcha;
			}
		}); */
	});

	function checkVerificationCode(){//检查验证码方法
		var inputVc = $("#inputVc").val();
		//验证码检验
		if(typeof(inputVc) == 'undefined' || $.trim(inputVc) == ''){
			alert("请输入验证码！！");
			return false;
		}
		inputVc = inputVc.toLowerCase();//转小写
		if(nowVc != inputVc){
			alert("验证码不正确！");
			return false;
		}
		return true;
	}
</script>
</head>

<body>
	<div class="login_register">
		<div class="outer_div">
			<div>
				<img alt="B2B" src="<%=curUrl%>/lc/manage/resources/img/my/unicom-logo.png"/>
			</div>
			<div class="form_div">
				<form action="" method="post" id="login_form">
					<div class="li">
						<div class="label">用户名：</div>
			            <div class="inputOuter">
			                 <input type="text" class="inputStyle" id="u" name="username" value="" tabindex="1"> 
			            </div>
			            <br class="clear"/>
			        </div> 
			        <div class="li">
			        	<div class="label">密 码：</div>
			            <div class="inputOuter">
			                <input type="password" class="inputStyle password" id="p" name="password" value="" maxlength="16" tabindex="2"> 
			            </div>
			            <br class="clear"/>
					</div>
					
					<div class="li">
			        	<div class="label">验证码：</div>
			            <div class="inputVcOuter">
			            	<input type="text" class="inputVcStyle" id="inputVc" maxlength="5">
			            </div>
						<div class="left">
						<!-- 
							<a href="###" id="change_code_img">
								<img src="<%=curUrl %>/verification_code.jpg" height="39" width="80"/>
							</a>
						 -->
						</div>
						<br class="clear"/>
					</div>
					
					<div class="li">
						<div class="rememberMe_label">记住我两周：<input id="rememberMe" type="checkbox" name="rememberMe" value="true"></div>
						<br class="clear"/>
					</div>
					
					<div class="button_bottom">
						<div class="left">
							<a href="###" id="login_btn"></a>
						</div>
						<div class="right">
							<a href="<%=curUrl %>/lc/manage/jsp/register.jsp" id="register_btn">注 册</a>
						</div>
						<br class="clear"/>
					</div>
					
				</form>
			</div>
		</div>
		<br class="clear"/>
	</div>
</body>

</html>
