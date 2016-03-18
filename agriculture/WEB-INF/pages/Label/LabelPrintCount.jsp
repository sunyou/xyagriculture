<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>标签打印数量列表</title>
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
    <script type="text/javascript">
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            var CoFarmer_ID = GetQueryString('CoFarmer_ID');
            var grid = $("#grid").createLigerGrid({
                header: [
                    { display: '生产者', name: 'COFARMER_NAME',width:250 },
                    { display: '打印数量', name: 'LABELCOUNT' },
                    { display: '打印日期', name: 'PRINT_DATE', type: 'date', format: 'yyyy-MM-dd' },
                    { display: '详细追溯码', render: function (rowdata, index, value) { return "<a href='javascript:;'onclick=\"ligerWin(850,600,'${ctx}/Label/LabelPrintList.html?CoFarmer_ID=" + rowdata['COFARMER_ID'] + "&Print_Date=" + rowdata['PRINT_DATE'] + "');\">详细追溯码</a>"; } }
                ],
                param: { 'flag': 1, 'CoFarmer_ID': CoFarmer_ID},
                leftBtns: {
                    show: false
                },
                keyID: "COFARMER_ID",
                ajaxURL: "${ctx}/Label/GetLabelNumByDate.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("operdate", $("#txt_PlotName").val());
                grid.reload()
            });
        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">打印时间：</div>
					<div class="sert left">
						<input type="text" name="txt_PlotName" id="txt_PlotName" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<!--
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					  -->
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="grid"></div>
		</div>
	</div>
</body>
</html>
