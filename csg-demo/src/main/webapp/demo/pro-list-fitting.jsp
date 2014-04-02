<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="url.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><%=title %></title>
    <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/pro-list-fitting.css">

    <script src="<%=curUrl%>/demo/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="<%=curUrl%>/demo/js/demo.js" type="text/javascript"></script>
</head>
<body>
<div class="col_main">
<%@include file="head.jsp" %>
<div id="main" class="content_width">
    <div class="dir_title fl">
        全部 >
    </div>
    <br class="clear"/>

    <div class="filter">
        <ul>
            <li id="brand_li">
                <span class="title">品牌：</span>
                <ul class="item_ul">
                    <li><a href="###" class="selected">不限</a></li>
                    <li><a href="###">苹果</a></li>
                    <li><a href="###">三星</a></li>
                    <li><a href="###">诺基亚</a></li>
                    <li><a href="###">华为</a></li>
                    <li><a href="###">联想</a></li>
                    <li><a href="###">中兴</a></li>
                    <li><a href="###">小米</a></li>
                    <li><a href="###">OPP</a></li>
                    <li><a href="###">索尼</a></li>
                    <li><a href="###">夏普</a></li>
                    <li><a href="###">小辣椒</a></li>
                    <li><a href="###">努比亚</a></li>
                    <li><a href="###">HTC</a></li>
                    <li><a href="###">步步高</a></li>
                    <li><a href="###">波导</a></li>
                    <li><a href="###">康佳</a></li>
                    <li><a href="###">神舟</a></li>
                </ul>
                <br class="clear"/>
            </li>
            <li id="type_li">
                <span class="title">种类：</span>
                <ul class="item_ul">
                    <li><a href="###" class="selected">全部</a></li>
                    <li><a href="###">电源</a></li>
                    <li><a href="###">耳机</a></li>
                    <li><a href="###">音箱</a></li>
                    <li><a href="###">保护后盖</a></li>
                    <li><a href="###">贴膜</a></li>
                    <li><a href="###">挂饰</a></li>
                    <li><a href="###">贴纸</a></li>
                    <li><a href="###">支架与绕线器</a></li>
                    <li><a href="###">服饰类</a></li>
                    <li><a href="###">存储卡与读卡器</a></li>
                    <li><a href="###">生活应用类</a></li>
                    <li><a href="###">优惠套装</a></li>
                    <li><a href="###">酷玩</a></li>
                    <li><a href="###">每周新品</a></li>
                </ul>
                <br class="clear"/>
            </li>
        </ul>
        <!--[if IE]>
        <br class="clear"/>
        <![endif]-->
    </div>

    <div class="pro_sort">
        <ul>
            <li>&nbsp;&nbsp;&nbsp;排序：</li>
            <li class="order_btn up notsel_li" by="score">相关度</li>
            <li class="order_btn up notsel_li" by="price"
                style="cursor: pointer;">价格<b></b></li>
            <li class="order_btn select_li up" by="stock"
                style="cursor: pointer;">库存<b></b></li>
            <li class="order_btn down notsel_li" by="sale"
                style="cursor: pointer;">销量<b></b></li>
            <li class="order_btn up notsel_li" by="inTime"
                style="cursor: pointer;">上架时间<b></b></li>
        </ul>
    </div>

    <div class="list" style="padding-left: 100px;">
        <ul>
            <li>
                <a href="<%=curUrl%>/app/lc/display/jsp/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f1.jpg" alt="">
                </a>

                <div class="summ_title">
                    苹果（APPLE）iPhone 4 8G版 3G手机（白色）<font color="#04B832">南网内部特价专供</font>
                </div>
                <div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
            <li>
                <a href="<%=curUrl%>/app/lc/display/jsp/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f2.jpg" alt="">
                </a>

                <div class="summ_title">
                    顽卓（VOJO） Micro USB数据充电线 225mm 蓝色
                </div>
                <div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
            <li>
                <b class="sign">特价</b>
                <a href="<%=curUrl%>/demo/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f3.jpg" alt="">
                </a>

                <div class="summ_title">
                    苹果（APPLE）iPhone 5 16G版 3G手机（白色）WCDMA/GSM全新设计，更
                </div>
                <div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
            <li>
                <a href="<%=curUrl%>/demo/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f4.jpg" alt="">
                </a>

                <div class="summ_title">
                    乐泡（lepow）魔象 蓝牙音箱 绿色<font color="#04B832">南网内部特价专供</font>
                </div>
                <div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
            <li>
                <a href="<%=curUrl%>/demo/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f5.jpg" alt="">
                </a>

                <div class="summ_title">
                    索尼（SONY） SBH20 蓝牙耳机 白色<font color="#FA7500">蓝牙3.0，便携夹子，滑动电源键，多点连接技术，NFC功能，音乐通话双享受</font>
                </div>
                <div class="price"><span class="m_p">￥350</span><span class="i_p">￥280</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
            <li>
                <b class="sign">特价</b>
                <a href="<%=curUrl%>/demo/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f6.jpg" alt="">
                </a>

                <div class="summ_title">
                    安卓果冻豆手机挂绳<font color="#FA7500">超级萌的挂绳，保证你爱不释手</font>
                </div>
                <div class="price"><span class="m_p">￥15</span><span class="i_p">￥9</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
            <li>
                <a href="<%=curUrl%>/demo/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f7.jpg" alt="">
                </a>

                <div class="summ_title">
                    诺基亚（NOKIA）MD-50W 无线扬声器 蓝色<font color="#FA7500">高品质无线音箱，两台并用可实现无线立体声的双声道</font>
                </div>
                <div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
            <li>
                <a href="<%=curUrl%>/demo/pro-detail-phone.jsp">
                    <img src="<%=curUrl%>/app/lc/display/resources/img/my/pro-list/f8.jpg" alt="">
                </a>

                <div class="summ_title">
                    橡胶封釉玫红色 适用于MP3/MP4播放器/手机/平板电脑/笔记本电脑/台式电脑
                </div>
                <div class="price"><span class="m_p">￥6000</span><span class="i_p">￥5000</span></div>
                <div class="buttons">
                    <a href="###" class="add_cart">加入购物车</a>
                    <a href="###" class="to_compare">对比</a>
                </div>
            </li>
        </ul>
        <br class="clear"/>
    </div>
    <div class="page_div fr">
        <img alt="" src="<%=curUrl%>/app/lc/display/resources/img/my/page.jpg"/>
    </div>
    <br class="clear"/>
    <jsp:include page="foot.jsp"></jsp:include>
</div>
</div>
</body>
</html>