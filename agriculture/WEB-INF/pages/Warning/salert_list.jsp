<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预警</title>
    <%@ include file="/common/include.jsp"%>
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '预警日期', name: 'Op_Date' , width: '80'},
                    { display: '预警编号', name: 'Alert_No' , width: '60', render: renderSalert},
                    { display: '生产者', name: 'CoFarmer_Name',width: 180,render: renderCoFarmer},
                    { display: '种植批次', name: 'Lot_No' , width: '150', render: renderPlantLot},
                    { display: '采收批次', name: 'PLotHarvest_No' , width: '150', render: renderPlotharvest},
                    { display: '包装', name: 'Package_No' , width: '150', render: renderPackage},
                    { display: '作物名称', name: 'Goods_Name' },
                    { display: '农户姓名', name: 'Farmer_Name' , width: '60'},
                    { display: '操作人', name: 'Operators' , width: '60'},
                    { display: '召回原因', name: 'Notes' }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: openWinWidthDef,
                    height: openWinHeightDef
                },
                leftBtns: {
                    showDetail: {
                        show: false,
                        url: "${ctx}/Warning/salert_detail.html"
                    },
                    showDelete: {
                        show:true,
                        close: function () {
                            grid.reload();
                        },
                        url: "${ctx}/Warning/deleteSAlert.ajax"
                    },
                    showEdit: {
                    	title:'编辑农产品预警',
                        show:true,
                        width: openWinWidthDef,
                        height: openWinHeightDef,
						close: function () {
                            grid.reload();
						},
                        url: "${ctx}/Warning/salert_edit.html"
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "ALERT_ID",
                ajaxURL: "${ctx}/Warning/getSAlertDetailList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("alertNo", $("#txt_Alert_No").val());
                grid.reload();
            });

            $("#btn_Add").click(function () {
                openDialogInIframe(openWinWidthDef, openWinHeightDef, '${ctx}/Warning/salert_edit.html', '新增农产品预警',null, grid);
            });
        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">预警编号：</div>
					<div class="sert left">
						<input type="text" name="txt_Alert_No" id="txt_Alert_No" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					<div class="serb left">
<!--						<input onclick="test()" type="button" value="测试" class="btn_tool_search" style="display:block"/>-->
					</div>
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

