<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>播种定植信息</title>
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
    <div id="MaterialsBody">
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
                    <td nowrap>采收日期
                    </td>
                    <td>
                        ${bean.operateDate }
                    </td>
                    <td nowrap>采收批次
                    </td>
                    <td>
                        ${bean.plotharvestNo }
                    </td>
                </tr>
                <tr>
                    <td nowrap>生产者
                    </td>
                    <td>
                       ${bean.cofarmerName }
                    </td>
                    <td nowrap>基地
                    </td>
                    <td>
                        ${bean.plantbasesName }
                    </td>
                 <tr>
                    <td nowrap>地块
                    </td>
                    <td>
                        ${bean.plotName }
                    </td>
                    <td nowrap>面积
                    </td>
                    <td>
                        ${bean.areas }亩
                    </td>
                </tr>
                 <tr>
                    <td nowrap>作物名称
                    </td>
                    <td>
                        ${bean.goodsName }
                    </td>
                    <td nowrap>存放方式
                    </td>
                    <td>
                        ${STORAGEMODE_NAME }
                    </td>
                </tr>
                 <tr>
                    <td nowrap>存放天数
                    </td>
                    <td>
                        ${bean.storagedays }
                    </td>
                    <td nowrap>采收量
                    </td>
                    <td>
                        ${bean.qty}${UNIT_NAME}
                    </td>
                </tr>
                <tr>
                    <td nowrap>操作人
                    </td>
                    <td>
                        ${bean.operators }
                    </td>
                    <td nowrap>说明
                    </td>
                    <td>
                        ${bean.notes }
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

