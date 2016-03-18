<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合作社使用物资- 农药列表</title>
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
        var ZongHe = false;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '采收日期', width:100,name: 'Operate_Date', type: 'date', format: 'yyyy-MM-dd'},
                    { display: '采收批次', width:150,name: 'PLOTHARVEST_NO',render:function(rowdata, index, value) {
                    	var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantHarvestDet('"+value+"');\">"+value+"</a>";
                    	return html;
                    }},
                    { display: '合作社名称/基地/地块/面积', name: 'CoFarmer_Name',width:'400',render:function(rowdata, index, value) {
                    	var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCofarmerDet('"+rowdata["COFARMER_ID"]+"');\">"+value+"</a>";
                    	html = html + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+rowdata["PLANTBASES_NAME"]+"</a>";
                        html = html +" / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlotDet('"+rowdata["PLOT_ID"]+"');\">"+rowdata["PLOT_NAME"]+"</a>";
                        return html + " /" + rowdata["AREAS"]+"(亩)";
                    }},
                    { display: '农作物名称', name: 'GOODS_NAME', align: 'left', width: '120'},
                    { display: '采收量', name: 'Qty' , width: '100',render:function(rowdata, index, value){
                    	return value + rowdata["UNITID"];
                    }},
                    { display: '存放方式', name: 'STORAGEMODE', align: 'left' , width: '100' },
                    { display: '存放天数', name: 'STORAGEDAYS', align: 'left' , width: '100' }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 460,
                    height: 650
                },
                leftBtns: false,
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "PLOTOPER_ID",
                ajaxURL: "${ctx}/PlotHarvest/queryPlotHarvestList.ajax"
            });
        	 
            $("#btn_Search").click(function () {
                grid.setParm("plotName", $("#plotName").val());
                grid.setParm("cofarmerName", $("#txt_CoFarmer_Name").val());
                grid.reload();
            });
        });
        
        function showPlantHarvestDet(plotharvestNo){
        	myopen("${ctx}/PlotHarvest/PlotHarvestDet.html?plotharvestNo="+plotharvestNo,"查看批次详情",660,360);
        }
        
        function showCofarmerDet(cofarmerId){
        	//myopen("${ctx}/Base/Info/CoFarmerBaseInfo.html?id="+cofarmerId,"查看基地详情",1000,600);
        	parent.f_addTab(cofarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+cofarmerId);	
        }
        
        function showPlantBase(plantBaseId){
        	myopen("${ctx}/PlantBases/PlantBaseDet.html?id="+plantBaseId,"查看基地详情",1000,600);
        }
        
        function showPlotDet(plotId){
        	myopen("${ctx}/Plot/PlotDet.html?id="+plotId,"显示地块详细信息",660,360);
        }
    </script>
</head>
<body>
	<div id="layout">
		<div class="rtittab">
			<div class="rtitbg2">
				<div class="rtxt left">生产者：</div>
				<div class="sert left">
					<input type="text" name="txt_CoFarmer_Name" id="txt_CoFarmer_Name" class="serchInput" />
				</div>
				<div class="rtxt left">地块名称：</div>
				<div class="sert left">
					<input type="text" name="plotName" id="plotName" class="serchInput" />
				</div>
				<div class="serb left">
					<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div id="grid"></div>
	</div>
</body>
</html>