<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- easyui依赖的jquery库 -->
<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/jquery.min.js"></script> 
<!-- 国际化文件：中文 -->
<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script> 
<!-- 引入相关的css文件 -->
<link rel="stylesheet" href="../css/commtent.css" type="text/css"></link>
<title>Welcome Travel</title>
<style type="text/css">


</style>
</head>
<body>
	<div class="main">
		<div class="hide">
			<span class="login_comm"><a href="javascript:void(0)"
				onclick="login_comm()" style="width: 100px;">请登录后评论</a></span>
		</div>
		<div class="content">
		<input type="hidden" value="${fn:length(dclist)}" id="dclistLength" >
		<input type="hidden" value="${userLogin.username}" id = "login_username">
		<input type="hidden" value="${userLogin.password}" id = "login_password">
		<c:forEach items="${dclist}" var="dclist">
			<div class="contentList" id="contentList_${dclist.dcID}"><!-- 1 -->
				<div class="showUserId">
					<div style="width: 23px; height: 22px; float: left;">
						<img alt="" src="../img/${dclist.headImg}" width="22" height="22"
							style="margin-left: 38px;">
					</div>
					<div style="width: 177px; height: 22px;">
						<span style="color: #EC7393"><input type="hidden" id="userID" name="userID" value="${userMap[dclist.userID]}">${userMap[dclist.userID]}</span>
					</div>
				</div>
				<div class="showcontent">
					<div class="showUserComment">
						<span style="float: left; width: 550px; line-height:39px;text-align: center;">${dclist.content}</span>
					</div>
					<div class="commtentOperater">
							<span class="commtentbtn" style="margin-left: 425px;">赞</span>
							<span class="commtentbtn" onclick="showCommtent('${dclist.dcID}')" >评论</span>
							<input type="hidden" value="show" id="showReview_${dclist.dcID}">
					</div>
					<!-- 回复区 -->
					<div class="review_area" id="review_area_${dclist.dcID}">
						<div  class="R_area1">
							<div  class="R_area1_1">
								<div style="width: 36px; height: 40px; float: left;">
									<img alt="" src="../img/headPhoto.jpg" width="35" height="35"
										style="margin-left: 15px;">
								</div>
								<div style="width: 414px; height: 40px;">
									<span class="reviewUserID">${userLogin.username}:</span> 
									<input type="text" class="btnReview" id = "replyContent_${dclist.dcID}">
								</div>
							</div>
							<div style="width: 550px; height: 30px; float: left;">
								<div style="width: 150px; margin-left: 329px;">
									<input type="checkbox" /><span>是否转发</span> 
									<input 	type="hidden" value="show" id="showTag_${dclist.dcID}">
									<span class="reviewbtn" onclick="review('${dclist.dcID}')"><font size="2.8">回复</font></span>
								</div>
							</div>
						</div>
						<input type="hidden"  id="clistLength_${dclist.dcID}" >
						<div class="comment" id="comment_${dclist.dcID}">
								<div class="commentArea" id="commentArea_${dclist.dcID}">
<%-- 								<c:forEach items="${ctlist}" var="ctlist"> --%>
<%-- 								<c:if test="${ctlist.dcComID==dclist.dcID }"> --%>
<%-- 								<div  class="ul_div" id="ul_div_${ctlist.comID}"> --%>
<!-- 								<ul> -->
<%-- 										<li><img alt="" src="../img/headPhoto.jpg" width="18" height="18" >&nbsp;&nbsp;<span>${userLogin.username}</span>@<span>${userMap[ctlist.cmtUserId] }</span> <span>${dclist.content }</span> --%>
<%-- 										<span class="reviewbtn" onclick="review_R('${ctlist.comID}','${dclist.dcID}')"><font size="2.8">回复</font></span> --%>
<%-- 										<input type="hidden" value="showli" id="showli_${ctlist.comID}"></li> --%>
<%-- 										<li id="li_div_${ctlist.comID}" style="display: none;"> --%>
<%-- 											<div class="li_div" id="lidiv_${ctlist.comID}"> --%>
<%-- 												<div class="R_area1_2" id="R_area1_2_${ctlist.comID}"> --%>
<!-- 													<div class="img_li"> -->
<!-- 														<img alt="" src="../img/headPhoto.jpg" width="18" -->
<!-- 															height="18" style="margin-left: 15px;"> -->
<!-- 													</div> -->
<!-- 													<div style="width:400px; height: 40px;"> -->
<!-- 														<span class="reviewUserID2">本人ID:</span> <input -->
<!-- 															type="text" class="btnReview2"> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div  class="re_confirm"> -->
<!-- 													<div style="width: 150px; margin-left: 268px;"> -->
<!-- 														<input type="checkbox" /><span>是否转发</span> <input -->
<%-- 															type="hidden" value="show" id="showTagInfo_${dclist.dcID}"> --%>
<%-- 															<span class="reviewbtn" onclick="reviewConfirm('${ctlist.comID}','${dclist.dcID}')"><font size="2.8">回复</font></span>  --%>
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<!-- 									</div> -->
<%-- 									</c:if> --%>
<%-- 								</c:forEach> --%>
<!-- 						<div class="moreReview" id ="moreReview" style="display: none;"><span class="loadMore" onclick="loadMore()">加载更多</span></div> -->
					</div>
					<!-- 回复区结束 -->
				</div>
			</div>
			</div>
			 </div>
			 </c:forEach>
			
			
		</div>
	</div>
