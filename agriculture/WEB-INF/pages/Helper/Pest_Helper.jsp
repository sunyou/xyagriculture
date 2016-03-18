<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>病虫害--选择帮助界面</title>
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
					{display:'选择',width: '50',render:function(record, rowindex, value, column){return "<input type='radio' name='radiobtns' value='' />";}},
					{ display: '病虫害编号', name: 'Pest_No' },
                    { display: '病虫害名称', name: 'Pest_Name', width: '200' },
                    { display: '病虫害种类', name: 'PestType_Name' }
                ],
                leftBtns: { show: false },
				onSelectRow:function(rowdata, rowid, rowobj){
					$(rowobj).find("input[type='radio']").attr("checked","checked");
				
				},
                param: { 'flag': 1 },
                keyID: "PEST_ID",
                ajaxURL: "${ctx}/Pest/GetPestList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("pestName", $("#Pest_Name").val());
                grid.reload();
            });

        });
    </script>
</head>
<body>
     <table>
        <tr>
            <td>病虫害：
            </td>
            <td>
                <input type="text" name="pestName" id="Pest_Name" value="" class="serchInput" />
            </td>
            <td>
                <input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
            </td>
        </tr>
    </table>
    <div id="grid"></div>       
</body>
</html>

