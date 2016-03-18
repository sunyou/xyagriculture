<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>施肥操作信息</title>
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
                    <td colspan="2">
                        <font color="#0090D7">${plantLot.goodsName }--施肥的详细信息</font>
                    </td>
                </tr>
                <tr>
                    <td>施肥日期
                    </td>
                    <td>
                        ${plantLot.operateDate }
                    </td>
                </tr>
                <tr>
                    <td>生产者
                    </td>
                    <td>
                       ${plantLot.cofarmerName }
                    </td>
                </tr>
                <tr>
                    <td>种植批次
                    </td>
                    <td>
                        ${plantLot.lotNo }
                    </td>
                </tr>
                <tr>
                    <td>作物名称
                    </td>
                    <td>
                        ${plantLot.goodsName }
                    </td>
                </tr>     
                <tr>
                    <td>作物名称及种苗
                    </td>
                    <td>
                        ${plantLot.operateDate }
                    </td>
                </tr>                
                <tr>
                    <td>农用物资名称
                    </td>
                    <td>
                        ${plantLot.materialName }
                    </td>
                </tr>     
                <tr>
                    <td>生产厂家名称
                    </td>
                    <td>
                        ${plantLot.produceName }
                    </td>
                </tr>
                <tr>
                    <td>经销商名称
                    </td>
                    <td>
                        ${plantLot.supplierName }
                    </td>
                </tr>  
                 <tr>
                    <td>使用方式
                    </td>
                    <td>
                        施埋
                    </td>
                </tr>
                 <tr>
                    <td>使用间隔期
                    </td>
                    <td>
                        ${plantLot.safeDays }     
                    </td>
                </tr>
                <tr>
                    <td>每亩标准使用量
                    </td>
                    <td>
                        ${plantLot.qty }
                    </td>
                </tr>
                <tr>
                    <td>每亩使用量
                    </td>
                    <td>
                        ${plantLot.amountper }
                    </td>
                </tr>
                <tr>
                    <td>操作人
                    </td>
                    <td>
                        ${plantLot.operators }
                    </td>

                </tr>
                <tr>
                    <td>说明
                    </td>
                    <td>
                        ${plantLot.notes }
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
    	if('${message}' != ''){
    		alert('${message}');
    	}
    </script>
</body>
</html>