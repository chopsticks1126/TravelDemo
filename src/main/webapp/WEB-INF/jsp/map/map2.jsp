<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"> -->
    <title>地图</title>
    <link rel="stylesheet" href="../css/map.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.4.1&key=a8961c47efea97510405430749cb0f29"></script><!-- 高德地图api接口 -->
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<!--     <script type="text/javascript" src="../jslib/jquery-1.9.1.min.js"></script> -->
	<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/jquery.min.js"></script> 
<style type="text/css">
.mapheaddiv {
	width: 100%;
	height: 10%;
	background-color: #E7EBF8;
	overflow: hidden;
	z-index: 1;
}

#container {
	width: 99%;
	/* 	width: 50%; */
	/* 	height: 78%; */
	/* 	margin-right: 1%; */
	/* 	margin-top: 5%; */
}

.loginbtndiv {
	width: 131px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	display: block;
	border: 1px solid #9C9B9D;
	cursor: pointer;
	-webkit-border-radius: 4px;
}

.login_out {
	width: 131px;
	height: 38px;
	float: right;
	margin-top: 1.5%;
	margin-right: 8%;
}

.logodiv {
	width: 136px;
	height: 36px;
	float: left;
}

.addbtn {
	position: absolute;
	width: 138px;
	height: 40px;
	/* 	border: 1px solid red; */
	z-index: 160;
	right: 70px;
	bottom: 10px;
}
/*左边区域页面*/
.left {
	width: 98%;
	height: 97%;
	border: 2px solid #CAEDFF;
	float: left;
	margin-left: 0.5%;
	margin-top: 0.5%;
}
/*城市增加区域*/
.addcity {
	width: 90%;
	height: 20%;
	margin-top: 3%;
	margin-left: 3%;
}

.cityspan {
	width: 100%;
	height: 100%;
	line-height: 100%;
	margin-top: 10px;
	margin-left: 5%;
}

.startCity {
	width: 20%;
	height: 80%;
	margin-right: 1%;
	margin-left: 19%;
}

.endCity {
	width: 20%;
	height: 100%;
	margin-left: 19%;
}

.spanbtn {
	width: 100px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	display: block;
	background-color: #ffffff;
	border: 1px solid #9C9B9D;
	cursor: pointer;
	-webkit-border-radius: 4px;
}
/*设备信息增加区*/
.addDevice {
	width: 90%;
	height: 62%;
	margin-left: 5%;
}

.deviceInfo {
	width: 100%;
	height: 20%;
	margin-bottom: 1%;
	margin-left: 3%;
}

.addBtnsp {
	float: left;
	margin-left: 30%;
}

.closeBtn {
	float: left;
	margin-left: 10%;
}

.addDevice_info {
	width: 95%;
	height: 40%;
	border: 1px solid #8C9094;
	margin-left: 2%;
	background-color: #FCF9F2;
	-webkit-border-radius: 4px;
}

/*编辑框*/
.editCity {
	border: 1px solid #CAEDFF;
	width: 100%;
	height: 20%;
}

.editDevice {
	border: 1px solid #CAEDFF;
	width: 100%;
	height: 58%;
	margin-top: 1%;
}

.editOperate {
	/*  	border :1px solid #CAEDFF;   */
	width: 100%;
	height: 20%;
	margin-top: 1%;
	backgroundColor: #FCF9F2;
	/* 	float: left; */
}

.editDeviceArea {
	width: 99%;
	height: 70%;
	/* 	border :1px solid #8C9094;  */
	background-color: #FCF9F2;
	margin-top: 1%;
	-webkit-border-radius: 4px;
}

.endAreaInfo {
	width: 99%;
	height: 45%;
	border: 1px solid #8C9094;
	-webkit-border-radius: 4px;
	margin-top: 0.5%;
}
/*城市编辑*/
.textCity {
	width: 18%;
	height: 100%;
}

.inputCity {
	width: 28%;
	height: 100%;
}

.inputCity input[type='text'] {
 	width: 110%; 
 	height: 100%; 
/* 	width: 50%; */
/* 	height: 15%; */
	margin-left: -14%;
	outline: none;
	/* 	border-radius: 1px; */
	/* 	-webkit-border-radius: 2px; */
}

.editSpan {
	width: 55px;
	heigth: 15px;
	line-heigth: 15px;
	border: 1px solid #9C9B9D;
	font-size: 13px;
	display: block;
	-webkit-border-radius: 4px;
	text-align: center;
}

.editDeviceIf {
	width: 95%;
	border: 1px solid #8C9094;
	-webkit-border-radius: 4px;
	margin: 0 auto;
}

