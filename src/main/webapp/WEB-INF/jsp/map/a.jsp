<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<div style="position: absolute; bottom: 0px; left: 16px;">
		<div>
			<div class="info" id="info" style="width: 130%; height: 100%;">
				<div class="info-top">
					<div>
						<span style="font-size: 16px; color: #000000;">设备信息</span>
					</div>
					<img src="../img/mapimg/close.png">
				</div>
				<div class="info-middle"
					style="background-color: white; border: 1px solid rgb(202, 237, 255);">
					<div class="editCity">
						<form action="" method="post" id="dataFrom_qwerty" name="dataFrom">
							<div style="border: 1px solid #DDF3FF; margin-top: 5px;">
								<table id="editCityTb" style="width: 98%; margin-top: 5px;"
									class="editCityTb">
									<tbody>
										<tr>
											<td class=""><span id="startCity"
												style="font-size: 13px;"><input type="checkbox"
													name="ischecked" value="qwerty">起始城市:</span></td>
											<td class="inputCity"><input type="text"
												id="editStartCityBtn" name="editStartCityBtn" value="成都"></td>
											<td class=""><span id="endCity" style="font-size: 13px;">途径城市:</span></td>
											<td class="inputCity"><input type="text"
												id="editPassCityBtn" name="editPassCityBtn" value="武汉"></td>
										</tr>
									</tbody>
								</table>
								<span style="font-size: 13px; margin-top: 5px;">设备信息说明:</span>
								<div class="editDeviceIf">
									<div>
										<font color="#93979A">起始城市:"OSL6200的相关一些信息，后续扩展"</font>
									</div>
									<div>
										<font color="#93979A">途径城市:"OSL6200的相关一些信息，后续扩展"</font>
									</div>
								</div>
							</div>
						</form>
						<form action="" method="post" id="dataFrom_qwengf" name="dataFrom">
							<div style="border: 1px solid #DDF3FF; margin-top: 5px;">
								<table id="editCityTb" style="width: 98%; margin-top: 5px;"
									class="editCityTb">
									<tbody>
										<tr>
											<td class=""><span id="startCity"
												style="font-size: 13px;"><input type="checkbox"
													name="ischecked" value="qwengf">起始城市:</span></td>
											<td class="inputCity"><input type="text"
												id="editStartCityBtn" name="editStartCityBtn" value="武汉"></td>
											<td class=""><span id="endCity" style="font-size: 13px;">途径城市:</span></td>
											<td class="inputCity"><input type="text"
												id="editPassCityBtn" name="editPassCityBtn" value="西安"></td>
										</tr>
									</tbody>
								</table>
								<span style="font-size: 13px; margin-top: 5px;">设备信息说明:</span>
								<div class="editDeviceIf">
									<div>
										<font color="#93979A">起始城市:"OSL6200的相关一些信息，后续扩展"</font>
									</div>
									<div>
										<font color="#93979A">途径城市:"OSL6200的相关一些信息，后续扩展"</font>
									</div>
								</div>
							</div>
						</form>
						<form action="" method="post" id="dataFrom_qwenltrg"
							name="dataFrom">
							<div style="border: 1px solid #DDF3FF; margin-top: 5px;">
								<table id="editCityTb" style="width: 98%; margin-top: 5px;"
									class="editCityTb">
									<tbody>
										<tr>
											<td class=""><span id="startCity"
												style="font-size: 13px;"><input type="checkbox"
													name="ischecked" value="qwenltrg">起始城市:</span></td>
											<td class="inputCity"><input type="text"
												id="editStartCityBtn" name="editStartCityBtn" value="武汉"></td>
											<td class=""><span id="endCity" style="font-size: 13px;">途径城市:</span></td>
											<td class="inputCity"><input type="text"
												id="editPassCityBtn" name="editPassCityBtn" value="郑州"></td>
										</tr>
									</tbody>
								</table>
								<span style="font-size: 13px; margin-top: 5px;">设备信息说明:</span>
								<div class="editDeviceIf">
									<div>
										<font color="#93979A">起始城市:"OSL6200的相关一些信息，后续扩展"</font>
									</div>
									<div>
										<font color="#93979A">途径城市:"OSL6200的相关一些信息，后续扩展"</font>
									</div>
								</div>
							</div>
						</form>
						<div>
							<span class="editSpan editSpan_style" onclick="editInfo()">编辑</span><span
								class="editSpan close_Style" onclick="deleteInfo()">删除</span>
						</div>
					</div>
				</div>
				<div class="info-bottom"
					style="position: relative; top: 0px; margin: 0px auto;">
					<img src="../img/mapimg/sharp.png">
				</div>
			</div>
		</div>
	</div>
</body></html>