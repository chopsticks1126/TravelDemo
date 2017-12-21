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
.review_area {
	border: 2px solid #BFEFFF;
	width: 700px;
	height: 300px;
	margin-top: 10px;
}
</style>
</head>
<body>
    <table id="dg" title="My msgInfo" class="easyui-datagrid" style="width:700px;height:250px"
             url="../ShowMsgDate/showMsgByConditional.do"
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
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">清除</a>
	 	<!-- 搜索-->	
	 	<input id="ss" class="easyui-searchbox" style="width:300px" data-options="searcher:search,prompt:'请输入查询条件',menu:'#mm'"></input> 
		<div id="mm" style="width:120px"> 
			<div data-options="name:'phone',iconCls:'icon-ok'" data-value ="phone">phone</div> 
			<div data-options="name:'email'" data-value ="email">email</div> 
			<input type="hidden" id="selectDown_01" name="selectDown_01"/>
		</div> 
    </div>
    <div id="dlg" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px" method="post" action="" >
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">Msg Information</div>
            <div style="margin-bottom:10px">
                <input name="name" class="easyui-textbox" required="true" label="Name:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="phone" id ="input_phone" class="easyui-textbox" required="true" label="Phone:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="email" class="easyui-textbox" required="true" validType="email" label="Email:" style="width:100%">
            </div>
            <input type="hidden" id="tagInfo" name="tagInfo" />
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
<!-- 	<!-- 拖动 --> 
<!-- 	<div id="dd" class="easyui-draggable" data-options="handle:'#title'"  -->
<!-- 		style="width: 100px; height: 100px;"disable ="true"> -->
<!-- 		<div id="title" style="background: #ccc;">title</div> -->
<!-- 	</div> -->
<!-- 	<!-- 放置--> 
<!-- 	<div id="dd" class="easyui-droppable" data-options="accept:'#d1,#d3'" -->
<!-- 		style="width: 100px; height: 100px;border: 1px solid red;"></div> -->
	<script type="text/javascript">
	$("a[class='l-btn']").click(function(){
		alert("点击事件");
	});
// 	$(".l-btn").bind('click',function(){
		
// 	});
	function search(){
		var typeSearch = $("#selectDown_01").val();
		var inputContent = $("#ss").val();
		$('#dg').datagrid('options').url ="../ShowMsgDate/showMsgByConditional.do?typeSearch="+typeSearch+"&inputContent="+inputContent;
		$('#dg').datagrid('reload');
		$("#selectDown_01").val("");
		$("#ss").val("");
	}
	$("#mm").menu({
		onClick:function(item){
			$("#selectDown_01").val(item.text);
		}
	});
// 		var m = $('#ss').searchbox('menu'); // 获取菜单项var item = m.menu('findItem', 'Sports News');     // 查找菜单项
// 		// 更改菜单项图标
// 		m.menu('setIcon', {
// 			target : item.target,
// 			iconCls : 'icon-save'
// 		});
// 		// 选择搜索类型名
// 		$('#ss').searchbox('selectName', 'sports');
// 		alert($('#ss').searchbox('selectName', 'sports'));

		// 	$(function (){
		// 		$('#dg').datagrid("getPager").pagination({
		// 			pageList: [10,20,50,100],
		// 			onSelectPage:function(pageNumber, pageSize){
		// 				alert(pageNumber+"~~~~~"+pageSize);
		// 			$('#dg').datagrid('options').url = "../ShowMsgDate/showMsgInfoDate.do";
		// 			$('#dg').datagrid('reload'); //重新加载表格
		// 			}
		// 		});
		// 	});
		function newUser() {
			$('#dlg').dialog('open').dialog('center').dialog('setTitle',
					'New MsgInfo');
			$("input[name='id']").remove();
			$('#fm').form('clear');
			$('#tagInfo').val('newUser');
			url = '.../AjaxGetDate/addOrUpdateMsgDate.do';
		}
		function editUser() {
			var row = $('#dg').datagrid('getSelected');
			$('#tagInfo').val('edit');
			var content = "<input type='hidden' name='id' class='easyui-textbox' required='true' validType='id' label='id:'>";
			$("#fm").append(content);
			if (row) {
				$('#dlg').dialog('open').dialog('center').dialog('setTitle',
						'Edit User');
				$('#fm').form('load', row);
			}
		}
		function saveUser() {
			var url="../AjaxGetDate/addOrUpdateMsgDate.do";
// 			var type = $("#tagInfo").val();
// 			if(type=="edit"){
// 				var url="../AjaxGetDate/updateDate.do";
// 			}else{
// 				var url="../AjaxGetDate/addMsgDate.do";
// 			}
			$('#fm').form({
				url:url,
				type:"POST",
				data:$("#fm").serialize(),
				dataType:"JSON",
				async:false,
				onSubmit:function(){  
					//校验数据是否为空
					var name = $('input[name="name"]').val();
					var phone = $('#input_phone').val();
					var email = $('input[name="email"]').val();
					if(name==''||phone==''||email==''){
						$.messager.alert('错误提示','输入框为必填项，请注意！','info');
							return false;
						}
						return true;
			    },   
				success:function(data){
					showOperation();
					$('#dlg').dialog('close'); // close the dialog
					$('#dg').datagrid('reload'); // reload the user data
				},error:function(){
					alert("error");	
				}
			});
			$('#fm').submit(); 
		}
		function destroyUser() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager.confirm('Confirm',
						'是否确定要删除选中的数据？',
						function(r) {
							if (r) {
								$.post('../AjaxGetDate/deleteDate.do', {
									id : row.id
								}, function(result) {
									if (result.success=='1') {
										$('#dg').datagrid('reload');
										showOperation();
									} else {
										$.messager.show({ // show error message
											title : 'Error',
											msg : result.errorMsg
										});
									}
								}, 'json');
							}
						});
			}
		}
		function showOperation(){
			$.messager.show({
				title:'提示信息',
				msg:'操作成功！',
				timeout:1000,
				showType:'slide',
				style:{
					right:'',
					top:document.body.scrollTop+document.documentElement.scrollTop,
					bottom:''
				}
			});
		}
	</script>
</body>
</html>