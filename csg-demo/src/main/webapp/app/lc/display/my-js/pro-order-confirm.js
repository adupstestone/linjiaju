$(function(){
	loadAddrList();
	//loadPhoneList();
});

function loadPhoneList() {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneCartAction!loadPhoneCartList.action",
		type : "post",
		dataType : "json",
		success : function(data){
			var phoneListHtml = assemblePhoneList(data);
			$("#phoneList").empty().html(phoneListHtml);
		}
	});
}

function assemblePhoneList(data) {
	var html = '';
	var sum = 0;
	html += '<table cellpadding="0" cellspacing="0" class="phone_list_table">';
	html += '<tr class="tr_title">';
	html += '<td>商品名称</td>';
	html += '<td class="td_item">单价</td>';
	html += '<td class="td_item">数量</td>';
	html += '<td class="td_item">总价</td>';
	html += '</tr>';
	for(var i = 0; i< data.length; i++) {
		
		html += '<tr class="tr_body">';
		html += '<td>';
		html += '<div class="p-img left"><a href="###" title="' + data[i].name + '">';
		html += '<img style="width:60px;height:60px;" src="'+ resourceUrl + data[i].pic + '" />';
		html += '</a></div>';
		html += '<div class="p-name left"><a href="###" title="' + data[i].name + '">';
		html += '<span style="color:#0044BB;">' + data[i].name + '</span>';
		html += '</a></div>';
		html += '</td>';
		html += '<td class="td_item">';
		html += '<span style="color:#FF0000;">￥' + data[i].price + '</span>';
		html += '</td>';
		html += '<td class="td_item">';
		html += data[i].count;
		html += '</td>';
		html += '<td class="td_item">';
		html += '<span style="color:#FF0000;">￥' + FloatMul(data[i].price, data[i].count) + '</span>';
		html += '</td>';
		html += '</tr>';

		sum += FloatMul(data[i].price, data[i].count);
	}
	html += '</table>';

	$("#totalPrice, #actualTotalPrice").text(sum);
	return html;
}

function loadAddrList() {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!loadAddrList.action",
		type : "post",
		dataType : "json",
		success : function(data){
			var addrListHtml = assembleAddrList(data);
			$("#addrList").empty().html(addrListHtml);
		}
	});
}

function assembleAddrList(data){
	var html = '';
	if(data.length > 0) {
		for(var i = 0; i< data.length; i++) {
			html += '<div class="item_content1">';
			html += '<div class="left">';
			html += '<input type="radio" name="addrId" value="' + data[i].ADDR_ID + '"';
			if(data[i].DEFAULT_ADDR_FLAG == 1) {
				html += ' checked ';
			}
			html += '/>&nbsp;&nbsp;&nbsp;';
			html += '</div>';
			html += '<div class="addr_detail left">';
			html += '<span>' + data[i].PROVINCE_NAME + '</span>';
			html += '<span>' + data[i].CITY_NAME + '</span>';
			html += '<span>' + data[i].AREA_NAME + '</span>';
			html += '<span>' + data[i].ADDR_DETAIL + '</span>';
			html += '</div>';
			html += '<div class="addr_receiver left">';
			html += '<span>' + data[i].RECEIVER_NAME + '</span>';
			html += '</div>';
			html += '<div class="addr_receiver left">';
			html += '<span>' + data[i].RECEIVER_MOBILE + '</span>';
			html += '</div>';
			html += '<div class="right">';
			if(data[i].DEFAULT_ADDR_FLAG == 0) {
				html += '<a href="###" onclick="updateDefaultAddr(' + data[i].ADDR_ID + ')"><span>&nbsp;设为默认地址&nbsp;</span></a>';
			} else {
				html += '<span>&nbsp;默认地址&nbsp;</span>';
			}
			html += '<a href="###" onclick="editAddrButton(' + data[i].ADDR_ID + ' , 0)"><span style="color:green;">&nbsp;修改&nbsp;</span></a>';
			html += '<a href="###" onclick="deleteAddr(' + data[i].ADDR_ID + ')"><span style="color:red;">&nbsp;删除&nbsp;</span></a>';
			html += '</div>';
			html += '</div>';
		}
	} else {
		html += '<div class="item_content2">';
		html += '<div class="no_addr">收货地址暂时为空</div>';
		html += '</div>';
	}
	return html;
}

