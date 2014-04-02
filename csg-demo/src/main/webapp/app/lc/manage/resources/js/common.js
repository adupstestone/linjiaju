function loadOptionByDicKind(selId, dicKind, dicOrder, selectLabel, style) {
	$.ajax({
		url : curUrl + "/b2b/manage/action/sysDic!loadOptionData.action",
		type : "post",
		data : {
			dicKindCode : dicKind,
			dicItemOrder : dicOrder
		},
		dataType : "json",
		success : function(data) {
			var html = '';
			if(selectLabel !=  '') {
				html += "<option value=''>" + selectLabel + "</option>"
			}
			for(var i = 0; i < data.length; i++) {
				html += "<option value='" + data[i].dicItemCode + "' style='" + style + "'>" + data[i].dicItemDesc + "</option>"
			}
			$("#"+selId).append(html);
		}
	});
}