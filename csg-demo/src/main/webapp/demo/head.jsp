<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!---头部开始--->
    <div class="top">
        <div class="head_width">
            <div class="fl" style="padding-left: 80px;">欢迎光临南网沃店 <a href="#">[登录]</a> <a href="#">[注册]</a></div>
            <div class="fr" style="padding-right: 80px;"><a href="#"><span class="sprite_icon set_icon"></span>管理中心</a></div>
        </div>
    </div>
    <div class="content_width" id="shop_po">
        <div class="logo fl">
            <a class="fl" href="#"><img src="<%=curUrl%>/demo/images/logo.gif" alt=""/></a>

            <div class="city fl">
                <a class="change-city" style="color: #666666;" href="javascript:void(null)" id="change-region">切换地域</a>
                <div class="change-city-list" style="position:absolute; display:none;background-color: #F9F9F9;width: 77px;border: 1px solid #e3e3e3;border-top:0px;" id="region-list">
                    <dl id="region-dl">
                        <dt style="padding-left: 10px;">广东</dt>
                        <dt style="padding-left: 10px;">广西</dt>
                        <dt style="padding-left: 10px;">海南</dt>
                    </dl>
                </div>
            </div>
        </div>
        <div class="search fr">
            <div class="inp fl">
                <input type="text" value="iphone5" onfocus="if(this.value==defaultValue) this.value=''"
                       onblur="if(!value) value=defaultValue">
            </div>
            <button class="fl"><span class="sprite_icon search_icon"></span></button>
            <div class="shop_bg fr">
                <a href="#"><span class="sprite_icon shop_icon"></span>去购物车结算<span id="shopping">2</span></a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="nav content_width">
        <div>
            <ul class="fl" id="menus">
                <li><a href="<%=curUrl%>?menu=0">首页</a></li>
                <li><a href="<%=curUrl%>/demo/pro-list.jsp?menu=1">主推机型</a></li>
                <li><a href="<%=curUrl%>/demo/pro-list-fitting.jsp?menu=2">配件</a></li>
                <li><a href="<%=curUrl%>/demo/seckill.jsp?menu=3">秒杀</a></li>
                <li class="bor_ri"><a href="<%=curUrl%>/demo/integration.jsp?menu=4">积分商城</a></li>
            </ul>
            <ul class="nav_bg_none fr">
                <li><a href="<%=curUrl%>/demo/industrial.jsp" target="_blank"><span class="sprite_icon industry_icon"></span>行业应用</a></li>
                <li><a href="<%=curUrl%>/demo/manage-bi.jsp" target="_blank"><span class="sprite_icon data_icon"></span>数据分析</a></li>
                <li><a href="<%=curUrl%>/demo/service.jsp" target="_blank"><span class="sprite_icon service_icon"></span>服务支持</a></li>
            </ul>
        </div>
    </div>
