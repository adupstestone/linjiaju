//var pageSize=20;//每页显示条数
//var allEntries=0;//总条数
//var proid="100002";
//proid="<%=proid%>";
jQuery(function() {
	var choose_version=$("#choose-version .item.selected a").attr("name");
	showOrHideBtn(choose_version);
	
	$(".btn-reduce").click(function(){
		var val=Number($("#buy-num").val())-1;
		if(val>0){
			$("#buy-num").val(val);
		}
	});
	
	$(".btn-add").click(function(){
		var val=Number($("#buy-num").val())+1;
		if(val>0){
			$("#buy-num").val(val);
		}
	});
	
	$("#choose-color .item").click(function(){
		$("#choose-color .item").removeClass("selected");
		$(this).addClass("selected");
	});
	
	$("#choose-version .item").click(function(){
		$("#choose-version .item").removeClass("selected");
		$(this).addClass("selected");
		choose_version=$("#choose-version .item.selected a").attr("name");
		showOrHideBtn(choose_version);
	});
	
	$(".fitting_list .title li").click(function(){
		$(".fitting_list .title li").removeClass("selected");
		$(this).addClass("selected");
	});
});

function showOrHideBtn(choose_version){
	if(choose_version+""=="v1"){
		$("#buy_now").hide();
		$("#addToCart").show();
	}else if(choose_version+""=="v2"){
		$("#addToCart").hide();
		$("#buy_now").show();
	}
}

/**end**/