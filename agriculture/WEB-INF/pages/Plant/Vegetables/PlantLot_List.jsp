<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植批次列表</title>
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
        
        var grid = null;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30 });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '种植日期', name: 'Plant_Date', type: 'date', options: { format: "yyyy-MM-dd" } },
                    { display: '批次号', name: 'Lot_No',width:200 },
                    { display: '生产者', name: 'CoFarmer_Name',width:240 },
                    { display: '农户姓名', name: 'Farmer_Name' },
                    { display: '作物名称', name: 'Goods_Name' },
                    { display: '种子种苗', name: 'GoodVariety_Name' },
                    { display: '种植区域', name: 'Plot_Name' },
                    { display: '种植面积', name: 'Areas' },
                    {
                        display: '种植状态', name: 'State1',align:'center', render: function (rowdata, index, value) {
                            if (value == "1") return "<font color='#0063DC'>种植中</font>";
                            else if (value == '0') return "<font color='#E22C37'>已清茬</font>";
                            else return "<font color='#0063DC'>种植中</font>";
                        }
                    },
                    { 
                        display: '种植档案', align: 'center', render: function (rowdata, index, value) { 
                            return "<a href='javascript:;' onclick=\"ligerWin(800,450,'${ctx}/Plant/Archives/PlantLot_Related.html?plotId="+rowdata['PLOT_ID'] + "&plantlotId=" + rowdata['PLANTLOT_ID'] + "','种植档案');\">种植档案</a>"; 
                        } 
                    }
                ],
                param: { 'lotNo': $("#txt_PlotNo").val() },
                editor: {
                    para: ["Goods_Name"]
                },
                leftBtns: {
	                    showDetail: {
	                        show:true,
	                        url: "${ctx}/Plant/Vegetables/PlantLotDet.html",
	                        width:660,
	                        height:360
	                    },
                        showEdit: {
                            show:true,
                            url: "${ctx}/Plant/Vegetables/PlantLotEdit.html",
                            width:660,
	                        height:360,
                            close: function () {
                                grid.reload();
                            }
                        },
                        showDelete:{
                            show:true,
                            url:"${ctx}/Plant/delPlantLot.ajax",
                            close: function () {
                                grid.reload();
                            }
                        }
                    },
                    onSelectRow: function (rowdata, rowid, rowobj) {
                    },
                    keyID: "PLANTLOT_ID",
                    ajaxURL: "${ctx}/Plant/getPlantLot.ajax"
                });

                $("#btn_Search").click(function () {
                    grid.setParm("lotNo", $("#txt_PlotNo").val());
                    grid.reload();
                });

            });
    </script>
</head>
<body>
	<div id="layout" style="overflow: hidden;">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">批次号：</div>
					<div class="sert left">
						<input type="text" name="txt_PlotNo" id="txt_PlotNo" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<!-- <div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div> -->
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
