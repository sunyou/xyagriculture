<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植批次--选择帮助界面</title>
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
            grid = $("#grid").createLigerGrid({
                header: [
					{display:'选择',render:function(record, rowindex, value, column){return "<input type='radio' name='radiobtns' value='' />";}},
                    { display: '种植区域', name: 'Plot_Name',width:'150' },
                    { display: '种植作物', name: 'GoodsValue', width: '150' },
                    { display: '种植日期', name: 'Plant_Date' },
                    { display: '批次号', name: 'Lot_No' },
                    { display: '生产者', name: 'CoFarmer_Name' },
                    { display: '农户', name: 'Farmer_Name' }
                ],
                leftBtns: { show: false },
				onSelectRow:function(rowdata, rowid, rowobj){
					$(rowobj).find("input[type='radio']").attr("checked","checked");
				
				},
                param: { 'flag': 1 },
                keyID: "PlantLot_ID",
                ajaxURL: "../PlantLot/getPlantLotList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("lotNo", $("#Lot_No").val());
                grid.reload();
            })


        });
    </script>
</head>
<body>
    <form method="post" action="PlantLot_Helper.aspx" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJMjE3MzE1MzI3ZGT2gvYTO2Tq1Fh5uy6+MZSJAP7T1niJczml/pNC68kVDQ==" />
</div>

        <table>
            <tr>
                <td>批次号：
                </td>
                <td>
                    <input type="text" name="Lot_No" id="Lot_No" value="" class="serchInput" />
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

