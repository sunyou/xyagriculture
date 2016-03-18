<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物资采购--选择帮助界面</title>
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
					{ display:'选择', width: 40 ,render:function(record, rowindex, value, column){return "<input type='radio' name='radiobtns' value='' />";}},
                    { display: '物资名称', width: 50, align: 'left', name: 'Object_Name', width:'140' },
                    { display: '经销商', align: 'left', name: 'Supplier_Name', width: 180 },
                    { display: '生产者', align: 'left', name: 'CoFarmer_Name' },
                    { display: '采购人', align: 'left', name: 'OperateUser' }
        ],
                leftBtns: { show: false },
				onSelectRow:function(rowdata, rowid, rowobj){
					$(rowobj).find("input[type='radio']").attr("checked","checked");
				
				},
                param: { 'flag': 1 ,'type':$("#type").val()},
                keyID: "COMAT_UID",
                ajaxURL: "${ctx}/CoFarmerMaterial/GetCoFarmerMaterial.ajax",
                width:650
            });

            $("#btn_Search").click(function () {
                grid.setParm("objectName", $("#Object_Name").val());
                grid.setParm("cofarmerName", $("#CoFarmer_Name").val());
                grid.setParm("supplierName", $("#Supplier_Name").val());
                grid.reload();
            });

        });
    </script>
</head>
<body>
    <form method="post" action="" id="form1">
    	<input type="hidden" id="type" value="${type }"/>
        <table>
            <tr>
                <td>农资名称：
                </td>
                <td>
                    <input type="text" name="Object_Name" id="Object_Name"/>
                </td>
                <td>生产单位：
                </td>
                <td colspan="2">
                    <input type="text" name="CoFarmer_Name" id="CoFarmer_Name"/>
                </td>
                <td>经销商：
                </td>
                <td colspan="4">
                    <input type="text" name="Supplier_Name" id="Supplier_Name"/>
                </td>
                <td>
                    <input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
                </td>
            </tr>
        </table>    
        <br>
        <div id="grid"></div>   
    </form>
</body>
</html>

