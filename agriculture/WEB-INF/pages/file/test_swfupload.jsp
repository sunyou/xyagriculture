<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Language" content="zh-cn" />
    <title>swfupload</title>
    <%@ include file="/common/include.jsp"%>
    
	<link type="text/css" rel="stylesheet" href="${ctx}/js-plugs/swfupload/css/uploadify.css">
	<script type="text/javascript" src="${ctx}/js-plugs/swfupload/js/jquery.uploadify.js" ></script>
	<script type="text/javascript" src="${ctx}/js-plugs/swfupload/js/jquery.uploadify.ext.js" ></script>
	<script type="text/javascript" src="${ctx}/content/js/LigerUI/json2.js" ></script>
	
<script>
$(function() {
	$('#file1').uploadifyExt({baseUrl:'<%=ApplicationUtil.getBasePath(request)%>',sessionId:'<%=session.getId()%>'});
});


</script>
</head>
<body>
	 <div style="margin: 100px 0 0 100px" id="file1"></div>
</body>
</html>
