
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>标签打印列表</title>
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
            var Object_UID = GetQueryString('Object_UID');
            var CoFarmer_ID = GetQueryString('CoFarmer_ID');
            var Print_Date = decodeURI(GetQueryString('Print_Date'));
            var grid = $("#grid").createLigerGrid({
                header: [
                   
                    { display: '标签号码', name: 'Label_No', width: 200 },
                    { display: '打印日期', name: 'Print_Date', type: 'date', format: 'yyyy-MM-dd hh:mm:ss' },
                    { display: '对应产品', name: 'Good_Value', width: 200 },
                     { display: '生产者', name: 'CoFarmer_Name',width:200 },
                    {
                        display: '包装编号', name: 'Object_No',width:100,render: function (rowdata, index, value) {
                            if (rowdata['stype'] == '1') {
                                return '<a href="${ctx}/PlantOper/Vegetables/PlantHarvestDet.html?type=2&id=' + rowdata["OBJECT_UID"] + '">采收批次</a>';
                            } else {
                                return '<a href="${ctx}/Package/toPackageEdit.html?type=3&id=' + rowdata["OBJECT_UID"] + '">包装信息</a>';
                            }
                        }
                    }
                ],
                param: { 'flag': 2, 'objectUid': Object_UID, 'cofarmerId': CoFarmer_ID, "printDate": Print_Date },
                leftBtns: {
                    show: false
                },
                keyID: "PRINT_UID",
                ajaxURL: "${ctx}/Label/getLabelPrint.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_PlotName").val());
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
					<div class="rtxt left">标签号码：</div>
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
