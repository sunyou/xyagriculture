﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>农作物病虫害信息</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
</head>
<body>
<br>
	<c:if test="${!empty message}">
		<script>showTips('${message }');</script>
	</c:if>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody> 
                <tr>
                    <th width=100px>病虫害编号
                    </th>
                    <td>
                        ${pest.pestNo }
                    </td>
                </tr>
                <tr>
                    <th>病虫害名称
                    </th>
                    <td>
                        ${pest.pestName }
                    </td>
                </tr>
                <tr>
                    <th>病虫害种类
                    </th>
                    <td >
                        <asia:select name="pesttypeId" dictId="PEST_TYPE" nullOption="true" nullText="请选择" defaultValue="${pest.pesttypeId}" disabled="disabled"></asia:select>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>		
</body>
</html>

