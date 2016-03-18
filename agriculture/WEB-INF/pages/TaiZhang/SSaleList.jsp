<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>销售台账</title>
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
        var grid2 = null, grid = null;
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30 });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '日期', name: 'Bill_Date', type: 'date', format: 'yyyy-MM-dd' },
                    { display: '销售商', name: 'Supplier_Name', width: '200' },
                    { display: '销售单号', name: 'Bill_No', width: '200' },
                    { display: '合计金额', name: 'Amount', type: 'double', format: '0.00' },
                    { display: '客户名称', name: 'Customer_Name' },
                    { display: '记录人', name: 'Operater' }
                ],
                param: { 'flag': 1 },
                pageSize: 10,
                height: '',
                editor: {
                    width: 400,
                    height: 300
                },
                leftBtns: {
                    width: 160,
                    showDelete: {
                        close: function () {
                            grid.reload();
                        }
                    },
                    showDetail: {
                        url: "SSaleDet.aspx"
                    },
                    showEdit: {
                        url: "SSaleEdit.aspx",
                        close: function () {
                            grid.reload();
                        }
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                    if (grid2 == null) {
                        grid2 = $("#grid2").createLigerGrid({
                            header: [
                                {
                                    display: '种类', name: 'Type', width: '200', render: function (rowdata, index, value) {
                                        if (value == 1) {
                                            return '肥料';
                                        } else if (value == 2) {
                                            return '农药';
                                        }
                                    }
                                },
                                { display: '农资名称', name: 'Material_Name' },
                                { display: '单价', name: 'Price', type: 'double', format: '0.00' },
                                { display: '数量', name: 'Qty', type: 'double', format: '0.00' },
                                { display: '金额', name: 'Amount', type: 'double', format: '0.00' }
                            ],
                            param: { 'flag': 2, 'Bill_ID': rowdata["Bill_ID"] },
                            height: '',
                            leftBtns: {
                                show:false
                            },
                            delayLoad: false,
                            keyID: "Detail_ID",
                            ajaxURL: "/SSaleDetail/getSSaleDetail"
                        });
                    } else {
                        grid2.setParm('Bill_ID', rowdata["Bill_ID"]);
                        grid2.reload();
                    }
                },
                keyID: "Bill_ID",
                ajaxURL: "/SSale/GetSSale"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_PackageNo").val());
                grid.reload()
            });


            $("#btn_Add").click(function () {
                ligerWin(860, 400, 'AddSSale.aspx?Type=1', '新增');
            });
        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">包装编号：</div>
					<div class="sert left">
						<input type="text" name="txt_PackageNo" id="txt_PackageNo" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="grid"></div>
			<div id="grid2"></div>
		</div>
	</div>
</body>
</html>
