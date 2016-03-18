<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农作物--选择帮助界面</title>
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
        var multiCheck = false;
        var headers = [
                    { display: '农作物名称', name: 'Goods_Name',width: '150' },
                    { display: '农作物编号', name: 'GoodsSTD_No' },
                    { display: '农作物分类', name: 'GoodsType_Name' }];
        $(document).ready(function () {
            multiCheck = GetQueryString("__CheckBox");
            if (multiCheck == undefined) {
                multiCheck = false;
                headers.unshift({ display: '选择',width: '50', render: function (record, rowindex, value, column) { return "<input type='radio' name='radiobtns' value='' />"; } });
            }
            grid=$("#grid").createLigerGrid({
                header: headers,
                checkbox: multiCheck,
                leftBtns:{show:false},
				onSelectRow:function(rowdata, rowid, rowobj){
				    if (!multiCheck) {
				        $(rowobj).find("input[type='radio']").attr("checked", "checked");
				    }
				},
                param: { 'flag': 1},
                keyID: "GOODS_ID",
                ajaxURL: "${ctx}/Goods/GetGoods.ajax",
                width:650
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#Goods_Name").val());
                grid.reload();
            })

        });
    </script>
</head>
<body>
         <table>
            <tr>
                <td>农作物名称：
                </td>
                <td>
                    <input type="text" name="Goods_Name" id="Goods_Name" value="" class="inw" />
                </td>
                <td>
                    <input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
                </td>
            </tr>
        </table>
        <div id="grid"></div>       

</body>
</html>

