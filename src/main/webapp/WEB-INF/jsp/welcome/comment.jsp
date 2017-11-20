<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</head>
<body>
	<div class="main">
		<div class="hide">
			<span class="login_comm"><a href="javascript:void(0)"
				onclick="login_comm()" style="width: 100px;">请登录后评论</a></span>
		</div>
		<div class="content">
			<div class="contentList"><!-- 1 -->
				<div class="showUserId">
					<div style="width: 23px; height: 22px; float: left;">
						<img alt="" src="../img/headPhoto.jpg" width="22" height="22"
							style="margin-left: 38px;">
					</div>
					<div style="width: 177px; height: 22px;">
						<span style="color: #EC7393">用户ID：</span>
					</div>
				</div>
				<div class="showcontent">
					<div class="showUserComment">
						<span style="float: left;">显示用户发表的内容</span>
					</div>
					<div class="commtentOperater">
						<input type="button" value="赞"
							style="width: 56px; height: 23px; margin-left: 430px;"> 
							<input type="button" value="评论1" class="commtentbtn"  onclick="showCommtent()"> 
							<input type="hidden" value="show" id="showReview">
					</div>
					<!-- 回复区 -->
					<div class="review_area" id="review_area1">
						<div  class="R_area1">
							<div  class="R_area1_1">
								<div style="width: 36px; height: 40px; float: left;">
									<img alt="" src="../img/headPhoto.jpg" width="35" height="35"
										style="margin-left: 15px;">
								</div>
								<div style="width: 414px; height: 40px;">
									<span class="reviewUserID">本人ID:</span> 
									<input type="text" class="btnReview">
								</div>
							</div>
							<div style="width: 550px; height: 30px; float: left;">
								<div style="width: 150px; margin-left: 329px;">
									<input type="checkbox" /><span>是否转发</span> 
									<input
										type="hidden" value="show" id="showTag"> <input
										type="button" value="回复" style="margin-right: 1px;"
										onclick="review()">
								</div>
							</div>
						</div>
						<div class="comment" id="comment1">
								<div class="commentArea">
								<!-- 回复视图 -->
								<div  class="ul_div" id="ul_div1">
								<ul>
										<li><img alt="" src="../img/headPhoto.jpg" width="18" height="18" >&nbsp;&nbsp;<span>本人ID</span>@<span>用户ID</span> <span>这就是回复的内容</span><input type="button" value="回复" onclick="review_R()"><input type="hidden" value="showli" id="showli"></li>
										<li id="li_div" style="display: none;">
											<div class="li_div">
												<div class="R_area1_2">
													<div class="img_li">
														<img alt="" src="../img/headPhoto.jpg" width="18"
															height="18" style="margin-left: 15px;">
													</div>
													<div style="width:400px; height: 40px;">
														<span class="reviewUserID2">本人ID:</span> <input
															type="text" class="btnReview2">
													</div>
												</div>
												<div  class="re_confirm">
													<div style="width: 150px; margin-left: 268px;">
														<input type="checkbox" /><span>是否转发</span> <input
															type="hidden" value="show" id="showTag"> <input
															type="button" value="回复" style="margin-right: 1px;"
															onclick="reviewConfirm()">
													</div>
												</div>
											</div>
										</li>
									</ul>
									<!-- 回复视图结束 -->
									</div>
									<div  class="ul_div" id="ul_div_2">
									<ul><li><img alt="" src="../img/headPhoto.jpg" width="18" height="18" >&nbsp;&nbsp;<span>本人ID</span>@<span>用户ID</span> <span>这就是回复的内容</span><input type="button" value="回复" onclick="review_R1()"><input type="hidden" value="showli" id="showli"></li><li></li></ul>
						</div>
							<div  class="ul_div" id="ul_div_2">
									<ul><li><img alt="" src="../img/headPhoto.jpg" width="18" height="18" >&nbsp;&nbsp;<span>本人ID</span>@<span>用户ID</span> <span>这就是回复的内容</span><input type="button" value="回复" onclick="review_R2()"><input type="hidden" value="showli" id="showli"></li><li></li></ul>
						</div>
						<div class="moreReview" id ="moreReview"><span class="loadMore" onclick="loadMore()">加载更多</span></div>
					</div>
					<!-- 回复区结束 -->
				</div>
			</div>
			</div>
			
			<div class="contentList" id="contentList2"><!-- 2 -->
				<div class="showUserId">
					<div style="width: 23px; height: 22px; float: left;">
						<img alt="" src="../img/headPhoto.jpg" width="22" height="22"
							style="margin-left: 38px;">
					</div>
					<div style="width: 177px; height: 22px;">
						<span style="color: #EC7393">用户ID：</span>
					</div>
				</div>
				<div class="showcontent">
					<div class="showUserComment">
						<span style="float: left;">显示用户发表的内容</span>
					</div>
					<div class="commtentOperater">
						<input type="button" value="赞"
							style="width: 56px; height: 23px; margin-left: 430px;"> <input
							type="button" value="评论2" class="commtentbtn2" 
							onclick="showCommtent2()"> <input type="hidden"
							value="show" id="showReview2">
					</div>
					<!-- 回复区 -->
					<div class="review_area">
						<div style="width: 550px; height: 72px; margin-top: 2px;">
							<div
								style="width: 550px; height: 40px; margin-top: 10px; margin-left: 25px;">
								<div style="width: 36px; height: 40px; float: left;">
									<img alt="" src="../img/headPhoto.jpg" width="35" height="35"
										style="margin-left: 15px;">
								</div>
								<div style="width: 414px; height: 40px;">
									<span class="reviewUserID">本人ID:</span> <input type="text"
										class="btnReview">
								</div>
							</div>
							<div style="width: 550px; height: 30px; float: left;">
								<div style="width: 150px; margin-left: 329px;">
									<input type="checkbox" /><span>是否转发</span> <input
										type="hidden" value="show" id="showTag2"> <input
										type="button" value="回复" style="margin-right: 1px;"
										onclick="review()">
								</div>
							</div>
						</div>
						<div class="comment">
							<div>
								<div class="commentArea">
									<ul>
										<li>内容一</li>
										<li>内容二</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- 回复区结束 -->
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="../jslib/commtent/commtent.js"></script>
</body>
</html>