.editSpan_style {
	margin-left: 33%;
	margin-bottom: 3px;
	margin-top: 8px;
}

.close_Style {
	margin-left: 57%;
	margin-bottom: 3px;
	margin-top: -21px;
}
</style>
</head>
<body>
<div id ="mapheaddiv" class="mapheaddiv" >
<div id = "logodiv" class ="logodiv" ><img alt="图片加载失败" src="../img/mapimg/loginClientLogo.png" style="margin-top: 2%;margin-left: 13%;float: left;"></div>
<div id="login_out" class="login_out" ><span id="loginbtn" class="loginbtndiv" onclick="login()"><font size="5%" color="#ffffff">登录/退出</font></span></div>
</div>
<div id="maindiv" style="border: 2px solid #CAEDFF;width: 99.6%;height: 70%;">
<div style="width: 48%;height: 100%;float: left; display: none;" id="leftdiv">
	<div id="addLeft" class="left">
		<div id="addcity" class="addcity" style="border: 1px solid #DDF3FF;margin-left: 5%;margin-bottom: 1%;">
			<div style="width: 100%; height: 20%;margin-top: 3%;">
				<span id="cityspan" class="cityspan">
				<font size="3px">添加设备城市所在站点:</font></span>
			</div>
			<div id="cityInputArea" style="width: 100%; height: 80%;">
				<table style="width: 100%;">
					<tr>
						<td style="width: 10%; height: 100%;">
						<span id="startCity" class="startCity" ><font
								size="3px">起始城市:</font></span></td>
						<td style="width: 34%; height: 100%;"><input type="text"
							id="startCityBtn" name="startCityBtn"/></td>
					</tr>
					<tr>
						<td style="width: 10%; height: 100%;"><span id="endCity"
							class="endCity" ><font
								size="3px">途径城市:</font></span></td>
						<td style="width: 34%; height: 100%;"><input type="text"
							id="endCityBtn" name="endCityBtn"/></td>
					</tr>
				</table>
			</div>
		</div>
	<div id="addDevice" class="addDevice" style="border: 1px solid #DDF3FF;">
					<div style="width: 100%; height: 10%;margin-top: 1%;">
						<span class="deviceInfo"><font
							size="3px">设备信息说明：</font></span>
					</div>
					<div class="addDevice_info" ><font color="#93979A">设备信息添加区</font></div>
<!-- 					<div class="addDevice_info" style="margin-top: 1%;"><font color="#93979A">途径城市设备信息添加区</font></div> -->
				</div>
	<div id="opreateBtn" style="width: 90%;height: 10%;text-align: center;margin-left: 3%;margin-top: 2%;">
			<span id="addBtnsp" class="spanbtn addBtnsp" onclick="addDateInfo()">添加</span>
			<span id="closeBtn" class="spanbtn closeBtn" onclick="closeAdd()">关闭</span>
	</div>
	</div>
</div>
<div style=" width: 49%;height: 100%;float: left;">
	<div id="container" class="container">
	<div id="addbtn" class="addbtn"><span id="spanbtn" class="spanbtn" onclick="addInfo()"><font size="3%" color="#444444">添加</font></span></div>
