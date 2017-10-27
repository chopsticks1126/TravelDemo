<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>上传下载功能</title>
	<link rel="stylesheet" type="text/css" href="../jslib/jquery-easyui-1.5.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jslib/jquery-easyui-1.5.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jslib/jquery-easyui-1.5.3/demo/demo.css">
	<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function down(){
		alert(1)
	}
</script>
</head>
<style type="text/css">
.down-a{
	margin-top: 15px;
}
</style>
<body>
	<h2>上传下载功能</h2>
	<div style="margin:20px 0;"></div>
	<form method="post" action="../upLoadController/doUploadFile.do" enctype="multipart/form-data">  
	<div class="easyui-panel" title="上传与下载文件" style="width:400px;padding:30px 70px 50px 70px">
<!-- 		<div style="margin-bottom:20px"> -->
<!-- 			<div>Name:</div> -->
<!-- 			<input class="easyui-textbox" style="width:100%"> -->
<!-- 		</div> -->
		<div style="margin-bottom:20px">
			<div>文件:</div>
			<input class="easyui-filebox" name="file1" data-options="buttonText:'选择',prompt:'选择文件'" style="width:100%" >
		</div>
		<div style="margin-bottom:20px">
			<div>文件:</div>
			<input class="easyui-filebox" name="file2" data-options="buttonText:'选择',prompt:'选择文件'" style="width:100%" >
		</div>
		<div>
		<button class="easyui-linkbutton" style="width:100%" name="Upload" type="submit"> 提交</button>
		</div>
	</div>
	</form>
	<c:forEach var="me" items="${fileNameMap}">
         <c:url value="/upLoadController/downDate.do" var="downurl">
             <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
         ${me.value}<a href="${downurl}">下载</a>
         <br/>
     </c:forEach>
</body>
</html>
