var Chart={
	column1:function(chart,chartData,chartdiv){
		// SERIAL CHART
	    chart = new AmCharts.AmSerialChart();
	    chart.dataProvider = chartData;
	    chart.categoryField = "country";
	    chart.startDuration = 2;
	    // the following two lines makes chart 3D
	    chart.depth3D = 2;
	    chart.angle = 30;

	    // AXES
	    // category
	    var categoryAxis = chart.categoryAxis;
	    categoryAxis.labelRotation = 0; // º
	    categoryAxis.dashLength = 5;
	    categoryAxis.gridAlpha = 0;//background x line
	    categoryAxis.gridPosition = "start";
	    

	    // value
	    var valueAxis = new AmCharts.ValueAxis();
	    //valueAxis.title = "地市";
	    valueAxis.dashLength = 5;
	    valueAxis.gridAlpha = 0; //background y line
	    chart.addValueAxis(valueAxis);

	    // GRAPH            
	    var graph = new AmCharts.AmGraph();
	    graph.valueField = "visits";
	    graph.colorField = "color";
	    graph.balloonText = "[[category]]: [[value]]";
	    graph.type = "column";
	    graph.lineAlpha = 0;
	    graph.fillAlphas = 0.6;
	    chart.addGraph(graph);

	    // WRITE
	    chart.write(chartdiv);
	},
	barStacked1:function(chart,chartData,chartdiv,array){
		// SERIALL CHART
        chart = new AmCharts.AmSerialChart();
        chart.dataProvider = chartData;
        chart.categoryField = "year";
        chart.startDuration = 2;
        chart.plotAreaBorderAlpha = 0.03; //border [tou ming du]
        chart.rotate = true;
        chart.depth3D = 2;
	    chart.angle = 30;

        // AXES
        // Category
        var categoryAxis = chart.categoryAxis;
        categoryAxis.gridAlpha = 0; //line
        categoryAxis.axisAlpha = 0;
        categoryAxis.gridPosition = "start";

        // value                      
        var valueAxis = new AmCharts.ValueAxis();
        valueAxis.stackType = "regular";
        valueAxis.gridAlpha = 0;
        valueAxis.axisAlpha = 0;
        chart.addValueAxis(valueAxis);

        // GRAPHS
        
        var graph;
        
        for(var i=0;i<array.length;i++){
        	graph = new AmCharts.AmGraph();
        	graph.title = array[i].key1;
            graph.labelText = "[[value]]";
            graph.valueField = array[i].key1;
            graph.type = "column";
            graph.lineAlpha = 0;
            graph.fillAlphas = 0.6;
            graph.lineColor = array[i].key2;
            chart.addGraph(graph);
        }
        
//        // firstgraph 
//        var graph = new AmCharts.AmGraph();
//        graph.title = array[0];
//        graph.labelText = "[[value]]";
//        graph.valueField = array[0];
//        graph.type = "column";
//        graph.lineAlpha = 0;
//        graph.fillAlphas = 0.6;
//        graph.lineColor = "#C72C95";
//        chart.addGraph(graph);
//
//        // second graph                              
//        graph = new AmCharts.AmGraph();
//        graph.title = array[1];
//        graph.labelText = "[[value]]";
//        graph.valueField = array[1];
//        graph.type = "column";
//        graph.lineAlpha = 0;
//        graph.fillAlphas = 0.6;
//        graph.lineColor = "#D8E0BD";
//        chart.addGraph(graph);
//
//        // thirdt graph              
//        graph = new AmCharts.AmGraph();
//        graph.title = array[2];
//        graph.labelText = "[[value]]";
//        graph.valueField = array[2];
//        graph.type = "column";
//        graph.lineAlpha = 0;
//        graph.fillAlphas = 0.6;
//        graph.lineColor = "#B3DBD4";
//        chart.addGraph(graph);
//
//        // fourth graph 
//        graph = new AmCharts.AmGraph();
//        graph.title = array[3];
//        graph.labelText = "[[value]]";
//        graph.valueField = array[3];
//        graph.type = "column";
//        graph.lineAlpha = 0;
//        graph.fillAlphas = 0.6;
//        graph.lineColor = "#69A55C";
//        chart.addGraph(graph);
//
//        // fifth graph 
//        graph = new AmCharts.AmGraph();
//        graph.title = array[4];
//        graph.labelText = "[[value]]";
//        graph.valueField = array[4];
//        graph.type = "column";
//        graph.lineAlpha = 0;
//        graph.fillAlphas = 0.6;
//        graph.lineColor = "#B5B8D3";
//        chart.addGraph(graph);
//
//        // sixth graph  
//        graph = new AmCharts.AmGraph();
//        graph.title = array[5];
//        graph.labelText = "[[value]]";
//        graph.valueField = array[5];
//        graph.type = "column";
//        graph.lineAlpha = 0;
//        graph.fillAlphas = 0.6;
//        graph.lineColor = "#F4E23B";
//        chart.addGraph(graph);

        // LEGEND
        var legend = new AmCharts.AmLegend();
        legend.position = "right";
        legend.borderAlpha = 0.01;//border [tou ming du]
        legend.horizontalGap = 10;
        legend.switchType = "v";
        chart.addLegend(legend);

        // WRITE
        chart.write(chartdiv);
	},
	pie1:function(chart,chartData,chartdiv){
		// PIE CHART
        chart = new AmCharts.AmPieChart();
        chart.dataProvider = chartData;
        chart.titleField = "country";
        chart.valueField = "litres";
        chart.labelRadius = -20;
        chart.labelText = "[[title]]: [[value]]";
        //chart.labelText = "[[percents]]%";
        chart.startDuration = 2;
        chart.depth3D = 2;
        chart.angle = 0;

        // LEGEND
        //var legend = new AmCharts.AmLegend();
        //legend.align = "center";
        //legend.markerType = "circle";
        //legend.switchType = "v";
        //chart.addLegend(legend);

        // WRITE
        chart.write(chartdiv);
	},
	radarPolar1:function(chart,chartData,chartdiv){
		// RADAR CHART
	    chart = new AmCharts.AmRadarChart();
	    chart.dataProvider = chartData;
	    chart.categoryField = "direction";
	    chart.startDuration = 2;
	
	    // TITLE
	    //chart.addTitle("Prevailing winds", 15);
	
	    // VALUE AXIS
	    var valueAxis = new AmCharts.ValueAxis();
	    valueAxis.gridType = "circles";
	    valueAxis.fillAlpha = 0.05;
	    valueAxis.fillColor = "#000000"
	    valueAxis.axisAlpha = 0.2;
	    valueAxis.gridAlpha = 0;
	    valueAxis.fontWeight = "bold"
	    valueAxis.minimum = 0;
	    chart.addValueAxis(valueAxis);
	
	    // GRAPH
	    var graph = new AmCharts.AmGraph();
	    graph.lineColor = "#FFCC00"
	    graph.fillAlphas = 0.4;
	    graph.bullet = "round"
	    graph.valueField = "value"
	    graph.balloonText = "[[category]]: [[value]] m/s"
	    chart.addGraph(graph);
	
	    // GUIDES
	    // blue fill
	    var guide = new AmCharts.Guide();
	    guide.angle = 225;
	    guide.tickLength = 0;
	    guide.toAngle = 315;
	    guide.value = 0;
	    guide.toValue = 14;
	    guide.fillColor = "#0066CC";
	    guide.fillAlpha = 0.6
	    valueAxis.addGuide(guide);
	
	    // red fill
	    var guide = new AmCharts.Guide();
	    guide.angle = 45;
	    guide.tickLength = 0;
	    guide.toAngle = 135;
	    guide.value = 0;
	    guide.toValue = 14;
	    guide.fillColor = "#CC3333";
	    guide.fillAlpha = 0.6;
	    valueAxis.addGuide(guide);
	
	    // WRITE                
	    chart.write(chartdiv);
	},
	lineWithDuration1:function(chart,chartData,chartdiv){
		// SERIAL CHART
        chart = new AmCharts.AmSerialChart();
        chart.dataProvider = chartData;
        chart.categoryField = "date";
        chart.marginTop = 0;
        chart.startDuration = 2;

        // AXES
        // category axis
        var categoryAxis = chart.categoryAxis;
        categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
        categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD                
        categoryAxis.autoGridCount = false;
        categoryAxis.gridCount = 50;
        categoryAxis.gridAlpha = 0;
        categoryAxis.gridColor = "#000000";
        categoryAxis.axisColor = "#555555";
        // we want custom date formatting, so we change it in next line
        categoryAxis.dateFormats = [{
            period: 'DD',
            format: 'DD'
        }, {
            period: 'WW',
            format: 'MMM DD'
        }, {
            period: 'MM',
            format: 'MMM'
        }, {
            period: 'YYYY',
            format: 'YYYY'
        }];

        // as we have data of different units, we create two different value axes
        // Duration value axis            
        var durationAxis = new AmCharts.ValueAxis();
        durationAxis.title = "库存";
        durationAxis.gridAlpha = 0.05;
        durationAxis.axisAlpha = 0;
        durationAxis.inside = true;
        // the following line makes this value axis to convert values to duration
        // it tells the axis what duration unit it should use. mm - minute, hh - hour...                
        durationAxis.duration = "mm";
        durationAxis.durationUnits = {
            DD: "d. ",
            hh: "h ",
            mm: "min",
            ss: ""
        };
        chart.addValueAxis(durationAxis);

        // Distance value axis 
        var distanceAxis = new AmCharts.ValueAxis();
        distanceAxis.title = "销量";
        distanceAxis.gridAlpha = 0;
        distanceAxis.position = "right";
        distanceAxis.inside = true;
        distanceAxis.unit = "mi";
        distanceAxis.axisAlpha = 0;
        chart.addValueAxis(distanceAxis);

        // GRAPHS
        // duration graph
        var durationGraph = new AmCharts.AmGraph();
        durationGraph.title = "duration";
        durationGraph.valueField = "duration";
        durationGraph.type = "line";
        durationGraph.valueAxis = durationAxis; // indicate which axis should be used
        durationGraph.lineColor = "#CC0000";
        durationGraph.balloonText = "[[value]]";
        durationGraph.lineThickness = 1;
        durationGraph.legendValueText = "[[value]]";
        durationGraph.bullet = "square";
        chart.addGraph(durationGraph);

        // distance graph
        var distanceGraph = new AmCharts.AmGraph();
        distanceGraph.valueField = "distance";
        distanceGraph.title = "distance";
        distanceGraph.type = "column";
        distanceGraph.fillAlphas = 0.1;
        distanceGraph.valueAxis = distanceAxis; // indicate which axis should be used
        distanceGraph.balloonText = "[[value]] miles";
        distanceGraph.legendValueText = "[[value]] mi";
        distanceGraph.lineColor = "#000000";
        distanceGraph.lineAlpha = 0;
        chart.addGraph(distanceGraph);

        // CURSOR                
        var chartCursor = new AmCharts.ChartCursor();
        chartCursor.zoomable = false;
        chartCursor.categoryBalloonDateFormat = "DD";
        chartCursor.cursorAlpha = 0;
        chart.addChartCursor(chartCursor);

        // LEGEND
        var legend = new AmCharts.AmLegend();
        legend.bulletType = "round";
        legend.equalWidths = false;
        legend.valueWidth = 120;
        legend.color = "#000000";
        chart.addLegend(legend);

        // WRITE                                
        chart.write(chartdiv);
	}
}

