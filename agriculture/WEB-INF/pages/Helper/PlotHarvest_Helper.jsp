<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>采收--选择帮助界面</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            var Result = GetQueryString("Result");
            var PlantLot_ID = GetQueryString("PlantLot_ID");
            grid = $("#grid").createLigerGrid({
                header: [
					{display:'选择',width:60,render:function(record, rowindex, value, column){return "<input type='radio' name='radiobtns' value='' />";}},
                    { display: '采收日期', name: 'Operate_Date',  type: 'date', format: 'yyyy-MM-dd' },
                    { display: '采收区域', name: 'Plot', width: '150' },
                    { display: '作物', name: 'GoodsValue', width: '150' },
                    { display: '数量', name: 'Qty',render:function(record,rowindex,value,column){
                        return value+'Kg';
                    } },
                    { display: '种植批次', name: 'Lot_No' },
                    { display: '采收号', name: 'PLotHarvest_No' },
                    { display: '生产者', name: 'CoFarmer_Name' }
                ],
                leftBtns: { show: false },
				onSelectRow:function(rowdata, rowid, rowobj){
					$(rowobj).find("input[type='radio']").attr("checked","checked");
				
				},
				param: { 'flag': 1, 'Result': Result, 'PlantLot_ID': PlantLot_ID },
                keyID: "PLotOper_ID",
                ajaxURL: "${ctx}/PlotHarvest/getPlotHarvestDetailList.ajax"
            });
            $("#btn_Search").click(function () {
                grid.setParm("plotHarvestNo", $("#PLotHarvest_No").val());
                grid.reload();
            })
        });
    </script>
</head>
<body>
    <form method="post" action="PlotHarvest_Helper.aspx" id="form1">
<div class="aspNetHidden">
</div>

        <table>
            <tr>
                <td>采收号：
                </td>
                <td>
                    <input type="text" name="PLotHarvest_No" id="PLotHarvest_No" value="" class="serchInput" />
                </td>
                <td>
                    <input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
                </td>
            </tr>
        </table>
        <div id="grid"></div>       
    </form>
</body>
</html>
