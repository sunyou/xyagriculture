<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>质询详细信息</title>
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
</head>
<body> 
	质询的对象和原因：
	<table class="data_grid" width="100%">
		<tbody>
			<tr>
				<th width="110">被质询合作社名称</th>
				<td colspan=3>${coFarmerBean.cofarmerName }</td> 
			</tr>
			<tr>
				<th  >被质询原因</th>
				<td colspan=3>${bean.objectName }</td>
			</tr>
	</table>
	<br>
	质询的内容：
	<table class="data_grid" width="100%">
			<tr>
				<th width="110">质询内容</th>
				<td colspan=3>${bean.reason }</td>
			</tr>
			
			<tr> 
				<th>质询人</th>
				<td width="210">${bean.operators }</td>
				<th width="110">质询日期</th>
				<td><fmt:formatDate value="${bean.operateDate }"
						pattern="yyyy-MM-dd" />
				</td> 
			</tr>
	</table>
	<br>
	反馈内容：
	<table class="data_grid" width="100%">
			<tr> 
				<th width="110">反馈说明</th>
				<td colspan=3>${bean.resnote}</td>
			</tr>
			
			<tr>
				<th>反馈人</th>
				<td width="200">${bean.resperson }</td>
				<th width="110">反馈日期</th>
				<td><fmt:formatDate value="${bean.resdate }"
						pattern="yyyy-MM-dd" />
				</td>
			</tr>
			
			
				
		</tbody>
	</table>
	<div align=center>
		<br> <br> <input type="button" name="btn_Cancel" value="关 闭"
			id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	</div>
</body>
</html>
