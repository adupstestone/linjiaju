/*
 * tab页
 */
(function(a) {
	a.fn.Jtab = function(d, h) {
		if (!this.length) {
			return
		}
		if (typeof d == "function") {
			h = d;
			d = {}
		}
		var b = a.extend( {
			type : "static",
			auto : false,
			event : "mouseover",
			currClass : "curr",
			source : "data-tag",
			hookKey : "data-widget",
			hookItemVal : "tab-item",
			hookContentVal : "tab-content",
			stay : 5000,
			delay : 100,
			threshold : null,
			mainTimer : null,
			subTimer : null,
			index : 0,
			compatible : false
		}, d || {});
		var f = a(this).find("*[" + b.hookKey + "=" + b.hookItemVal + "]"), e = a(
				this).find("*[" + b.hookKey + "=" + b.hookContentVal + "]"), k = b.source
				.toLowerCase()
				.match(
						/http:\/\/|\d|\.aspx|\.ascx|\.jsp|\.php|\.html\.htm|.shtml|.js/g);
		if (f.length != e.length) {
			return false
		}
		var j = function(m, l) {
			b.subTimer = setTimeout(function() {
				f.eq(b.index).removeClass(b.currClass);
				if (b.compatible) {
					e.eq(b.index).hide()
				}
				if (l) {
					b.index++;
					if (b.index == f.length) {
						b.index = 0
					}
				} else {
					b.index = m
				}
				b.type = (f.eq(b.index).attr(b.source) != null) ? "dynamic"
						: "static";
				c()
			}, b.delay)
		};
		var g = function() {
			b.mainTimer = setInterval(function() {
				j(b.index, true)
			}, b.stay)
		};
		var c = function() {
			f.eq(b.index).addClass(b.currClass);
			if (b.compatible) {
				e.eq(b.index).show()
			}
			switch (b.type) {
			default:
			case "static":
				var l = "";
				break;
			case "dynamic":
				var l = (!k) ? f.eq(b.index).attr(b.source) : b.source;
				f.eq(b.index).removeAttr(b.source);
				break
			}
			if (h) {
				h(l, e.eq(b.index), b.index)
			}
		};
		f.each(function(l) {
			a(this).bind(b.event, function() {
				clearTimeout(b.subTimer);
				clearInterval(b.mainTimer);
				j(l, false)
			}).bind("mouseleave", function() {
				if (b.auto) {
					g()
				} else {
					return
				}
			})
		});
		if (b.type == "dynamic") {
			j(b.index, false)
		}
		if (b.auto) {
			g()
		}
	}
})(jQuery);


/* 图片滚动 */
(function(a) {
	a.fn.imgScroll = function(b) {
		return this
				.each(function() {
					var s = a.extend( {
						evtType : "click",
						visible : 1,
						showControl : true,
						showNavItem : false,
						navItemEvtType : "click",
						navItemCurrent : "current",
						showStatus : false,
						direction : "x",
						next : ".next",
						prev : ".prev",
						disableClass : "disabled",
						speed : 300,
						loop : false,
						step : 1
					}, b);
					var i = a(this), k = i.find("ul"), o = k.find("li"), j = o.length, e = s.visible, d = s.step, g = parseInt((j - e)
							/ d), r = 0, m = i.css("position") == "absolute" ? "absolute"
							: "relative", p = o.css("float") !== "none", h = a('<div class="scroll-nav-wrap"></div>'), c = s.direction == "x" ? "left"
							: "top", n = s.direction == "x" ? "width"
							: "height";
					function q() {
						if (!p) {
							o.css("float", "left")
						}
						k.css( {
							position : "absolute",
							left : 0,
							top : 0
						});
						i.css( {
							position : m,
							width : s.direction == "x" ? e * o.width() : o
									.width(),
							height : s.direction == "x" ? o.height() : e
									* o.height(),
							overflow : "hidden"
						});
						a(s.prev).addClass(s.disableClass);
						if (s.loop) {
						} else {
							if ((j - e) % d !== 0 && j > e) {
								var v = d - (j - e) % d;
								k.append(o.slice(0, v).clone());
								j = k.find("li").length;
								g = parseInt((j - e) / d)
							}
						}
						k.css(n, j * o.width());
						if (!s.showControl && j <= e) {
							a(s.next + "," + s.prev).hide()
						}
						if (j <= e) {
							a(s.next + "," + s.next).addClass(s.disableClass)
						} else {
							a(s.prev).addClass(s.disableClass);
							a(s.next).removeClass(s.disableClass)
						}
						if (s.showNavItem) {
							for ( var t = 0; t <= g; t++) {
								var u = t == 0 ? s.navItemCurrent : "";
								h.append('<em class="' + u + '">' + (t + 1)
										+ "</em>")
							}
							i.after(h);
							h.find("em").bind(s.navItemEvtType, function() {
								var w = parseInt(this.innerHTML);
								l((w - 1) * d)
							})
						}
						if (s.showStatus) {
							i.after('<span class="scroll-status">' + 1 + "/"
									+ (g + 1) + "</span>")
						}
					}
					function l(t) {
						if (k.is(":animated")) {
							return false
						}
						if (t < 0) {
							a(s.prev).addClass(s.disableClass);
							return false
						}
						if (t + e > j) {
							a(s.next).addClass(s.disableClass);
							return false
						}
						r = t;
						k.animate(s.direction == "x" ? {
							left : -((t) * o.width())
						} : {
							top : -((r) * o.height())
						}, s.speed, function() {
							if (t > 0) {
								a(s.prev).removeClass(s.disableClass)
							} else {
								a(s.prev).addClass(s.disableClass)
							}
							if (t + e < j) {
								a(s.next).removeClass(s.disableClass)
							} else {
								a(s.next).addClass(s.disableClass)
							}
							f(t)
						})
					}
					function f(t) {
						h.find("em").removeClass(s.navItemCurrent).eq(t / d)
								.addClass(s.navItemCurrent);
						if (s.showStatus) {
							a(".scroll-status").html(
									((t / d) + 1) + "/" + (g + 1))
						}
					}
					q();
					if (j > e) {
						a(s.next).click(function() {
							l(r + d)
						});
						a(s.prev).click(function() {
							l(r - d)
						})
					}
				})
	}
}(jQuery));


