<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="url.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=title %>
    </title>
    <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/style.css">

    <link href="<%=curUrl%>/demo/css/foucs.css" type="text/css" rel="stylesheet"/>
    <script src="<%=curUrl%>/demo/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="<%=curUrl%>/demo/js/jquery.foucs.js" type="text/javascript"></script>
    <script src="<%=curUrl%>/demo/js/demo.js" type="text/javascript"></script>
</head>
<body>
<div class="col_main">
<%@include file="head.jsp" %>
<div id="main" class="content_width">
<div id="index_b_hero">
    <div class="hero-wrap">
        <ul class="heros clearfix">
            <li class="hero">
                <a href="#" target="_blank" title="第一张图的说明">
                    <img src="<%=curUrl%>/demo/images/1.jpg" class="thumb" alt=""/>
                </a>
            </li>
            <li class="hero">
                <a href="#" target="_blank" title="第二张图的说明">
                    <img src="<%=curUrl%>/demo/images/2.jpg" class="thumb" alt=""/>
                </a>
            </li>
            <li class="hero">
                <a href="#" target="_blank" title="第三张图的说明">
                    <img src="<%=curUrl%>/demo/images/3.jpg" class="thumb" alt=""/>
                </a>
            </li>
            <li class="hero">
                <a href="#" target="_blank" title="第4张图的说明">
                    <img src="<%=curUrl%>/demo/images/4.jpg" class="thumb" alt=""/>
                </a>
            </li>
        </ul>
    </div>
    <div class="helper">
        <div class="mask-left">
        </div>
        <div class="mask-right">
        </div>
        <a href="#" class="prev icon-arrow-a-left"></a>
        <a href="#" class="next icon-arrow-a-right"></a>
    </div>
</div>

<div class="fl">
    <div class="ad_l_h2">
        <h2>
            <a target="_blank" href="###" style="color:#999;">购买Iphone5手机仅¥4500</a>
        </h2>
    </div>
    <div class="ad_l_img">
        <ul>
            <li class="ad_l_img_li">
                <a href="###">
                    <img alt="" style="margin: 0px; opacity: 1;"
                         src="<%=curUrl%>/app/lc/display/resources/img/my/main/m_1.jpg">
                </a>
            </li>
            <li style="border-top:0" class="ad_l_img_li">
                <a href="###">
                    <img alt="" style="margin: 0px; opacity: 1;"
                         src="<%=curUrl%>/app/lc/display/resources/img/my/main/m_2.jpg">
                </a>
            </li>
        </ul>
    </div>
</div>

<div class="fr ad_r">
    <div class="ad_r_h2">
        <h2 style="overflow:hidden;">
            <a href="###" style="float:left">购买小米手机</a>
        </h2>
    </div>
    <p class="ad_r_notice">
        <a href="###" onclick="_gaq.push(['_trackEvent','首页广告点击','购买小米手机栏']);" target="_blank"><img
                src="<%=curUrl%>/app/lc/display/resources/img/my/main/s_ad.jpg"></a>
    </p>

    <div class="ad_r_phone"
         style="background:#FAFAFA url(<%=curUrl%>/app/lc/display/resources/img/my/main/rt_1.jpg) 166px 27px no-repeat;border-bottom:0;">
        <h3 class="ad_r_phone_h3">华为 G510</h3>

        <p class="item1">南网用户专供<br>
            性能提速25%<br>
            <em>900元起</em></p>
        <a class="button_round button_pink_1" href="###">立即购买</a><br>

        <p class="item2"><a class="home_btn_link" href="###" style="margin-right:10px;">了解更多</a> <a
                class="home_btn_link" href="###"
                onclick="_gaq.push(['_trackEvent', '首页广告点击', '小米手机2', 'F码通道']);">F码通道</a></p>
    </div>
    <div class="ad_r_phone"
         style="margin-bottom: 10px;background:#FAFAFA url(<%=curUrl%>/app/lc/display/resources/img/my/main/rt_2.png) 166px 27px no-repeat;">
        <h3>小米手机 2A</h3>

        <p class="item1" style="margin-bottom: 20px;">28纳米双核1.7GHz<br>
            全新演绎2S青春版</p>
        <a class="button_round button_pink_1" href="###">立即购买</a>

        <p class="item2"><a class="home_btn_link" href="###"
                            onclick="_gaq.push(['_trackEvent', '首页广告点击', '小米手机2', '了解更多']);" style="margin-right:10px;">了解更多</a><a
                class="home_btn_link" href="###"
                onclick="_gaq.push(['_trackEvent', '首页广告点击', '小米手机2', 'F码通道']);">F码通道</a></p>
    </div>
    <ul class="news">
        <li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '十点秒杀处-小米手机2S合约版']);"
               style="color:#C00;" target="_blank">小米手机2S合约版</a></li>
        <li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '十点秒杀处-充话费享超低折扣']);"
               target="_blank">充话费享超低折扣</a></li>
        <li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '十点秒杀处-企业用户采购通道']);"
               target="_blank">企业用户采购通道</a></li>
        <li><a class="item" href="###" onclick="_gaq.push(['_trackEvent', '首页广告点击', '活动-可口可乐活动专区']);" target="_blank">可口可乐活动专区</a>
        </li>
    </ul>