//type为0表示新增 为1表示修改
function loadCountrySelectSpan(countryId, provinceId, cityId, areaId, type) {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!loadCountryList.action",
		type : "post",
		dataType : "json",
		success : function(data){
			var html = '';
			html += '<select class="addr_select" name="countryId" '; 
			html += 'onchange="loadProvinceSelectSpan(this.options[this.selectedIndex].value, 0, 0, 0, ' + type + ')">';
			html += '<option value="0">请选择国家</option>';
			for(var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].COUNTRY_ID +'"'
				if(countryId == data[i].COUNTRY_ID) {
					html += ' selected ';
				}
				html += '>';
				html += data[i].COUNTRY_NAME;
				html += '</option>';
			}
			html += '</select>';
			loadProvinceSelectSpan(countryId, provinceId, cityId, areaId, type)
			if(type == 0) {
				$("#addCountrySelectSpan").empty().html(html);
			} else {
				$("#editCountrySelectSpan").empty().html(html);
			}
		}
	});
	
}

//type为0表示新增 为1表示修改
function loadProvinceSelectSpan(countryId, provinceId, cityId, areaId, type) {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!loadProvinceList.action",
		type : "post",
		dataType : "json",
		data : {parentId : countryId},
		success : function(data){
			var html = '';
			html += '<select class="addr_select" name="provinceId" ';
			html += 'onchange="loadCitySelectSpan(' + countryId + ', this.options[this.selectedIndex].value, 0, 0, ' + type + ')">';
			html += '<option value="0">请选择省份</option>';
			for(var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].PROVINCE_ID +'"'
				if(provinceId == data[i].PROVINCE_ID) {
					html += ' selected ';
				}
				html += '>';
				html += data[i].PROVINCE_NAME;
				html += '</option>';
			}
			html += '</select>';
			loadCitySelectSpan(countryId, provinceId, cityId, areaId, type);
			if(type == 0) {
				$("#addProvinceSelectSpan").empty().html(html);
			} else {
				$("#editProvinceSelectSpan").empty().html(html);
			}
		}
	});
	
}

//type为0表示新增 为1表示修改
function loadCitySelectSpan(countryId, provinceId, cityId, areaId, type) {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!loadCityList.action",
		type : "post",
		dataType : "json",
		data : {parentId : provinceId},
		success : function(data){
			var html = '';
			html += '<select class="addr_select" name="cityId" ';
			html += 'onchange="loadAreaSelectSpan(' + countryId + ', ' + provinceId + ', this.options[this.selectedIndex].value, 0, ' + type + ')">';
			html += '<option value="0">请选择城市</option>';
			for(var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].CITY_ID +'"'
				if(cityId == data[i].CITY_ID) {
					html += ' selected ';
				} 
				html += '>';
				html += data[i].CITY_NAME;
				html += '</option>';
			}
			html += '</select>';
			loadAreaSelectSpan(countryId, provinceId, cityId, areaId, type);	
			if(type == 0) {
				$("#addCitySelectSpan").empty().html(html);
			} else {
				$("#editCitySelectSpan").empty().html(html);
			}
		}
	});
	
}

//type为0表示新增 为1表示修改
function loadAreaSelectSpan(countryId, provinceId, cityId, areaId, type) {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!loadAreaList.action",
		type : "post",
		dataType : "json",
		data : {parentId : cityId},
		success : function(data){
			var html = '';
			html += '<select class="addr_select" name="areaId">';
			html += '<option value="0">请选择区域</option>';
			for(var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].AREA_ID +'"'
				if(areaId == data[i].AREA_ID) {
					html += ' selected ';
				}
				html += '>';
				html += data[i].AREA_NAME;
				html += '</option>';
			}
			html += '</select>';
			if(type == 0) {
				$("#addAreaSelectSpan").empty().html(html);
			} else {
				$("#editAreaSelectSpan").empty().html(html);
			}
		}
	});
	
}


//type为0表示打开 为1表示关闭
function addAddrButton(type){
	if(type == 0) {
		if($("#addAddrDiv:hidden").length == 1) {
			$("#addAddrDiv").show();
		}
	} else {
		$("#addAddrDiv").find(".validate_span").hide();
		$("#addAddrDiv").hide();
	}
	loadCountrySelectSpan(0, 0, 0, 0, 0);
}