</div>	
</div>
</div>
<div style="width: 99%;height: 7%;margin-top: 4.5%;"><span style="display: block;width: 200px;height: 40px;line-height: 40px;margin-left: 40%;"><font size="2.5px;">@成都欧飞凌通讯技术有限公司</font></span></div>
<!-- <script type="text/javascript" src="../js/map.js"></script> -->
<script type="text/javascript">
function login(){
	alert("登录");
}
function addInfo(){
	$("#container").css({"width":"50%","margin-right":"1%","height": "78%","margin-top": "5%"});
	$("#addbtn").hide();
	$("#leftdiv").show();
// 	$("body").append("<div><.");
}
function closeAdd(){
	$("#container").css({"width":"99%","height":"80%"});
	$("#leftdiv").hide();
	$("#addbtn").show();
}
function addDateInfo(){
	alert("添加成功");
}
</script>
<script type="text/javascript">
var map = new AMap.Map('container', {
    resizeEnable: true,
    center: [108.88, 34.34],
    zoom: 15
});
//数据
var data_info2 =[{"x":"104.06","y":"30.57","city":"cd"},
                {"x":"114.27","y":"30.58","city":"wh"},
                {"x":"108.88","y":"34.34","city":"xa"},
                {"x":"114.49","y":"38.01","city":'sjz'},
                {"x":"116.40","y":"39.91","city":'bj'}];
 var data_info =
	 [
	    {
	    	"oid":"qwerty",
	        "startx_axis": "104.06",
	        "starty_axis": "30.57",
	        "startcityName": "cd",
	        "startcityName_zh": "成都",
	        "passx_axis": "114.27",
	        "passy_axis": "30.58",
	        "passcityName": "wh",
	        "startimgName":"cd",
	        "passcityName_zh": "武汉",
	        "direction": "cd-wh",
	        "DeviceNam": "OSL6200",
	        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
	    }, {
	    	"oid":"qwesdf",
	        "startx_axis": "108.88",
	        "starty_axis": "34.34",
	        "startcityName": "xa",
	        "startcityName_zh": "西安",
	        "startimgName":"xa",
	        "passx_axis": "114.49",
	        "passy_axis": "38.01",
	        "passcityName": "sjz",
	        "passcityName_zh": "石家庄",
	        "direction": "xa-sjz",
	        "DeviceNam": "OSL6200",
	        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
	    },{
	    	"oid":"qwengf",
	        "startx_axis": "114.27",
	        "starty_axis": "30.58",
	        "startcityName": "wh",
	        "startcityName_zh": "武汉",
	        "startimgName":"wh",
	        "passx_axis": "108.88",
	        "passy_axis": "34.34",
	        "passcityName": "xa",
	        "passcityName_zh": "西安",
	        "direction": "wh-xa",
	        "DeviceNam": "OSL6200",
	        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
	    },{
	    		"oid":"qwenltrg",
		        "startx_axis": "114.27",
		        "starty_axis": "30.58",
		        "startcityName": "wh",
		        "startcityName_zh": "武汉",
		        "startimgName":"wh",
		        "passx_axis": "113.42",
		        "passy_axis": "34.44",
		        "passcityName": "zz",
		        "passcityName_zh": "郑州",
		        "direction": "wh-xa",
		        "DeviceNam": "OSL6200",
		        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
		    }
	    
	];

 var lines =[];//所有线段关系的坐标及城市城市名
 var point = [];
 var pointCity =[];//所有标记点坐标及对应城市名
 for (var i = 0; i < data_info.length; i++) {
		var startpoint = new AMap.LngLat(data_info[i].startx_axis, data_info[i].starty_axis);//起始城市坐标
		var endpoint = new AMap.LngLat(data_info[i].passx_axis, data_info[i].passy_axis);
		var saxis ={"X":data_info[i].startx_axis,"Y":data_info[i].starty_axis};
		var yaxis ={"X":data_info[i].passx_axis,"Y":data_info[i].passy_axis};
		point.push(saxis);
		point.push(yaxis);
		var ponitp1 ={"point":saxis,"cityName":data_info[i].startcityName};
		var ponitp2 ={"point":yaxis,"cityName":data_info[i].passcityName};
		pointCity.push(ponitp1);
		pointCity.push(ponitp2);
		var line ={
				"oid":data_info[i].oid,
				"start":{
							"startcityName": data_info[i].startcityName,
							"startcityName_zh":data_info[i].startcityName_zh,
							"start_axis":{"x":data_info[i].startx_axis,"y":data_info[i].starty_axis},
							"deviceInfo":data_info[i].deviceInfo
							} ,
					"pass":{
							"passcityName": data_info[i].passcityName,
							"passcityName_zh":data_info[i].passcityName_zh,
							"pass_axis":{"x":data_info[i].passx_axis,"y":data_info[i].passy_axis},
							"deviceInfo":data_info[i].deviceInfo
							}
					};
		lines.push(line);
 }

 /*标记坐标及坐标点名称*/
	var pointAll = [];
	var hash = {};
	for (var i = 0; i < pointCity.length; i++) {
		var str = JSON.stringify(pointCity[i].point);
		if (!hash[str]) {
			pointAll.push(pointCity[i]);
			hash[str] = true;
		}
	}
	
// 	console.log(lines);
	 var dataInfo =[];
	for (var i = 0; i < pointAll.length; i++) {
// 		console.log(pointAll[i]);
		var cityName = pointAll[i].cityName;
		for (var j = 0; j < lines.length; j++) {
			var startCity = lines[j].start.startcityName;
			var passCity = lines[j].pass.passcityName;
			if (cityName == startCity || cityName == passCity) { //cd
				var cityin ={"cityName":cityName,"axis":pointAll[i].point,"info":lines[j]}
				dataInfo.push(cityin);
			} 
		}
	}