</div>
<br class="clear">

<div class="main_pro_list">
    <div class="filter_title">
        <dl>
            <dt>
                热门配件：
            </dt>
            <dd>
                <a href="###">手机配件</a> <span>|</span> <a href="###">电源</a> <span>|</span> <a href="###">酷玩</a>
                <span>|</span> <a href="###">耳机音箱</a> <span>|</span> <span style="display: none">&nbsp;</span><a
                    href="###">服饰类</a><span>|</span><a href="###">多彩后盖</a> <span>|</span> <a href="###">保护</a>
                <span>|</span> <a href="###">全部配件</a> <span>|</span><a href="###">优惠套装</a> <span>|</span> <a href="###">每周新品</a>
            </dd>
        </dl>
    </div>
    <div class="filter_content">
        <ul class="home_xmAcce_con_ul cfl">
            <!--中部4张图开始 -->
            <li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt=""
                                                                                 src="<%=curUrl%>/app/lc/display/resources/img/my/main/m3.jpg">
            </a></li>
            <li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt=""
                                                                                 src="<%=curUrl%>/app/lc/display/resources/img/my/main/m4.jpg">
            </a></li>
            <li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt=""
                                                                                 src="<%=curUrl%>/app/lc/display/resources/img/my/main/m5.jpg">
            </a></li>
            <li class="b_img_li"><a class="home_xmAcce_con_li_a" href="###"><img alt=""
                                                                                 src="<%=curUrl%>/app/lc/display/resources/img/my/main/m6.jpg">
            </a></li>
            <!--底部商品列表 -->
            <li class="s_img_li">
                <dl style="display:block;">
                    <dt class="img_dt" style="display:block;">
                        <a href="###" style="line-height: 185px;display:block;"><img style="vertical-align:middle;"
                                                                                     alt="" width="110"
                                                                                     src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_1.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">线控通话耳机</a>
                    </dd>
                    <dd class="info_dd_2">
                        <em>¥49</em>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_2.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">磨砂贴膜升级版</a>
                    </dd>
                    <dd class="info_dd_2">
                        <em>¥19</em>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_3.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">小米短袖POLO两件装</a>
                        <b>特价</b>
                    </dd>
                    <dd class="info_dd_2">
                        <span>¥198</span><strong>¥169</strong>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_4.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">小钢炮蓝牙音乐座充</a>
                        <b>特价</b>
                    </dd>
                    <dd class="info_dd_2">
                        <span>¥199</span><strong>¥179</strong>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li trend">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_5.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">大电池全能套装</a>
                        <b>特价</b>
                    </dd>
                    <dd class="info_dd_2">
                        <span>¥247</span><strong>¥169</strong>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_6.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">车载充电器</a>
                        <b>特价</b>
                    </dd>
                    <dd class="info_dd_2">
                        <span>¥49</span><strong>¥39</strong>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_7.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###" w="">米兔超人版</a>
                    </dd>
                    <dd class="info_dd_2">
                        <em>¥69</em></dd>
                </dl>
            </li>
            <li class="s_img_li">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_8.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">学院风帆布双肩包-黑色</a>
                    </dd>
                    <dd class="info_dd_2">
                        <em>¥99</em>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_9.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">森海塞尔MX375立体声耳机</a>
                    </dd>
                    <dd class="info_dd_2">
                        <em>¥189</em>
                    </dd>
                </dl>
            </li>
            <li class="s_img_li trend">
                <dl class="goodsDisplay">
                    <dt class="img_dt">
                        <a href="###"><img alt="" width="110"
                                           src="<%=curUrl%>/app/lc/display/resources/img/my/main/b_10.jpg"></a>
                    </dt>
                    <dd class="info_dd_1">
                        <a href="###">抽取式保护套</a></dd>
                    <dd class="info_dd_2">
                        <em>¥79</em>
                    </dd>
                </dl>
            </li>
        </ul>
        <br class="clear">
    </div>
</div>
<%@include file="foot.jsp" %>
</div>
</div>
<script type="text/javascript">
    $(function () {
        $.foucs({ direction: 'right' });
    });
</script>
</body>
</html>