function editAddrButton(addrId, type) {
	if(type == 0) {
		if($("#editAddrDiv:hidden").length == 1) {
			$("#editAddrDiv").show();
		}
		$.ajax({
			url : curUrl + "/b2b/display/action/phoneAddrAction!loadAddrList.action",
			type : "post",
			dataType : "json",
			data : {
				addrId : addrId
			},
			success : function(data){
				loadCountrySelectSpan(data[0].COUNTRY_ID, data[0].PROVINCE_ID, data[0].CITY_ID, data[0].AREA_ID, 1);
				$("#editAddrDiv").find("input[name='addrDetail']").val(data[0].ADDR_DETAIL);
				$("#editAddrDiv").find("input[name='receiverName']").val(data[0].RECEIVER_NAME);
				$("#editAddrDiv").find("input[name='receiverMobile']").val(data[0].RECEIVER_MOBILE);
				$("#editAddrDiv").find("input[name='receiverMail']").val(data[0].RECEIVER_MAIL);
				$("#editAddrDiv").find("input[name='receiverTel']").val(data[0].RECEIVER_TEL);
				$("#editAddrDiv").find("input[name='addrPostal']").val(data[0].ADDR_POSTAL);
				$("#editAddrDiv").find("input[name='addrId']").val(addrId);
				if(data[0].DEFAULT_ADDR_FLAG == 0) {
					$("#editAddrDiv").find("input[name='defaultAddrFlag']").attr("checked", false);
				} else {
					$("#editAddrDiv").find("input[name='defaultAddrFlag']").attr("checked", true);
				}
			}
		});
	} else {
		$("#editAddrDiv").find(".validate_span").hide();
		$("#editAddrDiv").hide();
	}
}

function saveNewAddr(){
	$("#addAddrDiv").find(".validate_span").hide();
	if(!validateAddr(0)) {
		return;
	}
	var addrAreaId = $("#addAddrDiv").find("select[name='areaId']").val();
	var addrDetail = $("#addAddrDiv").find("input[name='addrDetail']").val();
	var receiverName = $("#addAddrDiv").find("input[name='receiverName']").val();
	var receiverMobile = $("#addAddrDiv").find("input[name='receiverMobile']").val();
	var receiverMail = $("#addAddrDiv").find("input[name='receiverMail']").val();
	var receiverTel = $("#addAddrDiv").find("input[name='receiverTel']").val();
	var addrPostal = $("#addAddrDiv").find("input[name='addrPostal']").val();
	var defaultAddrFlag = $("#addAddrDiv").find("input:checked[name='defaultAddrFlag']").length;
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!saveNewAddr.action",
		type : "post",
		dataType : "json",
		data : {
			addrAreaId : addrAreaId,
			addrDetail : addrDetail,
			receiverName : receiverName,
			receiverMobile : receiverMobile,
			receiverMail : receiverMail,
			receiverTel : receiverTel,
			addrPostal : addrPostal,
			defaultAddrFlag : defaultAddrFlag
		},
		success : function(data){
			$("#addAddrDiv").find("input[type='text']").val('');
			$("#addAddrDiv").find("input[type='checkbox']").attr("checked", false);
			$("#addAddrDiv").find("select").each(function(){
				$(this).find("option:eq(0)").attr("selected", true);
			});
			loadAddrList();
			$("#addAddrDiv").hide();
		}
	});
}

function updateAddr(){
	$("#editAddrDiv").find(".validate_span").hide();
	if(!validateAddr(1)) {
		return;
	}
	var addrId = $("#editAddrDiv").find("input[name='addrId']").val();
	var addrAreaId = $("#editAddrDiv").find("select[name='areaId']").val();
	var addrDetail = $("#editAddrDiv").find("input[name='addrDetail']").val();
	var receiverName = $("#editAddrDiv").find("input[name='receiverName']").val();
	var receiverMobile = $("#editAddrDiv").find("input[name='receiverMobile']").val();
	var receiverMail = $("#editAddrDiv").find("input[name='receiverMail']").val();
	var receiverTel = $("#editAddrDiv").find("input[name='receiverTel']").val();
	var addrPostal = $("#editAddrDiv").find("input[name='addrPostal']").val();
	var defaultAddrFlag = $("#editAddrDiv").find("input:checked[name='defaultAddrFlag']").length;
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!updateAddr.action",
		type : "post",
		dataType : "json",
		data : {
			addrId : addrId,
			addrAreaId : addrAreaId,
			addrDetail : addrDetail,
			receiverName : receiverName,
			receiverMobile : receiverMobile,
			receiverMail : receiverMail,
			receiverTel : receiverTel,
			addrPostal : addrPostal,
			defaultAddrFlag : defaultAddrFlag
		},
		success : function(data){
			loadAddrList();
			$("#editAddrDiv").hide();
		}
	});
}