(function(a) {
	a.fn.floatNav = function(c) {
		var d = a.extend( {
			start : null,
			end : null,
			fixedClass : "nav-fixed",
			anchor : null,
			targetEle : null,
			range : 0,
			onStart : function() {
			},
			onEnd : function() {
			}
		}, c);
		var g = a(this), h = g.height(), f = g.width(), b = a('<div class="float-nav-wrap"/>');
		g.css( {
			height : h,
			width : f
		});
		if (!g.parent().hasClass("float-nav-wrap")) {
			g.wrap(b.css("height", h))
		}
		/*
		a(window)
				.bind(
						"scroll",
						function() {
							var i = a(document).scrollTop(), j = g.find("a")
									.eq(0).attr("href"), l = d.start
									|| g.parent(".float-nav-wrap").offset().top, k = d.targetEle ? a(
									d.targetEle).offset().top
									: 10000;
							if (i > l && i < (d.end || k) - d.range) {
								g.addClass(d.fixedClass);
								if (d.anchor && j !== d.anchor) {
									g.find("a").attr("href", d.anchor)
								}
								if (d.onStart) {
									d.onStart()
								}
							} else {
								g.removeClass(d.fixedClass);
								if (d.anchor) {
									g.find("a").attr("href", "javascript:;")
								}
								if (d.onEnd) {
									d.onEnd()
								}
							}
						});
		*/
		return this
	}
})(jQuery);

function MouseEvent(a) {
	this.x = a.pageX;
	this.y = a.pageY
}

