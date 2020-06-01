<%@page import="com.mvc.prectice.login.dto.LoginDto"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<style type="text/css">
#main_image{
	margin-left: 10%;
}
</style>

<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://www.amcharts.com/lib/4/lang/de_DE.js"></script>
<script src="https://www.amcharts.com/lib/4/geodata/germanyLow.js"></script>
<script src="https://www.amcharts.com/lib/4/fonts/notosans-sc.js"></script>

<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.PieChart);

// Add data
chart.data = [ {
  "country": "남자",
  "litres": 561524
}, {
  "country": "여자",
  "litres": 619016
} ];

// Add and configure Series
var pieSeries = chart.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "litres";
pieSeries.dataFields.category = "country";
pieSeries.slices.template.stroke = am4core.color("#fff");
pieSeries.slices.template.strokeWidth = 2;
pieSeries.slices.template.strokeOpacity = 1;

// This creates initial animation
pieSeries.hiddenState.properties.opacity = 1;
pieSeries.hiddenState.properties.endAngle = -90;
pieSeries.hiddenState.properties.startAngle = -90;

}); // end am4core.ready()
</script>

<style type="text/css">
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv1", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.data = [
   {
      country : "합계",
      visits: 1180540
   },
   {
      country : "노원구",
      visits: 49265
   },
   {
      country : "강서구",
      visits: 68237
   },
   {
      country : "성북구",
      visits: 54243
   },
   {
      country : "은평구",
      visits: 46535
   },
   {
      country : "송파구",
      visits: 58848
   },
   {
      country : "도봉구",
      visits: 29469
   },
   {
      country : "관악구",
      visits: 106865
   },
   {
      country : "강북구",
      visits: 39082
   },
   {
      country : "중랑구",
      visits: 47543
   },
   {
      country : "양천구",
      visits: 33088
   },
   {
      country : "강남구",
      visits: 62774
   },
   {
      country : "영등포구",
      visits: 51151
   },
   {
      country : "동대문구",
      visits: 54030
   },
  {
    country: "서대문구",
    visits: 43418
  },
  {
    country: "구로구",
    visits: 42984
  },
  {
    country: "동작구",
    visits: 54355
  },
  {
    country: "마포구",
    visits: 54162
  },
  {
    country: "강동구",
    visits: 41050
  },
  {
    country: "용산구",
    visits: 33076
  },
  {
    country: "광진구",
    visits: 54866
  },
  {
    country: "성동구",
    visits: 39067
  },
  {
    country: "서초구",
    visits: 39702
  },
  {
    country: "금천구",
    visits: 32928
  },
  {
    country: "종로구",
    visits: 23638
  },
  {
    country: "중구",
    visits: 20164
  }
];

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 40;
categoryAxis.fontSize = 11;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 10000;
valueAxis.max = 150000;
valueAxis.strictMinMax = true;
valueAxis.renderer.minGridDistance = 30;
// axis break
var axisBreak = valueAxis.axisBreaks.create();
axisBreak.startValue = 60000;
axisBreak.endValue = 80000;
//axisBreak.breakSize = 0.005;

// fixed axis break
var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
axisBreak.breakSize = 0.05 * (1 - d) / d;  

// make break expand on hover
var hoverState = axisBreak.states.create("hover");
hoverState.properties.breakSize = 1;
hoverState.properties.opacity = 0.1;
hoverState.transitionDuration = 1500;

axisBreak.defaultState.transitionDuration = 1000;
/*
// this is exactly the same, but with events
axisBreak.events.on("over", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
    1500,
    am4core.ease.sinOut
  );
});
axisBreak.events.on("out", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
    1000,
    am4core.ease.quadOut
  );
});*/

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "visits";
series.columns.template.tooltipText = "{valueY.value}";
series.columns.template.tooltipY = 0;
series.columns.template.strokeOpacity = 0;

// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});

}); // end am4core.ready()
</script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

</head>

<body>
<%@ include file="form/header.jsp" %>


<img src="resources/images/coliving_main.jpg" id="main_image">


   <div id="chartdiv"></div>
   

	<div id="chartdiv1"></div>




<%@ include file="form/footer.jsp" %>
</body>
</html>