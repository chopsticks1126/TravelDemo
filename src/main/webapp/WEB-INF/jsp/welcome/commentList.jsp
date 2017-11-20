<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- easyui依赖的jquery库 -->
<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/jquery.min.js"></script> 
<!-- easyui核心库 -->
<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<!-- 国际化文件：中文 -->
<script type="text/javascript" src="../jslib/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script> 
<!-- 引入样式文件 -->
<link rel="stylesheet" href="../jslib/jquery-easyui-1.5.3/themes/default/easyui.css" type="text/css"></link>
<!-- 引入相关的icon文件 -->
<link rel="stylesheet" href="../jslib/jquery-easyui-1.5.3/themes/icon.css" type="text/css"></link>
<title>Welcome Travel</title>
<style type="text/css">

</style>
</head>
<body>
	 <table id="dg" title="My msgInfo" class="easyui-datagrid" style="width:700px;height:250px"
             url="../ShowMsgDate"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true" >
        <thead>
            <tr>
                <th field="name" width="50">Name</th>
                <th field="phone" width="50">Phone</th>
                <th field="email" width="50">Email</th>
            </tr>
        </thead>
    </table>
	<script type="text/javascript">
		function login_comm() {
			alert(1);
		}
	</script>
</body>
</html>