function updateDefaultAddr(addrId) {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!updateDefaultAddr.action",
		type : "post",
		dataType : "json",
		data : {
			addrId : addrId
		},
		success : function(data){
			loadAddrList();
		}
	});
}

function deleteAddr(addrId) {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneAddrAction!deleteAddr.action",
		type : "post",
		dataType : "json",
		data : {
			addrId : addrId
		},
		success : function(data){
			loadAddrList();
		}
	});
}

function confirmOrder(){
	var addrId = $("#addrList").find("input:checked[name='addrId']").val();
	var totalPrice = $.trim($("#totalPrice").text());
	if(totalPrice == '0' || totalPrice == '') {
		return;
	}
	if(typeof(addrId) == 'undefined' || $.trim(addrId) == '') {
		alert("请选择派送地址");
		if($("#addrList").find("input[name='addrId']").length == 0) {
			addAddrButton(0);
		}
	} else {
		var paymentMethod = $("input:checked[name='paymentMethod']").val(); 
		var deliveryMethod = $("input:checked[name='deliveryMethod']").val(); 
		var orderComment = $("#orderComment").val(); 
		var actualTotalPrice = $("#actualTotalPrice").text(); 
		$.ajax({
			url : curUrl + "/b2b/display/action/phoneOrderAction!confirmOrder.action",
			type : "post",
			dataType : "json",
			data : {
				addrId : addrId,
				paymentMethod : paymentMethod,
				orderComment : orderComment,
				totalAmount : actualTotalPrice,
				deliveryMethod : deliveryMethod
			},
			success : function(data) {
				//跳转到订单支付页面
				if(data != null && data!= '') {
					window.location.href = curUrl + "/b2b/display/action/phoneOrderAction!toPayment.action?orderId="+ data + "&paymentMethod=" + paymentMethod;
				}
			}
		});
	}
}

function validateAddr(type) {
	var flag = true;
	var validateDiv;
	if(type == 0) {
		validateDiv = $("#addAddrDiv");
	} else {
		validateDiv = $("#editAddrDiv");
	}

	//验证区域
	var areaId = $(validateDiv).find("select[name='areaId']").val();
	if(areaId == 0) {
		$(validateDiv).find("select[name='areaId']").parent().parent().find(".validate_span").show();
		flag = false;
	}

	//验证详细地址
	var addrDetail = $.trim($(validateDiv).find("input[name='addrDetail']").val());
	if(addrDetail == '') {
		$(validateDiv).find("input[name='addrDetail']").parent().parent().find(".validate_span").show();
		flag = false;
	}

	//验证收货人姓名
	var receiverName = $.trim($(validateDiv).find("input[name='receiverName']").val());
	if(receiverName == '') {
		$(validateDiv).find("input[name='receiverName']").parent().parent().find(".validate_span").show();
		flag = false;
	}

	//验证手机
	var receiverMobile = $.trim($(validateDiv).find("input[name='receiverMobile']").val());
	if(!validateMobile(receiverMobile)) {
		$(validateDiv).find("input[name='receiverMobile']").parent().parent().find(".validate_span").show();
		flag = false;
	}

	///验证邮箱
	var receiverMail = $.trim($(validateDiv).find("input[name='receiverMail']").val());
	if(!validateMail(receiverMail) && receiverMail != '') {
		$(validateDiv).find("input[name='receiverMail']").parent().parent().find(".validate_span").show();
		flag = false;
	}

	//验证固话
	var receiverTel = $.trim($(validateDiv).find("input[name='receiverTel']").val());
	if(!validateTel(receiverTel) && receiverTel != '') {
		$(validateDiv).find("input[name='receiverTel']").parent().parent().find(".validate_span").show();
		flag = false;
	}

	//验证邮编
	var addrPostal = $.trim($(validateDiv).find("input[name='addrPostal']").val());
	if(!validatePostal(addrPostal) && addrPostal != '') {
		$(validateDiv).find("input[name='addrPostal']").parent().parent().find(".validate_span").show();
		flag = false;
	}
	return flag;
}