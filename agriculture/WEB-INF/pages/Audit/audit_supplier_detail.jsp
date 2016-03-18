<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>经销商审核详细信息</title>
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
<script language="javascript" type="text/javascript">

</script>

</head>
<body>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="data_grid">
		<tbody>
			<tr>
				<th width="80">经销商名称</th>
				<td>${bean.supplierName}</td>
				<th width="80">法定代表人</th>	
				<td>${bean.legalRepresent }
				</td>
			</tr>
			<tr>
				<th>注册资金(万元)</th>
				<td>${bean.regCapital }</td>
				<th>联 系 人</th>
				<td>${bean.contact}</td>
			</tr>
			<tr>
				<th>联系电话</th>
				<td>${bean.tel}</td>
				<th>邮箱</th>
				<td>${bean.email}</td>
			</tr>
			<tr>
				<th>所在地区</th>
				<td>${bean.areaFullname}</td>
				<th>详细地址</th>
				<td>${bean.supplierAddress}</td>
			</tr>
			<tr>
				<th>申请原因</th>
				<td>${bean.applyremark}</td>
				<th>申请日期</th>
				<td><fmt:formatDate value="${bean.applyDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>申请类型</th>
				<td><asia:write name="applyType" dictId="cofarmer_apply_type"></asia:write></td>
				<th>审核时间</th>
				<td><fmt:formatDate value="${bean.auditDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>审核人</th>
				<td>${bean.auditname}</td>
				<th>审核状态</th>
				<td><asia:write name="auditResult" dictId="cofarmer_audit_result"></asia:write></td>
			<tr>
				<th>审核说明</th>
				<td colspan="3">${bean.rejectreason}</td>
			</tr>
		</tbody>
	</table>
	<div align=center style="margin: 5px 0 5px 0">
		<input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel"
			onclick="art.dialog.close()" class="cancelbtn" />
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="data_grid">
		<tr>
			<th style="text-align: center;">营业执照</th>
		<tr>
		<tr>
			<td style="text-align: center;">
				<a href='${ctx}/${bean.docfilepath}' target="_blank"><img class="pic" src="${ctx}/${bean.docfilepath}" width="98%" title="营业执照" alt="营业执照" />
			</td>
		<tr>
	</table>
	
	</br>
</body>
</html>

