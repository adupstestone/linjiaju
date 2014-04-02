$(function(){
	//createZoomTag();
});

function createZoomTag()
{
	var bigItemImage = document.createElement("div");
	var bigImage = document.createElement("img");
	bigItemImage.setAttribute("id","BigItemImage");
	bigItemImage.style.position = "relative";
	bigItemImage.style.display="none";
	bigItemImage.style.background="#fff";
  	bigItemImage.style.border = "10px solid #ccc";
	bigImage.setAttribute("id","big_image");
	bigImage.setAttribute("src","");
	bigImage.style.display="none";
	var wmImg = document.createElement("img");
	wmImg.setAttribute("id", "actWMImg");
	wmImg.style.position = "absolute";
	wmImg.style.top = "10px";
	wmImg.style.left = "10px";
	wmImg.style.display="none";
	wmImg.setAttribute("src","");
	bigItemImage.appendChild(wmImg);
	bigItemImage.appendChild(bigImage);
	document.body.appendChild(bigItemImage);
}

function HiddenBigItemImage()
{
	$('#BigItemImage').css("display","none");
	$('#big_image').css("display","none");
}
function showBigItemImage(imge)
{
	var src = $(imge).attr("src");
	//var wmImgSrc = $("#hidden_basepath_url").val()+$("#hd_ipt_wm_path").val();
	//$("#actWMImg").attr("src",wmImgSrc);
	$('#big_image').attr("src",src);
	$('#actWMImg').css("display","block");
	$('#BigItemImage').css("display","block");
	$('#big_image').css("display","block");
	$("#actWMImg").css("height",$('#big_image').css("height"));
}
function move_layer(event){ 

event = event || window.event; 
var moues_postion_X=event.clientX+document.body.scrollLeft+document.documentElement.scrollLeft+10;
var moues_postion_y=event.clientY+document.body.scrollTop+document.documentElement.scrollTop+10;
    var addheight = $('#big_image').attr("height")+10;
    $('#BigItemImage').css("left",moues_postion_X);
	$('#BigItemImage').css("top",moues_postion_y-addheight);
} 
document.onmousemove =move_layer;