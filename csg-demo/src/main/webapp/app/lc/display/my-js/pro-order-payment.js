$(function(){
	initPage();
});
function initPage() {
	$.ajax({
		url : curUrl + "/b2b/display/action/phoneOrderAction!loadOrderDetailList.action",
		type : "post",
		dataType : "json",
		data : {orderId : orderId },
		success : function(data) {
			var titleNumber = '';
			var titleAmount = 0;
			for(var i = 0; i < data.length; i++) {
				if(i == 0) {
					titleNumber = titleNumber + data[i].ORDER_NUMBER;
				} else {
					titleNumber = titleNumber + '&nbsp;&nbsp;&nbsp;' + data[i].ORDER_NUMBER;
				}
				titleAmount += data[i].TOTAL_AMOUNT;
				
				var divClone; 
				if(paymentMethod == 0) {
					divClone = $("#divTemplate").clone();
				} else {
					divClone = $("#divTemplate2").clone();
					divClone.show();
				}
				
				divClone.find(".item_content1").text(data[i].PAYMENT_DESC);
				divClone.find(".content2_title span:eq(1)").text(data[i].ORDER_NUMBER);
				divClone.find(".content2_title span:eq(3)").text("￥" + data[i].TOTAL_AMOUNT);

				divClone.find(".content2_body .item:last").find(".item_content3:eq(0) span:eq(1)").text(data[i].LINKMAN);
				divClone.find(".content2_body .item:last").find(".item_content3:eq(1) span:eq(1)").text(data[i].LINKMAN_MOBILE);
				divClone.find(".content2_body .item:last").find(".item_content3:eq(2) span:eq(1)").text(data[i].LINKMAN_QQ);
				divClone.find(".content2_body .item:last").find(".item_content3:eq(3) span:eq(1)").text(data[i].LINKMAN_COMMENT);

				divClone.find("input[name='paymentId']").val(data[i].PAYMENT_ID);

				$("#divTemplate").after(divClone);
			}

			$("#titleNumber").html(titleNumber);
			$("#titleAmount").text("￥" + titleAmount);
				
			if(paymentMethod == 0) {
				initAllAccountTable();
			}
			
		}
	});
}

function initAllAccountTable() {
	$("input[name='paymentId']").each(function(){
		var paymentIdInput = $(this);
		var paymentId = $(paymentIdInput).val();
		if(paymentId != '') {
			$.ajax({
				url : curUrl + "/b2b/display/action/phoneOrderAction!loadPaymentList.action",
				type : "post",
				dataType : "json",
				data : {paymentId : paymentId },
				success : function(data) {
					var html = '';
					for(var i = 0; i < data.length; i++) {
						html += '<tr><td>';
						html += data[i].ACCOUNT_NAME;
						html += '</td><td>';
						html += data[i].ACCOUNT_BANK;
						html += '</td><td>';
						html += data[i].ACCOUNT_BANK_NUMBER;
						html += '</td></tr>';
					}
					$(paymentIdInput).parent().parent().find(".tr_body").html(html);
					$(paymentIdInput).parent().parent().show();
				}
			});
		}
	});
}
