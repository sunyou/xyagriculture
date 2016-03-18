<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>司机详细信息</title>
<link rel="Stylesheet" type="text/css"
	href="${ctx}/content/css/Custom.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
<link href="${ctx}/content/css/default.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
<script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
<script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
<script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
<script type="text/javascript">
	$(function() {
		var temp = ${bean};
		alert(temp);
	});
</script>

</head>
<body>
<br/>
	<table class="data_grid" cellpadding="0" cellspacing="0" border="0"  width="98%">
		<tbody>
			<tr>
				<th width="80"> 司机名称 </th>
				<td>${bean.name}</td>
			
				<th width="80">性别</th>
				<td>
				<c:if test="${bean.sex=='1'}">男</c:if>
				<c:if test="${bean.sex=='0'}">女</c:if>
				</td>
			</tr>
			<tr>
				<th>年龄</th>
				<td>
				 ${bean.age}
				</td>
				<th>QQ号</th>
				<td>${bean.qq}</td>
		 
				
			</tr>
			<tr>
				<th>电话</th>
				<td>
				 ${bean.tel}
				</td>
				<th>邮箱</th>
				<td>${bean.email}</td>
		 
				
			</tr>
			<tr>
				<th>地址</th>
				<td colspan='3'>${bean.addre}</td>
			</tr>
			<tr>
				<th>备注</th>
				<td colspan='3'>${bean.remark}</td>
			</tr>
		</tbody>
	</table>
		<div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
</body>
</html>