<!-- <script type="text/javascript" src="../jslib/commtent/commtent.js"></script> -->
<script type="text/javascript">
	

		//回复的基础上再回复
		function review_R(div_comID,div_dcid){
			var div_dcidN=parseInt(div_dcid)+1;
			var showli =$("#showli_"+div_comID).val();
			var num = $('#comment_'+div_dcid+' ul').length;
			if(showli=='showli'){
				$("#lidiv_"+div_comID).show();
				$("#li_div_"+div_comID).show();
				$("#showli_"+div_comID).val('hideli');
				$("#contentList_"+div_dcidN+" ul li").css({"margin-top": "15px"});
				$('#ul_div_'+div_comID).css({"height": "118px"});
				var height ="220px";
				var topheight = "230px";
				for (var i = 0; i < num; i++) {
					height = parseInt(height) + 50;
				}
				topheight = parseInt(topheight) + 50*num;
				$("#contentList_"+div_dcidN).css({"margin-top": topheight});
				$('#review_area_'+div_dcid).css({"height": height});
			}else{
				$("#lidiv_"+div_comID).hide();
				$("#li_div_"+div_comID).hide();
				$("#showli_"+div_comID).val('showli');
				$('#ul_div_'+div_comID).css({"height": "30px"});
				var toph ="198";
				var height = "184";
				toph = parseInt(toph) + 46*(num-1);
				height = parseInt(height) + 46*(num-1);
// 				alert(height+"~~~~~~~~~~~~~~"+toph);
				$('#review_area_'+div_dcid).css({"height": height});
				$("#contentList_"+div_dcidN).css({"margin-top": toph});
// 				if(num==3){
// 					$('#review_area_'+div_dcid).css({"height":"276px"});
// 					$("#contentList_"+div_dcidN).css({"margin-top": "290px"});
// 				}else if(num==2){
// 					$('#review_area_'+div_dcid).css({"height": "230px"});
// 					$("#contentList_"+div_dcidN).css({"margin-top": "244px"});
// 				}else if(num==1){
// 					$('#review_area_'+div_dcid).css({"height": "184px"});
// 					$("#contentList_"+div_dcidN).css({"margin-top": "198px"});
// 				}
			}
		}
		//回复后确认回复
		function reviewConfirm(div_dcid,div_comID){
			var div_dcidN=parseInt(div_dcid)+1;
			$("#li_div_"+div_comID).hide();
			$("#showli_"+div_comID).val('showli');
// 			$("ul li:eq(2)").css({"margin-top" : "0px"});
			$('#ul_div_'+div_comID).css({"height" : "30px"});
			$("#contentList_"+div_dcidN).css({"margin-top" : "290px"});
			$('#review_area_'+div_dcid).css({"height" : "276px"});
		}
		
		//展示评论下方的回复div
		function showCommtent(div_dcid) {
			var div_dcidN = parseInt(div_dcid)+1;
			var dcComID =div_dcid;
			var dclistLength = $("#dclistLength").val();
			var dclistLength = parseInt(dclistLength)+1;
// 			var clistLength = parseInt($("#clistLength").val());//回复表的长度
// 			var num = $('#comment_'+div_dcid+' ul').length;
			chrckLogin(div_dcid);
			var showReview = $("#showReview_"+div_dcid).val();
			var clistLength = $("#clistLength_"+div_dcid).val();
			var url = "../CommtentController/loadComments.do";
			if (showReview == "show" && (clistLength == ''||clistLength == null )) {
				$.ajax({
					type:"POST",
			    	url:url,
			    	dataType:"json",
			    	async: false,
					data:{"dcComID":dcComID},
					success: function(data){
					$("#clistLength_"+div_dcid).val(data.length);//后台传过来的数据的总条数
					$.each(data,function (i, item){
					$("#commentArea_"+dcComID).append("<div  class=\"ul_div\" id=\"ul_div_"+item.comID+"\">"
					 						+"<ul>"
					 						+"<li><img alt=\"\" src=\"../img/headPhoto.jpg\" width=\"18\" height=\"18\" >&nbsp;&nbsp;<span>"+item.cmtUserId+"</span>@<span>"+item.cmtUserId+"</span> <span>"+item.replyContent+"</span>"
					 						+"<span class=\"reviewbtn\" onclick=\"review_R('"+item.comID+"','"+item.dcComID+"')\"><font size=\"2.8\">回复</font></span>"
					 						+"<input type=\"hidden\" value=\"showli\" id=\"showli_"+item.comID+"\"></li>"
					 						+"<li id=\"li_div_"+item.comID+"\" style=\"display: none;\">"
					 						+"<div class=\"li_div\" id=\"lidiv_"+item.comID+"\">"
					 						+"<div class=\"R_area1_2\" id=\"R_area1_2_"+item.comID+"\">"
					 						+"<div class=\"img_li\">"
					 						+"<img alt=\"\" src=\"../img/headPhoto.jpg\" width=\"18\" height=\"18\" style=\"margin-left: 15px;\">"
					 						+"</div>"
					 						+"<div style=\"width:400px; height: 40px;\"><span class=\"reviewUserID2\">本人ID:</span> <input type=\"text\" class=\"btnReview2\">"
					 						+"</div>"
					 						+"</div>"
					 						+"<div  class=\"re_confirm\">"
					 						+"<div style=\"width: 150px; margin-left: 268px;\">"
					 						+"<input type=\"checkbox\" /><span>是否转发</span> <input type=\"hidden\" value=\"show\" id=\"showTagInfo_"+item.dcComID+"\">"
					 						+"<span class=\"reviewbtn\" onclick=\"reviewConfirm('"+item.comID+"','"+item.dcComID+"')\"><font size=\"2.8\">回复</font></span>"
					 						+"</div>"
					 						+"</div>"
					 						+"</div>"
					 						+"</li>"
					 						+"</ul>"
					 						+"</div>");
					
							});
						
						var num = $('#comment_'+div_dcid+' ul').length;
// 						$("#contentList_"+div_dcidN).css({"margin-top" : "100px"});
						$("#showReview_"+div_dcid).val('hide');
						/////////////////////////////////////
// 						$("#comment_"+div_dcid).show();
			  			$("#review_area_"+div_dcid).show();
// 			  			if(clistLength>0){
			  				lengthUlLi(num,div_dcid);
// 			  			}
						if(num==3){		//每个动态内容加载评论时只显示三个
							$("#commentArea_"+dcComID).append("<div class=\"moreReview\" id =\"moreReview\">"
							+"<span class=\"loadMore\" onclick=\"loadMore()\">加载更多</span></div>");
						}
						},error:function(){
							alert("失败");
						}
						});
				// $(".contentList:eq('0')").show().siblings(".contentList").hide();
				// $(".contentList:eq('1')").show().siblings(".contentList").hide();
				// $(".contentList:eq('2')").show().siblings(".contentList").hide();
// 				$("#contentList_"+div_dcidN).css({"margin-top" : "100px"});
// 				$("#showReview_"+div_dcid).val('hide');
// 				/////////////////////////////////////
// 	  			$("#review_area_"+div_dcid).show();
// 	  			if(clistLength>0){
// 	  				lengthUlLi(num,div_dcid);
// 	  			}
			} else {
				$("#contentList_"+div_dcidN).css({"margin-top" : "1px"});//展开评论当前的div的下一个
// 				for(var i=div_dcidN;i<dclistLength;i++){
// 					alert(i);
// 				$("#contentList_"+i).css({"margin-bottom" : "100px"});
// 				$("#contentList_"+i).css({"margin-top" : "1px"});
// 				}
// 				$("#lidiv_"+div_comID).hide();
// 				$("#li_div_"+div_comID).hide();
				$("#review_area_"+div_dcid).hide();
				$("#showReview_"+div_dcid).val('show');
				$("#clistLength_"+div_dcid).val('');
				$("#commentArea_"+dcComID).empty();//将已经追加的div内容清空，方便下次再点击评论重新加载
			}
		}
		//校验是否登录
		function chrckLogin(div_dcid){
			var flagshow= false;
			var url ="../CommtentController/ajaxCheckLogin.do";
			$.ajax({
				type:"POST",
		    	url:url,
		    	dataType:"json",
		    	async: false,
		  		success: function(data){
		  			if(data.flag=='islogin'){
		  				$("#showReview_"+div_dcid).val("show");
		  				flagshow = true;
		  			}else{
		  				$("#showReview_"+div_dcid).val("hide");
		  				flagshow = false;
		  			}
		  		},error:function(){
		  			$("#showReview_"+div_dcid).val("hide");
		  			flagshow = false;
		  	}
			});
			return flagshow;
		}
		//第一个回复按钮
		function review(div_dcid) {
			var div_dcidN = parseInt(div_dcid)+1;
			var dcComID =div_dcid;
			var num = $('#comment_'+div_dcid+' ul').length;
			var showTag = $("#showTag_"+div_dcid).val();
			var replyContent = $("#replyContent_"+div_dcid).val();
// 			alert(replyContent);
			if(replyContent==null || replyContent==''){
				alert("评论内容不为空");
				return;
			}
			var url ="../CommtentController/addComments.do";
			$.ajax({
				type:"POST",
		    	url:url,
		    	dataType:"json",
		    	async: false,
		    	data:{"dcComID":dcComID,"replyContent":replyContent},
		  		success: function(data){
		  			$("#clistLength_"+div_dcid).val('');
		  			$("#commentArea_"+dcComID).empty();
		  			$("#replyContent_"+div_dcid).val('');
		  			showCommtent(div_dcid);
		  			alert("添加成功！");
		  		},error:function(){
		  			alert(2);
		  	}
			});
			
// 			if (showTag == 'hide') {
// 				$("#comment_"+div_dcid).hide();
// 				$("#showTag_"+div_dcid).val('show');
// // 				for (var i = 0; i < num; i++) {
// // 					height = parseInt(height) + 45;
// // 				}
				
				
// 				if(num==1){
// 					$('#review_area_'+div_dcid).css({"height" : "84px"});
// 					$("#contentList_"+div_dcidN).css({"margin-top" : "95px"});
// 				}else if (num==2){
// 					$('#review_area_'+div_dcid).css({"height" : "84px"});
// 					$("#contentList_"+div_dcidN).css({"margin-top" : "95px"});
// 				}else if(num==3){
// 					$('#review_area_'+div_dcid).css({"height" : "84px"});
// 					$("#contentList_"+div_dcidN).css({"margin-top" : "95px"});
// 				}
				
// 			} else {
// 				lengthUlLi(num,div_dcid);
// 				$("#contentList_"+div_dcidN).css({"margin-top" : "245px"});//每次增加45px;
// 				var top = "200";
// 				var height ="140px";
// 				for (var i = 0; i < num; i++) {
// 					height = parseInt(height) + 45;
// 				}
// 			$('#review_area_' + div_dcid).css({"height" : height});
// 			$("#comment_" + div_dcid).show();
// 			$("#showTag_" + div_dcid).val('hide');
// 		}
	}
		
		
	//回复评论的个数
	function lengthUlLi(num,div_dcid) {
		var div_dcidN = parseInt(div_dcid)+1;
		$("#comment_" + div_dcid).show();
// 		$("#contentList_"+div_dcidN).css({"margin-top" : "290px"});//每次增加45px;
		var height ="140px";
		var topheight = "160px";
		if(num==3){
			height = parseInt(height) + 50*num;
			topheight = parseInt(topheight) + 50*num;
		}else{
			height = parseInt(height) + 50*(num-1);
			topheight = parseInt(topheight) + 50*(num-1);
		}
// 		alert(topheight+"----"+num);//2--265   3--300  1---210     0  ----153
		$("#contentList_"+div_dcidN).css({"margin-top" : topheight});
		$('#review_area_' + div_dcid).css({"height" : height});
		$("#showTag_" + div_dcid).val('hide');
	}
</script>
</body>
</html>