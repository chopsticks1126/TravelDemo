<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>地图显示</title>
    <link rel="stylesheet" href="../demo/css/map.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.4.1&key=a8961c47efea97510405430749cb0f29"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <script type="text/javascript" src="../demo/js/jquery-1.9.1.min.js"></script>
</head>
<body onload="onload()">
<div id ="mapheaddiv" class="mapheaddiv" >
<div id = "logodiv" class ="logodiv" ><img alt="å¾çå è½½å¤±è´¥" src="../img/loginClientLogo.png" style="margin-top: 2%;margin-left: 13%;float: left;"></div>
<div id="login_out" class="login_out" ><span id="loginbtn" class="loginbtndiv" onclick="login()"><font size="5%" color="#ffffff">ç»å½/éåº</font></span></div>
</div>
<div id="maindiv" style="border: 2px solid #CAEDFF;width: 99.6%;height: 70%;">
<div style="width: 48%;height: 100%;float: left; display: none;" id="leftdiv">
	<div id="addLeft" class="left">
		<div id="addcity" class="addcity" style="border: 1px solid #DDF3FF;margin-left: 5%;margin-bottom: 1%;">
			<div style="width: 100%; height: 20%;margin-top: 3%;">
				<span id="cityspan" class="cityspan">
				<font size="3px">æ·»å è®¾å¤åå¸æå¨ç«ç¹:</font></span>
			</div>
			<form  action="" method="post" name="addForm" id ="addForm">
			<div id="cityInputArea" style="width: 100%; height: 80%;">
				<table style="width: 100%;">
					<tr>
						<td style="width: 10%; height: 100%;">
						<span id="startCity" class="startCity" ><font
								size="3px">èµ·å§ç«ç¹:</font></span></td>
						<td style="width: 34%; height: 100%;"><input type="text"
							id="addStartCityBtn" name="addStartCityBtn" onblur="onblurStartData()"/>
						<input type="hidden" name="startLatitude" id ="startLatitude" />
						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 100%;"><span id="endCity"
							class="endCity" ><font
								size="3px">éå¾ç«ç¹:</font></span></td>
						<td style="width: 34%; height: 100%;"><input type="text"
							id="addPassCityBtn" name="addPassCityBtn" onblur="onblurPassData()"/>
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
							size="3px">è®¾å¤ä¿¡æ¯è¯´æï¼</font></span>
					</div>
					<div class="addDevice_info" ><font color="#93979A">è®¾å¤ä¿¡æ¯æ·»å åº</font></div>
					<div class="addDevice_info" style="margin-top: 1%;"><font color="#93979A">éå¾åå¸è®¾å¤ä¿¡æ¯æ·»å åº</font></div>
				</div>
	<div id="opreateBtn" style="width: 90%;height: 10%;text-align: center;margin-left: 3%;margin-top: 2%;">
			<span id="addBtnsp" class="spanbtn addBtnsp" onclick="addDateInfo()">æ·»å </span>
			<span id="closeBtn" class="spanbtn closeBtn" onclick="closeAdd()">å³é­</span>
	</div>
	</div>


</div>
<div style=" width: 49%;height: 100%;float: left;">
	<div id="container" class="container">
	<div id="addbtn" class="addbtn"><span id="spanbtn" class="spanbtn" onclick="addInfoTest()"><font size="3%" color="#444444">æ·»å </font></span></div>
</div>	
</div>
</div>
<div style="width: 99%;height: 7%;margin-top: 4.5%;"><span style="display: block;width: 200px;height: 40px;line-height: 40px;margin-left: 40%;"><font size="2.5px;">@æé½æ¬§é£åéè®¯ææ¯æéå¬å¸</font></span></div>
<script type="text/javascript" src="../demo/js/map.js"></script>

</body>
</html>