<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="url.jsp" %>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
		<meta name="keywords" content="广东联通">
		<meta name="description" content="广东联通">

        <link rel="stylesheet" type="text/css" href="<%=curUrl%>/demo/css/style.css">
        <link rel="stylesheet" href="<%=curUrl%>/demo/css/service.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="<%=curUrl%>/demo/css/common.css" type="text/css" media="screen" />

        <script src="<%=curUrl%>/demo/js/jquery-1.9.1.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			jQuery(function() {
				
			});
		</script>
	</head>
	<body>
        <%@include file="head.jsp" %>
		<div class="content_width line"></div>
		<div class="outer_div">
			
			
			<div class="list">
				<ul>
					<li>
						<a href="###">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_1.png" alt="">
						</a>
						<div class="s_name">
							修改订单
						</div>
					</li>
					<li>
						<a href="###">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_10.png" alt="">
						</a>
						<div class="s_name">
							物流查询
						</div>
					</li>
					<li>
						<a href="###">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_2.png" alt="">
						</a>
						<div class="s_name">
							取消订单
						</div>
					</li>
					<li>
						<a href="###">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_3.png" alt="">
						</a>
						<div class="s_name">
							物流查询
						</div>
					</li>
					<li>
						<a href="###">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_4.png" alt="">
						</a>
						<div class="s_name">
							用户安全
						</div>
					</li>
					<li>
						<a href="###">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_5.png" alt="">
						</a>
						<div class="s_name">
							退换货查询
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/app/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_6.png" alt="">
						</a>
						<div class="s_name">
							维修网点
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/app/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_7.png" alt="">
						</a>
						<div class="s_name">
							物流进度
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/app/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_8.png" alt="">
						</a>
						<div class="s_name">
							南网之家
						</div>
					</li>
					<li>
						<a href="<%=curUrl%>/app/lc/display/jsp/pro-detail-phone.jsp">
							<img src="<%=curUrl%>/app/lc/display/resources/img/my/service/s_9.png" alt="">
						</a>
						<div class="s_name">
							建议留言
						</div>
					</li>
				</ul>
				<br class="clear"/>
			</div>
			<br class="clear"/>
			<div style="border: 1px solid #f7f7f7;">
				<div class="title" style="background:#f7f7f7;;padding:5px;">常见问题</div>
				<div class="content">
					<table>
						<tr>
							<td width="245px">如何才能何才能参加秒杀？</td>
							<td width="245px">如何进行支付？</td>
							<td width="245px">如何申请退款？</td>
						</tr>
						<tr>
							<td>如何查看物流？</td>
							<td>如何联系物流？</td>
                            <td>如何下单？</td>
						</tr>
						<tr>
							<td>如何下单？</td>
							<td>如何删除订单？</td>
                            <td>如何查看订单？</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

        <jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>