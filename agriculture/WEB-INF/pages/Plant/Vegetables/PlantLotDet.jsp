<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>种植批次详细信息</title>
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
	<br>
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <td>种植日期
                    </td>
                    <td>
                        ${plantLot.plantDate }
                    </td>
                    <td>生产者
                    </td>
                    <td>
                        ${plantLot.cofarmerName }
                    </td>
                </tr>
                <tr>
                    <td>农户姓名
                    </td>
                    <td>
                      ${plantLot.farmerName }
                    </td>
                    <td>作物名称
                    </td>
                    <td>
                       ${plantLot.goodsName }
                    </td>

                </tr>
                <tr>
                    <td>种子种苗
                    </td>
                    <td>
                      ${plantLot.goodvarietyName }
                    </td>
                    <td>种植区域
                    </td>
                    <td>
                        ${plantLot.plotName }
                    </td>
                </tr>
                <tr>
                    <td>技术员
                    </td>
                    <td>
                        ${plantLot.userName }
                    </td>
                    <td>土地状态
                    </td>
                    <td>
                        <span style="color:#FF5500;">
                        	<c:choose>
                        		<c:when test="${plantLot.state == '1' }">已种植</c:when>
                        		<c:otherwise>未种植</c:otherwise>
                        	</c:choose>
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
	    <div align=center><br>
		  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
    </div>
</body>
</html>

