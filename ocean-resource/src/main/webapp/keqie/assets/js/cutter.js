/*!
 * 渴切(Cutter)开源中文css框架 v3.2
 *
 * Copyright 2012 keqie.com, Inc
 * Licensed under the Apache License v2.0
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 */
 
 /*tooltip*/
$(function(){
	$('[rel=kq-tooltip]').hover(function(){ 
		$('<div class="kq-tooltip" style="display:none; top:'+($(this).offset().top+$(this).height()+5)+'px;left:'+$(this).offset().left+'px;">'+$(this).attr('title')+'<div class="kq-tooltip-arrow"></div></div>').appendTo('body').fadeIn();
		//$('body').append('<div class="tooltip" style="top:'+($(this).offset().top+$(this).height()+5)+'px;left:'+$(this).offset().left+'px;">'+$(this).attr('title')+'<div class="arrow"></div></div>');						  		
	},
	function(){
		$('.kq-tooltip').fadeOut().remove();	
	})
	
	
	$('.kq-naver .kq-naver-collapse').click(function(){
		$('.kq-naver-module, .kq-naver-search, .kq-naver-sub').toggle();									  
	})
})


/*选项卡效果*/
$(function(){
	$('.kq-taber-head a').hover(function(){
		$('.kq-taber-body').hide();
		$('.kq-taber #'+$(this).attr('lang')).show();	
		
		$('.kq-taber-head a').removeClass('selected');
		$(this).addClass('selected');
	})		   
})


/*头部二级菜单*/
$(function(){
	$('.kq-naver li').hover(function(){
		
		//alert($('.naver').height());
		$('.kq-naver-droper').css('top',$('.kq-naver').height()-2);
		$(this).addClass('selected');
	},
	function(){
		$(this).removeClass('selected');
	})
	
	if($('.kq-naver-fixed').size()>0){
		$('body').animate({'padding-top':67},'fast');	
	}
})


/*heading响应式用户体验*/
$(function(){
/*	$('.heading').hover(function(){
		$(this).animate({'height':'+=10'},300,function(){
														  
		})							 
	},
	function(){
		$(this).animate({'height':'-=10'},300,function(){
														  
		})		
	})	*/	   
})

$(function(){
	$('a[rel=kq-popup]').click(function(){
		
		$('body').prepend('<div id="kq-mask"></div>').find('#kq-mask').css({opacity:0.5,  cursor:'pointer', background:'black', position:'absolute', zIndex:999, width:'100%',  height:$(document).height()});
		
		//$('body').append('<div class="popup"><del>x</del><div class="head">渴切-开源中文css框架</div><div class="body">渴切是一个开源中文 (X)HTML/CSS 框架 ,它的目的是减少你的css开发时间。它提供一个可靠的css基础去创建你的项目,能够用于网站的快速设计,通过重设和重建浏览器标准，可以让每个网站防 止枯燥的跨浏览器兼容性测试。你可以将他理解成一套模板，里面包含了大多数站点中所需要的那些css类。他很小，只有四个文件而已。总共不到6KB。</div><div class="foot"><a href="#" class="button blue">关闭</a></div></div>').find('.popup').fadeIn();
		$($(this).attr('href')).fadeIn().animate({'top':'60%'});
		return false;
		
	})		   
	
	/*点击遮罩关闭,live方法用于，为通过js新增的元素添加事件*/
	$('#kq-mask, .kq-popup del').live('click',function(){
		$('#kq-mask').remove();
		$(this).parent('.kq-popup').fadeOut(); $(this).parent().parent('.kq-popup').fadeOut();
		$('.kq-popup').fadeOut();
	})
})

/*popover*/
$(function(){
	$('*[rel=kq-popover], .kq-popover').live('mouseover',function(){
		//alert(o) 
		e = $(this)[0];
		
		$('<div class="kq-popover" onMouseOver="'+$('.kq-popover').show()+'" onMouseOut="'+$('.kq-popover').hide()+'"  style="display:none; top:'+($(this).offset().top+$(this).height()+3)+'px;left:'+$(this).offset().left+'px;">'+$(this).attr('title')+'<div class="kq-popup-arrow"></div></img></div>').appendTo('body').show();
							   
	})	
	
	$('*[rel=kq-popover], .kq-popover').live('mouseout',function(){
		$('.kq-popover').hide().remove();						   
	})	
	
	/*$('.popover').live('mouseover',function(){
		$(this).show();										
	})
	$('.popover').live('mouseout',function(){
		$(this).hide();									   
	})*/
})





/*卡通公仔*/
$(function(){
	setTimeout(function(){
			$('.cartoon').fadeIn();				
		},1000)		   
})

/*头部提示语*/
$(function(){
	$('.kq-spring del').click(function(){
		$('.kq-spring').slideUp();								
	})		   
})

/*头部导航搜索栏 用户体验*/
$(function(){
	$('.kq-naver input[type=text]').focus(function(){
		//$(this).animate({'width':'+=10px'},'fast')									 
	})			
})


/*导航条固定*/
$(document).ready(function(){
		
	$(window).bind('scroll',function() {
		if(Math.abs($(window).scrollTop())>300)
			{
				$('.kq-naver-js').hide().addClass('fixed').fadeIn('slow');
			}
			else
			{
				$('.kq-naver-js').removeClass('fixed');
			}
	});
	
});

