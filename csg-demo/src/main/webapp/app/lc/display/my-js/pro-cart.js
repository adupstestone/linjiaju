$(function(){
	//initCartList();
});

function initCartList() {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneCartAction!loadPhoneCartList.action",
		type : "post",
		dataType : "json",
		success : function(data){
			var cartListHtml = assembleCartList(data);
			$("#cartList").empty().html(cartListHtml);
		}
	});
}

function assembleCartList(data) {
	var html = '';
	var sum = 0;
	var count = 0;
	if(data.length == 0) {
		html += '<div class="cart_list_body">';
		html += '<div class="cart_list_body_noitem">购物车暂时没有商品</div>'
		html += "</div>";
	} else {
		for(var i = 0; i < data.length; i++) {
			html += '<div class="cart_list_body">';
			html += '<div class="cart_list_body_item_name left">';
			html += '<div class="p-img left">';
			html += '<a href="###" title="' + data[i].name + '">';
			html += '<img style="width:60px;height:60px;" src="' + resourceUrl + data[i].pic + '"/>';
			html += '</a>';
			html += '</div>';
			html += '<div class="p-name left">';
			html += '<a href="###" title="' + data[i].name + '">';
			html += '<span>';
			html += data[i].name;
			html += '</span></a>		';
			html += '</div>';
			html += '</div>';
			html += '<div class="cart_list_body_item left">';
			html += data[i].sellerName;
			html += '</div>';
			html += '<div class="cart_list_body_item left">';
			html += data[i].stock;
			html += '</div>';
			html += '<div class="cart_list_body_item left">￥';
			html += data[i].price;
			html += '</div>';
			html += '<div class="cart_list_body_item left">';
			html += '<input type="hidden" name="currentCount" value="' + data[i].count + '"/>';
			html += '<a href="###" onclick="changePhoneCartNum(this, \'' + data[i].id + '\', \'' + data[i].stock + '\', \'dec\')"><img src="' + resourceUrl + '/b2b/display/resources/img/my/dec.gif"/></a>&nbsp;&nbsp;&nbsp;';
			html += '<input type="text" onblur="changePhoneCartNum(this, \'' + data[i].id + '\', \'' + data[i].stock + '\', \'\')" name="phoneNum" value="' + data[i].count + '" style="width:40px;text-align:center;"/>';
			html += '&nbsp;&nbsp;&nbsp;<a href="###" onclick="changePhoneCartNum(this, \'' + data[i].id + '\', \'' + data[i].stock + '\', \'add\')"><img src="' + resourceUrl + '/b2b/display/resources/img/my/add.gif"/></a>';
			html += '</div>';
			html += '<div class="cart_list_body_item left">￥';
			html += FloatMul(data[i].price, data[i].count);
			html += '</div>';
			html += '<div class="cart_list_body_item left">';
			html += '<a href="###" onclick="delPhoneFromCart(this, \'' + data[i].id + '\')"><span style="color:#0044BB;">删除</span></a>';
			html += '</div>';
			html += '</div>';

			sum += FloatMul(data[i].price, data[i].count);
			count += data[i].count;
		}
	}
	$("#phoneCount").text(count);
	$("#phoneSum").text("￥"+ sum);
	return html;
}

function clearPhoneCart() {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneCartAction!clearPhoneCart.action",
		type : "post",
		dataType : "json",
		success : function(data){
			var cartListHtml = assembleCartList(data);
			$("#cartList").empty().html(cartListHtml);
			$("#shopping-amount").text(0);
		}
	});
}

function delPhoneFromCart(obj, id) {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneCartAction!delPhoneFromCart.action",
		type : "post",
		data : {id : id},
		dataType : "json",
		success : function(data){
			var cartListHtml = assembleCartList(data);
//			alert($(obj).parent().prev().prev().find("input[name='currentCount']").val());
			$("#shopping-amount").text(parseInt($("#shopping-amount").text()) - parseInt($(obj).parent().prev().prev().find("input[name='currentCount']").val()));
			$("#cartList").empty().html(cartListHtml);
		}
	});
}

function changePhoneCartNum(obj, id, stock, change) {
	var phoneNum = $.trim($(obj).parent().find("input[name='phoneNum']").val());
	if(change == 'add') {
		if(phoneNum == stock) {
			return;
		}
		phoneNum = parseInt(phoneNum) + 1;
	} else if(change == 'dec') {
		if(phoneNum == '1') {
			return;
		}
		phoneNum = parseInt(phoneNum) - 1;
	} else {
		if(isValidateNumber(phoneNum)) {
			phoneNum = roundNumber(phoneNum, 0);
			if(parseInt(phoneNum) > parseInt(stock)) {
				phoneNum = parseInt(stock);
			} else if(parseInt(phoneNum) < 1) {
				phoneNum = 1;
			}
		} else {
			phoneNum = 1;
		}
	}
	$("#shopping-amount").text(parseInt($("#shopping-amount").text()) + parseInt(phoneNum) - parseInt($(obj).parent().find("input[name='currentCount']").val()));

	$.ajax({
		url : curUrl + "/b2b/display/action/phoneCartAction!modifyPhoneCart.action",
		type : "post",
		data : {id : id, count : phoneNum},
		dataType : "json",
		success : function(data){
			var cartListHtml = assembleCartList(data.phoneCartList);
			$("#cartList").empty().html(cartListHtml);
		}
	});
}

function confirmOrder() {
	var phoneCartCount = $.trim($("#phoneCount").text());
	if(parseInt(phoneCartCount) == 0) {
		return;
	} else {
		window.location.href = curUrl + "/b2b/display/action/phoneOrderAction!toConfirm.action";
	}
}