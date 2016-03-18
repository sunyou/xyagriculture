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
                    { display: '农药使用日期', width:100,name: 'Operate_Date', type: 'date', format: 'yyyy-MM-dd'},
                    
                    { display: '喷药的合作社名称/基地/地块/面积', name: 'CoFarmer_Name',width:'400',render:function(rowdata, index, value) {
                        var html = value + " / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlantBase('"+rowdata["PLANTBASES_UID"]+"');\">"+rowdata["PLANTBASES_NAME"]+"</a>";
                        html = html +" / <a href='javascript:;' class='ligerBtnDetail' onclick=\"showPlotDet('"+rowdata["PLOT_ID"]+"');\">"+rowdata["PLOT_NAME"]+"</a>"
                        html = html + " /" + rowdata["AREAS"]+"(亩)"
                        return html ;
                    }},
                  { display: '农药名称', name: 'Material_Name', align: 'left',render:function(rowdata, index, value){
                    	var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showOperDetail('"+rowdata["PLOTOPER_ID"]+"');\">"+value+"</a>";
			             return html ;
                    } },
                     { display: '喷药的农产品名称', name: 'GoodsFullName', align: 'left' , width: '120' },
                    
                    { display: '亩实际用量/标准用量(ML)', name: 'Qty' ,render: showNYUseRender, width: '180' }
                     <shiro:hasPermission name="1009:inquiry.req"> 
	                 	,{ display: '质询', render: function (rowdata, index, value) { return "<input type='button' value='发起质询' class='rowSelectButton' onclick=\"ligerWin(600,350,'${ctx}/Base/Material/InquiryEdit.html?Object_ID=" + rowdata['CM_ID'] + "&Type=4&CoFarmer_ID=" + rowdata['COFARMER_ID'] + "','质询');\" />"; } }
	                 </shiro:hasPermission>
                ],
                param: { 'flag': 1, MaterialType_Code: 2 },
                editor: {
                    width: 460,
                    height: 650
                },
                leftBtns: false,
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "PLOTOPER_ID",
                ajaxURL: "${ctx}/Base/Material/GetCoFarmerNYList.ajax"
            });
            
            function showNYUseRender(rowdata,index,value){return rowdata["QTY"] + "/" + rowdata["AMOUNTPER"];}

			 function showNYDetail(rowdata,index,value){
             	var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showNYDetail('"
             	+rowdata["FARMER_ID"]+"','"+value+"');\">"+value+"</a>";
             	return html;
        	 } 
        	 
            $("#btn_Search").click(function () {
                grid.setParm("materialName", $("#txt_MaterialName").val());
                grid.setParm("cofarmerName", $("#txt_CoFarmer_Name").val());
                grid.reload();
            });
        });
        
        function showPlantBase(plantBaseId){
        	myopen("${ctx}/PlantBases/PlantBaseDet.html?id="+plantBaseId,"查看基地详情",1000,600);
        }
        
        function showPlotDet(plotId){
        	myopen("${ctx}/Plot/PlotDet.html?id="+plotId,"显示地块详细信息",660,360);
        }
        
        function showMaterialInfo(materialId){
        	myopen("${ctx}/Base/Material/MaterialNYDet.html?id="+materialId,"查看农药详情",660,360);
        }
        
        function showOperDetail(operId){
        	myopen("${ctx}/Base/Material/CoFarmerNYDet.html?id="+operId,"查看农药使用详情",660,360);
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
				<div class="rtxt left">农药名称：</div>
				<div class="sert left">
					<input type="text" name="txt_MaterialName" id="txt_MaterialName" class="serchInput" />
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
