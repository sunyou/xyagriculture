<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	按生产者统计标签打印数量
</title>
    <script type="text/javascript" src="${ctx}/content/js/charts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/charts/highcharts.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/charts/data.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/charts/exporting.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=&lt;%=LastVersion%>" /><link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" /><link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css" /><link rel="Stylesheet" type="text/css" href="${ctx}/content/css/report.css" />
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/publicchart.js"></script>    
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript">
        var AreaID =610403;
    </script>
    <script type="text/javascript" src="${ctx}/content/js/Pages/LabelByCoFarmer.js"></script>
    <style type="text/css">
        .l-layout-left, .l-layout-content, .l-tree {
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <div id="div_Param">
        <table style="width: 100%;">
            <tr>
                <td style="width:80px">时间范围：</td>
                <td>
                    <input type="text" id="txt_StartDate" class='liger-text l-text' onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" style="float:left;" />至
                    <input type="text" id="txt_EndDate" class='liger-text l-text' onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" />
                </td>
            </tr>
            <tr>
                <td >生产者：</td>
                <td >
                    <div style="float:left;"><input type="button" class='liger-button l-button' style="margin-left:3px;margin-top:3px;" id="btn_CoFarmer_Add" value=" 添 加 " onclick="GetCoFarmer();"/></div><div id="div_CoFarmers"></div>
                        <input type="hidden" id="txt_CoFarmerName" /><input type="hidden" id="hd_CoFarmerId" /></td>
            </tr>            
            <tr>
                <td>农作物：</td>
                <td>
                    <div><input type="button" class='liger-button l-button' style="margin-left:3px;margin-top:3px;" id="btn_Goods_Add" value=" 添 加 " onclick="GetGoods()"/></div><div id="div_Goods"></div>
                    <input type="hidden" id="txt_GoodsName"/><input type="hidden" id="hd_GoodsId" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" class='liger-button l-button' value="查询" onclick="Query()" /></td>                
            </tr>
        </table>
    </div>
    <div id="layout1">
        <div id="leftTree" position="left" title="区县">
            <div id="tree1" style="margin: 0; padding: 0"></div>
        </div>
        <div position="center" title="报表视图">
            <div style="float: left; width: 100%; height: 35px;">
                <span class='liger-button l-button' id='Type_column' style='float: left; margin-left: 3px;' onclick="ChartChange('column')">柱状图</span><span class='liger-button l-button' id='Type_line' style='float: left; margin-left: 3px;' onclick="ChartChange('line')">折现图</span>
                <span class='liger-button l-button' id='Type_spline' style='float: left; margin-left: 3px;' onclick="ChartChange('spline')">曲线图</span>
                <span class='liger-button l-button' id='Type_pie' style='float: left; margin-left: 3px;' onclick="ChartChange('pie')">饼状图</span>
            </div>
            <div id="container" class="ChartView" style="width: 100%; height: 85%; margin: 0px; padding: 0px; float: left;">
            </div>
            <div style="width: 100%; height: 16%; position: absolute; bottom: 3px; z-index: 9999;" id="ChartQty"></div>
        </div>
        <div position="right" title="数据视图">
            <div id="maingrid4" style="margin: 0; padding: 0"></div>
        </div>
    </div>    
</body>
</html>
