<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>种植档案关联</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/index.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        function GetPlotID(aa) {
            location.href = "${ctx}/Plant/Archives/PlantLot_Oper.html?ID=" + aa;
        }
    </script>

</head>
<body>
	<c:forEach items="${beans }" var="bean" varStatus="status">
        <fieldset>
            <legend class="legtitle">
                <span class="leg_left">
                	<span class="leg_text">${bean.goodsName }的详细信息</span>
                	<span class="leg_right"></span>
                </span>
            </legend>
            <div class="ro_middle" style="width: auto;">
                <div class="ro_top"><span class="ro_top_left"></span><span class="ro_top_right"></span></div>
                <table class="data_grid">
                    <tr>
                        <td width="100">批次号：
                        </td>
                        <td colspan="3">
                            ${bean.plotNo }
                        </td>
                    </tr>
                    <tr>
                        <td>作物名称：
                        </td>
                        <td colspan="3">
                            ${bean.goodsName }
                        </td>
                    </tr>
                    <tr>
                        <td>种植日期：
                        </td>
                        <td colspan="3">
                            ${bean.plantDate }
                        </td>
                    </tr>
                    <tr>
                        <td>种植面积：
                        </td>
                        <td colspan="3">
                            ${bean.areas }
                        </td>
                    </tr>
                    <tr>
                        <td>农户名称：
                        </td>
                        <td colspan="3">
                            ${bean.farmerName }
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">种植批次
                         <span style="color:#0090D7;">${bean.plotNo }</span>的详细信息
                        </td>
                    </tr>
                    <tr>
                        <td width="100">种植区域：
                        </td>
                        <td>
                            ${bean.plotName }
                        </td>
                        <td width="100">生产者：
                        </td>
                        <td>
                            ${bean.cofarmerName }
                        </td>
                    </tr>
                    <tr>
                        <td>种植批次：
                        </td>
                        <td>
                            ${bean.plotNo }
                        </td>
                        <td>作物名称：
                        </td>
                        <td>
                            ${bean.goodsName }
                        </td>
                    </tr>
                    <tr>
                        <td>种子/种苗：
                        </td>
                        <td>
                            ${bean.goodvarietyName }
                        </td>
                        <td>农户姓名：
                        </td>
                        <td>
                            ${bean.farmerName }
                        </td>
                    </tr>
                    <tr>
                        <td>技术员：
                        </td>
                        <td colspan="3">
                            ${bean.userName }
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <label class="ybtns" onclick="ligerWin('100%','100%','${ctx}/Plant/Archives/PlantLot_Oper.html?plantLotId=${bean.plantlotId }','查看详细');">
                                <input type="button" value="点击查看详细档案" class="btntt" />
                            </label>
                        </td>
                    </tr>
                </table>
                <div class="ro_bottom"><span class="ro_bottom_left"></span><span class="ro_bottom_right"></span></div>
            </div>
        </fieldset>
    </c:forEach>
</body>
</html>

