<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>轮作换茬信息</title>
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
	<c:if test="${!empty message}">
		<script>showTips('${message }');</script>
	</c:if>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <td colspan="4">
                        <font color="#0090D7">${plantLot.goodsName }--轮作换茬的详细信息</font>
                    </td>
                </tr>
                <tr>
                    <td>浇水日期
                    </td>
                    <td>
                        ${plantLot.operateDate }
                    </td>
                    <td>种植批次
                    </td>
                    <td>
                        ${plantLot.plotNo }
                    </td>
                </tr>
                <tr>
                    <td>生产者
                    </td>
                    <td>
                      ${plantLot.cofarmerName }
                    </td>
                    <td>果树
                    </td>
                    <td>
                        ${plantLot.goodsName }
                    </td>
                </tr>
                <tr>
                    <td>操作人
                    </td>
                    <td>
                      ${plantLot.operators }
                    </td>
                    <td>说明
                    </td>
                    <td>
                        ${plantLot.notes }
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>