/*回到顶部*/
$(document).ready(function(){
	
	if($.browser.msie&&($.browser.version == "6.0")&&!$.support.style){
		
	}
	else{
		$(window).bind('scroll',function() {
			if(Math.abs($(window).scrollTop())>200)
				{
					$('.totop').fadeIn();
					
				}
				else
				{
					$('.totop').fadeOut();	
				}
		});	
	}
	
});


/*幻灯片*/
$(function(){
		setTimeout(function(){
			$('.kq-slider-item:first').fadeIn(); $('.kq-slider').css('background-image','none');
		},600);
		
		$.extend({
			autoSlider:function(){
				
				/*if($('.slider .item.selected').next().size()==0){
					$('.slider .item.selected').removeClass('selected').parent().find('.item:first').addClass('selected');
				}
				else{
					$('.slider .item.selected').removeClass('selected').next().addClass('selected');
				}*/
				$('.kq-slider-item:first').animate({'opacity':0},200,function(){
						$(this).css('opacity',1).hide().appendTo($(this).parent());
						$('.kq-slider-item:first').fadeIn();
				})
			}
		})
		// 函数重复调用，基于jQuery的方法一定要以上面的写法定义，否则这里不会生效
		setInterval("$.autoSlider()",10000);

     $('.kq-slider-prev').click(function(){
		
			/*if($('.slider .item.selected').next().size()==0){
					$('.slider .item.selected').removeClass('selected').parent().find('.item:first').addClass('selected');
				}
				else{
					$('.slider .item.selected').removeClass('selected').next().addClass('selected');
				}*/
				$('.kq-slider-item:first').animate({'opacity':0},200,function(){
						$(this).css('opacity',1).hide();
						$('.kq-slider-item:last').prependTo($(this).parent()).fadeIn();
				})
		},
		function(){});
		
		$('.kq-slider-next').click(function(){
		
			$('.kq-slider-item:first').animate({'opacity':0},200,function(){
						$(this).css('opacity',1).hide().appendTo($(this).parent());
						$('.kq-slider-item:first').fadeIn();
				})
		},
		function(){})
	})


/*单行滚动 singlerolling */
$(function(){
		
		$.extend({
			singlerolling:function(){
				$('.kq-singlerolling ul').animate({'marginTop':-22},function(){
					$(this).css('marginTop',0).find('li:first').appendTo($(this));
				});
			}
		})
		// 函数重复调用，基于jQuery的方法一定要以上面的写法定义，否则这里不会生效
		setInterval("$.singlerolling()",3000);
	})


// 加载prettify着色插件

// Load the stylesheet that we're demoing.
/*var script = document.createElement('script');
script.src = 'assets/js/prettify.js';
document.getElementsByTagName('head')[0].appendChild(script);

var link = document.createElement('link');
link.rel = 'stylesheet';
link.type = 'text/css';
link.href = 'assets/css/prettify.css';
document.getElementsByTagName('head')[0].appendChild(link);
  

$(function(){
  // 调用prettify着色插件
  $('pre').addClass('prettyprint linenums');
  prettyPrint();
})*/

$(function(){
	//alert($('body').width());	
	
	responsive();
		
	$(window).resize(function() {
	  responsive();
	}); 
		
	
	if($.browser.msie) { 
		
		
		
		if($.browser.msie&&($.browser.version == "6.0")&&!$.support.style){
			$('html').addClass('ie6');
		} 
		if($.browser.msie&&($.browser.version == "7.0")&&!$.support.style){
			$('html').addClass('ie7');
		} 
		if($.browser.msie&&($.browser.version == "8.0")&&!$.support.style){
			$('html').addClass('ie8');
		}
	}
	else if($.browser.safari)
	{
		$('html').addClass('safari');
	}
	else if($.browser.mozilla)
	{
		$('html').addClass('firefox');
	}
	else if($.browser.opera) {
		$('html').addClass('opera');
	}
	else {
		//alert("i don't konw!");
	}  
})



function responsive(){
			if($('body').width()>1250 && $('body').width() < 1440){
		//$('<link rel="stylesheet" href="assets/css/screen/1200.css" />').appendTo('head').fadeIn();
		$('html').removeClass('desktop flatbed phone hd');
			$('html').addClass('hd');
		}
		else if($('body').width()>980 && $('body').width() < 1300){
			$('html').removeClass('desktop flatbed phone hd');
			$('html').addClass('desktop');
		}
		else if($('body').width()>=768 && $('body').width() < 960){
			$('html').removeClass('desktop flatbed phone hd');
			$('html').addClass('flatbed');
		}
		else if($('body').width()<768){
			$('html').removeClass('desktop flatbed phone hd');
			$('html').addClass('phone');
		}
	}
	
	/*ie6 浏览器更新提醒*/
	$(function(){
		if($.browser.msie&&($.browser.version == "6.0")&&!$.support.style){
			$('<div class="kq-spring"><div class="kq-wrapper">亲~您还在使用十几年前的浏览器IE6，享受更棒的冲浪体验建议您更新 <a href="http://se.360.cn" target="_blank">360安全浏览器</a></div><del>×</del></div>').prependTo('body').fadeIn();	
		}		   
	})
	
	$(function(){
			   	if($('.absbar').size() > 0){
						$('.absbar li').hover(function(){
							$(this).find('.droper').show();							   
						}
						,function(){
								$(this).find('.droper').hide();	
							})
					}
			   })