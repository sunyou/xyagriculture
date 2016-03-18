<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
								<title>结果</title>
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
					<script type="text/javascript"
						src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
					<script type="text/javascript"
						src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
					<script type="text/javascript"
						src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
					<script type="text/javascript"
						src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
					<script type="text/javascript"
						src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
					<script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
					<script type="text/javascript"
						src="${ctx}/content/js/public.js?v=2015081410080444"></script>
</head>
<body>
  <c:if test="${!empty saveFlag}">
		<script>showTips('${saveFlag }','${ctx}/Base/Material/materialNYSave.html');</script>
	</c:if>
		
</body>
</html>

