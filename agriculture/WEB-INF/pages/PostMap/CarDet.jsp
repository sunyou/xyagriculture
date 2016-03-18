<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>车辆详细信息</title>
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
	<table class="data_grid" width="499">
		<tbody>
			<tr>
				<th>车辆编号</th>
				<td>${bean.carno}</td>
				<th>车辆类型</th>
				<td><asia:write name="cartype" dictId="PostMap_CarType"></asia:write>
				</td>
			</tr>
			<tr>
				<th>年审时间</th>
				<td><fmt:formatDate value="${bean.carcheck }"
						pattern="yyyy-MM-dd" /></td>
				<th>车辆状态</th>
				<td><asia:write name="carstate" dictId="car_state"></asia:write>
				</td>
			</tr>
			<tr>
				<th>最大载重量</th>
				<td>${bean.maxcap}KG</td>

				<th>GPS编号</th>
				<td>${bean.gpsNo}</td>

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

