<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>司机--选择帮助界面</title>
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
            grid=$("#grid").createLigerGrid({
                header: [
					{display:'选择',render:function(record, rowindex, value, column){return "<input type='radio' name='radiobtns' value='' />";}},
                    { display: '司机名称', name: 'Name' },
                    { display: '性别', name: 'Sex', render: function (rowdata, index, value) { if (value != '0') { return "<font color='#FF5500'>女</font>" } else { return "<font color='#0063DC'>男</font>"; } } },
                    { display: '年龄', name: 'Age' },
                    { display: '电话', name: 'Tel' }
                ],
                leftBtns:{show:false},
				onSelectRow:function(rowdata, rowid, rowobj){
					$(rowobj).find("input[type='radio']").attr("checked","checked");
				
				},
                param: { 'flag': 1},
                keyID: "DRIVEID",
                ajaxURL: "${ctx}/PostMap/getIgDriverList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#Name").val());
                grid.reload();
            })

        });
    </script>
</head>
<body>
    <form method="post" action="IG_Driver_Helper.aspx" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJMjE3MzE1MzI3ZGS+xfSSsO2QGjQppNvohiMABVtqqxo50Q102YzKXyxmiw==" />
</div>

         <table>
            <tr>
                <td>司机姓名：
                </td>
                <td>
                    <input type="text" name="Name" id="Name" value="" class="serchInput" />
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