// 	console.log(dataInfo);
	/*画线段区域*/
	var lineArr = [];
	for (var i = 0; i < lines.length; i++) {
		var lineArr = [];
		var startAxis = lines[i].start.start_axis;
		var passsAxis = lines[i].pass.pass_axis;
		var startpoint = new AMap.LngLat(startAxis.x, startAxis.y);
		var passpoint = new AMap.LngLat(passsAxis.x, passsAxis.y);
		lineArr.push(startpoint);
		lineArr.push(passpoint);
		var polyline = new AMap.Polyline({
			path : lineArr, //设置线路径
			strokeColor : "#3366FF", //线颜色
			strokeOpacity : 1, //线透明度
			strokeWeight : 6, //线宽
			strokeStyle : "solid", //线样式
			strokeDasharray : [ 10, 6 ], //补充线样式
			showDir : true
		//显示线上的箭头
		});
		polyline.setMap(map);
	}
	/*自定义显示窗体*/
	var infoWindow = new AMap.InfoWindow({
		isCustom : true, //使用自定义窗体
		offset : new AMap.Pixel(16, -45)
	});
	
	/*画点标记*/
	var markerAll = [];
	var showInfo =[];
	var showdata =[];
// 	console.log(dataInfo);
	for (var i = 0; i < pointAll.length; i++) {
		var image = '../img/mapimg/' + pointAll[i].cityName + '.png';
// 		console.log(pointAll[i].cityName);
		var markerPoint = new AMap.LngLat(pointAll[i].point.X,
				pointAll[i].point.Y);
		var marker = new AMap.Marker({ //起始城市标记
			map : map,
			icon : image,
			position : markerPoint,
			offset : new AMap.Pixel(-12, -36)//draggable:true, //是否可拖动
		}); 
		var count=0;
	 	var title = '<span style="font-size:16px;color:#000000;">设备信息</span>';
	 	
	 	var editDevice1 =[];
	 	var editDevice2 =[];
	 	var content3=[] ;
	 	var editBtn = [];
	 	var showEdit =[];
		for(var j=0;j<dataInfo.length;j++){
			console.log(dataInfo);
			if(pointAll[i].cityName==dataInfo[j].cityName){
				showEdit.push("<form action=\"\" method=\"post\" id=\"dataFrom_"+dataInfo[j].info.oid+"\" name=\"dataFrom\">"
									+"<div style=\" border:1px solid #DDF3FF;margin-top:5px;\">"
									+"<table id=\"editCityTb\" style=\"width:98%;margin-top:5px;\" class=\"editCityTb\">"
									+ "<tr>"
									+ "<td  class=\"\">"
									+ "<span id=\"startCity\" style=\"font-size:13px;\">"
									+"<input type=\"checkbox\" name=\"ischecked\"  value=\""+dataInfo[j].info.oid+"\">起始城市:"
									+ "</span></td>"
									+ "<td class=\"inputCity\">"
									+ "<input type=\"text\" id=\"startCityBtn\"  name=\"startCityBtn\" value =\""+dataInfo[j].info.start.startcityName_zh+"\"/></td>"
									+ "<td  class=\"\">"
									+ "<span id=\"endCity\" style=\"font-size:13px;\">途径城市:"
									+ "</span></td>"
									+ "<td class=\"inputCity\">"
									+ "<input type=\"text\" id=\"endCityBtn\" name=\"endCityBtn\" value=\""+dataInfo[j].info.pass.passcityName_zh+"\"/></td>"
									+ "</tr>" + "</table>"//city编辑区
									+"<span style=\"font-size:13px;margin-top:5px;\">设备信息说明:</span>"
									+"<div class =\"editDeviceIf\">"
									+"<div><font color=\"#93979A\">上一城市:\""+dataInfo[j].info.start.deviceInfo+"\"</font></div>"
									+"<div><font color=\"#93979A\">下一城市:\""+dataInfo[j].info.start.deviceInfo+"\"</font></div></div></form>");
									
			}
		}
		showEdit.push("<div><span class=\"editSpan editSpan_style\"  onclick=\"editInfo()\">编辑</span>"
				+ "<span class=\"editSpan close_Style\" onclick = \"closeInfoWindow()\">关闭</span></div></div>");
		marker.content = createInfoWindow(title,showEdit,editBtn,editDevice1,editDevice2);
		marker.on('click', markerClick); //左键点击 markerClick 方法名
		marker.on('rightclick', rightclick);//右键点击
		marker.emit('click', {
			target : marker
		});
		if (i == pointAll.length - 1) {
			closeInfoWindow();
		}
	}
	
	for (var i = 0; i < markerAll.length; i++) {
		// 			markers[i].content = createInfoWindow(title, content1, content2);
		markerAll[i].content = createInfoWindow();
		markerAll[i].on('click', markerClick); //左键点击 markerClick 方法名
		markerAll[i].on('rightclick', rightclick);//右键点击
		markerAll[i].emit('click', {
			target : markerAll[i]
		});
		if (i == markerAll.length - 1) {
			closeInfoWindow();
		}
	}

	function markerClick(e) {
		infoWindow.setContent(e.target.content);
		infoWindow.open(map, e.target.getPosition());
	}

	//右键窗体
	var contextMenu = new AMap.ContextMenu(); //创建右键
	contextMenu.addItem("放大一级", function() {
		//     alert("点击了放大一级");
		map.zoomIn();
	}, 0);
	//右键缩小
	contextMenu.addItem("缩小一级", function() {
		// 	alert("点击了缩小一级");
		map.zoomOut();
	}, 1);
	function rightclick(e) {
		contextMenu.open(map, e.lnglat);//打开右键窗体
	}

	map.setFitView();
	//构建自定义信息窗体
		function createInfoWindow(title,showEdit,content2,editDevice1,editDevice2) {
// 	function createInfoWindow() {
		var info = document.createElement("div");
		info.className = "info";
		info.style.width = "130%";
		info.style.height = "100%";

		//可以通过下面的方式修改自定义窗体的宽高
		// 定义顶部标题
		var top = document.createElement("div");
		var titleD = document.createElement("div");
		var closeX = document.createElement("img");
		top.className = "info-top";
				titleD.innerHTML = title;
		closeX.src = "../img/mapimg/close.png";
		closeX.onclick = closeInfoWindow;

		top.appendChild(titleD);
		top.appendChild(closeX);
		info.appendChild(top);

		// 定义中部内容
		var middle = document.createElement("div");
		middle.className = "info-middle";
		middle.style.backgroundColor = 'white';
		middle.style.border = "1px solid #CAEDFF";
		//
		var editCity = document.createElement("div");//修改城市
		editCity.className = "editCity";
		editCity.innerHTML = getStrByArr(showEdit);	//展示修改城市的多个table

// 		var editDevice = document.createElement("div");//修改设备信息
// 		editDevice.className = "editDevice";

// 		var editDeviceTitle = document.createElement("div");//设备信息
// 		editDeviceTitle.className = "editDeviceTitle";

// 		editDeviceTitle.style.width = "100%";
// 		editDeviceTitle.style.height = "20%";
// 		editDeviceTitle.innerHTML = "<span style=\"font-size:15px;\">设备信息说明:</span>";
		
// 		/*区域设备编辑区*/
// 		var editDeviceArea = document.createElement("div");//编辑区域
// 		editDeviceArea.className = "editDeviceArea";
// 		//起始城市(备用 后面要)
// // 		var startAreaInfo = document.createElement("div");
// // 		startAreaInfo.className = "endAreaInfo";//公用同一个样式
// // 		startAreaInfo.innerHTML = getStrByArr(editDevice2);
// // 		editDeviceArea.appendChild(startAreaInfo);
// 		//途径城市
// 		var endAreaInfo = document.createElement("div");
// 		endAreaInfo.className = "endAreaInfo";
// 		endAreaInfo.innerHTML = getStrByArr(editDevice1);
		
// 		editDeviceArea.appendChild(endAreaInfo);
// 		editDevice.appendChild(editDeviceTitle);
// 		editDevice.appendChild(editDeviceArea);
		

// 		var editOperate = document.createElement("div");//操作按钮
// 		editOperate.className = "editOperate";
// 		editOperate.innerHTML = content2;

		middle.appendChild(editCity);
// 		middle.appendChild(editDevice);
// 		middle.appendChild(editOperate);

		// 	middle.innerHTML = content;
		info.appendChild(middle);

		// 定义底部内容
		var bottom = document.createElement("div");
		bottom.className = "info-bottom";
		bottom.style.position = 'relative';
		bottom.style.top = '0px';
		bottom.style.margin = '0 auto';
		var sharp = document.createElement("img");
		sharp.src = "../img/mapimg/sharp.png";
		bottom.appendChild(sharp);
		info.appendChild(bottom);
		return info;
	}
	/*将得到的数组转成字符串，目地去掉数组中的,*/
 	function getStrByArr(dataArr){
 		var dataStr ="";
		for(var i = 0;i<dataArr.length;i++){
			dataStr +=dataArr[i];
			}
		return dataStr;
 	}

	function createInfoWindow2(title, content) {
		$(".amap-info").append("<div class =\"info-middle\">111111</div>");
	}
	function editInfo() {
		alert(1);
	}

	//关闭信息窗体
	function closeInfoWindow() {
		map.clearInfoWindow();
	}
</script>
</body>
</html>