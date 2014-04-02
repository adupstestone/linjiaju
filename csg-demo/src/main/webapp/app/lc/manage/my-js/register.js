			var nowVc = null;
			$(function(){
				var check1 = false;
				var check2 = false;
				var check3 = false;
				var check4 = false;
				var check5 = false;
				var check6 = false;
				var check8 = false;

				$("#account_val").blur(function(){
					var nameVal = $(this).val();
					var html = "";
					if(nameVal == ''){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;帐号不能为空！</span>";
						$("#account_msg").html(html);
						return check1 = false;
					}else if(checkStrLength(nameVal) < 5){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;字符长度不符！</span>";
						$("#account_msg").html(html);
						return check1 = false;
					}
					
					$("#").html(html);
					check1 = true;
				});
				
				$("#name_val").blur(function(){
					var accountVal = $(this).val();
					var html = "";
					if(accountVal == ''){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;用户名不能为空！</span>";
						$("#name_msg").html(html);
						return check2 = false;
					}else if(checkStrLength(accountVal) < 6  || checkStrLength(accountVal) > 30){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;字符长度不符！</span>";
						$("#name_msg").html(html);
						return check2 = false;
					}
					
					$.ajax({
						url:curUrl + '/b2b/manage/action/user!findUser.action?',
						type : "post",
						dataType : "json",
						data : {
							account : accountVal
						},
						success:function(data) {
							if(data.count == "1"){
								html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;该帐号已存在！</span>";
								$("#account_msg").html(html);
								return check2 = false;
							}
						}
					});
					
					$("#account_msg").html(html);
					check2 = true;
				});
				
				$("#pwd_val").blur(function(){
					var pwdVal = $(this).val();
					var html = "";
					if(pwdVal == ''){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;请输入密码！</span>";
						$("#pwd_msg").html(html);
						return check3 = false;
					}else if(checkStrLength(pwdVal) < 6){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;密码长度不符！</span>";
						$("#pwd_msg").html(html);
						return check3 = false;
					}else if(checkPassword(pwdVal)){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;请输入字母数字组合的密码！</span>";
						$("#pwd_msg").html(html);
						return check3 = false;
					}
					
					$("#pwd_msg").html(html);
					
					var repwdVal = $("#re_pwd_val").val();
					if(pwdVal != repwdVal && repwdVal !=""){
						var html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;两次输入的密码不一致！</span>";
						$("#re_pwd_msg").html(html);
					}
					check3 = true;
				});
				
				$("#re_pwd_val").blur(function(){
					var pwdVal = $("#pwd_val").val();
					var repwdVal = $(this).val();
					var html = "";
					if(repwdVal == ''){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;请再输入一次密码！</span>";
						$("#re_pwd_msg").html(html);
						return check4 = false;
					}else if(pwdVal != repwdVal){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;两次输入的密码不一致！</span>";
						$("#re_pwd_msg").html(html);
						return check4 = false;
					}
					
					$("#re_pwd_msg").html(html);
					check4 = true;
				});
				
				$("#groupDetailName_val").blur(function(){
					var groupDetailNameVal = $(this).val().trim();
					var html = "";
					if(groupDetailNameVal == ''){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;请输入网点名称！</span>";
						$("#groupDetailName_msg").html(html);
						return check5 = false;
					}
					
					$("#groupDetailName_msg").html(html);
					check5 = true;
				});
				
				$("#phone_val").blur(function(){
					var phoneVal = $(this).val();
					var html = "";
					if(phoneVal == ''){
						html = "<span style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;手机号码不能为空！</span>";
						$("#phone_msg").html(html);
						return check6 = false;
					}else if(!checkLTmun(phoneVal)){
						html = "<span style='color:red;'>&nbsp;&nbsp;手机号码有误，请输入联通手机号码！</span>";
						$("#phone_msg").html(html);
						return check6 = false;
					}
					
					$("#phone_msg").html(html);
					return check6 = true;
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
				
				$.ajax({
					url :  curUrl + "/b2b/manage/action/loginAction!verificationCode.action",
					type : "post",
					dataType : "json",
					success : function(data){
						nowVc = data[0].captcha;
					}
				});
				
				$("#inputVc").blur(function(){
					
					var inputVc = $("#inputVc").val();
					//验证码检验
					var html = ""
					if(typeof(inputVc) == 'undefined' || $.trim(inputVc) == ''){
						html = "<span style='color:red;'>&nbsp;&nbsp;请输入验证码！</span>";
						$("#inputVc_msg").html(html);
						return check8 = false;
					}
					inputVc = inputVc.toLowerCase();//转小写
					if(nowVc != inputVc){
						html = "<span style='color:red;'>&nbsp;&nbsp;验证码不正确！</span>";
						$("#inputVc_msg").html(html);
						return check8 = false;
					}
					$("#inputVc_msg").html("");
					return check8 = true;
				});
				
				
				//将用户组织隐藏
				$("#groupDetailDiv").hide();
				//是否已注册
				$("input:radio").change(function(){
					if($(this).val() == '0') {//未注册
						$("#groupDetailDiv").hide();
						$("#groupDetailDivLi").show();
						$("#groupDetailName_val").val("");
						check5 = false;
					} else {
						check5 = true;
						$("#groupDetailDiv").show();
						$("#groupDetailDivLi").hide();
					}
				});
				
				//以代理商初始化组织
				initGroup('3');

				$("#userType").change(function(){
					var userType = $(this).val();
					initGroup(userType);
					initGroupDetail();
				});



				$("#register").click(function(){
					var check7 = true;
					if($("input:radio").val() != '0'){//已经注册
						var groupDetaiVal = $("#groupDetailId").val();
						if(groupDetaiVal == -1 || groupDetaiVal == null){
							var html = "<span style='color:red;'>&nbsp;&nbsp;请选择归属地！</span>";
							$("#group_msg").html(html);
							check7 = false;
						}
					}
					if(check1 && check2 && check3 && check4 && check5 && check6 && check7 && check8){
						//alert("ok");
						$("#registerForm").submit();
					}else{
						//alert(check1 + "  " + check2 + "  " + check3 + "  " + check4 + "  " + check5 + "  " + check6 + "  " + check7 + "  " + check8);
						if(!check8){
							var html = "<span style='color:red;'>&nbsp;&nbsp;请输入验证码！</span>";
							$("#inputVc_msg").html(html);
							return;
						}
						alert("请把带    ※   号的信息填写完整！");
						
					}
					
				});

				$(".inputStyle,.inputVcStyle").focus(function(){
					$(this).parent().removeClass("blur");
					$(this).parent().addClass("focus");
				}).blur(function(){
					$(this).parent().removeClass("focus");
					$(this).parent().addClass("blur");
				});

			});
			
			
		
			function initGroup(userType){
				$("#cGroupId").val("-1");
				$.ajax({
					url:curUrl + '/b2b/manage/action/group!loadGroups.action?parentId=0',
					dataType:'json',
					type:'post',
					success:function(data) {
						//初始化levelDiv0的内容 并且删除之后的Div
						var html = "<select style='width:150px' onchange='groupChange(this, 0)'>";
						html += '<option value="-1">请选择</option>';
						if(data.length > 0) {
							for(var i = 0; i < data.length; i++) {
								html += '<option value="' + data[i].id + '">' + data[i].text + '</option>';
							}
						}
						html += '</select>';
						$("#levelDiv0 span").html(html);
						$("div[id^='levelDiv']").not($("#levelDiv0")).remove();
					}
				});
			}

			function groupChange(obj, level) {
				var parentId = $(obj).val();
				var userType = $("#userType").val();
				var cGroupId = parentId;
				if(parentId == '-1' && level != 0) {
					cGroupId = $("#levelDiv" +(parseInt(level) - 1) +" select").val();
				} 
				$("#cGroupId").val(cGroupId);
				initGroupDetail();
				$.ajax({
					url:curUrl + '/b2b/manage/action/group!loadGroups.action?&parentId='+parentId,
					dataType:'json',
					type:'post',
					success:function(data) {
						$("div[id^='levelDiv']").not($("#levelDiv0")).each(function(){
							var cLevel = $(this).attr("id").substring('levelDiv'.length);
							if(parseInt(cLevel) > parseInt(level)) {
								$(this).remove();
							}
						});
						if(data.length > 0) {
							var html = '<div id="levelDiv' + (level + 1) + '"><span>';
							html += "<select style='width:150px'";
							html += " onchange='groupChange(this, " + (level +1) + ")'>";
							html += '<option value="-1">请选择</option>';
							for(var i = 0; i < data.length; i++) {
								html += '<option value="' + data[i].id + '">' + data[i].text + '</option>';
							}
							html += '</select>';
							html += '</span></div>';
							$("#levelDiv" + level).after(html);
						}
					}
				});
			}

			function initGroupDetail(){
				var groupId = $("#cGroupId").val();
				var userType = $("#userType").val();
				$.ajax({
					url:curUrl + '/b2b/manage/action/groupDetail!loadGroupDetailSelect.action?groupId='+groupId+'&userType='+userType,
					dataType:'json',
					type:'post',
					success:function(data) {
						var html = "<select style='width:150px' id='groupDetailId' name=userMap['groupDetailId']";
						html += '><option value="-1">请选择组织</option>';
						if(data.length > 0) {
							for(var i = 0; i < data.length; i++) {
								html += '<option value="' + data[i].groupDetailId + '">' + data[i].groupDetailName + '</option>';
							}
						}
						html += '</select>';
						$("#groupDetailDiv span").html(html);
					}
				});
			}