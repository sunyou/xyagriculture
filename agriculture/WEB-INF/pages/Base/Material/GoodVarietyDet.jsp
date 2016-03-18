<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>农用物资详细信息</title>
<link href="${ctx}/content/js/poshytip/tip-green/tip-green.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/content/js/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/content/css/Custom.css?20130202020202"
	rel="stylesheet" type="text/css" />
<link rel="Stylesheet" type="text/css"
	href="${ctx}/content/css/Custom.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
<script type="text/javascript"
	src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
<script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
<script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
</head>
<body>
	<br>
	<table class="data_grid">
		<tbody>
			<tr>
				<th>作物名称</th>
				<td>${bean.goodsName}</td>
				<th>品种名称</th>
				<td>${bean.goodvariantName}</td>
			</tr>
			<tr>
				<th>成活率</th>
				<td>${bean.survivalrate}%</td>
				<th>出苗率</th>
				<td>${bean.emergencerate}%</td>

			</tr>
			<tr>
				<th>苗龄</th>
				<td>${bean.seedingage}</td>

				<th>产地</th>
				<td>${bean.origin}</td>

			</tr>
			<tr>
				<th>检疫证</th>
				<td>${bean.pratique}</td>
				<th>备注</th>
				<td>${bean.remark}</td>
			</tr>
		</tbody>
	</table>
	<div align=center>
		<br>
		<br> <input type="button" name="btn_Cancel" value="关 闭"
			id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	</div>
</body>
</html>