(function(a) {
	a.fn.jqueryzoom = function(b) {
		var d = {
			xzoom : 200,
			yzoom : 200,
			offset : 10,
			position : "right",
			lens : 1,
			preload : 1
		};
		if (b) {
			a.extend(d, b)
		}
		var c = "";
		a(this).hover(
						function() {
							var g = a(this).offset().left;
							var j = a(this).offset().top;
							var i = a(this).find("img").get(0).offsetWidth;
							var f = a(this).find("img").get(0).offsetHeight;
							c = a(this).find("img").attr("alt");
							var h = a(this).find("img").attr("src");
							a(this).find("img").attr("alt", "");
							if (a("div.zoomdiv").get().length == 0) {
								a(this).after(
										"<div class='zoomdiv'><img class='bigimg' src='"
												+ h + "'/></div>");
								a(this).append(
										"<div class='jqZoomPup'>&nbsp;</div>")
							}
							a("div.zoomdiv").width(d.xzoom);
							a("div.zoomdiv").height(d.yzoom);
							a("div.zoomdiv").show();
							if (!d.lens) {
								a(this).css("cursor", "crosshair")
							}
							a(document.body)
									.mousemove(
											function(n) {
												mouse = new MouseEvent(n);
												var o = a(".bigimg").get(0).offsetWidth;
												var m = a(".bigimg").get(0).offsetHeight;
												var k = "x";
												var l = "y";
												if (isNaN(l) | isNaN(k)) {
													var l = (o / i);
													var k = (m / f);
													a("div.jqZoomPup")
															.width(
																	(d.xzoom)
																			/ (l * 1));
													a("div.jqZoomPup")
															.height(
																	(d.yzoom)
																			/ (k * 1));
													if (d.lens) {
														a("div.jqZoomPup").css(
																"visibility",
																"visible")
													}
												}
												xpos = mouse.x
														- a("div.jqZoomPup")
																.width() / 2
														- g;
												ypos = mouse.y
														- a("div.jqZoomPup")
																.height() / 2
														- j;
												if (d.lens) {
													xpos = (mouse.x
															- a("div.jqZoomPup")
																	.width()
															/ 2 < g) ? 0
															: (mouse.x
																	+ a(
																			"div.jqZoomPup")
																			.width()
																	/ 2 > i + g) ? (i
																	- a(
																			"div.jqZoomPup")
																			.width() - 2)
																	: xpos;
													ypos = (mouse.y
															- a("div.jqZoomPup")
																	.height()
															/ 2 < j) ? 0
															: (mouse.y
																	+ a(
																			"div.jqZoomPup")
																			.height()
																	/ 2 > f + j) ? (f
																	- a(
																			"div.jqZoomPup")
																			.height() - 2)
																	: ypos
												}
												if (d.lens) {
													a("div.jqZoomPup").css( {
														top : ypos,
														left : xpos
													})
												}
												scrolly = ypos;
												a("div.zoomdiv").get(0).scrollTop = scrolly
														* k;
												scrollx = xpos;
												a("div.zoomdiv").get(0).scrollLeft = (scrollx)
														* l
											})
						}, function() {
							a(this).children("img").attr("alt", c);
							a(document.body).unbind("mousemove");
							if (d.lens) {
								a("div.jqZoomPup").remove()
							}
							a("div.zoomdiv").remove()
						});
		count = 0;
		if (d.preload) {
			a("body").append(
					"<div style='display:none;' class='jqPreload" + count
							+ "'>360buy</div>");
			a(this).each(
					function() {
						var g = a(this).children("img").attr("img");
						var f = jQuery("div.jqPreload" + count + "").html();
						//jQuery("div.jqPreload" + count + "").html(f + '<img src="' + g + '">')
					})
		}
	}
})(jQuery);



var isIe = (window.ActiveXObject) ? true : false;

$(function() {
	$(".jqzoom").jqueryzoom( {
		xzoom : 400,
		yzoom : 400,
		offset : 10,
		position : "left",
		preload : 1,
		lens : 1
	});
	$("#summary-grade .dd").click(
			function() {
				var a = $("#comment");
				if ($("#comment").attr("nodata") !== "true") {
					a.show()
				} else {
					$(document).scrollTop(
							$("#comments-list").offset().top
									+ $("#comments-list .mt").height())
				}
			});
	$("#spec-list img").mouseover(function() {
		var a = $(this).attr("src");
		$("#spec-list img").removeClass("img-hover");
		$(this).addClass("img-hover");
		$("#spec-n1 img").eq(0).attr( {
			src : a.replace("/n5/", "/n1/"),
			jqimg : a.replace("/n5/", "/n0/")
		})
	});
	$(".spec-items").imgScroll( {
		visible : 5,
		speed : 200,
		step : 1,
		loop : false,
		prev : "#spec-forward",
		next : "#spec-backward",
		disableClass : "disabled"
	});
	$("#product-detail").Jtab( {
		event : "click",
		compatible : true
	},function(a, b, c) {
		$("#product-detail .mt").removeClass("nav-fixed");
		$("#product-detail .mt").removeClass("nav-fixed").floatNav( {
			fixedClass : "nav-fixed",
			targetEle : "#consult",
			anchor : "#product-detail",
			range : 30,
			onStart : function() {
				$("#nav-minicart").show()
			}
		});
		if (c == 3) {
			b.css("height", 5).html("<div>a</div>");
			$("#promises,#state").hide();
			$("#product-detail .mt").floatNav( {
				fixedClass : "nav-fixed",
				targetEle : "#consult",
				anchor : "#product-detail",
				range : 0,
				onStart : function() {
					$("#nav-minicart").show()
				}
			})
		} else {
			$("#promises,#state").show()
		}
	});
	$("#ranklist .mc").Jtab( {
		compatible : true
	});
	$("#consult").Jtab( {
		event : "click",
		compatible : true
	}, function(a, b, c) {
		if (c <= 4) {
			//Consult.getData(c, b)
		} else {
			//Consult.setExtraData(c, b)
		}
	});
});

