<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>基本地图展示</title>
    <link rel="stylesheet" href="../demo/css/map.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.4.1&key=a8961c47efea97510405430749cb0f29"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <script type="text/javascript" src="../demo/js/jquery-1.9.1.min.js"></script>
</head>
<script>
    var start_time = new Date();
    var end_time = "" ;
    var t = setInterval(function(){
        if(document.readyState=="complete"){aa();}
    },500)
 
    function aa(){
        end_time = new Date();
        console.log(end_time.getTime() -  start_time.getTime() );
        clearInterval(t);
    }
</script>
<body onload="onload()">
<div id ="mapheaddiv" class="mapheaddiv" >
<div id = "logodiv" class ="logodiv" ><img alt="图片加载失败" src="../demo/img/loginClientLogo.png" style="margin-top: 2%;margin-left: 13%;float: left;"></div>
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
			<form  action="" method="post" name="addForm" id ="addForm">
			<div id="cityInputArea" style="width: 100%; height: 80%;">
				<table style="width: 100%;">
					<tr>
						<td style="width: 10%; height: 100%;">
						<span id="startCity" class="startCity" ><font
								size="3px">起始站点:</font></span></td>
						<td style="width: 34%; height: 100%;"><input type="text"
							id="addStartCityBtn" name="addStartCityBtn" onBlur="onblurStartData()"/>
						<input type="hidden" name="startLatitude" id ="startLatitude" />
						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 100%;"><span id="endCity"
							class="endCity" ><font
								size="3px">途径站点:</font></span></td>
						<td style="width: 34%; height: 100%;"><input type="text"
							id="addPassCityBtn" name="addPassCityBtn" onBlur="onblurPassData()"/>
							<input type="hidden" name="passLatitude" id ="passLatitude" />
						</td>
					</tr>
				</table>
			</div>
			</form>
		</div>
	<div id="addDevice" class="addDevice" style="border: 1px solid #DDF3FF;">
					<div style="width: 100%; height: 10%;margin-top: 1%;">
						<span class="deviceInfo"><font
							size="3px">设备信息说明：</font></span>
					</div>
					<div class="addDevice_info" ><font color="#93979A">设备信息添加区</font></div>
					<div class="addDevice_info" style="margin-top: 1%;"><font color="#93979A">途径城市设备信息添加区</font></div>
				</div>
	<div id="opreateBtn" style="width: 90%;height: 10%;text-align: center;margin-left: 3%;margin-top: 2%;">
			<span id="addBtnsp" class="spanbtn addBtnsp" onclick="addDateInfo()">添加</span>
			<span id="closeBtn" class="spanbtn closeBtn" onclick="closeAdd()">关闭</span>
	</div>
	</div>
</div>
<div style=" width: 49%;height: 100%;float: left;">
	<div id="container" class="container">
	<div id="addbtn" class="addbtn"><span id="spanbtn" class="spanbtn" onclick="addInfoTest()"><font size="3%" color="#444444">添加</font></span></div>
</div>	
</div>
</div>
<div style="width: 99%;height: 7%;margin-top: 4.5%;"><span style="display: block;width: 200px;height: 40px;line-height: 40px;margin-left: 40%;"><font size="2.5px;">@成都欧飞凌通讯技术有限公司</font></span></div>
<script type="text/javascript" src="../demo/js/map.js"></script>

</body>
</html>