<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<%@include file="url.jsp" %>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
		<meta name="keywords" content="广东联通">
		<meta name="description" content="广东联通">
		
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/common.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="<%=curUrl%>/lc/display/resources/css/my/manage-bi.css" type="text/css" media="screen" />
		
		<script src="<%=curUrl%>/lc/display/resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="<%=curUrl%>/lc/display/resources/js/charts.js" type="text/javascript"></script>
		<script src="<%=curUrl%>/lc/display/resources/js/chart-cfg/chart-cfg.js" type="text/javascript"></script>
		
		<script type="text/javascript">
            var chart1;

            var chartData1 = [{
                country: "广州",
                visits: 1900,
                color: "#FF0F00"
            }, {
                country: "东莞",
                visits: 1809,
                color: "#FF9E01"
            }, {
                country: "佛山",
                visits: 1322,
                color: "#FCD202"
            }, {
                country: "珠海",
                visits: 1122,
                color: "#F8FF01"
            }, {
                country: "惠州",
                visits: 1114,
                color: "#B0DE09"
            }, {
                country: "清远",
                visits: 984,
                color: "#04D215"
            }, {
                country: "云浮",
                visits: 711,
                color: "#0D8ECF"
            }, {
                country: "江门",
                visits: 580,
                color: "#2A0CD0"
            }, {
                country: "湛江",
                visits: 443,
                color: "#8A0CCF"
            }, {
                country: "深圳",
                visits: 441,
                color: "#CD0D74"
            }, {
                country: "清远",
                visits: 395,
                color: "#754DEB"
            }, {
                country: "清远",
                visits: 386,
                color: "#DDDDDD"
            }, {
                country: "清远",
                visits: 384,
                color: "#999999"
            }];


            var chart2;
            var chartData2 = [{
                year: "本月",
                IPhone: 2.5,
				三星: 1.5,
				小米: 2.1,
				魅族: 2.3,
				诺基亚: 1.2,
				华为: 2.1
            }, {
                year: "上月",
                IPhone: 2.6,
				三星: 2.7,
				小米: 2.2,
				魅族: 2.3,
				诺基亚: 2.3,
				华为: 1.1
            }, {
                year: "去年同期",
                IPhone: 2.8,
				三星: 1.9,
				小米: 2.4,
				魅族: 2.3,
				诺基亚: 2.3,
				华为: 1.1
            }];

            var chart3;
            var chartData3 = [{
                country: "广东",
                litres: 156.90
            }, {
                country: "云南",
                litres: 131.10
            }, {
                country: "海南",
                litres: 115.80
            }, {
                country: "广西",
                litres: 109.90
            }, {
                country: "贵州",
                litres: 108.30
            }];



            var chart4;

            var chartData4 = [{
                direction: "魅族",
                value: 8
            }, {
                direction: "小米",
                value: 9
            }, {
                direction: "诺基亚",
                value: 4.5
            }, {
                direction: "HTC",
                value: 3.5
            }, {
                direction: "华为",
                value: 9.2
            }, {
                direction: "MOTO",
                value: 8.4
            }, {
                direction: "Iphone",
                value: 11.1
            }, {
                direction: "三星",
                value: 10
            }];

            
            var chart5;
            var chartData5 = [{
                date: new Date(2012, 0, 1),
                distance: 227,
                duration: 408
            }, {
                date: new Date(2012, 0, 2),
                distance: 371,
                duration: 482
            }, {
                date: new Date(2012, 0, 3),
                distance: 433,
                duration: 562
            }, {
                date: new Date(2012, 0, 4),
                distance: 345,
                duration: 379
            }, {
                date: new Date(2012, 0, 5),
                distance: 480,
                duration: 501
            }, {
                date: new Date(2012, 0, 6),
                distance: 386,
                duration: 443
            }, {
                date: new Date(2012, 0, 7),
                distance: 348,
                duration: 405
            }, {
                date: new Date(2012, 0, 8),
                distance: 238,
                duration: 309
            }, {
                date: new Date(2012, 0, 9),
                distance: 218,
                duration: 287
            }, {
                date: new Date(2012, 0, 10),
                distance: 349,
                duration: 485
            }, {
                date: new Date(2012, 0, 11),
                distance: 603,
                duration: 890
            }, {
                date: new Date(2012, 0, 12),
                distance: 534,
                duration: 810
            }];
            
            AmCharts.ready(function () {
            	Chart.column1(chart1,chartData1,"chartdiv1");
            	//Chart.barStacked1(chart2,chartData2,"chartdiv2",["IPhone","三星","小米","魅族","诺基亚","华为"]);
            	//Chart.barStacked1(chart2,chartData2,"chartdiv2",[{key1:"IPhone",key2:"#FF0F00"},{key1:"三星",key2:"#FF9E01"},{key1:"小米",key2:"#F8FF01"},{key1:"魅族",key2:"#B0DE09"},{key1:"诺基亚",key2:"#0D8ECF"},{key1:"华为",key2:"#DDDDDD"}]);
            	Chart.barStacked1(chart2,chartData2,"chartdiv2",[{key1:"IPhone",key2:"#F84249"},{key1:"三星",key2:"#FA7278"},{key1:"小米",key2:"#FB9095"},{key1:"魅族",key2:"#FCAFB3"},{key1:"诺基亚",key2:"#FDCDCF"},{key1:"华为",key2:"#FEE1E1"}]);
            	//Chart.pie1(chart3,chartData3,"chartdiv3");
            	Chart.radarPolar1(chart4,chartData4,"chartdiv4");
            	Chart.lineWithDuration1(chart5,chartData5,"chartdiv5");
            });

            
        </script>
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="content_width line"></div>
		<div class="outer_div" style="position:relative;">
			<div class="table">
				<table>
					<tr>
						<th>组织架构</th>
						<th>销售量</th>
						<th>上月值</th>
						<th>同比</th>
						<th>环比</th>
						<th>增幅</th>
						<th>预警</th>
					</tr>
					<tr>
						<td class="group_name">广东</td>
						<td>1000</td>
						<td>1000</td>
						<td><font color="red">6.00%↑</font></td>
						<td><font color="#FFCC00">0.00%→</font></td>
						<td>50</td>
						<td class="g"><b class="g_y"></b></td>
					</tr>
					<tr>
						<td class="group_name">海南</td>
						<td>900</td>
						<td>950</td>
						<td><font color="#03E23F">-6.00%↓</font></td>
						<td><font color="red">10.00%↑</font></td>
						<td>-50</td>
						<td class="g"><b class="g_r"></b></td>
					</tr>
					<tr>
						<td class="group_name">广西</td>
						<td>800</td>
						<td>750</td>
						<td><font color="red">6.00%↑</font></td>
						<td><font color="#03E23F">-12.00%↓</font></td>
						<td>5-</td>
						<td class="g"><b class="g_g"></b></td>
					</tr>
					<tr>
						<td class="group_name">云南</td>
						<td>700</td>
						<td>795</td>
						<td><font color="red">6.00%↑</font></td>
						<td><font color="#03E23F">-12.00%↓</font></td>
						<td>-95</td>
						<td class="g"><b class="g_g"></b></td>
					</tr>
					<tr>
						<td class="group_name">贵州</td>
						<td>500</td>
						<td>495</td>
						<td><font color="#03E23F">-6.00%↓</font></td>
						<td><font color="red">12.00%↑</font></td>
						<td>5</td>
						<td class="g"><b class="g_r"></b></td>
					</tr>
				</table>
			</div>
			
			<div class="chart">
				<div id="chartdiv1" class="chart_div left"></div>
				<div id="chartdiv2" class="chart_div left"></div>
				<br class="clear"/>
				<!-- 
				<div id="chartdiv3" class="chart_div left"></div>
				 -->
				<div id="chartdiv5" class="chart_div left"></div>
				<div id="chartdiv4" class="chart_div left"></div>
				<br class="clear"/>
			</div>
		</div>
		
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>