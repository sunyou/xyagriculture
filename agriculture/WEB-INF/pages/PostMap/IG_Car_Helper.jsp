<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>车辆管理--选择帮助界面</title>
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
                    { display: '车辆编号', name: 'CarNo' },
                    { display: '类型', name: 'CarType' },
                    { display: '状态', name: 'CarState', render: function (rowdata, index, value) { if (value != '0') { return "<font color='#FF5500'>正常</font>" } else { return "<font color='#0063DC'>维护</font>"; } } },
                    { display: '最大承载量 KG', name: 'MaxCap' }
                ],
                leftBtns:{show:false},
				onSelectRow:function(rowdata, rowid, rowobj){
					$(rowobj).find("input[type='radio']").attr("checked","checked");
				
				},
                param: { 'flag': 1},
                keyID: "CARID",
                ajaxURL: "${ctx}/PostMap/getIgCarList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("carNo", $("#CarNo").val());
                grid.reload();
            })

        });
    </script>
</head>
<body>
    <form method="post" action="IG_Car_Helper.aspx" id="form1">
         <table>
            <tr>
                <td>车牌号：
                </td>
                <td>
                    <input type="text" name="CarNo" id="CarNo" value="" class="serchInput" />
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

