function createHtml(actionUrl){
	$.ajax({
				url : curUrl+actionUrl,
				type : "post",
				dataType : "text",
				beforeSend : function(xhr) {
					var html = '<img src="'+curUrl+'/app/lc/manage/resources/js/jquery-easyui/images/loading.gif" align="middle" /> 正在处理中,请稍候...';
					$('#loading').html(html);
					 $('#loading').window({   
						 width:200,   
						 height:80,
						 modal:true ,
						 title:''
					  });
				},	
				success : function(data){
					$('#loading').window('close');
					alert(data);
					//location.reload();
				}
			});
}